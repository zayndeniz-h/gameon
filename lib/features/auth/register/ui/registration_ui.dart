import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/components/custom_button.dart';
import 'package:teen_patti/components/entry_field.dart';
import 'package:teen_patti/components/login_header.dart';

import 'registration_interactor.dart';

class RegistrationUI extends StatefulWidget {
  final RegistrationInteractor registrationInteractor;
  final String? phoneNumber;

  const RegistrationUI(this.registrationInteractor, this.phoneNumber, {super.key});

  @override
  RegistrationUIState createState() => RegistrationUIState();
}

class RegistrationUIState extends State<RegistrationUI> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        fadeDuration: const Duration(milliseconds: 300),
        slideDuration: const Duration(milliseconds: 150),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        child: Column(
          children: [
            LoginHeader(
              title: locale.register,
              subtitle: locale.inLessThanAMinute,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  EntryField(
                    title: locale.fullName,
                    hintText: locale.enterFullName,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  EntryField(
                    title: locale.emailAddress,
                    hintText: locale.enterPhoneNumber,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  EntryField(
                    title: locale.phoneNumber,
                    hintText: locale.enterPhoneNumber,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  EntryField(
                    title: locale.birthdate,
                    hintText: locale.selectBirthdate,
                    suffixIcon: Icon(
                      Icons.event,
                      color: Theme.of(context).hintColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              locale.wellSendVerificationCode,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 15,
                  ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                onTap: () {
                  widget.registrationInteractor.register('name', 'email');
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
