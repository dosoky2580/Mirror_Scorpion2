package com.tetocollctionway.mirror

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import com.tetocollctionway.mirror.ui.theme.MirrorScorpionTheme
import com.tetocollctionway.mirror.ui.theme.ScorpionGold
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState: Bundle?)
        setContent {
            MirrorScorpionTheme {
                // شاشة مؤقتة للتأكد من انطلاق النبض الذهبي
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(MaterialTheme.colorScheme.background),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        text = "Mirror Scorpion:\n حيث تُصنع البدايات",
                        color = ScorpionGold,
                        style = MaterialTheme.typography.titleLarge
                    )
                }
            }
        }
    }
}
