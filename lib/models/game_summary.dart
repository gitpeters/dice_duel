
import 'package:dice_duel/models/roll_record.dart';

class GameSummary {
  const GameSummary(this.winner, this.scores, this.history);

  final int winner;
  final List<int> scores;
  final List<RollRecord> history;
}