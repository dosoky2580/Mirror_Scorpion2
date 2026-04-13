package com.tetocollctionway.mirror.di

import android.content.Context
import com.tetocollctionway.mirror.security.ScorpionCrypto
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object SecurityModule {

    @Provides
    @Singleton
    fun provideScorpionCrypto(@ApplicationContext context: Context): ScorpionCrypto {
        return ScorpionCrypto(context)
    }
}
