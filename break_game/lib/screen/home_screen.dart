import 'dart:async';

import 'package:break_game/screen/ball_screen.dart';
import 'package:break_game/screen/cover_screen.dart';
import 'package:break_game/screen/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //ball variable
  double ballx = 0;
  double bally = 0;

  //player variable

  double playerx = 0;
  double playerwidth = 0.3;

  //game setting
  bool gamestarted = false;

  //start game
  void startgame() {
    gamestarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        bally += 0.001;
      });
    });
  }

  //move player left
  void moveleft() {
    setState(() {
      if (!(playerx - 0.2 <= -1)) {
        playerx -= 0.2;
      }
    });
  }

  //move player right
  void moveright() {
    setState(() {
      if (!(playerx + 0.2 >= 1)) {
        playerx += 0.2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (value) {
        if (value.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          moveleft();
        } else if (value.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          moveright();
        }
      },
      child: GestureDetector(
        onTap: startgame,
        child: Scaffold(
          backgroundColor: Colors.deepPurple[100],
          body: Center(
            child: Stack(
              children: [
                //tap to play
                CoverScreen(gamestarted: gamestarted),
                //ball
                BallScreen(ballx: ballx, bally: bally),
                // player
                PlayerScreen(playerx: playerx, playerwidth: playerwidth),
                Container(
                  alignment: Alignment(playerx, 0.9),
                  child: Container(
                    color: Colors.red,
                    width: 4,
                    height: 15,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
