import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/models/wallet_history.dart';

class HistoryTab extends StatelessWidget {
  HistoryTab({super.key});

  final List<WalletHistory> transaction = [
    WalletHistory(TransactionType.pokerEntry, '-\$ 20.00'),
    WalletHistory(TransactionType.earningAdded, '\$ 12.00'),
    WalletHistory(TransactionType.moneyAdded, '-\$ 20.00'),
    WalletHistory(TransactionType.moneyWithdrawal, '-\$ 150.00'),
    WalletHistory(TransactionType.earningAdded, '\$ 12.00'),
    WalletHistory(TransactionType.pokerEntry, '-\$ 20.00'),
    WalletHistory(TransactionType.earningAdded, '\$ 12.00'),
    WalletHistory(TransactionType.moneyAdded, '-\$ 20.00'),
    WalletHistory(TransactionType.moneyWithdrawal, '-\$ 150.00'),
    WalletHistory(TransactionType.earningAdded, '\$ 12.00'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: ((context, index) {
        return getTransactionWidget(
          context,
          transaction[index].transactionType,
          transaction[index].amount,
        );
      }),
      separatorBuilder: ((context, index) {
        return const SizedBox(
          height: 2,
        );
      }),
      itemCount: transaction.length,
    );
  }

  Container buildHistoryItem(
      BuildContext context, String image, IconData icon, String title, String amount) {
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
                  image,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Icon(
                  icon,
                  size: 16,
                  color: Theme.of(context).primaryColor,
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
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '24 ${AppLocalizations.of(context).june}, 01:35 PM',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getTransactionWidget(BuildContext context, TransactionType type, String amount) {
    final locale = AppLocalizations.of(context);

    switch (type) {
      case TransactionType.pokerEntry:
        return buildHistoryItem(
            context, 'assets/wallet/key.png', Icons.remove_circle, locale.pokerEntry, amount);
      case TransactionType.earningAdded:
        return buildHistoryItem(
            context, 'assets/wallet/coupon.png', Icons.add_circle, locale.earningAdded, amount);
      case TransactionType.moneyAdded:
        return buildHistoryItem(
            context, 'assets/wallet/wallet.png', Icons.add_circle, locale.moneyAdded, amount);
      case TransactionType.moneyWithdrawal:
        return buildHistoryItem(context, 'assets/wallet/wallet.png', Icons.remove_circle,
            locale.moneyWithdrawal, amount);
      default:
        return const SizedBox();
    }
  }
}
