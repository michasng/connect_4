import 'package:connect_4/connect_4/player.dart';
import 'package:connect_4/connect_4/token.dart';
import 'package:flutter/material.dart';

class Connect4 extends StatefulWidget {
  final int columnCount, rowCount;
  final Player startingTurnPlayer;

  const Connect4({
    super.key,
    this.columnCount = 7,
    this.rowCount = 6,
    this.startingTurnPlayer = Player.yellow,
  });

  @override
  State<Connect4> createState() => _Connect4State();
}

class _Connect4State extends State<Connect4> {
  late final List<List<Player?>> _grid;
  late Player _turnPlayer;

  @override
  void initState() {
    super.initState();
    _grid = List.generate(
      widget.rowCount,
      (_) => List.filled(widget.columnCount, null),
    );
    _turnPlayer = widget.startingTurnPlayer;
  }

  void _reset() {
    setState(() {
      for (final row in _grid) {
        row.fillRange(0, row.length, null);
      }
      _turnPlayer = widget.startingTurnPlayer;
    });
  }

  Player get _nextTurnPlayer => switch (_turnPlayer) {
        Player.red => Player.yellow,
        Player.yellow => Player.red,
      };

  void _tryInsertToken(int colIndex) {
    final rowIndex = _grid.lastIndexWhere((row) => row[colIndex] == null);
    if (rowIndex == -1) return;

    setState(() {
      _grid[rowIndex][colIndex] = _turnPlayer;
      _turnPlayer = _nextTurnPlayer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: widget.columnCount / widget.rowCount,
          child: Table(
            children: [
              for (final row in _grid)
                TableRow(
                  children: [
                    for (final (colIndex, owner) in row.indexed)
                      AspectRatio(
                        aspectRatio: 1,
                        child: InkWell(
                          onTap: () => _tryInsertToken(colIndex),
                          child: Container(
                            color: const Color(0xff66aaff),
                            padding: const EdgeInsets.all(8),
                            child: owner == null ? null : Token(owner: owner),
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
        color: _turnPlayer.color,
        onPressed: _reset,
        icon: const Icon(Icons.restart_alt_rounded),
      ),
    );
  }
}
