import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/components/custom_button.dart';
import 'package:teen_patti/components/entry_field.dart';

class AddCashScreen extends StatelessWidget {
  const AddCashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          locale.addCash.toUpperCase(),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                letterSpacing: 3,
              ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        )),
        child: ListView(
          children: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '\$ 50.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
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
                    height: 46,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      locale.topUpYourWalletBalance,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: EntryField(
                      title: locale.enterAmountToAdd,
                      hintText: locale.enterAmount,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      locale.addAQuickAmount,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 15,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        buildQuickAmount(context, '50', '20'),
                        const SizedBox(
                          width: 20,
                        ),
                        buildQuickAmount(context, '100', '40'),
                        const SizedBox(
                          width: 20,
                        ),
                        buildQuickAmount(context, '200', '100'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomButton(
                      title: locale.addCash.toUpperCase(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            SizedBox(
              height: 80,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return buildOffersItem(
                    context,
                    locale.offer1,
                    locale.offer1Subtitle,
                  );
                }),
                separatorBuilder: ((context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                }),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildOffersItem(
      BuildContext context, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
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
        ],
      ),
    );
  }

  Widget buildQuickAmount(BuildContext context, String amount, String bonus) {
    final locale = AppLocalizations.of(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Text(
              '\$$amount',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '+\$$bonus ${locale.bonus}',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
