import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MirrorApp());

class MirrorApp extends StatelessWidget {
  const MirrorApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF16213E),
        textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme.apply(bodyColor: Colors.white)),
      ),
      home: const MirrorHome(),
    );
  }
}

class MirrorHome extends StatefulWidget {
  const MirrorHome({super.key});
  @override
  State<MirrorHome> createState() => _MirrorHomeState();
}

class _MirrorHomeState extends State<MirrorHome> {
  final TextEditingController _inputController = TextEditingController();
  List<String> _chatHistory = [];
  String _selectedVoice = "سيف";
  final List<String> _voices = ["سيف", "سلمى", "سما", "سارة", "تامر"];

  @override
  void initState() {
    super.initState();
    _loadMemory();
  }

  _loadMemory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _chatHistory = prefs.getStringList('mirror_history') ?? ["أهلاً بك يا تامر.. أدهم معك."];
    });
  }

  _saveToMemory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('mirror_history', _chatHistory);
  }

  void _handleSend() {
    if (_inputController.text.isEmpty) return;
    String timestamp = DateFormat('HH:mm').format(DateTime.now());
    setState(() {
      _chatHistory.insert(0, "[$timestamp] تامر: ${_inputController.text}");
      _inputController.clear();
      _saveToMemory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("قعدة قهوة مع أدهم"),
        centerTitle: true,
        backgroundColor: const Color(0xFF0F3460),
        actions: [
          DropdownButton<String>(
            value: _selectedVoice,
            underline: Container(),
            onChanged: (val) => setState(() => _selectedVoice = val!),
            items: _voices.map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _chatHistory.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_chatHistory[index], style: const TextStyle(color: Colors.white70)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _inputController,
                    decoration: const InputDecoration(hintText: "فضفض لأدهم..."),
                  ),
                ),
                IconButton(icon: const Icon(Icons.send), onPressed: _handleSend),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
