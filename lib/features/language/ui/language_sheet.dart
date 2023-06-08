import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/app_config/app_config.dart';
import 'package:teen_patti/components/custom_button.dart';
import 'package:teen_patti/components/login_header.dart';
import 'package:teen_patti/features/auth/login_navigator.dart';
import 'package:teen_patti/features/language/bloc/language_cubit.dart';
import 'package:teen_patti/routes/routes.dart';

class LanguageSheet extends StatefulWidget {
  final bool fromRoot;

  const LanguageSheet({Key? key, this.fromRoot = true}) : super(key: key);

  @override
  LanguageSheetState createState() => LanguageSheetState();
}

class LanguageSheetState extends State<LanguageSheet> {
  late LanguageCubit _languageCubit;

  String? selectedLocale;

  @override
  void initState() {
    super.initState();
    _languageCubit = context.read<LanguageCubit>()..getCurrentLanguage();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FadedSlideAnimation(
        fadeDuration: const Duration(milliseconds: 300),
        slideDuration: const Duration(milliseconds: 300),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginHeader(
              title: locale.language,
              subtitle: locale.preferredLanguage,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                locale.preferredLanguage,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 15,
                    ),
              ),
            ),
            Expanded(
              child: BlocBuilder<LanguageCubit, Locale>(
                builder: (context, currentLocale) {
                  selectedLocale ??= currentLocale.languageCode;
                  return ListView.builder(
                    padding: const EdgeInsets.only(
                      bottom: 100,
                      top: 0,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: AppConfig.languagesSupported.length,
                    itemBuilder: (context, index) {
                      var langCode =
                          AppConfig.languagesSupported.keys.elementAt(index);
                      return Container(
                        // padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                          // border: Border.all(
                          //   color: Colors.grey.withOpacity(0.5),
                          // ),
                        ),
                        margin: const EdgeInsets.symmetric(
                            // horizontal: 20.0,
                            // vertical: 10.0,
                            ),
                        child: RadioListTile(
                          title: Text(
                            AppConfig.languagesSupported[langCode]!,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          value: langCode,
                          groupValue: selectedLocale,
                          onChanged: (langCode) async {
                            setState(() {
                              selectedLocale = langCode as String;
                            });
                          },
                          activeColor: theme.primaryColor,
                          fillColor:
                              MaterialStateProperty.all(theme.primaryColor),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          onTap: () {
            _languageCubit.setCurrentLanguage(selectedLocale!);
            if (widget.fromRoot) {
              Navigator.pushNamed(context, LoginRoutes.login);
            } else {
              Navigator.popUntil(
                context,
                ModalRoute.withName(PageRoutes.bottomNavigation),
              );
              Navigator.popAndPushNamed(
                context,
                PageRoutes.bottomNavigation,
              );
            }
          },
        ),
      ),
    );
  }
}
