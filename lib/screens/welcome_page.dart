import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ftm_service_app/main.dart';
import 'package:ftm_service_app/services/translations.dart';
import 'package:ftm_service_app/widgets/buttons.dart';
import 'package:ftm_service_app/constructor.dart';

import 'package:page_transition/page_transition.dart';
import 'sign_up_page.dart';
import 'sing_in_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Locale _locale = const Locale('fa');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  void _changeLanguage(String langCode) {
    Locale _temp;
    switch (langCode) {
      case 'en':
        _temp = const Locale('en', 'US');
        break;

      case 'fa':
        _temp = const Locale('fa', 'IR');
        break;

      default:
        _temp = const Locale('fa', 'IR');
    }

    setLocale(_temp);
    MyApp.locale = _temp;
    Navigator.pushReplacement(
      context,
      PageTransition(
          child: const MyApp(
            version: "0.0.0.0",
          ),
          type: PageTransitionType.fade),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale!.languageCode &&
              locale.countryCode == deviceLocale.countryCode) {
            return deviceLocale;
          }
          return supportedLocales.first;
        }
      },
      supportedLocales: const [
        Locale('fa', 'IR'),
        Locale('en', 'US'),
      ],
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/ftm.png', width: 260, height: 210),
              Container(
                margin: const EdgeInsets.only(bottom: 10, top: 0),
                child: Text(
                  Translations.of(context).text('welcome_home'),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                  ),
                ),
              ),
              Container(
                width: 200,
                margin: const EdgeInsets.only(bottom: 0),
                child: ftmFlatBtn(
                  Translations.of(context).text('sing_in'),
                  () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRightWithFade,
                        duration: const Duration(seconds: 1),
                        child: const SignInPage(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: 200,
                padding: const EdgeInsets.all(0),
                child: ftmOutlineBtn(
                  Translations.of(context).text('sing_up'),
                  () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRightWithFade,
                        duration: const Duration(seconds: 1),
                        child: const SignUpPage(
                          pageTitle: 'SignUpPage',
                        ),
                      ),
                    );
                    // Navigator.of(context).pushReplacementNamed('/sign_up');
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      _changeLanguage('en');
                    },
                    child: const Text('English'),
                  ),
                  TextButton(
                    onPressed: () {
                      _changeLanguage('fa');
                    },
                    child: const Text('فارسی'),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: kLightBackgroundColor,
      ),
    );
  }
}
