import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/components/login_header.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        children: [
          LoginHeader(
            title: locale.privacyPolicy,
            subtitle: locale.howWeWork,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  locale.termsOfUse,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 15,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.6,
                      ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  locale.privacyPolicy,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 15,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.\n\nSed ut Terspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.6,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
