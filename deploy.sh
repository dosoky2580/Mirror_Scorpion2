#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. حذف ملفات التعريف القديمة اللي مسببة الأزمة
rm -f android/app/src/main/kotlin/com/tetocollctionway/mirror_scorpion/MainActivity.kt
rm -f android/app/src/main/java/com/tetocollctionway/mirror_scorpion/MainActivity.java

# 2. إعادة إنشاء مسار الكود بنظام Kotlin الحديث (V2)
mkdir -p android/app/src/main/kotlin/com/tetocollctionway/mirror_scorpion/
cat << 'KOTLIN' > android/app/src/main/kotlin/com/tetocollctionway/mirror_scorpion/MainActivity.kt
package com.tetocollctionway.mirror_scorpion

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
}
KOTLIN

# 3. تحديث ملف الإعدادات العام لإلغاء أي إشارة للنظام القديم
cat << 'GRADLE_PROPS' > android/gradle.properties
org.gradle.jvmargs=-Xmx4G
android.useAndroidX=true
android.enableJetifier=true
flutter.compileSdkVersion=36
flutter.targetSdkVersion=36
flutter.minSdkVersion=21
android.ndkVersion=28.2.13676358
# سطر السحر لإجبار الفريمورك على V2
flutter.embeddingVersion=2
GRADLE_PROPS

# 4. تنظيف شامل ورفع
flutter clean
git add .
git commit -m "Final Purge: Removed all V1 embedding remnants and forced V2 for all cards"
git push origin main
