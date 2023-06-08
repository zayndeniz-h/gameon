import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/components/custom_button.dart';
import 'package:teen_patti/components/entry_field.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
                opacity: 0.4,
              ),
            ),
            height: 280,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    locale.support,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    locale.connectUs,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 15,
                        ),
                  ),
                ),
                const Spacer(),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: buildOptionRow(
                          context,
                          'assets/icons/ic_call.png',
                          locale.callUs,
                        ),
                      ),
                      VerticalDivider(
                        color: Theme.of(context).highlightColor,
                      ),
                      Expanded(
                        child: buildOptionRow(
                          context,
                          'assets/menu_icons/mail.png',
                          locale.mailUs,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              locale.writeUs,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 22,
                  ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              locale.letsKnowYourQuery,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: const Color(0xffa3bccf),
                  ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: EntryField(
              title: locale.phoneNumberEmail,
              hintText: locale.addContactInfo,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: EntryField(
              title: locale.addYourIssueFeedback,
              hintText: locale.writeYourMessage,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomButton(
              title: locale.submit.toUpperCase(),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOptionRow(BuildContext context, String image, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            scale: 3,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
