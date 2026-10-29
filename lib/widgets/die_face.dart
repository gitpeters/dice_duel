import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DieFace extends StatelessWidget {
  const DieFace(this.value, {super.key});

  final int? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      padding: EdgeInsetsGeometry.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        value == null ? '?' : '$value',
        style: GoogleFonts.fredoka(fontSize: 64, fontWeight: FontWeight.bold),
      ),
    );
  }
}
