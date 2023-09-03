import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  static const String LANGUAGE_KEY = "lang";

  Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(LANGUAGE_KEY);
  }

  Future<void> setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(LANGUAGE_KEY, language);
  }
}
