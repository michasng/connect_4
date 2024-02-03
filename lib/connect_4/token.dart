import 'package:connect_4/connect_4/player.dart';
import 'package:flutter/material.dart';

class Token extends StatelessWidget {
  final Player owner;
  final bool highlighted;

  const Token({
    super.key,
    required this.owner,
    required this.highlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: highlighted
            ? Border.all(
                color: const Color(0xffffffff),
                width: 8,
              )
            : null,
        shape: BoxShape.circle,
        color: owner.color,
      ),
    );
  }
}
