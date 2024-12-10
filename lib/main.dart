import 'package:flutter/material.dart';
import 'library_page.dart';
import 'top_page.dart';
import 'stats_page.dart';
import 'splash_screen.dart'; // Tambahkan impor untuk splash screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0A0A0A), // Background color
        primaryColor: Color(0xFF013220), // Secondary color
      ),
      home: SplashScreen(), // Tampilkan splash screen terlebih dahulu
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Current selected index for the navbar

  final List<Widget> _pages = [
    LibraryPage(), // Library Page
    TopPage(),     // Top Page
    StatsPage(),   // Stats Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Color.fromARGB(255, 0, 186, 78), // Navbar background color
        selectedItemColor: Colors.white, // Selected item color
        unselectedItemColor: Colors.grey, // Unselected item color
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded),
            label: 'Top',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}
