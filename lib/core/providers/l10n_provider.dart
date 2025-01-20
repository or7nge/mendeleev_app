import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  String locale = 'ru';

  void changeLocale() {
    locale =  locale == 'en' ? 'ru' : 'en';
    notifyListeners();
  }
}