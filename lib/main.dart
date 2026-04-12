import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ui/soul_corner.dart';

void main() {
  runApp(const MirrorScorpion2());
}

class MirrorScorpion2 extends StatelessWidget {
  const MirrorScorpion2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirror Scorpion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return const SoulCorner();
  }
}
