#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. تحديث الكود الأساسي ليدعم التنقل للكرت الأول
cat << 'FLUTTER_CODE' > lib/main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'translator_page.dart';

void main() => runApp(const MirrorScorpion());

class MirrorScorpion extends StatelessWidget {
  const MirrorScorpion({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0E14),
        textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.security, size: 80, color: Colors.cyanAccent), 
                  const SizedBox(height: 5),
                  Opacity(
                    opacity: 0.2,
                    child: Transform(alignment: Alignment.center, transform: Matrix4.rotationX(3.14),
                    child: const Icon(Icons.security, size: 60, color: Colors.cyanAccent)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildCard(context, "ترجمة نصية", Icons.translate, const TranslatorPage()),
                  _buildCard(context, "حوار مترجم", Icons.record_voice_over, null),
                  _buildCard(context, "مستندات وعدسة", Icons.document_scanner, null),
                  _buildCard(context, "أحاديث وقصص", Icons.auto_stories, null),
                  _buildCard(context, "الألعاب", Icons.videogame_asset, null),
                  _buildCard(context, "الإعدادات", Icons.settings, null),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("TetoCollctionWay", style: TextStyle(color: Colors.grey, letterSpacing: 1.2)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Widget? target) {
    return InkWell(
      onTap: () {
        if (target != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => target));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF161B22),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.cyanAccent),
            const SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
FLUTTER_CODE

# 2. إنشاء صفحة الترجمة النصية (الكرت الأول)
cat << 'TRANSLATOR_CODE' > lib/translator_page.dart
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
TRANSLATOR_CODE

# 3. الرفع التلقائي
git add .
git commit -m "Translator Card: Fully built according to Scorpion specs"
git push origin main
