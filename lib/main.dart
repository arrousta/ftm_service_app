import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ftm_service_app/screens/home_page.dart';
import 'package:ftm_service_app/screens/spash_screen.dart';
import 'package:ftm_service_app/translations.dart';
import 'screens/confirmation_page.dart';
import 'screens/sign_up_page.dart';
import 'screens/sing_in_page.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var lang = Localizations.localeOf(context).languageCode;
    // print(lang);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('fa', ''), Locale('en', '')],
      debugShowCheckedModeBanner: false,
      title: 'FTM.CO',
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xffc7c7c7),
        backgroundColor: const Color(0xffc7c7c7),
        scaffoldBackgroundColor: const Color(0xffc7c7c7),
      ),
      home: const HomePage(pageTitle: 'FTM.CO'),
      initialRoute: '/.',
      routes: {
        '/.': (BuildContext context) => SplashScreen(),
        '/home': (BuildContext context) => const HomePage(
              pageTitle: 'Home',
            ),
        '/signin': (BuildContext context) => SignInPage(
              pageTitle: 'SignInPage',
            ),
        '/signup': (BuildContext context) => const SignUpPage(
              pageTitle: 'SignUpPage',
            ),
        '/confirmpage': (BuildContext context) => const ConfirmationPage(
              pageTitle: 'ConfirmationPage',
            ),
      },
    );
  }
}
