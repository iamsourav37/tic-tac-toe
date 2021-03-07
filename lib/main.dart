import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/GameScreen.dart';
import 'package:tic_tac_toe/screens/HomePage.dart';


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
