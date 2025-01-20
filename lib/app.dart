import 'package:flutter/material.dart';
import 'package:mendeleev_app/core/providers/l10n_provider.dart';
import 'package:mendeleev_app/core/providers/score_provider.dart';
import 'package:mendeleev_app/l10n/l10n.dart';
import 'package:mendeleev_app/router/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocaleProvider>(create:(context) => LocaleProvider(),),
        ChangeNotifierProvider<ScoreProvider>(create:(context) => ScoreProvider(),)
      ],
      child: Builder(
        builder: (context) {
          Provider.of<ScoreProvider>(context).initScore();
          return MaterialApp.router(
            routerConfig: router.config(),
            theme: ThemeData.dark() ,
            supportedLocales: L10n.all,
            locale: Locale(Provider.of<LocaleProvider>(context).locale),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
          );
        }
      ),
    );
  }
}