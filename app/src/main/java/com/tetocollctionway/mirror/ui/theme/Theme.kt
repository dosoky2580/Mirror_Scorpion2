package com.tetocollctionway.mirror.ui.theme

import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.runtime.Composable

private val ScorpionDarkColorScheme = darkColorScheme(
    primary = ScorpionGold,
    secondary = ScorpionRoyalBlue,
    background = ScorpionBackground,
    surface = ScorpionSurface,
    onPrimary = ScorpionOnPrimary,
    onSecondary = ScorpionOnSecondary
)

@Composable
fun MirrorScorpionTheme(
    content: @Composable () -> Unit
) {
    MaterialTheme(
        colorScheme = ScorpionDarkColorScheme,
        typography = Typography,
        content = content
    )
}
