package com.tetocollctionway.mirror

import android.app.Application
import androidx.hilt.work.HiltWorkerFactory
import androidx.work.Configuration
import dagger.hilt.android.HiltAndroidApp
import javax.inject.Inject

/**
 * ScorpionApp: قلب التطبيق والمسؤول عن تهيئة المحركات الحيوية.
 */
@HiltAndroidApp
class ScorpionApp : Application(), Configuration.Provider {

    @Inject
    lateinit var workerFactory: HiltWorkerFactory

    override fun onCreate() {
        super.onCreate()
        // هنا سيتم لاحقاً تهيئة نظام التشفير ScorpionCrypto
        // وإعداد قنوات الإشعارات لرسائل الإلهام
    }

    override val workManagerConfiguration: Configuration
        get() = Configuration.Builder()
            .setWorkerFactory(workerFactory)
            .build()
}
