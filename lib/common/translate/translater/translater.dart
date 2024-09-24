import 'package:get/get.dart';
import 'package:test/common/translate/translater/translate_keys.dart';

class Translater extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          TranslateKeys.flutterDemoSwitcherTheme: "Flutter demo switcher theme",
          TranslateKeys.switchToLight: "Switch to light",
          TranslateKeys.switchToDark: "Switch to dark",
          TranslateKeys.language: "Language",
          TranslateKeys.switchToEnglish: "Switch to English",
          TranslateKeys.switchToKhmer: "Switch to Khmer",
        },
        "KH": {
          TranslateKeys.flutterDemoSwitcherTheme:"ការបង្ហាញពីការផ្លាស់ប្ដូររូបរាង",
          TranslateKeys.switchToLight: "ប្ដូរទៅភ្លឺ",
          TranslateKeys.switchToDark: "ប្ដូរទៅងងឹត",
          TranslateKeys.language: "ភាសា",
          TranslateKeys.switchToEnglish: "ប្ដូរទៅអង់គ្លេស",
          TranslateKeys.switchToKhmer: "ប្ដូរទៅខ្មែរ",
        }
      };
}
