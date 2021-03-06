import 'package:flutter/material.dart';
import 'package:tictactoe/screens/GameScreen.dart';
import 'package:tictactoe/screens/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TicTacToe",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/game': (context) => GameScreen(),
      },
      initialRoute: '/',
    );
  }
}
