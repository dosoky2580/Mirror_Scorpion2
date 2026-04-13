#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. النسف: مسح مجلد الأندرويد بالكامل للتخلص من أي أثر لـ V1
rm -rf android

# 2. إعادة التوليد: إنشاء مجلد أندرويد جديد بأحدث نظام (V2) تلقائياً
flutter create . --platforms android

# 3. الحقن: تعديل الملفات الجديدة لتناسب مواصفات الـ 6 كروت و SDK 36
# تعديل ملف gradle.properties
cat << 'GPROPS' > android/gradle.properties
org.gradle.jvmargs=-Xmx4G
android.useAndroidX=true
android.enableJetifier=true
flutter.compileSdkVersion=36
flutter.targetSdkVersion=36
flutter.minSdkVersion=21
android.ndkVersion=28.2.13676358
GPROPS

# 4. تحديث الـ MainActivity.kt فوراً لضمان نظام الـ Embedding الجديد
mkdir -p android/app/src/main/kotlin/com/tetocollctionway/mirror_scorpion/
cat << 'KOTLIN' > android/app/src/main/kotlin/com/tetocollctionway/mirror_scorpion/MainActivity.kt
package com.tetocollctionway.mirror_scorpion

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
}
KOTLIN

# 5. تعديل الـ build.gradle الأساسي لفرض الـ SDK 36 يدوياً
sed -i 's/compileSdkVersion flutter.compileSdkVersion/compileSdkVersion 36/g' android/app/build.gradle
sed -i 's/targetSdkVersion flutter.targetSdkVersion/targetSdkVersion 36/g' android/app/build.gradle

# 6. تحديث الـ Workflow عشان ينظف قبل ما يبني
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
          flutter-version: '3.22.0'
      - name: Build APK
        run: |
          flutter pub get
          flutter build apk --debug
WORKFLOW

# 7. الرفع النهائي
git add .
git commit -m "Nuclear Option: Recreated Android folder from scratch to kill V1 embedding forever"
git push origin main
