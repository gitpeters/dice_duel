import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard(
    this.player,
    this.totalScore,
    this.isActivePlayer, {
    super.key,
  });

  final int player;
  final int totalScore;
  final bool isActivePlayer;

  Color setPlayerColor() {
    return player ==1 ? Color(0xFFFF6B6B) : Color(0xFF4ECDC4);
  }

  Color setActiveTextColor() {
    return isActivePlayer ? Colors.white : Colors.white.withValues(alpha: 0.1);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isActivePlayer ? 1 : 0.55,
      child: Container(
        width: 140,
        height: 140,
        padding: EdgeInsetsGeometry.all(12),
        decoration: BoxDecoration(
          color: Color.fromARGB(208, 45, 53, 97),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isActivePlayer ? setPlayerColor() : Color.fromARGB(208, 45, 53, 97),
            width: 2.0
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PLAYER $player',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: setPlayerColor()
              ),
            ),
            Text(
              '$totalScore',
              style: GoogleFonts.fredoka(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: setActiveTextColor()
              ),
            ),
            Text(
              'of 30',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: setActiveTextColor()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
