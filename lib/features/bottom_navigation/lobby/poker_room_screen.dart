import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/components/circular_icon_button.dart';
import 'package:teen_patti/components/custom_button.dart';
import 'package:teen_patti/utils/utils.dart';

class PokerRoomScreen extends StatefulWidget {
  const PokerRoomScreen({super.key});

  @override
  State<PokerRoomScreen> createState() => _PokerRoomScreenState();
}

class _PokerRoomScreenState extends State<PokerRoomScreen> {
  bool cardsOpened = false;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => setState(() {
          cardsOpened = !cardsOpened;
        }),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/bg.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 12.0,
                  ),
                  child: Row(
                    children: [
                      CircularIconButton(
                        icon: Icons.menu,
                        onTap: () {
                          buildMenuDialog(context);
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CircularIconButton(
                        icon: Icons.add,
                        onTap: () => buildCashBuyInDialog(context),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 32,
                        width: 58,
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
                      const SizedBox(
                        width: 8,
                      ),
                      CircularIconButton(
                        icon: Icons.info_outline,
                        onTap: () {
                          buildTableInfoDialog(context);
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CircularIconButton(
                        icon: Icons.settings,
                        onTap: () => buildSettingsDialog(context),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Image.asset('assets/table.png'),
                      ),
                      Positioned(
                        left: 20,
                        top: 10,
                        child: CircularIconButton(
                          icon: Icons.exit_to_app_outlined,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Column(
                          children: [
                            buildPlayerIcon(context, 'Anthony34'),
                            const SizedBox(
                              height: 6,
                            ),
                            buildCardRow(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    buildPlayerIcon(
                                      context,
                                      'Panthorgev',
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    RotatedBox(
                                      quarterTurns: 1,
                                      child: buildCardRow(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    buildPlayerIcon(context, 'LisaPoker'),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    RotatedBox(
                                      quarterTurns: 1,
                                      child: buildCardRow(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: buildCardRow(),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    buildPlayerIcon(context, 'RoseHazel'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: buildCardRow(),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    buildPlayerIcon(context, 'TigerPlay'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Column(
                          children: [
                            buildCardRow(),
                            const SizedBox(
                              height: 6,
                            ),
                            buildPlayerIcon(
                              context,
                              locale.you.toUpperCase(),
                              cardsDisplayed: cardsOpened,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 150,
                        child: Image.asset(
                          'assets/logo.png',
                          width: 100,
                          color:
                              Theme.of(context).highlightColor.withOpacity(0.3),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            locale.potAmt,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                              color: Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.6),
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
                                Text(
                                  '\$ 10000',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: CustomButton(
                        title: '${locale.check}/${locale.fold}',
                        bgImage: 'assets/button/button5.png',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 10,
                            ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomButton(
                        title: locale.check,
                        bgImage: 'assets/button/button5.png',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 10,
                            ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomButton(
                        title: '${locale.check}/${locale.callAny}',
                        bgImage: 'assets/button/button5.png',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 10,
                            ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCardRow() {
    if (!cardsOpened) {
      return Row(
        children: List.generate(
          3,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Image.asset(
              'assets/card.png',
              width: 24,
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
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

  Widget buildPlayerIcon(BuildContext context, String name,
      {bool? cardsDisplayed}) {
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
                  horizontal: (cardsDisplayed ?? false) ? 48 : 8, vertical: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Image.asset('assets/avatars/avatar1.png'),
            ),
            if (cardsOpened)
              Positioned(
                right: 4,
                bottom: 12,
                child: Transform.rotate(
                  angle: 6,
                  child: Image.asset(
                    'assets/card.png',
                    width: 21,
                  ),
                ),
              ),
            if (cardsOpened)
              Positioned(
                right: 0,
                bottom: 12,
                child: Image.asset(
                  'assets/card.png',
                  width: 21,
                ),
              ),
            if (cardsDisplayed ?? false)
              Positioned(
                right: 0,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/cards/card1.png',
                      height: 40,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Image.asset(
                      'assets/cards/card1.png',
                      height: 40,
                    ),
                  ],
                ),
              ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsetsDirectional.only(
                  start: 4,
                  end: 8,
                  top: 4,
                  bottom: 4,
                ),
                decoration: CircularIconButton.getDecoration(
                  context,
                  Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/coin.png',
                      height: 12,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    FittedBox(
                      child: Text(
                        '\$ 25658',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 10,
                            ),
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
}
