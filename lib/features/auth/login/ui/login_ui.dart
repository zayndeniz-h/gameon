import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/components/custom_button.dart';
import 'package:teen_patti/components/entry_field.dart';

import 'login_interactor.dart';

class LoginUI extends StatefulWidget {
  final LoginInteractor loginInteractor;

  const LoginUI(this.loginInteractor, {Key? key}) : super(key: key);

  @override
  LoginUIState createState() => LoginUIState();
}

class LoginUIState extends State<LoginUI> {
  final TextEditingController _numberController = TextEditingController();

  String isoCode = '';

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        fadeDuration: const Duration(milliseconds: 300),
        slideDuration: const Duration(milliseconds: 150),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    // flex: 5,
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              'assets/logo.png',
                              alignment: Alignment.bottomCenter,
                              scale: 3,
                            ),
                          ),
                          Image.asset(
                            'assets/sign_in_head.png',
                            scale: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Spacer(),
                        Text(
                          locale.letsPlay,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: EntryField(
                            title: locale.phoneNumber,
                            hintText: locale.enterPhoneNumber,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomButton(
                            onTap: () {
                              widget.loginInteractor
                                  .loginWithMobile('isoCode', 'mobileNumber');
                            },
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => widget.loginInteractor.skipLogin(),
                          child: Text(
                            locale.skipLogin,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          locale.orContinueWith,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const Spacer(),
                        Container(
                          color: Theme.of(context).colorScheme.background,
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: buildSocialRow(
                                    context,
                                    'assets/social_icons/ic_fb.png',
                                    locale.facebook,
                                  ),
                                ),
                                VerticalDivider(
                                  color: Theme.of(context).highlightColor,
                                ),
                                Expanded(
                                  child: buildSocialRow(
                                    context,
                                    'assets/social_icons/ic_google.png',
                                    locale.google,
                                  ),
                                ),
                              ],
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
        ),
      ),
    );
  }

  Row buildSocialRow(BuildContext context, String image, String title) {
    return Row(
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
    );
  }
}
