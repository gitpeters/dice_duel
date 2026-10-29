import 'package:dice_duel/models/game_summary.dart';
import 'package:dice_duel/widgets/roll_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WinnerScreen extends StatelessWidget {
  const WinnerScreen(this.summary, this.restartGame, {super.key});

  final GameSummary summary;
  final Function() restartGame;

  @override
  Widget build(BuildContext context) {
    final winnerScore = summary.scores[summary.winner - 1];
    final loserScore = summary.scores[summary.winner == 1 ? 1: 0];
    final totalWinnerSix = summary.history
        .where((r) => r.player == summary.winner && r.value == 6)
        .length;
    final totalLoserSix = summary.history
        .where((r) => r.player != summary.winner && r.value == 6)
        .length;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
          'assets/images/trophy.png', 
          width: 100, 
          ),
          SizedBox(height: 20),
          Text(
            'Player ${summary.winner} wins!',
            style: GoogleFonts.fredoka(
              color: summary.winner == 1
                  ? Color(0xFFFF6B6B)
                  : Color(0xFF4ECDC4),
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 70,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Color.fromARGB(208, 45, 53, 97),
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: Text(
                  '$winnerScore vs $loserScore',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                width: 100,
                height: 70,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Color.fromARGB(208, 45, 53, 97),
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: Text(
                  '${summary.history.length} rolls',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                width: 100,
                height: 70,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Color.fromARGB(208, 45, 53, 97),
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Sixes: $totalWinnerSix vs $totalLoserSix',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Every roll',
              style: GoogleFonts.poppins(
                color: Color(0xFFB9BFE0),
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: summary.history.map((record) {
                  return RollRow(record);
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: restartGame,
            icon: Icon(
              Icons.restart_alt_outlined,
              size: 20,
              fontWeight: FontWeight.bold,
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(width: 2, color: Colors.white),
            ),
            label: Text(
              'Play again',
              style: GoogleFonts.fredoka(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
