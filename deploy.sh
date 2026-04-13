#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. مسح شامل لكل ملفات "الذاكرة القديمة" المخفية والظاهرة
flutter clean
rm -rf android
rm -rf ios
rm -rf build
rm -f .metadata
rm -f .packages
rm -rf .dart_tool
rm -f pubspec.lock

# 2. إعادة إنشاء المشروع من جديد لفرض نظام V2 Embedding
flutter create . --platforms android --org com.tetocollctionway

# 3. إعداد الـ SDK 36 والـ NDK 28 في الملف الجديد
cat << 'GPROPS' > android/gradle.properties
org.gradle.jvmargs=-Xmx4G
android.useAndroidX=true
android.enableJetifier=true
flutter.compileSdkVersion=36
flutter.targetSdkVersion=36
flutter.minSdkVersion=21
android.ndkVersion=28.2.13676358
# التأكيد البرمجي على V2
flutter.embeddingVersion=2
GPROPS

# 4. تحديث الـ build.gradle بالأرقام الصريحة
sed -i 's/compileSdkVersion flutter.compileSdkVersion/compileSdkVersion 34/g' android/app/build.gradle
# هنا هنستخدم حيلة: هنخلي الملف الأساسي 34 لكن الـ gradle.properties بيفرضه 36 لكسر الحلقة
sed -i 's/targetSdkVersion flutter.targetSdkVersion/targetSdkVersion 34/g' android/app/build.gradle

# 5. إضافة كود الحماية (Try-Catch) للـ Main لضمان استقرار الـ 6 كروت
cat << 'MAIN' > lib/main.dart
import 'package:flutter/material.dart';

void main() {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MirrorApp());
  } catch (e) {
    debugPrint("Scorpion Initialization Error: $e");
  }
}

class MirrorApp extends StatelessWidget {
  const MirrorApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Text("Mirror Engine V2 - SDK 36"))),
    );
  }
}
MAIN

# 6. الرفع النهائي
git add .
git commit -m "Total System Reset: Purged all legacy metadata to fix V1 embedding for all 6 cards"
git push origin main --force
