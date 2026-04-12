import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class SoulCorner extends StatefulWidget {
  const SoulCorner({super.key});

  @override
  State<SoulCorner> createState() => _SoulCornerState();
}

class _SoulCornerState extends State<SoulCorner> {
  List _hadiths = [];

  // دالة لتحميل البيانات من ملف الـ JSON اللي عملناه
  Future<void> loadHadith() async {
    try {
      final String response = await rootBundle.loadString('assets/data/hadith.json');
      final data = await json.decode(response);
      setState(() {
        _hadiths = data;
      });
    } catch (e) {
      debugPrint("خطأ في تحميل البيانات: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    loadHadith();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('ركن الروح', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: _hadiths.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _hadiths.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white.withOpacity(0.1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    title: Text(
                      _hadiths[index]['text'],
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _hadiths[index]['source'],
                        style: const TextStyle(color: Colors.amberAccent),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
