mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
import 'package:flutter/material.dart';
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
import 'package:google_fonts/google_fonts.dart';
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';

mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
void main() {
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  WidgetsFlutterBinding.ensureInitialized();
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  runApp(const MirrorScorpion2());
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
}
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';

mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
class MirrorScorpion2 extends StatelessWidget {
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  const MirrorScorpion2({super.key});
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';

mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  @override
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  Widget build(BuildContext context) {
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
    return MaterialApp(
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
      title: 'Mirror Scorpion 2',
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
      debugShowCheckedModeBanner: false,
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
      theme: ThemeData(
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
        useMaterial3: true,
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
        colorScheme: ColorScheme.fromSeed(
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
          seedColor: Colors.deepPurple,
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
          brightness: Brightness.dark,
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
        ),
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
        textTheme: GoogleFonts.rubikTextTheme(ThemeData.dark().textTheme),
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
      ),
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
      home: const MainNavigationScreen(),
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
    );
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  }
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
}
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';

mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
class MainNavigationScreen extends StatefulWidget {
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  const MainNavigationScreen({super.key});
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';

mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  @override
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
}
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';

mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
class _MainNavigationScreenState extends State<MainNavigationScreen> {
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  int _selectedIndex = 0;
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';

mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  // هذه القائمة ستضم الواجهات التي سنبنيها خطوة بخطوة
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  final List<Widget> _pages = [
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
    const SoulCorner(),
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
    const Center(child: Text('العدسة (قريباً)', style: TextStyle(fontSize: 24))),
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
    const Center(child: Text('محادثة أدهم (قريباً)', style: TextStyle(fontSize: 24))),
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  ];
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';

mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  @override
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  Widget build(BuildContext context) {
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
    return Scaffold(
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
      body: Container(
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
        decoration: const BoxDecoration(
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
          gradient: LinearGradient(
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
            begin: Alignment.topLeft,
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
            end: Alignment.bottomRight,
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
            colors: [Color(0xFF0F0C29), Color(0xFF302B63), Color(0xFF24243E)],
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
          ),
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
        ),
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
        child: _pages[_selectedIndex],
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
      ),
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
      bottomNavigationBar: NavigationBar(
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
        selectedIndex: _selectedIndex,
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
        onDestinationSelected: (int index) {
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
          setState(() {
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
            _selectedIndex = index;
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
          });
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
        },
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
        destinations: const [
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
          NavigationDestination(icon: Icon(Icons.auto_stories), label: 'الروح'),
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
          NavigationDestination(icon: Icon(Icons.remove_red_eye), label: 'العدسة'),
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
          NavigationDestination(icon: Icon(Icons.psychology), label: 'أدهم'),
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
        ],
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
      ),
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
    );
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
  }
mport 'package:google_fonts/google_fonts.dart';/a import 'package:mirror_scorpion2/ui/soul_corner.dart';
}
