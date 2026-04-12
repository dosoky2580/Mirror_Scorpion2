#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. مسح شامل لأي كاش قديم
rm -f android/local.properties
flutter clean

# 2. إنشاء ملف local.properties جديد تماماً بالرقم المطلوب
cat << 'PROPERTIES' > android/local.properties
sdk.dir=/usr/local/lib/android/sdk
flutter.sdk=/usr/local/lib/forty/flutter
flutter.buildMode=debug
flutter.versionName=1.0.0
flutter.versionCode=1
PROPERTIES

# 3. إعادة كتابة ملف build.gradle مع حذف أي مرجع للـ SDK القديم
cat << 'APP_GRADLE' > android/app/build.gradle
apply plugin: 'com.android.application'
apply plugin: 'kotlin-android'
apply from: "$flutterRoot/packages/flutter_tools/gradle/flutter.gradle"

android {
    namespace "com.tetocollctionway.mirror_scorpion"
    
    // فرض النسخة 36 في كل المتغيرات
    compileSdkVersion 36
    buildToolsVersion "36.0.0"

    defaultConfig {
        applicationId "com.tetocollctionway.mirror_scorpion"
        minSdkVersion 21
        targetSdkVersion 36
        versionCode 1
        versionName "1.0"
        multiDexEnabled true
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

# 4. تحديث ملف الإعدادات العام للمشروع (android/build.gradle)
cat << 'ROOT_GRADLE' > android/build.gradle
buildscript {
    ext.kotlin_version = '1.9.0'
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:8.1.0'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
ROOT_GRADLE

# 5. الرفع التلقائي
git add .
git commit -m "Critical Fix: Forced SDK 36 and Gradle 8.1.0 to break the SDK 34 loop"
git push origin main
