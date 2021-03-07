import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/components.dart';
import 'package:tic_tac_toe/screens/GameScreen.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String player1 = "Unknown 1";
  String player2 = "Unknown 2";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: TextFormField(
                    onChanged: (value) {
                      this.player1 = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                      labelText: "Player 1",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: TextFormField(
                    onChanged: (value) {
                      this.player2 = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                      labelText: "Player 2",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () {
                    // go to game screen with players name
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GameScreen(
                        player1: player1,
                        player2: player2,
                      );
                    }));
                    print('testing');
                  },
                  child: Text(
                    "Play Game",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                TextButton(
                  onPressed: () {
                    // go to game screen without players name (unknown)
                  },
                  child: Text("Play as unknown player"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
