import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/components/circular_icon_button.dart';
import 'package:teen_patti/components/custom_button.dart';
import 'package:teen_patti/utils/utils.dart';

class PokerRoomScreen extends StatelessWidget {
  const PokerRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: Container(
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
                    const CircularIconButton(icon: Icons.add),
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
                      child: buildPlayerIcon(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildPlayerIcon(context),
                              buildPlayerIcon(context),
                              buildPlayerIcon(context),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildPlayerIcon(context),
                              buildPlayerIcon(context),
                              buildPlayerIcon(context),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: buildPlayerIcon(context, cardsDisplayed: true),
                    ),
                    Positioned(
                      bottom: 150,
                      child: Image.asset(
                        'assets/logo_watermark.png',
                        scale: 2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Image.asset(
                            'assets/cards/card${index + 1}.png',
                            height: 40,
                          ),
                        ),
                      ),
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
                  Center(
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
                  ),
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
                  Center(
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
                  ),
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

  Widget buildPlayerIcon(BuildContext context, {bool? cardsDisplayed}) {
    return Stack(
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
    );
  }
}
