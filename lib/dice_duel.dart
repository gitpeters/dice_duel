import 'package:dice_duel/game_screen.dart';
import 'package:dice_duel/models/game_summary.dart';
import 'package:dice_duel/start_screen.dart';
import 'package:dice_duel/winner_screen.dart';
import 'package:flutter/material.dart';

class DiceDuel extends StatefulWidget{
  const DiceDuel({super.key});

  @override
  State<DiceDuel> createState() {
    return _DiceDuelState();
  }
}


class _DiceDuelState extends State<DiceDuel> {
  String activeScreen = 'start-screen';

  GameSummary? summary;

  void startGame() {
    setState(() {
      activeScreen = 'game-screen';
    });
  }

  void showResult(GameSummary gameSummary) {
    setState(() {
      summary = gameSummary;
      activeScreen = 'winner-screen';
    });
  }

  void restartGame() {
    setState(() {
      summary = null;
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(startGame);

    if (activeScreen == 'game-screen') {
      screen = GameScreen(showResult);
    }

    if (activeScreen == 'winner-screen') {
       screen = WinnerScreen(summary!, restartGame);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsetsGeometry.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1B1F3B), Color(0xFF2D3561)],
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}