import 'package:flutter/material.dart';
import 'package:music_player/home.dart';
import 'package:music_player/splash_screen.dart';
import 'package:music_player/songpage.dart';
void main() {
  runApp(
    MaterialApp(
      initialRoute: 'splash',
      routes: {
        'home' : (context) =>MyHomePage(),
        'splash': (context) =>Splash(),
      },
    ),
  );
}