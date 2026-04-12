import 'package:flutter/material.dart';

class TranslatorPage extends StatefulWidget {
  const TranslatorPage({super.key});
  @override
  State<TranslatorPage> createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();
  String _selectedLang = "English";

  void _clearOnNewInput() {
    if (_outputController.text.isNotEmpty) {
      setState(() {
        _inputController.clear();
        _outputController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF161B22),
        title: Center(
          child: DropdownButton<String>(
            value: _selectedLang,
            items: List.generate(100, (index) => "Language ${index+1}") // مثال للـ 100 لغة
                .map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (v) => setState(() => _selectedLang = v!),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // المحرر العلوي
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: const Color(0xFF161B22), borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  children: [
                    TextField(
                      controller: _inputController,
                      maxLines: null,
                      decoration: const InputDecoration(hintText: "اكتب هنا...", border: InputBorder.none),
                      onTap: _clearOnNewInput,
                    ),
                    Positioned(
                      bottom: 0, left: 0,
                      child: IconButton(icon: const Icon(Icons.mic, color: Colors.cyanAccent), onPressed: () {}),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // المحرر السفلي
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: const Color(0xFF1C2128), borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  children: [
                    TextField(
                      controller: _outputController,
                      readOnly: true,
                      maxLines: null,
                      decoration: const InputDecoration(hintText: "الترجمة ستظهر هنا...", border: InputBorder.none),
                    ),
                    Positioned(
                      bottom: 0, right: 0,
                      child: Row(
                        children: [
                          IconButton(icon: const Icon(Icons.volume_up), onPressed: () {}),
                          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
                          IconButton(icon: const Icon(Icons.copy), onPressed: () {}),
                        ],
                      ),
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
}
