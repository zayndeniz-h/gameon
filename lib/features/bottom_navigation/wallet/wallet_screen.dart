import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/components/custom_button.dart';
import 'package:teen_patti/features/bottom_navigation/wallet/views/history_tab.dart';
import 'package:teen_patti/features/bottom_navigation/wallet/views/offers_tab.dart';
import 'package:teen_patti/routes/routes.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            locale.wallet.toUpperCase(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  letterSpacing: 3,
                ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: Image.asset('assets/avatars/avatar1.png'),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locale.walletBalance,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '\$ 50.00',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildWalletTopRow(
              context,
              'assets/wallet/add_money.png',
              locale.unplayed,
              '\$ 20.00',
              CustomButton(
                bgImage: 'assets/button/button2.png',
                title: locale.addCash.toUpperCase(),
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.addCashScreen);
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            buildWalletTopRow(
              context,
              'assets/wallet/coupon.png',
              locale.bonus,
              '\$ 16.50',
              CustomButton(
                bgWidget: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Image.asset(
                      'assets/button/button2.png',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 26,
                      width: 50,
                      margin: const EdgeInsets.all(3),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ],
                ),
                bgImage: 'assets/button/button2.png',
                title: locale.earnBonus.toUpperCase(),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.referEarnScreen);
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            buildWalletTopRow(
              context,
              'assets/wallet/level.png',
              locale.earning,
              '\$ 16.50',
              CustomButton(
                bgWidget: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Image.asset(
                      'assets/button/button2.png',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 26,
                      width: 50,
                      margin: const EdgeInsets.all(3),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ],
                ),
                bgImage: 'assets/button/button2.png',
                title: locale.withdraw.toUpperCase(),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 4),
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/bg.png'), fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Theme.of(context).primaryColor,
                      labelColor: Theme.of(context).primaryColor,
                      labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                            letterSpacing: 3,
                            fontWeight: FontWeight.w700,
                          ),
                      tabs: [
                        Tab(
                          text: locale.history.toUpperCase(),
                        ),
                        Tab(
                          text: locale.offers.toUpperCase(),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          HistoryTab(),
                          const OffersTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildWalletTopRow(
    BuildContext context,
    String icon,
    String title,
    String subtitle,
    Widget trailing,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Image.asset(
              icon,
              width: 16,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 130,
            child: trailing,
          ),
        ],
      ),
    );
  }
}
