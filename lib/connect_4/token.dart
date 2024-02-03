import 'package:connect_4/connect_4/player.dart';
import 'package:flutter/material.dart';

class Token extends StatelessWidget {
  final Player owner;

  const Token({
    super.key,
    required this.owner,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: owner.color,
      ),
    );
  }
}
