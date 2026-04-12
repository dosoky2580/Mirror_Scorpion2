import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';

import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
void main() {
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  WidgetsFlutterBinding.ensureInitialized();
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  runApp(const MirrorScorpion2());
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
}
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';

import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
class MirrorScorpion2 extends StatelessWidget {
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  const MirrorScorpion2({super.key});
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';

import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  @override
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  Widget build(BuildContext context) {
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
    return MaterialApp(
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
      title: 'Mirror Scorpion 2',
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
      debugShowCheckedModeBanner: false,
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
      theme: ThemeData(
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
        useMaterial3: true,
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
        colorScheme: ColorScheme.fromSeed(
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
          seedColor: Colors.deepPurple,
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
          brightness: Brightness.dark,
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
        ),
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
        textTheme: GoogleFonts.rubikTextTheme(ThemeData.dark().textTheme),
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
      ),
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
      home: const MainNavigationScreen(),
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
    );
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  }
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
}
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';

import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
class MainNavigationScreen extends StatefulWidget {
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  const MainNavigationScreen({super.key});
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';

import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  @override
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
}
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';

import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
class _MainNavigationScreenState extends State<MainNavigationScreen> {
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  int _selectedIndex = 0;
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';

import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  // هذه القائمة ستضم الواجهات التي سنبنيها خطوة بخطوة
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  final List<Widget> _pages = [
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
    const SoulCorner(),
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
    const Center(child: Text('العدسة (قريباً)', style: TextStyle(fontSize: 24))),
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
    const Center(child: Text('محادثة أدهم (قريباً)', style: TextStyle(fontSize: 24))),
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  ];
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';

import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  @override
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  Widget build(BuildContext context) {
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
    return Scaffold(
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
      body: Container(
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
        decoration: const BoxDecoration(
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
          gradient: LinearGradient(
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
            begin: Alignment.topLeft,
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
            end: Alignment.bottomRight,
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
            colors: [Color(0xFF0F0C29), Color(0xFF302B63), Color(0xFF24243E)],
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
          ),
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
        ),
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
        child: _pages[_selectedIndex],
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
      ),
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
      bottomNavigationBar: NavigationBar(
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
        selectedIndex: _selectedIndex,
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
        onDestinationSelected: (int index) {
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
          setState(() {
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
            _selectedIndex = index;
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
          });
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
        },
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
        destinations: const [
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
          NavigationDestination(icon: Icon(Icons.auto_stories), label: 'الروح'),
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
          NavigationDestination(icon: Icon(Icons.remove_red_eye), label: 'العدسة'),
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
          NavigationDestination(icon: Icon(Icons.psychology), label: 'أدهم'),
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
        ],
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
      ),
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
    );
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
  }
import 'package:google_fonts/google_fonts.dart';;
import 'package:mirror_scorpion2/ui/soul_corner.dart';
}
