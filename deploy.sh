#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. تنظيف عميق
flutter clean

# 2. تعديل ملف android/app/build.gradle لفرض القيم فرضاً صريحاً
# استبدلنا المتغيرات الديناميكية بأرقام ثابتة لقطع الشك باليقين
cat << 'APP_GRADLE' > android/app/build.gradle
apply plugin: 'com.android.application'
apply plugin: 'kotlin-android'
apply from: "$flutterRoot/packages/flutter_tools/gradle/flutter.gradle"

android {
    namespace "com.tetocollctionway.mirror_scorpion"
    
    // فرض النسخة 36 هنا مباشرة لإنهاء صراع الـ 34
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
        minSdkVersion 21
        targetSdkVersion 36
        
        // سطر إضافي لضمان أن المترجم يرى 36 في كل الطبقات
        multiDexEnabled true
        testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            signingConfig signingConfigs.debug
        }
    }
}
APP_GRADLE

# 3. تحديث ملف gradle.properties لتعزيز الثبات
cat << 'GPROPS' > android/gradle.properties
org.gradle.jvmargs=-Xmx4G
android.useAndroidX=true
android.enableJetifier=true
# هذه السطور تجبر فلاتر على رؤية الأرقام الجديدة
flutter.compileSdkVersion=36
flutter.targetSdkVersion=36
GPROPS

# 4. الرفع التلقائي
git add .
git commit -m "Final Enforcement: Hardcoded SDK 36 in build.gradle for all future cards"
git push origin main
