#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. إنشاء ملف المكتبات (pubspec.yaml)
cat << 'PUBSPEC' > pubspec.yaml
name: mirror_scorpion
description: Mirror Scorpion AI Project by TetoCollctionWay
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.1.0
  shared_preferences: ^2.2.2
  intl: ^0.19.0
  http: ^1.2.0
  google_generative_ai: ^0.2.0
  speech_to_text: ^6.6.0
  flutter_tts: ^3.8.5
  camera: ^0.10.5+5
  google_mlkit_translation: ^0.11.0
  google_mlkit_text_recognition: ^0.11.0
  path_provider: ^2.1.2
  share_plus: ^7.2.1

flutter:
  uses-material-design: true
PUBSPEC

# 2. إنشاء مجلد lib وكتابة الكود (الهيكل الأساسي)
mkdir -p lib
cat << 'FLUTTER_CODE' > lib/main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  _buildCard(context, "ترجمة نصية", Icons.translate),
                  _buildCard(context, "حوار مترجم", Icons.record_voice_over),
                  _buildCard(context, "مستندات وعدسة", Icons.document_scanner),
                  _buildCard(context, "أحاديث وقصص", Icons.auto_stories),
                  _buildCard(context, "الألعاب", Icons.videogame_asset),
                  _buildCard(context, "الإعدادات", Icons.settings),
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

  Widget _buildCard(BuildContext context, String title, IconData icon) {
    return InkWell(
      onTap: () => print(title),
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

# 3. إرسال التحديث لجيت هب
git add .
git commit -m "Added AI dependencies and Project Structure"
git push origin main
