import 'dart:math';

import 'package:dice_duel/models/game_summary.dart';
import 'package:dice_duel/models/roll_record.dart';
import 'package:dice_duel/widgets/die_face.dart';
import 'package:dice_duel/widgets/player_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen(this.processResult, {super.key});

  final Function(GameSummary summary) processResult;

  @override
  State<GameScreen> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> {
  List<int> scores = [0, 0]; // index 0 = Player 1
  int currentPlayer = 1;
  int lastPlayer = 1;
  int? lastRoll;
  final List<RollRecord> history = [];

  final randomizer = Random();

  void rollDice() {
    final roll  = randomizer.nextInt(6) + 1;
    setState(() {
      lastRoll = roll;
      lastPlayer = currentPlayer;

      scores[currentPlayer -1] += roll;
      history.add(RollRecord(currentPlayer, roll, scores[currentPlayer -1]));

      if (roll != 6) {
        currentPlayer = currentPlayer == 1 ? 2 : 1;
      }

      if (scores[lastPlayer -1] >= 30) {
        widget.processResult(GameSummary(lastPlayer, scores, history));
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Dice Duel',
                  style: GoogleFonts.fredoka(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(208, 45, 53, 97),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'First to 30',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PlayerCard(1, scores[0], currentPlayer == 1),
                PlayerCard(2, scores[1], currentPlayer == 2),
              ],
            ),
            Column(
              children: [
                Text(
                  "Player $currentPlayer's turn",
                  style: GoogleFonts.fredoka(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                DieFace(lastRoll),
                SizedBox(height: 20),
                Text(
                  lastRoll == null ? 'Tap Roll to start' : "Player $currentPlayer rolled a $lastRoll",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 80),
                OutlinedButton(
                  onPressed: rollDice,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFF4ECDC4),
                    foregroundColor: Colors.black,
                    // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    fixedSize: const Size(370, 70),
                  ),
                  child: Text(
                    'Roll',
                    style: GoogleFonts.fredoka(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
