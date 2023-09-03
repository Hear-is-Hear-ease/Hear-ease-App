import 'package:flutter/material.dart';
import 'package:hear_ease_app/models/language.dart';

Widget _buildLanguageOption(
    String language, String flag, bool isSelected, double width) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    width: width * 0.8,
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              flag,
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(width: 8.0),
            Text(
              language,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
        isSelected ? const Icon(Icons.check) : const SizedBox(width: 1),
      ],
    ),
  );
}

class SelectLangWidget extends StatefulWidget {
  final void Function() closeBottomWidget;
  const SelectLangWidget({super.key, required this.closeBottomWidget});

  @override
  State<SelectLangWidget> createState() => _SelectLangWidgetState();
}

class _SelectLangWidgetState extends State<SelectLangWidget> {
  final LanguageService _lang = LanguageService();
  String? userLang;

  @override
  void initState() {
    _lang.getLanguage().then((value) => setState(() => userLang = value));
    super.initState();
  }

  void _updateLanguage(String lang) {
    var originLang = userLang;
    setState(() {
      userLang = lang;
    });
    _lang.setLanguage(lang);
    if (originLang == null) {
      widget.closeBottomWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * 0.85,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Select Language",
              style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 36),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _updateLanguage("KR"),
                  child: _buildLanguageOption(
                      '한국어', '🇰🇷', userLang == 'KR', width),
                ),
                GestureDetector(
                  onTap: () => _updateLanguage("EN"),
                  child: _buildLanguageOption(
                      'English', '🇺🇸', userLang == 'EN', width),
                ),
                GestureDetector(
                  onTap: () => _updateLanguage("JP"),
                  child: _buildLanguageOption(
                      '日本語', '🇯🇵', userLang == 'JP', width),
                ),
              ],
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
