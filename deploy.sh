#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. تنظيف شامل
flutter clean

# 2. إنشاء ملف gradle.properties لفرض الـ SDK على مستوى النظام
cat << 'GPROPS' > android/gradle.properties
org.gradle.jvmargs=-Xmx4G
android.useAndroidX=true
android.enableJetifier=true
# فرض الإصدارات هنا
flutter.compileSdkVersion=36
flutter.targetSdkVersion=36
flutter.minSdkVersion=21
GPROPS

# 3. تعديل ملف build.gradle (القديم والجديد) لضمان القضاء على رقم 34
# هنستخدم "sed" عشان نبدل أي رقم 34 بـ 36 في كل ملفات الجرادل
find android -name "*.gradle" -exec sed -i 's/compileSdkVersion 34/compileSdkVersion 36/g' {} +
find android -name "*.gradle" -exec sed -i 's/targetSdkVersion 34/targetSdkVersion 36/g' {} +

# 4. إعادة بناء ملف android/app/build.gradle بشكل يدوي وصريح جداً
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
    
    // الأرقام النهائية المطلوبة
    compileSdkVersion 36
    ndkVersion "28.2.13676358"

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

# 5. الرفع الرفع التلقائي
git add .
git commit -m "Final Overdrive: Forced SDK 36 via gradle.properties and global sed replacement"
git push origin main
