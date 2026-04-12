import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

class DialoguePage extends StatefulWidget {
  const DialoguePage({super.key});
  @override
  State<DialoguePage> createState() => _DialoguePageState();
}

class _DialoguePageState extends State<DialoguePage> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final FlutterTts _tts = FlutterTts();
  final TextEditingController _upperController = TextEditingController();
  final TextEditingController _lowerController = TextEditingController();

  String _rightLang = "العربية";
  String _leftLang = "English";
  bool _isListening = false;

  void _swapLanguages() {
    setState(() {
      String temp = _rightLang;
      _rightLang = _leftLang;
      _leftLang = temp;
      // لا نغير ربط المحرر العلوي، سيظل يقرأ من الجهة اليمنى دائماً
    });
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        // مسح الشاشة لبدء حوار جديد عند كل ضغطة مايك
        setState(() {
          _upperController.clear();
          _lowerController.clear();
          _isListening = true;
        });
        
        _speech.listen(onResult: (val) {
          setState(() {
            _upperController.text = val.recognizedWords;
            if (val.finalResult) {
              _isListening = false;
              _translate();
            }
          });
        });
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _translate() {
    // منطق المحرر السفلي يترجم ما في العلوي بناءً على لغة الزر الأيسر
    if (_upperController.text.isNotEmpty) {
      _lowerController.text = "Translating to $_leftLang...";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("حوار مترجم"), backgroundColor: const Color(0xFF0A0E14)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // المحرر العلوي (يتبع الجهة اليمنى دائماً)
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: const Color(0xFF161B22), borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: _upperController,
                  maxLines: null,
                  decoration: InputDecoration(hintText: "تحدث بلغة ($_rightLang)...", border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // شريط التحكم (اللغات والمايك)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _langButton(_rightLang, (val) => setState(() => _rightLang = val!)),
                IconButton(icon: const Icon(Icons.swap_horiz, color: Colors.cyanAccent), onPressed: _swapLanguages),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: _isListening ? Colors.red : Colors.cyanAccent,
                  child: IconButton(
                    icon: Icon(_isListening ? Icons.stop : Icons.mic, color: Colors.black),
                    onPressed: _listen,
                  ),
                ),
                _langButton(_leftLang, (val) => setState(() => _leftLang = val!)),
              ],
            ),
            const SizedBox(height: 10),
            // المحرر السفلي (الترجمة)
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: const Color(0xFF1C2128), borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  children: [
                    TextField(
                      controller: _lowerController,
                      readOnly: true,
                      maxLines: null,
                      style: const TextStyle(color: Colors.cyanAccent),
                      decoration: const InputDecoration(hintText: "الترجمة...", border: InputBorder.none),
                    ),
                    Positioned(
                      bottom: 0, right: 0,
                      child: IconButton(icon: const Icon(Icons.volume_up), onPressed: () => _tts.speak(_lowerController.text)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _langButton(String current, Function(String?) onChanged) {
    return DropdownButton<String>(
      value: current,
      underline: Container(),
      items: ["العربية", "English", "French", "German"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: onChanged,
    );
  }
}
