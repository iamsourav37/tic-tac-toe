import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/components.dart';

class GameScreen extends StatefulWidget {
  String player1;
  String player2;

  GameScreen({this.player1, this.player2});
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int player1Score;
  int player2Score;
  bool player1Turn;
  bool player2Turn;
  bool isDisabled;
  String turnMsg;
  bool isPlayer1Win;
  bool isPlayer2Win;
  String message;

  List<String> board = [
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
  ];
  AssetImage cross = AssetImage("assets/images/x.png");
  AssetImage circle = AssetImage("assets/images/o.png");
  AssetImage empty = AssetImage("assets/images/plane.png");

  @override
  void initState() {
    super.initState();
    this.player1Turn = true;
    this.player2Turn = false;
    this.turnMsg = "Your turn";
    this.player1Score = this.player2Score = 0;
    this.isDisabled = false;
    isPlayer1Win = isPlayer2Win = false;
    this.message = '';
  }

  void resetGame() {
    this.isDisabled = false;
    isPlayer1Win = isPlayer2Win = false;
    this.message = '';
    this.board = [
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
    ];
    setState(() {});
  }

  void playGame(int index) {
    if (this.board[index] == 'empty') {
      if (player1Turn) {
        this.board[index] = "X";
        this.checkWin("X");
        this.player1Turn = false;
        this.player2Turn = true;
      } else {
        this.board[index] = "O";
        this.checkWin("O");
        this.player2Turn = false;
        this.player1Turn = true;
      }
      setState(() {});
    }
  }

  AssetImage getImage(String value) {
    print('value : $value');
    switch (value) {
      case 'empty':
        return this.empty;
      case 'X':
        return this.cross;
      case 'O':
        return this.circle;
    }
  }

  void checkWin(String symbol) {
    // 0 1 2
    // 3 4 5
    // 6 7 8

    if ((board[0] != "empty") &&
        (board[0] == board[1]) &&
        (board[1] == board[2])) {
      setState(() {
        this.isDisabled = true;
      });
    }
    if ((board[3] != "empty") &&
        (board[3] == board[4]) &&
        (board[4] == board[5])) {
      setState(() {
        this.isDisabled = true;
      });
    }
    if ((board[6] != "empty") &&
        (board[6] == board[7]) &&
        (board[7] == board[8])) {
      setState(() {
        this.isDisabled = true;
      });
    }
    if ((board[0] != "empty") &&
        (board[0] == board[3]) &&
        (board[3] == board[6])) {
      setState(() {
        this.isDisabled = true;
      });
    }
    if ((board[1] != "empty") &&
        (board[1] == board[4]) &&
        (board[4] == board[7])) {
      setState(() {
        this.isDisabled = true;
      });
    }
    if ((board[2] != "empty") &&
        (board[2] == board[5]) &&
        (board[5] == board[8])) {
      setState(() {
        this.isDisabled = true;
      });
    }
    if ((board[0] != "empty") &&
        (board[0] == board[4]) &&
        (board[4] == board[8])) {
      setState(() {
        this.isDisabled = true;
      });
    }
    if ((board[2] != "empty") &&
        (board[2] == board[4]) &&
        (board[2] == board[6])) {
      setState(() {
        this.isDisabled = true;
      });
    }

    if (symbol == 'X' && isDisabled) {
      this.isPlayer1Win = true;
      this.player1Score++;
      this.message = "${widget.player1} is win !!!";
    } else if (symbol == 'O' && isDisabled) {
      this.isPlayer2Win = true;
      this.player2Score++;
      this.message = "${widget.player2} is win !!!";
    }
    if (!board.contains("empty")) {
      setState(() {
        this.message = "Game draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              this.resetGame();
              print("reload board");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: isDisabled
                        ? null
                        : () {
                            this.playGame(index);
                          },
                    child: Image(
                      image: this.getImage(this.board[index]),
                    ),
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Table(
                border: TableBorder.all(
                  color: Colors.green,
                  width: 2.12,
                ),
                children: [
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Players",
                        textAlign: TextAlign.center,
                        style: headStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Score",
                        textAlign: TextAlign.center,
                        style: headStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Turn",
                        textAlign: TextAlign.center,
                        style: headStyle,
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.player1,
                        style: textStyle,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(this.player1Score.toString())),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(player1Turn ? turnMsg : ''),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.player2,
                        style: textStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(this.player2Score.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(player2Turn ? turnMsg : ''),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          Spacer(),
          Center(
            child: Text(
              this.message,
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
