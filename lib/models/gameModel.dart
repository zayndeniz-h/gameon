enum GameStatus {WAITING,READY,CARD_DISTRIBUTION,IN_PROGREES,COMPLETED}


class Game {
   String gameId; // Unique identifier for the game
   DateTime createdAt; // Timestamp when the game was created
   GameStatus status; // "waiting", "in-progress", or "completed"
   String? currentTurn; // Player ID whose turn it is
   List<String>? tableCards; // Cards on the table
   double betAmount; // Base bet amount

  Game({
    required this.gameId,
    required this.createdAt,
    required this.status,
    this.currentTurn,
    this.tableCards,
    required this.betAmount,
  });

  /// Convert Game to JSON
  Map<String, dynamic> toJson() {
    return {
      'gameId': gameId,
      'createdAt': createdAt.toIso8601String(),
      'status': status.name,
      'currentTurn': currentTurn,
      'tableCards': tableCards,
      'betAmount': betAmount,
    };
  }

  /// Create Game from JSON
  factory Game.fromJson(Map<String, dynamic> json, String id) {
    return Game(
      gameId: id,
      createdAt: DateTime.parse(json['createdAt']),
      status: GameStatus.values.byName(json['status'] ?? 'WAITING'),
      currentTurn: json['currentTurn'],
      tableCards: (json['tableCards'] as List<dynamic>?)?.cast<String>(),
      betAmount: json['betAmount'].toDouble(),
    );
  }

  /// Create a copy of Game with modified values
  Game copyWith({
    String? gameId,
    DateTime? createdAt,
    GameStatus? status,
    String? currentTurn,
    List<String>? tableCards,
    double? betAmount,
  }) {
    return Game(
      gameId: gameId ?? this.gameId,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      currentTurn: currentTurn ?? this.currentTurn,
      tableCards: tableCards ?? this.tableCards,
      betAmount: betAmount ?? this.betAmount,
    );
  }
}
