import 'dart:ui';

enum Player {
  yellow(Color(0xffff8888)),
  red(Color(0xffffff88));

  final Color color;

  const Player(this.color);
}
