import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  // نظام Catch لجميع أخطاء التطبيق (الـ 6 كروت)
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MirrorApp());
  }, (error, stack) {
    debugPrint('Scorpion Engine Error: $error');
    // هنا ممكن تضيف لوج للأخطاء مستقبلاً
  });
}

class MirrorApp extends StatelessWidget {
  const MirrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirror Scorpion',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Scorpion Engine v2 (SDK 36) Ready'),
      ),
    );
  }
}
