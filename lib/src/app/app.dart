import 'package:coolmovies/src/constants/app_sizes.dart';
import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:coolmovies/src/routing/routing.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.dark().copyWith(
      dialogTheme: const DialogTheme(
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.p16)),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(Sizes.p8))),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p8),
          ),
        ),
      ),
    );

    return MaterialApp.router(
      title: 'Cool Movies',
      theme: theme,
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
