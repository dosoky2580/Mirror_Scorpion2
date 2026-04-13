#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. إنشاء/تعديل ملف أوامر جيت هب (المدير الحقيقي)
mkdir -p .github/workflows
cat << 'WORKFLOW' > .github/workflows/main.yml
name: Scorpion Remote Engine

on:
  push:
    branches: [ main ]
  pull_request:
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
          flutter-version: '3.19.0' # إصدار حديث يدعم SDK 36

      - name: Install Android SDK 36
        run: |
          echo "y" | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install "platforms;android-36" "build-tools;36.0.0"

      - name: Install Dependencies
        run: flutter pub get

      - name: Build APK
        run: flutter build apk --debug --target-platform android-arm64 --extra-gen-snapshot-options=--deterministic
WORKFLOW

# 2. التأكيد على ملفات الأندرويد الداخلية تكراراً
sed -i 's/compileSdkVersion 34/compileSdkVersion 36/g' android/app/build.gradle
sed -i 's/targetSdkVersion 34/targetSdkVersion 36/g' android/app/build.gradle

# 3. الرفع النهائي
git add .
git commit -m "Engine Fix: Updated GitHub Workflow to support Android SDK 36 for all 6 cards"
git push origin main
