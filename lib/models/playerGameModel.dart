import 'package:flip_card/flip_card_controller.dart';

enum ChaalStatus { PROCESSING, DONE, INIT }
enum PlayerGameStatus { ACTIVE, FOLDED, ELIMINATED, WIN, LOSS, DISCONNECTED, WAITING, TIMEDOUT }

class PlayerGameModel {
  bool card1;
  bool card2;
  bool card3;
  String name;
  String image;
  ChaalStatus chaal;
  bool? seen;
  List<FlipCardController> cardControllers;

  PlayerGameModel({
    required this.card1,
    required this.card2,
    required this.card3,
    required this.name,
    required this.image,
    required this.chaal,
    this.seen = false,
    required this.cardControllers,
  });

  /// Convert PlayerGameModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'card1': card1,
      'card2': card2,
      'card3': card3,
      'name': name,
      'image': image,
      'chaal': chaal.name,
      'seen': seen,
      'cardControllers': cardControllers.length, // Placeholder for FlipCardController
    };
  }

  /// Create PlayerGameModel from JSON
  factory PlayerGameModel.fromJson(Map<String, dynamic> json) {
    return PlayerGameModel(
      card1: json['card1'] ?? false,
      card2: json['card2'] ?? false,
      card3: json['card3'] ?? false,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      chaal: ChaalStatus.values.byName(json['chaal'] ?? 'INIT'),
      seen: json['seen'] ?? false,
      cardControllers: List.generate(
        json['cardControllers'] ?? 3,
            (_) => FlipCardController(),
      ),
    );
  }

  /// Create a copy of PlayerGameModel with modified values
  PlayerGameModel copyWith({
    bool? card1,
    bool? card2,
    bool? card3,
    String? name,
    String? image,
    ChaalStatus? chaal,
    bool? seen,
    List<FlipCardController>? cardControllers,
  }) {
    return PlayerGameModel(
      card1: card1 ?? this.card1,
      card2: card2 ?? this.card2,
      card3: card3 ?? this.card3,
      name: name ?? this.name,
      image: image ?? this.image,
      chaal: chaal ?? this.chaal,
      seen: seen ?? this.seen,
      cardControllers: cardControllers ?? this.cardControllers,
    );
  }
}
