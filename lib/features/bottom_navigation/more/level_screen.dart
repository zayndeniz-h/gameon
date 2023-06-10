import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '${locale.youAreOnLevel} 89',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 22,
                    ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '8,871 ${locale.points}',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          'assets/point_levels/88.png',
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          'assets/point_levels/89.png',
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          'assets/point_levels/90.png',
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        color: Theme.of(context).primaryColorLight,
                        backgroundColor:
                            Theme.of(context).highlightColor.withOpacity(0.1),
                        value: 0.7,
                        minHeight: 6,
                      ),
                      Row(
                        children: [
                          const Spacer(
                            flex: 2,
                          ),
                          Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(
                              Icons.check_circle,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(
                              Icons.check_circle,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(
                              Icons.circle,
                              color: Theme.of(context)
                                  .highlightColor
                                  .withOpacity(0.3),
                            ),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      Text(
                        '8800 ${locale.points}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .highlightColor
                                  .withOpacity(0.5),
                            ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      Text(
                        '8800 ${locale.points}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .highlightColor
                                  .withOpacity(0.5),
                            ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      Text(
                        '8800 ${locale.points}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .highlightColor
                                  .withOpacity(0.5),
                            ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 60,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff10210E),
                    ),
                    child: Text(
                      locale.earnPointsToReach,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 10),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff10210E),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      locale.howItWorks,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 15,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  buildHowItWorkRow(
                    context,
                    'assets/point_levels/level.png',
                    locale.youllGetPoints,
                    locale.joinedMatch,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  buildHowItWorkRow(
                    context,
                    'assets/point_levels/like.png',
                    locale.ifYouJoinedAndWon,
                    locale.earnedPoints,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  buildHowItWorkRow(
                    context,
                    'assets/point_levels/dislike.png',
                    locale.ifYouJoinedAndLose,
                    locale.losePoints,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildHowItWorkRow(
    BuildContext context,
    String image,
    String title,
    String subtitle,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 36,
            width: 36,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).highlightColor.withOpacity(0.5),
              ),
            ),
            child: Image.asset(image),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 10,
                        height: 1.4,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
