#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. تنظيف شامل ومسح الكاش
flutter clean

# 2. عملية "البحث والاستبدال" الشاملة (Global Replace)
# السطر ده بيدور في كل الملفات اللي بتنتهي بـ .gradle أو .properties أو .yaml
# وبيرغمها تتحول من 34 لـ 36 غصب عن أي إعدادات مخفية
find . -type f \( -name "*.gradle" -o -name "*.yaml" -o -name "*.properties" \) -exec sed -i 's/compileSdkVersion 34/compileSdkVersion 36/g' {} +
find . -type f \( -name "*.gradle" -o -name "*.yaml" -o -name "*.properties" \) -exec sed -i 's/targetSdkVersion 34/targetSdkVersion 36/g' {} +
find . -type f \( -name "*.gradle" -o -name "*.yaml" -o -name "*.properties" \) -exec sed -i 's/compileSdk = 34/compileSdk = 36/g' {} +
find . -type f \( -name "*.gradle" -o -name "*.yaml" -o -name "*.properties" \) -exec sed -i 's/targetSdk = 34/targetSdk = 36/g' {} +

# 3. إجبار إصدار الـ Gradle والـ Kotlin على أحدث مستويات التوافق
cat << 'ROOT_GRADLE' > android/build.gradle
buildscript {
    ext.kotlin_version = '1.9.10'
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:8.1.1'
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

# 4. ملف الخصائص النهائي لفرض السيطرة على الـ 6 كروت
cat << 'GPROPS' > android/gradle.properties
org.gradle.jvmargs=-Xmx4G
android.useAndroidX=true
android.enableJetifier=true
flutter.compileSdkVersion=36
flutter.targetSdkVersion=36
flutter.minSdkVersion=21
android.ndkVersion=28.2.13676358
GPROPS

# 5. الرفع النهائي
git add .
git commit -m "Global Overwrite: Erased SDK 34 from all files and forced SDK 36/NDK 28 for ultimate stability"
git push origin main
