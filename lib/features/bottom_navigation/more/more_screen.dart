import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/models/more_options.dart';
import 'package:teen_patti/routes/routes.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final List<MoreOption> moreOptions = [];

  @override
  void didChangeDependencies() {
    final locale = AppLocalizations.of(context);
    moreOptions.addAll([
      MoreOption(
        image: 'assets/menu_icons/user.png',
        title: locale.leaderboard,
        subtitle: locale.knowWhereYouStandInCompetition,
        onTap: () => Navigator.pushNamed(context, PageRoutes.levelScreen),
      ),
      MoreOption(
        image: 'assets/menu_icons/alert.png',
        title: locale.aboutUs,
        subtitle: locale.whoWeAreAndStarted,
        onTap: () => Navigator.pushNamed(context, PageRoutes.aboutUsScreen),
      ),
      MoreOption(
        image: 'assets/wallet/coupon.png',
        title: locale.referNEarn,
        subtitle: locale.referYourFriendsAndFamily,
        onTap: () => Navigator.pushNamed(context, PageRoutes.referEarnScreen),
      ),
      MoreOption(
        image: 'assets/menu_icons/mail.png',
        title: locale.support,
        subtitle: locale.connectUsForIssue,
        onTap: () => Navigator.pushNamed(context, PageRoutes.supportScreen),
      ),
      MoreOption(
          image: 'assets/menu_icons/task.png',
          title: locale.privacyPolicy,
          subtitle: locale.knowOurPrivacyPolicies,
          onTap: () {
            Navigator.pushNamed(context, PageRoutes.privacyPolicyScreen);
          }),
      MoreOption(
        image: 'assets/menu_icons/global.png',
        title: locale.changeLanguage,
        subtitle: locale.setYourPreferredLanguage,
        onTap: () => Navigator.pushNamed(context, PageRoutes.languageScreen),
      ),
      MoreOption(
        image: 'assets/menu_icons/question.png',
        title: locale.faqs,
        subtitle: locale.getYourQuestionsAnswered,
        onTap: () => Navigator.pushNamed(context, PageRoutes.faqScreen),
      ),
    ]);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          locale.myProfile.toUpperCase(),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                letterSpacing: 3,
              ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, PageRoutes.myProfileScreen),
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Container(
                    height: 78,
                    width: 78,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: Image.asset('assets/avatars/avatar5.png'),
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Samanthateam123',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 15,
                                  ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Samantha Smith',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 15,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PageRoutes.myProfileScreen);
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                    color: Theme.of(context).highlightColor,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, PageRoutes.levelScreen),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
              color: const Color(0xff133511),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/menu_icons/ic_level.png',
                    height: 16,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${locale.level} 89',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontSize: 15,
                                    ),
                              ),
                            ),
                            Text(
                              '8,871 ${locale.points}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontSize: 15,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        LinearProgressIndicator(
                          value: 0.4,
                          color: Theme.of(context).primaryColor,
                          backgroundColor:
                              Theme.of(context).highlightColor.withOpacity(0.1),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          locale.earnPointsToReach,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .highlightColor
                                        .withOpacity(
                                          0.4,
                                        ),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xff112811),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 28,
              ),
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: moreOptions[index].onTap,
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          moreOptions[index].image,
                          height: 16,
                          width: 16,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                moreOptions[index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontSize: 15,
                                    ),
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Text(
                                moreOptions[index].subtitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .highlightColor
                                          .withOpacity(
                                            0.4,
                                          ),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  height: 32,
                );
              }),
              itemCount: moreOptions.length,
            ),
          ),
        ],
      ),
    );
  }
}
