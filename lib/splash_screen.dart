import 'package:flutter/material.dart';
import 'dart:async'; // Untuk menggunakan Timer

import 'main.dart'; // Untuk mengakses HomeScreen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer untuk berpindah ke halaman utama setelah 3 detik
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF013220), // Warna latar belakang splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo atau ikon aplikasi
            Icon(
              Icons.music_note, // Ganti dengan logo Anda
              color: Colors.white,
              size: 100,
            ),
            SizedBox(height: 20),
            // Nama aplikasi
            Text(
              'LOVETIFY',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'RobotoSlab', // Gunakan font favorit Anda
              ),
            ),
          ],
        ),
      ),
    );
  }
}
