#!/bin/bash
cd ~/Mirror_Scorpion2

# 1. تحديث MainActivity ليتوافق مع نظام Flutter الجديد (V2)
cat << 'KOTLIN' > android/app/src/main/kotlin/com/tetocollctionway/mirror_scorpion/MainActivity.kt
package com.tetocollctionway.mirror_scorpion

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
}
KOTLIN

# 2. تنظيف ملف Manifest من المراجع القديمة
cat << 'MANIFEST' > android/app/src/main/AndroidManifest.xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.tetocollctionway.mirror_scorpion">
    
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.RECORD_AUDIO"/>
    <uses-permission android:name="android.permission.CAMERA"/>

    <application
        android:label="Mirror Scorpion"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
                android:name="io.flutter.embedding.android.NormalTheme"
                android:resource="@style/NormalTheme" />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
</manifest>
MANIFEST

# 3. تحديث أوامر جيت هب لضمان تنظيف البيئة قبل البناء
sed -i 's/flutter build apk --debug/flutter build apk --debug --no-pub/g' .github/workflows/main.yml

# 4. الرفع النهائي لكسر حاجز الـ V1
git add .
git commit -m "Migration: Updated to Android V2 embedding to support Flutter 3.22 for all cards"
git push origin main
