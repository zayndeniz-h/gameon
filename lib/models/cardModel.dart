class Card {
  final String suit; // "hearts", "diamonds", "clubs", "spades"
  final String rank; // "2", "3", "J", "Q", "K", "A"

  Card({required this.suit, required this.rank});

  Map<String, dynamic> toMap() {
    return {
      'suit': suit,
      'rank': rank,
    };
  }

  factory Card.fromMap(Map<String, dynamic> map) {
    return Card(
      suit: map['suit'],
      rank: map['rank'],
    );
  }
}
