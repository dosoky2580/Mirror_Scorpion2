#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. تحديث المكتبات لإصدارات أكثر استقراراً مع الأندرويد الحديث
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
  speech_to_text: ^6.1.1  # العودة لإصدار مستقر يتوافق مع الأندرويد الحديث
  flutter_tts: ^3.8.5
  camera: ^0.10.5+9
  google_mlkit_translation: ^0.12.0
  google_mlkit_text_recognition: ^0.14.0
  google_mlkit_commons: ^0.9.0
  path_provider: ^2.1.2
  share_plus: ^7.2.1
  sqflite: ^2.3.0
  flutter_spinkit: ^5.2.0

flutter:
  uses-material-design: true
  assets:
    - assets/data/
    - assets/images/
PUBSPEC

# 2. إضافة إعدادات التوافق للأندرويد (Kotlin/Gradle)
# هذا الجزء يضمن عدم حدوث تضارب في لغة Kotlin
mkdir -p android/app
cat << 'GRADLE' > android/build.gradle
buildscript {
    ext.kotlin_version = '1.8.10'
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:7.3.0'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
GRADLE

# 3. الرفع التلقائي
git add .
git commit -m "Fix: SpeechToText Kotlin compilation error and Gradle update"
git push origin main
