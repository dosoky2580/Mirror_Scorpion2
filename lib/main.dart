import 'package:flutter/material.dart';

void main() {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MirrorApp());
  } catch (e) {
    debugPrint("Scorpion Initialization Error: $e");
  }
}

class MirrorApp extends StatelessWidget {
  const MirrorApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Text("Mirror Engine V2 - SDK 36"))),
    );
  }
}
