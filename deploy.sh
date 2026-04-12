#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. تحديث المكتبات لأحدث إصدارات مستقرة تتوافق مع Android 35
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
  speech_to_text: ^6.6.2  # العودة للأحدث مع ضبط الأندرويد
  flutter_tts: ^4.2.2
  camera: ^0.11.0
  google_mlkit_translation: ^0.12.0
  google_mlkit_text_recognition: ^0.14.0
  google_mlkit_commons: ^0.9.0
  path_provider: ^2.1.2
  share_plus: ^10.1.0
  sqflite: ^2.3.0
  flutter_spinkit: ^5.2.1

flutter:
  uses-material-design: true
  assets:
    - assets/data/
    - assets/images/
PUBSPEC

# 2. ضبط ملف android/app/build.gradle لرفع الـ SDK لـ 35
# هذا الجزء هو "المفتاح" لحل كل التحذيرات اللي ظهرت في جيت هب
mkdir -p android/app
cat << 'APP_GRADLE' > android/app/build.gradle
def localProperties = new Properties()
def localPropertiesFile = rootProject.file('local.properties')
if (localPropertiesFile.exists()) {
    localPropertiesFile.withReader('UTF-8') { reader ->
        localProperties.load(reader)
    }
}

apply plugin: 'com.android.application'
apply plugin: 'kotlin-android'
apply from: "$flutterRoot/packages/flutter_tools/gradle/flutter.gradle"

android {
    namespace "com.tetocollctionway.mirror_scorpion"
    compileSdkVersion 35  // رفع التوافق لـ 35

    defaultConfig {
        applicationId "com.tetocollctionway.mirror_scorpion"
        minSdkVersion 21
        targetSdkVersion 35
        versionCode 1
        versionName "1.0"
    }

    buildTypes {
        release {
            signingConfig signingConfigs.debug
        }
    }
}

dependencies {
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
}
APP_GRADLE

# 3. الرفع التلقائي
git add .
git commit -m "Fix: Upgraded Android SDK to 35 and resolved namespace issues"
git push origin main
