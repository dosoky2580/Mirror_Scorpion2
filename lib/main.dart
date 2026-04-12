import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MirrorScorpion2());
}

class MirrorScorpion2 extends StatelessWidget {
  const MirrorScorpion2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirror Scorpion 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.rubikTextTheme(ThemeData.dark().textTheme),
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
  int _selectedIndex = 0;

  // هذه القائمة ستضم الواجهات التي سنبنيها خطوة بخطوة
  final List<Widget> _pages = [
    const Center(child: Text('ركن الروح (قريباً)', style: TextStyle(fontSize: 24))),
    const Center(child: Text('العدسة (قريباً)', style: TextStyle(fontSize: 24))),
    const Center(child: Text('محادثة أدهم (قريباً)', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F0C29), Color(0xFF302B63), Color(0xFF24243E)],
          ),
        ),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.auto_stories), label: 'الروح'),
          NavigationDestination(icon: Icon(Icons.remove_red_eye), label: 'العدسة'),
          NavigationDestination(icon: Icon(Icons.psychology), label: 'أدهم'),
        ],
      ),
    );
  }
}
