#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. تحديث ملف أوامر جيت هب لأحدث إصدار فلاتر مستقر
mkdir -p .github/workflows
cat << 'WORKFLOW' > .github/workflows/main.yml
name: Scorpion Remote Engine

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Set up Java
        uses: actions/setup-java@v3
        with:
          distribution: 'zulu'
          java-version: '17'

      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          # استخدام أحدث نسخة مستقرة لضمان توافق Dart 3.4+
          flutter-version: '3.22.0' 

      - name: Install Android SDK 36
        run: |
          echo "y" | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install "platforms;android-36" "build-tools;36.0.0"

      - name: Install Dependencies
        run: flutter pub get

      - name: Build APK
        run: flutter build apk --debug
WORKFLOW

# 2. ضبط ملف pubspec ليتوافق مع الماكينة الجديدة
sed -i 's/sdk: ">=3.0.0 <4.0.0"/sdk: ">=3.2.0 <4.0.0"/g' pubspec.yaml

# 3. الرفع النهائي
git add .
git commit -m "Engine Upgrade: Switched to Flutter 3.22.0 to support Dart 3.4 and SDK 36 for all cards"
git push origin main
