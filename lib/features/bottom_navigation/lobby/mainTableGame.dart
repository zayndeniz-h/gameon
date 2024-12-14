import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';

import 'flameTable.dart';

class TeenPattiScreen extends StatelessWidget {
  const TeenPattiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: TeenPattiGame(),
      ),
    );
  }
}
