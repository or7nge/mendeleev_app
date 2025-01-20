import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mendeleev_app/app.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SentryFlutter.init(
      (options) {
        options.dsn = 'https://e9f0af0d806a0243eb99f163b3cc6ddc@o4507984211017728.ingest.de.sentry.io/4507984213966928';
        options.tracesSampleRate = 1.0;
        options.profilesSampleRate = 1.0;
      },
      appRunner: () => runApp(const MainApp()),
    );
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
  
  //runApp(const MainApp());
}