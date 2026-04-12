#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. تحديث المكتبات مع إجبار الإصدار المستقر (Dependency Overrides)
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
  google_generative_ai: ^0.4.4
  speech_to_text: 6.1.1  # تثبيت بدون علامة ^ لمنع التحديث التلقائي
  flutter_tts: ^3.8.5
  camera: ^0.10.5+9
  google_mlkit_translation: ^0.12.0
  google_mlkit_text_recognition: ^0.14.0
  google_mlkit_commons: ^0.9.0
  path_provider: ^2.1.2
  share_plus: ^7.2.1
  sqflite: ^2.3.0
  flutter_spinkit: ^5.2.0

# إجبار النظام على استخدام إصدارات متوافقة
dependency_overrides:
  speech_to_text: 6.1.1

flutter:
  uses-material-design: true
  assets:
    - assets/data/
    - assets/images/
PUBSPEC

# 2. تنظيف ملفات الأندرويد لضمان إعادة البناء من الصفر
rm -rf android/build
rm -rf android/.gradle

# 3. الرفع التلقائي
git add .
git commit -m "Fix: Forced speech_to_text 6.1.1 and added dependency overrides"
git push origin main
