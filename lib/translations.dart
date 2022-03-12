import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

class Translations {
  late Map localizationValues;
  Future load(Locale locale) async {
    String jsonContent =
        await rootBundle.loadString('locale/${locale.languageCode}.json');
    localizationValues = jsonDecode(jsonContent);
  }
  static Translations of(BuildContext context){
    // return Localizations.of<Translations>(context,Translations);
    return Localizations.of(context, Translations);
  }
  String text(String key){
    if(localizationValues['key'] == ''){
      return "** $key not found";
    } else {
      return localizationValues[key];
    }
  }

}

class AppLocalizationDelegate extends LocalizationsDelegate<Translations> {
  @override
  bool isSupported(Locale locale) {
    return ['fa', 'en'].contains(locale.languageCode);
  }

  @override
  Future<Translations> load(Locale locale) async{
    Translations translations = Translations();
    await translations.load(locale);
    return translations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Translations> old) {
    //Changed by user
    return false;
  }
}
