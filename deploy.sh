#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. تحديث ملف الخصائص لإجبار الفريمورك على استخدام SDK 36
cat << 'PROPERTIES' > android/local.properties
flutter.sdk=/usr/local/lib/forty/flutter
flutter.buildMode=debug
flutter.versionName=1.0.0
flutter.versionCode=1
flutter.compileSdkVersion=36
flutter.targetSdkVersion=36
PROPERTIES

# 2. إعادة كتابة build.gradle بمواصفات "المسطرة" النهائية
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
    compileSdkVersion 36 // رفعنا السقف لـ 36 لضمان التوافق التام

    defaultConfig {
        applicationId "com.tetocollctionway.mirror_scorpion"
        minSdkVersion 21
        targetSdkVersion 36
        versionCode 1
        versionName "1.0"
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = '1.8'
    }
}
APP_GRADLE

# 3. الرفع التلقائي
git add .
git commit -m "Fix: Hard-coded SDK 36 in build.gradle and local.properties to satisfy Camera dependency"
git push origin main
