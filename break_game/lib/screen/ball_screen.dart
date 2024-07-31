import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BallScreen extends StatelessWidget {
  final ballx;
  final bally;
  BallScreen({super.key, required this.ballx, required this.bally});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(ballx, bally),
      child: Container(
        height: 15,
        width: 15,
        decoration:
            BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
      ),
    );
  }
}
