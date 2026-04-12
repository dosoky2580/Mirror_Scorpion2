#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. تنظيف شامل
flutter clean
rm -rf android/app/build.gradle

# 2. إعادة إنشاء ملف build.gradle بنظام "الفرض المطلق"
cat << 'APP_GRADLE' > android/app/build.gradle
apply plugin: 'com.android.application'
apply plugin: 'kotlin-android'
apply from: "$flutterRoot/packages/flutter_tools/gradle/flutter.gradle"

android {
    namespace "com.tetocollctionway.mirror_scorpion"
    
    // الأرقام اللي طلبها جيت هب بالاسم
    compileSdkVersion 36
    ndkVersion "28.2.13676358"

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = '1.8'
    }

    defaultConfig {
        applicationId "com.tetocollctionway.mirror_scorpion"
        // إجبار الأرقام هنا أيضاً
        minSdkVersion 21
        targetSdkVersion 36
        compileSdk = 36
        versionCode 1
        versionName "1.0"
        
        multiDexEnabled true
    }

    buildTypes {
        release {
            signingConfig signingConfigs.debug
        }
    }
}

dependencies {
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
    implementation 'com.android.support:multidex:1.0.3'
}
APP_GRADLE

# 3. تحديث ملف الإعدادات الخارجي ليتوافق مع Gradle الجديد
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

# 4. الرفع التلقائي
git add .
git commit -m "Final Force: SDK 36, NDK 28, and manual build.gradle override"
git push origin main
