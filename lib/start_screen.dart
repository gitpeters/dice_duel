import 'package:dice_duel/widgets/die_face.dart';
import 'package:flutter/material.dart';

import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startGame, {super.key});

  final Function() startGame;

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.rotate(angle: -8 * pi / 180, child: DieFace(5)),
              SizedBox(height: 25),
              Text(
                'Dice Duel',
                style: GoogleFonts.fredoka(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Two players. One die. First to 30 wins',
                style: GoogleFonts.poppins(
                  color: Color(0xFFB9BFE0),
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 40),
              OutlinedButton.icon(
                onPressed: startGame,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: const StadiumBorder(),
                  side: BorderSide(width: 2, color: Colors.white),
                  padding: EdgeInsetsGeometry.fromLTRB(25, 12, 25, 12)
                ),
                label: Text(
                  'Start game',
                  style: GoogleFonts.fredoka(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                icon: Icon(
                  Icons.play_arrow_rounded,
                  size: 20,
                  ),
              ),
            ],
          ),
    );
  }
}
