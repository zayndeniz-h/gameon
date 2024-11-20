enum chaalStatus  {PROCESSING,DONE,INIT}

class PlayerGameModel {
  bool card1;
  bool card2;
  bool card3;
  String name;
  String image;
  chaalStatus chaal;

  PlayerGameModel({
    required this.card1,
    required this.card2,
    required this.card3,
    required this.name,
    required this.image,
    required this.chaal,

  });
}
