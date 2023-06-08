import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/components/login_header.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final List<String> faqs = [];

  @override
  void didChangeDependencies() {
    var locale = AppLocalizations.of(context);
    faqs.addAll([
      locale.howToPlay,
      locale.howToAddMoney,
      locale.howToSelectPlayer,
      locale.howToChangeProfilePicture,
      locale.howToSendMoney,
      locale.howToShop,
      locale.howToChangeLanguage,
      locale.canILogin,
      locale.howToLogout,
    ]);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        children: [
          LoginHeader(
            title: locale.faqs,
            subtitle: locale.getYourAnswers,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return FaqTile(
                  title: faqs[index],
                );
              },
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  height: 0,
                );
              }),
              itemCount: faqs.length,
            ),
          ),
        ],
      ),
    );
  }
}

class FaqTile extends StatefulWidget {
  final String title;

  const FaqTile({Key? key, required this.title}) : super(key: key);

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> {
  double height = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          height = (height == 160) ? 0 : 160;
        });
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Theme.of(context).hintColor,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            AnimatedContainer(
              height: height,
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              duration: const Duration(
                milliseconds: 300,
              ),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea. quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      height: 2,
                    ),
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
