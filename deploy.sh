#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. تنظيف عميق للمشروع وحذف الملفات التي تسبب التعارض
flutter clean
rm -f android/app/build.gradle
rm -f android/app/build.gradle.kts

# 2. إنشاء ملف build.gradle.kts (الذي يطلبه جيت هب) بالقيم المطلوبة حرفياً
cat << 'KTS_GRADLE' > android/app/build.gradle.kts
plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.tetocollctionway.mirror_scorpion"
    compileSdk = 36
    ndkVersion = "28.2.13676358"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }

    defaultConfig {
        applicationId = "com.tetocollctionway.mirror_scorpion"
        minSdk = 21
        targetSdk = 36
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}
KTS_GRADLE

# 3. تحديث ملف الإعدادات العام (Settings) ليتناسب مع النظام الجديد
cat << 'SETTINGS' > android/settings.gradle
pluginManagement {
    def flutterSdkPath = {
        def properties = new Properties()
        file("local.properties").withInputStream { properties.load(it) }
        def flutterSdkPath = properties.getProperty("flutter.sdk")
        assert flutterSdkPath != null, "flutter.sdk not set in local.properties"
        return flutterSdkPath
    }()

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id "dev.flutter.flutter-gradle-plugin" version "1.0.0" apply false
    id "com.android.application" version "8.1.0" apply false
    id "org.jetbrains.kotlin.android" version "1.8.22" apply false
}

include ":app"
SETTINGS

# 4. الرفع التلقائي لفرض التغييرات
git add .
git commit -m "Ultra Force: Switched to build.gradle.kts with SDK 36 and NDK 28 as requested by GitHub"
git push origin main
