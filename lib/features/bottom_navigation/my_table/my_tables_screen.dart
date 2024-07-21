import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/components/custom_button.dart';
import 'package:teen_patti/routes/routes.dart';

class MyTablesScreen extends StatelessWidget {
  const MyTablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          locale.myTables.toUpperCase(),
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
            opacity: 0.4,
          ),
        ),
        child: ListView(
          children: [
            ListView.separated(
              shrinkWrap: true,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 6,
                );
              },
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Container(
                            width: 4,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xffffef8b),
                                  Color(0xffffdd49),
                                  Color(0xfffff775),
                                  Color(0xffffb232)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.group,
                                      size: 18,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '10 ${locale.seats}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 13,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  '\$ 5.00 / \$ 10.00',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 128,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  locale.goToTable,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 14,
                                      ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                CustomButton(
                                  title: '\$ 50 / \$ 100',
                                  bgImage: 'assets/button/button2.png',
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    PageRoutes.pokerRoomScreen,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 2,
            ),
          ],
        ),
      ),
    );
  }
}
