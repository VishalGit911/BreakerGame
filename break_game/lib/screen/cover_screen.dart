import 'package:flutter/material.dart';

class CoverScreen extends StatelessWidget {
  final bool gamestarted;
  CoverScreen({super.key, required this.gamestarted});

  @override
  Widget build(BuildContext context) {
    return gamestarted
        ? Container()
        : Container(
            alignment: Alignment(0, -0.2),
            child: Text(
              "tap to play",
              style: TextStyle(color: Colors.deepPurple[400]),
            ),
          );
    ;
  }
}
