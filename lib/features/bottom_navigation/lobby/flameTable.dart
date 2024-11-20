import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TeenPattiGame extends FlameGame {
  late SpriteComponent tableBackground;
  late PlayerComponent player1, player2;
  late CardComponent card1, card2;

  @override
  Future<void> onLoad() async {
    // Preload audio
    await FlameAudio.audioCache.loadAll(['card_deal.mp3', 'card_deal.mp3']);

    // Load and set the table background
    tableBackground = SpriteComponent()
      ..sprite = await Sprite.load('table.png') // Updated sprite loading
      ..size = size
      ..position = Vector2(0, 0);

    // Add the table background to the game
    add(tableBackground);

    // Adding Players (Player Avatar)
    player1 = PlayerComponent(position: Vector2(0, 400), playerName: "Player 1");
    player2 = PlayerComponent(position: Vector2(500, 400), playerName: "Player 2");

    // Adding Cards (You can add your card distribution logic later)
    card1 = CardComponent(position: Vector2(30, 200));
    card2 = CardComponent(position: Vector2(60, 200));

    add(player1);
    add(player2);
    add(card1);
    add(card2);

    // Play sounds if needed
    FlameAudio.play('card_deal.mp3');
  }
}

class PlayerComponent extends SpriteComponent {
  final String playerName;
  final TextPaint textPaint; // Declare TextPaint

  PlayerComponent({
    required Vector2 position,
    required this.playerName,
  })  : textPaint = TextPaint(style: TextStyle(color: const Color(0xFFFFFFFF), fontSize: 14)), // Initialize TextPaint
        super(size: Vector2(80, 80), position: position);

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('avatars/avatar1.png'); // Updated sprite loading
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // Add custom render logic for player name
    textPaint.render(canvas, playerName, position + Vector2(0, size.y + 5)); // Render player name below the avatar
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Animate cards to move from center to player avatars
    if (position.y < 400) {
      position.y += 100 * dt;
    }
  }
}

class CardComponent extends SpriteComponent with HasGameRef {
  CardComponent({required Vector2 position})
      : super(size: Vector2(50, 80), position: position);

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('cards/card1.png'); // Updated sprite loading
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Animate cards to move from center to player avatars
    if (position.y < 400) {
      position.y += 100 * dt;
    }

    if (position.x < 0) {
      position.x += 100 * dt;
    }
  }
}
