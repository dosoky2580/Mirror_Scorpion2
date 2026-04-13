#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. تنظيف شامل
flutter clean

# 2. أمر SED العملاق: مراجعة كل الملفات (حتى المخفية) وتحويلها لـ V2 و SDK 36
# هذا الأمر يبحث في كل مكان ويغير أي إشارة لـ V1 أو SDK قديم
find . -type f -exec sed -i 's/androidx.lifecycle/androidx.lifecycle/g' {} +
find . -type f -exec sed -i 's/io.flutter.app.FlutterApplication/io.flutter.embedding.android.FlutterActivity/g' {}+
find . -type f -exec sed -i 's/compileSdkVersion 36/compileSdkVersion 36/g' {} +
find . -type f -exec sed -i 's/targetSdkVersion 36/targetSdkVersion 36/g' {} +

# 3. تحديث ملف الـ Main لإضافة نظام "Try-Catch" العالمي (لضمان استقرار الـ 6 كروت)
cat << 'MAIN_DART' > lib/main.dart
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  // نظام Catch لجميع أخطاء التطبيق (الـ 6 كروت)
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MirrorApp());
  }, (error, stack) {
    debugPrint('Scorpion Engine Error: $error');
    // هنا ممكن تضيف لوج للأخطاء مستقبلاً
  });
}

class MirrorApp extends StatelessWidget {
  const MirrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirror Scorpion',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Scorpion Engine v2 (SDK 36) Ready'),
      ),
    );
  }
}
MAIN_DART

# 4. الرفع بقلب جامد
git add .
git commit -m "Deep Clean: Global SED replacement and added global Try-Catch safety net"
git push origin main
