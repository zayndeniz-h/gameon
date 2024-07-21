import 'package:flutter/material.dart';
import 'package:teen_patti/features/auth/register/ui/registration_page.dart';
import 'package:teen_patti/features/language/ui/language_sheet.dart';
import 'package:teen_patti/routes/routes.dart';

import 'login/ui/login_page.dart';
import 'verification/ui/verification_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class LoginRoutes {
  static const String loginRoot = 'login/';
  static const String login = 'login/login';
  static const String registration = 'login/registration';
  static const String verification = 'login/verification';
}

class LoginNavigator extends StatelessWidget {
  const LoginNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState!.canPop();
        if (canPop) {
          navigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: LoginRoutes.loginRoot,
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            case LoginRoutes.loginRoot:
              builder = (BuildContext _) => const LanguageSheet();
              break;
            case LoginRoutes.login:
              builder = (BuildContext _) => LoginPage(
                    onSkipLogin: () => Navigator.popAndPushNamed(
                      context,
                      PageRoutes.bottomNavigation,
                    ),
                  );
              break;
            case LoginRoutes.registration:
              String? phoneNumber = settings.arguments as String?;
              builder = (BuildContext _) => RegisterPage(phoneNumber);
              break;
            case LoginRoutes.verification:
              builder = (BuildContext _) => VerificationPage(
                    () => Navigator.popAndPushNamed(
                      context,
                      PageRoutes.bottomNavigation,
                    ),
                  );
              break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
