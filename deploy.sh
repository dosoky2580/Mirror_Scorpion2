#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. تحديث المكتبات (pubspec.yaml) لتكون جاهزة لكل الكروت (AI, Vision, Audio)
cat << 'PUBSPEC' > pubspec.yaml
name: mirror_scorpion
description: Mirror Scorpion Ultimate AI Project
version: 1.0.0+1

environment:
  sdk: '>=3.2.0 <4.0.0' # رفعنا الـ SDK بتاع فلاتر لضمان أحدث المميزات

dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.2.0
  shared_preferences: ^2.2.3
  intl: ^0.19.0
  http: ^1.2.1
  google_generative_ai: ^0.4.4 # كرت الإلهام والذكاء الصناعي
  speech_to_text: ^6.6.2       # كرت الحوار المترجم
  flutter_tts: ^4.2.2          # كرت النطق الصوتي
  camera: ^0.11.0              # كرت العدسة والمستندات
  google_mlkit_translation: ^0.12.0
  google_mlkit_text_recognition: ^0.14.0 # كرت المستندات
  google_mlkit_commons: ^0.9.0
  path_provider: ^2.1.3
  share_plus: ^10.1.0
  sqflite: ^2.3.3              # قاعدة البيانات لكل الكروت
  flutter_spinkit: ^5.2.1

flutter:
  uses-material-design: true
  assets:
    - assets/data/
    - assets/images/
PUBSPEC

# 2. ضبط أندرويد "النهائي" (Android Manifest) لإعطاء صلاحيات المايك والكاميرا والإنترنت
cat << 'MANIFEST' > android/app/src/main/AndroidManifest.xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.tetocollctionway.mirror_scorpion">
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.RECORD_AUDIO"/>
    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <application
        android:label="Mirror Scorpion"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:theme="@style/LaunchTheme">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
    </application>
</manifest>
MANIFEST

# 3. فرض الـ SDK 36 والـ NDK 28 في ملف الإعدادات الأساسي
cat << 'GRADLE_PROPS' > android/gradle.properties
org.gradle.jvmargs=-Xmx4G
android.useAndroidX=true
android.enableJetifier=true
flutter.compileSdkVersion=36
flutter.targetSdkVersion=36
flutter.minSdkVersion=21
android.ndkVersion=28.2.13676358
GRADLE_PROPS

# 4. تنظيف ورفع
flutter clean
git add .
git commit -m "Foundation Update: Prepared structure for all 6 cards with SDK 36/NDK 28"
git push origin main
