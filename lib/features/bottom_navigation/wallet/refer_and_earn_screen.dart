import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/components/custom_button.dart';
import 'package:teen_patti/components/entry_field.dart';

class ReferAndEarnScreen extends StatelessWidget {
  const ReferAndEarnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          locale.referNEarn,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                letterSpacing: 3,
              ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        children: [
          Image.asset('assets/earn.png'),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            title: locale.referToYourContacts,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 44,
          ),
          Text(
            locale.alreadyHaveACouponCode,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 36,
          ),
          EntryField(
            title: locale.applyCouponCode,
            hintText: locale.enterCouponCode,
            initialValue: 'ADVF1243',
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            title: locale.applyCode.toUpperCase(),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
