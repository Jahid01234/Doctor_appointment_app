import 'package:get/get.dart';

class LanguageController extends GetxController {

  RxString selectedLanguage = 'English (US)'.obs;

  void selectLanguage(String language) {
    selectedLanguage.value = language;
  }

  final List<String> suggestedLanguages = [
    'English (US)',
    'English (UK)',
  ];

  final List<String> allLanguages = [
    'English',
    'Mandarin Chinese',
    'Hindi',
    'Spanish',
    'French',
    'Arabic',
    'Bengali',
    'Russian',
    'Portuguese',
    'Indonesian',
    'Urdu',
    'German',
    'Japanese',
    'Swahili',
    'Marathi',
    'Telugu',
    'Turkish',
    'Tamil',
    'Yue Chinese (Cantonese)',
    'Vietnamese',
    'Korean',
    'Persian (Farsi)',
    'Thai',
    'Gujarati',
    'Polish',
    'Ukrainian',
    'Malay',
    'Kannada',
    'Romanian',
    'Dutch',
    'Greek',
    'Czech',
    'Hungarian',
    'Hebrew',
    'Danish',
    'Finnish',
    'Norwegian',
    'Slovak',
    'Bulgarian',
    'Croatian',
    'Serbian',
    'Lithuanian',
    'Latvian',
    'Estonian',
    'Slovenian',
    'Icelandic',
    'Irish',
    'Welsh',
    'Scottish Gaelic',
    'Filipino (Tagalog)',
    'Khmer',
    'Lao',
    'Myanmar (Burmese)',
    'Nepali',
    'Sinhala',
    'Pashto',
    'Kazakh',
    'Uzbek',
    'Azerbaijani',
    'Georgian',
    'Armenian',
    'Amharic',
    'Somali',
    'Zulu',
    'Xhosa',
    'Afrikaans',
  ];

}
