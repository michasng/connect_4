import 'package:connect_4/connect_4/connect_4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Connect Four',
      debugShowCheckedModeBanner: false,
      home: Connect4(),
    );
  }
}
