import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/models/wallet_offers.dart';

class OffersTab extends StatelessWidget {
  const OffersTab({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final List<WalletOffers> offers = [
      WalletOffers(locale.offer1, locale.offer1Subtitle),
      WalletOffers(locale.offer2, locale.offer2Subtitle),
      WalletOffers(locale.offer3, locale.offer3Subtitle),
      WalletOffers(locale.offer4, locale.offer4Subtitle),
      WalletOffers(locale.offer5, locale.offer5Subtitle),
    ];
    return ListView.separated(
      itemBuilder: ((context, index) {
        return buildOffersItem(
          context,
          offers[index].title,
          offers[index].subtitle,
          locale.apply.toUpperCase(),
        );
      }),
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 2,
        );
      },
      itemCount: offers.length,
    );
  }

  Container buildOffersItem(
      BuildContext context, String title, String subtitle, String amount) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 34,
                width: 34,
                padding: const EdgeInsets.all(7),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1.5,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Image.asset(
                  'assets/wallet/coupon.png',
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                    Text(
                      amount,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 15,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
