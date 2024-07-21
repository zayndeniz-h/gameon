import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:teen_patti/app_config/theme_cubit.dart';
import 'package:teen_patti/features/auth/login_navigator.dart';
import 'package:teen_patti/features/language/bloc/language_cubit.dart';
import 'package:teen_patti/routes/routes.dart';

import 'Locale/locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Phoenix(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LanguageCubit>(
            create: (context) => LanguageCubit()..getCurrentLanguage(),
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit()..getCurrentTheme(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (_, theme) {
        return BlocBuilder<LanguageCubit, Locale>(
          builder: (_, locale) {
            return MaterialApp(
              localizationsDelegates: const [
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
                Locale('pt'),
                Locale('fr'),
                Locale('id'),
                Locale('es'),
                Locale('it'),
                Locale('tr'),
                Locale('sw'),
                Locale('ro'),
                Locale('de'),
              ],
              locale: locale,
              theme: theme,
              home: const LoginNavigator(),
              routes: PageRoutes().routes(),
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
