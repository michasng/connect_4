import 'package:connect_4/connect_4/grid_point.dart';
import 'package:connect_4/connect_4/player.dart';

class WinningSequenceChecker {
  static const sequenceLength = 4;

  final int columnCount, rowCount;
  final Player? Function(GridPoint point) getOwner;

  const WinningSequenceChecker({
    required this.columnCount,
    required this.rowCount,
    required this.getOwner,
  });

  List<GridPoint>? tryFindWinningSequence() {
    return _tryFindWinningRow() ??
        _tryFindWinningColumn() ??
        _tryFindWinningDiagonalDown() ??
        _tryFindWinningDiagonalUp();
  }

  bool _isWinningSequence(List<GridPoint> sequence) {
    final owners = sequence.map<Player?>(getOwner);
    return owners.every((owner) => owner != null && owner == owners.first);
  }

  List<GridPoint>? _tryFindWinningRow() {
    for (int col = 0; col < columnCount; col++) {
      for (int row = 0; row < rowCount - (sequenceLength - 1); row++) {
        final sequence = List.generate(
          sequenceLength,
          (offset) => (colIndex: col, rowIndex: row + offset),
        );
        if (_isWinningSequence(sequence)) return sequence;
      }
    }
    return null;
  }

  List<GridPoint>? _tryFindWinningColumn() {
    for (int col = 0; col < columnCount - (sequenceLength - 1); col++) {
      for (int row = 0; row < rowCount; row++) {
        final sequence = List.generate(
          sequenceLength,
          (offset) => (colIndex: col + offset, rowIndex: row),
        );
        if (_isWinningSequence(sequence)) return sequence;
      }
    }
    return null;
  }

  List<GridPoint>? _tryFindWinningDiagonalDown() {
    for (int row = 0; row < rowCount - (sequenceLength - 1); row++) {
      for (int col = 0; col < columnCount - (sequenceLength - 1); col++) {
        final sequence = List.generate(
          sequenceLength,
          (offset) => (colIndex: col + offset, rowIndex: row + offset),
        );
        if (_isWinningSequence(sequence)) return sequence;
      }
    }
    return null;
  }

  List<GridPoint>? _tryFindWinningDiagonalUp() {
    for (int row = (sequenceLength - 1); row < rowCount; row++) {
      for (int col = 0; col < columnCount - (sequenceLength - 1); col++) {
        final sequence = List.generate(
          sequenceLength,
          (offset) => (colIndex: col + offset, rowIndex: row - offset),
        );
        if (_isWinningSequence(sequence)) return sequence;
      }
    }
    return null;
  }
}
