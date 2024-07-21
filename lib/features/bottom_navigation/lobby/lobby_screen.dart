import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/components/circular_icon_button.dart';
import 'package:teen_patti/components/custom_button.dart';
import 'package:teen_patti/routes/routes.dart';
import 'package:teen_patti/utils/utils.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/logo.png',
                          alignment: Alignment.centerLeft,
                          scale: 4,
                        ),
                      ),
                      const Spacer(),
                      CircularIconButton(
                        icon: Icons.question_mark,
                        onTap: () {
                          Utils().showGuideDialog(context);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, PageRoutes.addCashScreen);
                        },
                        child: Container(
                          padding: const EdgeInsetsDirectional.only(
                            start: 8,
                            end: 12,
                            top: 8,
                            bottom: 8,
                          ),
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Theme.of(context).scaffoldBackgroundColor,
                            border: Border.all(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/coin.png'),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '\$ 50',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    PageRoutes.pokerRoomScreen,
                  ),
                  child: Image.asset('assets/banner.png'),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Theme.of(context).primaryColor,
                labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      letterSpacing: 3,
                      fontWeight: FontWeight.w700,
                    ),
                tabs: [
                  Tab(
                    text: locale.cashTables.toUpperCase(),
                  ),
                  Tab(
                    text: locale.leaderboard.toUpperCase(),
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    CashTablesTab(),
                    LeaderboardTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CashTablesTab extends StatelessWidget {
  const CashTablesTab({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 6,
        );
      },
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 4,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffffef8b),
                          Color(0xffffdd49),
                          Color(0xfffff775),
                          Color(0xffffb232)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.group,
                              size: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${15 * (index + 1)} ${locale.playersOnline}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 13,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          '\$ 5.00 / \$ 10.00',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 128,
                    child: CustomButton(
                      title: '\$ 50',
                      bgImage: 'assets/button/button2.png',
                      onTap: () => Navigator.pushNamed(
                        context,
                        PageRoutes.pokerRoomScreen,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: 8,
    );
  }
}

class LeaderboardTab extends StatelessWidget {
  const LeaderboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          color: const Color(0xff221e1e),
          child: Row(
            children: [
              const Spacer(
                flex: 2,
              ),
              buildHeading(context, '${locale.name}/${locale.rank}'),
              const SizedBox(
                width: 20,
              ),
              buildHeading(context, locale.points, align: TextAlign.center),
              buildHeading(context, locale.winnings, align: TextAlign.end),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
            child: ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        'assets/avatars/avatar${index + 1}.png',
                        height: 40,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Panthor2234',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            '#${index + 1}',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '15465346',
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '\$ 50',
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: ((context, index) {
                return Divider(
                  height: 40,
                  thickness: 0.2,
                  color: Theme.of(context).highlightColor,
                );
              }),
              itemCount: 6,
            ),
          ),
        )
      ],
    );
  }

  Widget buildHeading(BuildContext context, String title, {TextAlign? align}) {
    return Expanded(
      flex: 3,
      child: Text(
        title,
        textAlign: align ?? TextAlign.start,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: const Color(0x4dffffff),
            ),
      ),
    );
  }
}
