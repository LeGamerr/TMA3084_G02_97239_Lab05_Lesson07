import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'alarm.dart';
import 'business.dart';
import 'school.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TabModel(),
      child: const MyApp(),
    ),
  );
}

class TabModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (index == _currentIndex) return;
    _currentIndex = index;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavLab(),
    );
  }
}

class BottomNavLab extends StatelessWidget {
  const BottomNavLab({super.key});

  static const List<Widget> screens = [
    Home(),
    Alarm(),
    Business(),
    School(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<TabModel>().currentIndex;

    return Scaffold(
      appBar: AppBar(
        title: const Text('4 Bottom Navigation Bar'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        backgroundColor: Colors.blue,
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: (int index) => context.read<TabModel>().setIndex(index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarm'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
      ),
    );
  }
}
