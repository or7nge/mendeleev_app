// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _viewedKey = 'viewed';
const _guessKey = 'guess';

class ScoreProvider extends ChangeNotifier {
  int? _viewedCount = 0;
  int? _guessedCount = 0;

  int get viewed => _viewedCount ?? 0;
  int get guessed => _guessedCount ?? 0;

  void initScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? _viewed = prefs.getInt(_viewedKey);
    final int? _guessed = prefs.getInt(_guessKey);

    if (_viewed == null || _guessed == null) {
      await prefs.setInt(_viewedKey, 0);
      await prefs.setInt(_guessKey, 0);
    } else {
      await prefs.setInt(_viewedKey, _viewed);
      await prefs.setInt(_guessKey, _guessed);

      _viewedCount = prefs.getInt(_viewedKey) ?? 0;
      _guessedCount = prefs.getInt(_guessKey) ?? 0;
    }

    notifyListeners();
  }

  void onGuess() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? _viewed = prefs.getInt(_viewedKey);
    final int? _guessed = prefs.getInt(_guessKey);

    await prefs.setInt(_viewedKey, _viewed!+1);
    await prefs.setInt(_guessKey, _guessed!+1);

    _viewedCount = prefs.getInt(_viewedKey)!;
    _guessedCount = prefs.getInt(_guessKey)!;

    print("VIEWED: $_viewedCount, GUESSED: $_guessedCount");
    notifyListeners();
  }

  void onNoGuess() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? _viewed = prefs.getInt(_viewedKey);
    final int? _guessed = prefs.getInt(_guessKey);

    await prefs.setInt(_viewedKey, _viewed!+1);

    _viewedCount = prefs.getInt(_viewedKey)!;

    print("VIEWED: $_viewedCount, GUESSED: $_guessedCount");
    notifyListeners();
  }
  
  void clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _viewedCount = 0;
    _guessedCount = 0;
    notifyListeners();
  }
}