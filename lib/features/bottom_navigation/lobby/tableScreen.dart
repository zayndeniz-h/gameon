import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';
import 'package:teen_patti/models/playerGameModel.dart';
import '../../../Locale/locales.dart';
import '../../../components/circular_icon_button.dart';
import '../../../components/custom_button.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart'; // For sounds
import 'package:collection/collection.dart';

class TeenPattiTable extends StatefulWidget {
  const TeenPattiTable({super.key});

  @override
  State<TeenPattiTable> createState() => _TeenPattiTableState();
}

class _TeenPattiTableState extends State<TeenPattiTable>
    with TickerProviderStateMixin {
  // late AnimationController _cardAnimationController;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool cardsDistributed = false;
  bool cardsDisplayed1 = false;

  bool cardsDisplayed2 = false;
  bool cardsDisplayed3 = false;

  int cardIndex = 0;

  var _value = 0.0;

  var playerList = [
    PlayerGameModel(
        card1: false, card2: false, card3: false, name: "You", image: "", chaal:  chaalStatus.INIT),
    PlayerGameModel(
        card1: false,
        card2: false,
        card3: false,
        name: "Faizan",
        image: "image", chaal:  chaalStatus.INIT),
    PlayerGameModel(
        card1: false,
        card2: false,
        card3: false,
        name: "Salman",
        image: "image", chaal:  chaalStatus.INIT),
    PlayerGameModel(
        card1: false,
        card2: false,
        card3: false,
        name: "Suleman",
        image: "image", chaal:  chaalStatus.INIT),
    PlayerGameModel(
        card1: false,
        card2: false,
        card3: false,
        name: "Noman",
        image: "image", chaal:  chaalStatus.INIT),
    PlayerGameModel(
        card1: false,
        card2: false,
        card3: false,
        name: "Shezwan",
        image: "image", chaal:  chaalStatus.INIT),
  ];

  @override
  void initState() {
    super.initState();

    // Animation controller for the card distribution
    // _cardAnimationController = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 500),
    // );

    // _cardAnimationController.addListener(() {
    //   if (_cardAnimationController.status == AnimationStatus.forward) {
    // Play card dealing sound during animation
    // _playSound('card_deal.mp3');
    // }
    // });
  }

  @override
  void dispose() {
    // _cardAnimationController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playSound(String fileName) {
    _audioPlayer.play(AssetSource(fileName));
  }

  Future<void> _startCardDistribution() async {
    _playSound('card_deal.mp3');
    setState(() {

    });
    for (int i = 0; i < (playerList.length * 3); i++) {
      await Future.delayed(Duration(milliseconds: 300), () {
        int playerIndex = i % playerList.length;
        int cardIndex = i ~/ playerList.length;

        print("$i playerInde = ${playerIndex} ${cardIndex}");

        if (cardIndex == 0) {
          playerList[playerIndex].card1 = true;
        } else if (cardIndex == 1) {
          playerList[playerIndex].card2 = true;
        } else if (cardIndex == 2) {
          playerList[playerIndex].card3 = true;
        }

        setState(() {});
      });

      // setState(() {
      //   if(i == 0){
      //     cardsDisplayed1 = true;
      //   }
      //   if(i == 1){
      //     cardsDisplayed2 = true;
      //   }
      //   if(i == 2){
      //     cardsDisplayed3 = true;
      //   }
      // });
    }
    setState(() {
      cardsDistributed = true;
    });
  }

  Future<void> chaalForPlayer(PlayerGameModel playerGameModel,double coins) async {
    setState(() {
      playerGameModel.chaal = chaalStatus.PROCESSING;
    });

    _playSound('audio/coin.mp3');

    _value += coins;
    await Future.delayed(Duration(milliseconds: 200)).then((value) {
      setState(() {
        playerGameModel.chaal = chaalStatus.INIT;
      });
    });
    setState(() {
      playerGameModel.chaal = chaalStatus.DONE;
    });
    Future.delayed(Duration(milliseconds: 4000)).then((value) {
      setState(() {
        playerGameModel.chaal = chaalStatus.INIT;
      });
    });

  }


  Future<void> startFirstCoinAdd(double initialCoins) async {
    // _playSound('card_deal.mp3');
    setState(() {

    });
    for (int i = 0; i < (playerList.length); i++) {
      // await Future.delayed(Duration(milliseconds: 300), () {
      //   int playerIndex = i % playerList.length;
      //   int cardIndex = i ~/ playerList.length;
      //
      //   print("$i playerInde = ${playerIndex} ${cardIndex}");

        // if (cardIndex == 0) {
        //   playerList[playerIndex].card1 = true;
        // } else if (cardIndex == 1) {
        //   playerList[playerIndex].card2 = true;
        // } else if (cardIndex == 2) {
        //   playerList[playerIndex].card3 = true;
        // }

      chaalForPlayer(playerList[i],initialCoins);

      setState(() {});
      // });

      // setState(() {
      //   if(i == 0){
      //     cardsDisplayed1 = true;
      //   }
      //   if(i == 1){
      //     cardsDisplayed2 = true;
      //   }
      //   if(i == 2){
      //     cardsDisplayed3 = true;
      //   }
      // });
    }
  }


  Widget buildPlayerIcon(String name, {bool? cardsOpened}) {
    return Column(
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(
                  horizontal: cardsOpened == true ? 8 : 8, vertical: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Image.asset('assets/avatars/avatar1.png'),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/coin.png',
                      height: 12,
                    ),
                    const SizedBox(width: 6),
                    FittedBox(
                      child: Text(
                        '\$ 25658',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Widget _buildCardDisplay(PlayerGameModel playerModel,cardsDisplayed,double startright,double startbottom,double endrigt,double endbottom) {
  //   return AnimatedPositioned(
  //     duration: Duration(milliseconds: 500),
  //
  //     right: cardsDisplayed ? endrigt : startright,
  //     top: cardsDisplayed ? endbottom : startbottom,
  //     child: !cardsDistributed ? Image.asset(
  //       'assets/card.png',
  //       height: 40,
  //     ) :
  //     Row(
  //       children: [
  //        if(playerModel.card1) Image.asset(
  //           'assets/cards/card1.png',
  //           height: 40,
  //         ),
  //         const SizedBox(width: 6),
  //         if(playerModel.card2) Image.asset(
  //           'assets/cards/card2.png',
  //           height: 40,
  //         ),
  //         const SizedBox(width: 6),
  //         if(playerModel.card3)   Image.asset(
  //           'assets/cards/card3.png',
  //           height: 40,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildCardDisplay2(
      PlayerGameModel playerModel,
      cardsDisplayed,
      double startright,
      double startbottom,
      double endrigt,
      double endbottom,
      index) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),

      right: cardsDisplayed ? endrigt : startright,
      top: cardsDisplayed ? endbottom : startbottom,
      child: Image.asset(
        'assets/card.png',
        height: 40,
      ),
      // !cardsDistributed ?
      // Stack(
      //   children: [
      //     if(playerModel.card1) Image.asset(
      //       'assets/card.png',
      //       height: 40,
      //     ),
      //     const SizedBox(width: 6),
      //     if(playerModel.card2) Image.asset(
      //       'assets/card.png',
      //       height: 40,
      //     ),
      //     const SizedBox(width: 6),
      //     if(playerModel.card3)   Image.asset(
      //       'assets/card.png',
      //       height: 40,
      //     ),
      //   ],
      // )
      //     :
      // Row(
      //   children: [
      //     if(playerModel.card1) Image.asset(
      //       'assets/cards/card1.png',
      //       height: 40,
      //     ),
      //     const SizedBox(width: 6),
      //     if(playerModel.card2) Image.asset(
      //       'assets/cards/card2.png',
      //       height: 40,
      //     ),
      //     const SizedBox(width: 6),
      //     if(playerModel.card3)   Image.asset(
      //       'assets/cards/card3.png',
      //       height: 40,
      //     ),
      //   ],
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    print("height = ${size.height}, width = ${size.width}");

    double widthFactor(double value) =>
        value / 756.0 * size.width; // Base on width of 756
    double heightFactor(double value) =>
        value / 436.0 * size.height; // Base on height of 436

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        double maxWidth = constraints.maxWidth; // Proportional to width
        double maxHeigth = constraints.maxHeight;
        print("mheight = ${maxHeigth}, mwidth = ${maxWidth}");

        return Container(
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/bg.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.only(
                    top: heightFactor(60),
                    bottom: heightFactor(60),
                    left: widthFactor(80),
                    right: widthFactor(80),
                  ),
                  width: size.width,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/table.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widthFactor(20),
                  vertical: heightFactor(12),
                ),
                child: Row(
                  children: [
                    CircularIconButton(
                      icon: Icons.menu,
                      onTap: () {
                        buildMenuDialog(context);
                      },
                    ),
                    SizedBox(width: widthFactor(8)),
                    CircularIconButton(
                      icon: Icons.add,
                      onTap: () => buildCashBuyInDialog(context),
                    ),
                    SizedBox(width: widthFactor(8)),
                    Container(
                      height: heightFactor(32),
                      width: widthFactor(58),
                      decoration: CircularIconButton.getDecoration(
                        context,
                        const Color(0xff095928),
                      ),
                    ),
                    const Spacer(),
                    CircularIconButton(
                      icon: Icons.question_mark,
                      onTap: () => Utils().showGuideDialog(context),
                    ),
                    SizedBox(width: widthFactor(8)),
                    CircularIconButton(
                      icon: Icons.info_outline,
                      onTap: () {
                        buildTableInfoDialog(context);
                      },
                    ),
                    SizedBox(width: widthFactor(8)),
                    CircularIconButton(
                      icon: Icons.settings,
                      onTap: () => buildSettingsDialog(context),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: widthFactor(20),
                top: heightFactor(60),
                child: CircularIconButton(
                  icon: Icons.exit_to_app_outlined,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                bottom: heightFactor(130),
                left: size.width / 2 - widthFactor(110),
                child: Image.asset(
                  'assets/logo.png',
                  width: widthFactor(250),
                  color: Theme.of(context).highlightColor.withOpacity(0.3),
                ),
              ),
              Positioned(
                bottom: heightFactor(260),
                left: size.width / 2 - widthFactor(80),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      locale.potAmt,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/coin.png',
                            height: 16,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          AnimatedFlipCounter(
                            value: _value,
                            fractionDigits: 2, // decimal precision
                            suffix: rupeeSyumbol,
                            textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).highlightColor,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: heightFactor(18),
                    horizontal: widthFactor(18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: widthFactor(12)),
                      Expanded(
                        child: CustomButton(
                          title: '${locale.check}/${locale.fold}',
                          bgImage: 'assets/button/button5.png',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 10,
                                  ),
                        ),
                      ),
                      SizedBox(width: widthFactor(20)),
                      Expanded(
                        child: CustomButton(
                          title: locale.check,
                          bgImage: 'assets/button/button5.png',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 10,
                                  ),
                        ),
                      ),
                      SizedBox(width: widthFactor(20)),
                      Expanded(
                        child: CustomButton(
                          onTap: (){startFirstCoinAdd(0.5);},
                          title: '${locale.check}/${locale.callAny}',
                          bgImage: 'assets/button/button5.png',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 10,
                                  ),
                        ),
                      ),
                      SizedBox(width: widthFactor(12)),
                    ],
                  ),
                ),
              ),

              ...playerList
                  .mapIndexed((index, element) {
                    PlayerGameModel playerModel = element;

                    switch (index) {
                      case 0:
                        return [

                          Positioned(
                            top: heightFactor(330),
                            right: size.width / 2 - widthFactor(60),
                            child: buildPlayerIcon('Player $index',
                                cardsOpened: cardIndex >= 1),
                          ),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card1,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              size.width / 2 - widthFactor(115),
                              heightFactor(345),
                              0),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card2,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              size.width / 2 - widthFactor(125),
                              heightFactor(350),
                              1),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card3,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              size.width / 2 - widthFactor(135),
                              heightFactor(355),
                              2),
                         if(cardsDistributed) Positioned(
                            top: heightFactor(360),
                            right: size.width / 2 - widthFactor(145),
                            child: Card(
                              color:Theme.of(context).primaryColorLight,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
                                child: Text("See",style: TextStyle(fontSize: 10,color: Theme.of(context).canvasColor,),),
                              ),
                            ),
                          ),
                          animatedCoinWidget( playerModel,
                              playerModel.chaal,
                              // heightFactor(330),
                              // size.width / 2 - widthFactor(60),
                              size.width / 2 - widthFactor(60),
                              heightFactor(364),
                              size.width / 2 - widthFactor(53),
                              heightFactor(161),

                              2,0.5),
                        ];

                      case 1:
                        return [
                          Positioned(
                            top: heightFactor(270),
                            right: widthFactor(40),
                            child: buildPlayerIcon('Player {$index}',
                                cardsOpened: cardIndex >= 1),
                          ),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card1,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(170),
                              heightFactor(285),
                              0),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card2,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(180),
                              heightFactor(290),
                              1),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card3,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(190),
                              heightFactor(295),
                              2),
                          animatedCoinWidget(  playerModel,
                              playerModel.chaal,
                             widthFactor(40),
                              heightFactor(305),
                              size.width / 2 - widthFactor(53),
                              heightFactor(161),
                              2,0.5),

                        ];

                      case 2:
                        return [
                          Positioned(
                            top: heightFactor(270),
                            right: widthFactor(600),
                            child: buildPlayerIcon('Player {$index}',
                                cardsOpened: cardIndex >= 1),
                          ),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card1,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(550),
                              heightFactor(285),
                              0),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card2,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(540),
                              heightFactor(290),
                              1),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card3,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(530),
                              heightFactor(295),
                              2),
                        ];

                      case 3:
                        return [
                          Positioned(
                            top: heightFactor(90),
                            right: widthFactor(40),
                            child: buildPlayerIcon('Player {$index}',
                                cardsOpened: cardIndex >= 1),
                          ),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card1,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(170),
                              heightFactor(103),
                              0),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card2,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(180),
                              heightFactor(108),
                              1),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card3,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(190),
                              heightFactor(113),
                              2),
                        ];

                      case 4:
                        return [
                          Positioned(
                            top: heightFactor(90),
                            right: widthFactor(600),
                            child: buildPlayerIcon('Player {$index}',
                                cardsOpened: cardIndex >= 1),
                          ),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card1,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(550),
                              heightFactor(103),
                              0),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card2,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(540),
                              heightFactor(108),
                              1),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card3,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(530),
                              heightFactor(113),
                              2),
                        ];

                      case 5:
                        return [
                          Positioned(
                            top: heightFactor(35),
                            right: size.width / 2 - widthFactor(60),
                            child: buildPlayerIcon('Player {$index}',
                                cardsOpened: cardIndex >= 1),
                          ),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card1,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              size.width / 2 - widthFactor(115),
                              heightFactor(48),
                              0),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card2,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              size.width / 2 - widthFactor(125),
                              heightFactor(53),
                              1),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card3,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              size.width / 2 - widthFactor(135),
                              heightFactor(58),
                              2),
                        ];

                      default:
                        return [
                          Positioned(
                            top: heightFactor(100),
                            right: widthFactor(40),
                            child: buildPlayerIcon('Player {$index}',
                                cardsOpened: cardIndex >= 1),
                          ),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card1,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(215),
                              heightFactor(112),
                              0),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card2,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(215),
                              heightFactor(112),
                              1),
                          _buildCardDisplay2(
                              playerModel,
                              playerModel.card3,
                              size.width / 2 - widthFactor(20),
                              size.height / 2 - widthFactor(50),
                              widthFactor(215),
                              heightFactor(112),
                              2),
                        ];
                    }
                  })
                  .toList()
                  .expand((element) => element),

              // Positioned(
              //   top: heightFactor(100),
              //   left: widthFactor(40),
              //   child: buildPlayerIcon('Player 2', cardsOpened: cardIndex >= 2),
              // ),
              // _buildCardDisplay(cardsDisplayed1,size.width / 2 - widthFactor(20),size.height / 2 - widthFactor(50), widthFactor(500), heightFactor(112)),
              //
              // Positioned(
              //   bottom: heightFactor(120),
              //   left: widthFactor(40),
              //   child: buildPlayerIcon('Player 3', cardsOpened: cardIndex >= 3),
              // ),
              // _buildCardDisplay(cardsDisplayed1,size.width / 2 - widthFactor(20),size.height / 2 - widthFactor(50), widthFactor(500), heightFactor(280)),
              //
              //
              // Positioned(
              //   bottom: heightFactor(120),
              //   right: widthFactor(40),
              //   child: buildPlayerIcon('Player 4', cardsOpened: cardIndex >= 3),
              // ),
              // _buildCardDisplay(cardsDisplayed1,size.width / 2 - widthFactor(20),size.height / 2 - widthFactor(50), widthFactor(150), heightFactor(280)),
              //
              // Positioned(
              //   top: heightFactor(40),
              //   right: size.width / 2 - widthFactor(50),
              //   child: buildPlayerIcon('Player 5', cardsOpened: cardIndex >= 3),
              // ),
              // _buildCardDisplay(cardsDisplayed1,size.width / 2 - widthFactor(20),size.height / 2 - widthFactor(50),size.width / 2 - widthFactor(150), heightFactor(53)),
              //
              // Positioned(
              //   bottom: heightFactor(50),
              //   right: size.width / 2 - widthFactor(60),
              //   child: buildPlayerIcon('Player 6', cardsOpened: cardIndex >= 3),
              // ),
              // _buildCardDisplay(cardsDisplayed1,size.width / 2 - widthFactor(20),size.height / 2 - widthFactor(50),size.width / 2 - widthFactor(157), heightFactor(350)),
            ],
          ),
        );
      }),
    );
  }

  Future<dynamic> buildMenuDialog(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return showDialog(
      context: context,
      builder: ((context) {
        return Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    locale.menu.toUpperCase(),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          letterSpacing: 3,
                        ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 100,
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Theme.of(context).highlightColor,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 38,
                    child: CustomButton(
                      title: locale.leaveTheTable,
                      bgImage: 'assets/button/button4.png',
                      fit: StackFit.loose,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 38,
                    child: CustomButton(
                      title: locale.addCash,
                      bgImage: 'assets/button/button4.png',
                      fit: StackFit.loose,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 38,
                    child: CustomButton(
                      title: locale.replay,
                      fit: StackFit.loose,
                      bgImage: 'assets/button/button4.png',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 38,
                    child: CustomButton(
                      title: locale.lobby,
                      fit: StackFit.loose,
                      bgImage: 'assets/button/button4.png',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  highlightColor: Colors.grey,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Theme.of(context).highlightColor,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Future<dynamic> buildTableInfoDialog(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return showDialog(
      context: context,
      builder: ((context) {
        return Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Text(
                      locale.tableInformation.toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            letterSpacing: 3,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildGradientLine(context),
                  const SizedBox(
                    height: 24,
                  ),
                  buildTableInfoTile(
                      context, locale.tableName, '${locale.hand} #2254210'),
                  const SizedBox(
                    height: 30,
                  ),
                  buildTableInfoTile(context, locale.numberOfPlayers, '6 / 6'),
                  const SizedBox(
                    height: 30,
                  ),
                  buildTableInfoTile(
                      context, locale.minMaxBuyIn, '\$ 50.00 / \$ 100.00'),
                  const SizedBox(
                    height: 30,
                  ),
                  buildTableInfoTile(
                      context, locale.stakesSmallBig, '\$ 50.00 / \$ 100.00'),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  highlightColor: Colors.grey,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Theme.of(context).highlightColor,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Future<dynamic> buildCashBuyInDialog(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return showDialog(
      context: context,
      builder: ((context) {
        return Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Text(
                      locale.cashBuyIn.toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            letterSpacing: 3,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildGradientLine(context),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTableInfoTile(
                          context,
                          locale.holdem,
                          '\$50.00/\$100.00',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: buildTableInfoTile(
                          context,
                          locale.availableBalance,
                          '\$50.85',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  buildGradientLine(context),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      '\$10.00',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${locale.min}.',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 10,
                                ),
                          ),
                        ),
                        Text(
                          locale.buyInAmount,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 10,
                                  ),
                        ),
                        Expanded(
                          child: Text(
                            '${locale.max}.',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 10,
                                ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Slider(
                    value: 0.2,
                    thumbColor: Theme.of(context).primaryColor,
                    inactiveColor: const Color(0xff191A1F),
                    activeColor: const Color(0xff191A1F),
                    onChanged: (val) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        Text(
                          '\$5',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                        ),
                        const Spacer(),
                        Text(
                          '\$10',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomButton(
                      title: locale.ok,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  highlightColor: Colors.grey,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Theme.of(context).highlightColor,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Center buildGradientLine(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Theme.of(context).highlightColor,
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildSettingsDialog(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return showDialog(
      context: context,
      builder: ((context) {
        return Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Text(
                      locale.settings.toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            letterSpacing: 3,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildGradientLine(context),
                  const SizedBox(
                    height: 30,
                  ),
                  buildOptionRow(
                    context,
                    locale.sound,
                    isEnabled: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildOptionRow(
                    context,
                    locale.tableShowWhenYourTurn,
                    isEnabled: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildOptionRow(context, '${locale.wait} BB'),
                  const SizedBox(
                    height: 10,
                  ),
                  buildOptionRow(
                    context,
                    locale.autoPostBlinds,
                    isEnabled: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildOptionRow(
                    context,
                    locale.autoMuckCards,
                    isEnabled: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildOptionRow(
                    context,
                    locale.displayBetAmounts,
                    isEnabled: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildOptionRow(context, locale.vibration),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  highlightColor: Colors.grey,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Theme.of(context).highlightColor,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildOptionRow(BuildContext context, String title,
      {bool? isEnabled, Function(bool)? onChanged}) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 30.0, end: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Transform.scale(
            scale: 0.5,
            child: CupertinoSwitch(
              value: isEnabled ?? false,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (val) {},
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTableInfoTile(
      BuildContext context, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 10,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }

  Expanded buildBlackButton(BuildContext context, String title,
      {Function()? onTap}) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/button/button4.png'),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 10,
                ),
          ),
        ],
      ),
    );
  }

  Widget animatedCoinWidget( PlayerGameModel playerModel,
      chaalStatus cardsDisplayed,
      double startright,
      double startbottom,
      double endrigt,
      double endbottom,
      index,double coinsAdded){
    return cardsDisplayed == chaalStatus.INIT ? SizedBox.shrink() :AnimatedPositioned(
      duration: Duration(milliseconds: 800),

      right:  cardsDisplayed == chaalStatus.DONE ? endrigt : startright,
      top:cardsDisplayed == chaalStatus.DONE  ? endbottom : startbottom,
      child: AnimatedScale(
        duration: Duration(milliseconds: 1200),
        scale:  cardsDisplayed == chaalStatus.DONE   ? 0 : 1.5,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 1200),

          opacity:  cardsDisplayed == chaalStatus.DONE  ? 0 : 1,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
            ),
            child: AnimatedOpacity(
              opacity: 1,
              duration: Duration(milliseconds: 300),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/coin.png',
                    height: 16,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  AnimatedFlipCounter(
                    value: coinsAdded,
                    fractionDigits: 2, // decimal precision
                    suffix: rupeeSyumbol,
                    textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).highlightColor,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
