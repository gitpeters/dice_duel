import 'package:dice_duel/models/roll_record.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RollRow extends StatelessWidget {
  const RollRow(this.record, {super.key});

  final RollRecord record;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: record.player == 1
                  ? const Color(0xFFFF6B6B)
                  : const Color(0xFF4ECDC4),
              shape: BoxShape.circle,
            ),
            child: Text(
              '${record.value}',
              style: GoogleFonts.fredoka(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              record.value == 6 ? 'Player ${record.player} rolled ${record.value} · total ${record.totalAfter} · again!' : 
              'Player ${record.player} rolled ${record.value} · total ${record.totalAfter}',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
