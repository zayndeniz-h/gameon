import 'package:flutter/material.dart';
import 'package:teen_patti/features/bottom_navigation/bottom_navigation.dart';
import 'package:teen_patti/features/bottom_navigation/lobby/poker_room_screen.dart';
import 'package:teen_patti/features/bottom_navigation/more/about_us_screen.dart';
import 'package:teen_patti/features/bottom_navigation/more/faq_screen.dart';
import 'package:teen_patti/features/bottom_navigation/more/level_screen.dart';
import 'package:teen_patti/features/bottom_navigation/more/my_profile_screen.dart';
import 'package:teen_patti/features/bottom_navigation/more/privacy_policy_screen.dart';
import 'package:teen_patti/features/bottom_navigation/more/support_screen.dart';
import 'package:teen_patti/features/bottom_navigation/wallet/add_cash_screen.dart';
import 'package:teen_patti/features/bottom_navigation/wallet/refer_and_earn_screen.dart';
import 'package:teen_patti/features/language/ui/language_sheet.dart';

class PageRoutes {
  static const String bottomNavigation = 'bottom_navigation';
  static const String pokerRoomScreen = 'poker_room';
  static const String addCashScreen = 'add_cash';
  static const String referEarnScreen = 'refer_earn';
  static const String myProfileScreen = 'my_profile';
  static const String levelScreen = 'level';
  static const String privacyPolicyScreen = 'privacy_policy';
  static const String aboutUsScreen = 'about_screen';
  static const String languageScreen = 'language_screen';
  static const String faqScreen = 'faq_screen';
  static const String supportScreen = 'support_screen';

  Map<String, WidgetBuilder> routes() {
    return {
      bottomNavigation: (context) => const BottomNavigation(),
      pokerRoomScreen: (context) => const PokerRoomScreen(),
      addCashScreen: (context) => const AddCashScreen(),
      referEarnScreen: (context) => const ReferAndEarnScreen(),
      myProfileScreen: (context) => const MyProfileScreen(),
      levelScreen: (context) => const LevelScreen(),
      privacyPolicyScreen: (context) => const PrivacyPolicyScreen(),
      aboutUsScreen: (context) => const AboutUsScreen(),
      languageScreen: (context) => const LanguageSheet(
            fromRoot: false,
          ),
      faqScreen: (context) => const FaqScreen(),
      supportScreen: (context) => const SupportScreen(),
    };
  }
}
