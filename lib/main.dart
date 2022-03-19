import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ftm_service_app/screens/welcome_page.dart';
import 'package:ftm_service_app/screens/home_page.dart';
import 'package:ftm_service_app/screens/splash_screen.dart';
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
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('fa', '')],
      // supportedLocales: const [Locale('fa', ''), Locale('en', '')],
      debugShowCheckedModeBanner: false,
      title: 'FTM.CO',
      theme: ThemeData(
        fontFamily: 'Yekan',
      ),
      home: const WelcomePage(),
      initialRoute: '/.',
      routes: {
        '/.': (BuildContext context) => SplashScreen(),
        '/welcome': (BuildContext context) => const WelcomePage(),
        '/sign_in': (BuildContext context) => const SignInPage(),
        '/sign_up': (BuildContext context) => const SignUpPage(
              pageTitle: 'SignUpPage',
            ),
        '/confirm_page': (BuildContext context) => const ConfirmationPage(
              pageTitle: 'ConfirmationPage',
            ),
        '/home': (BuildContext context) => const HomePage(
              operatorName: 'operatorName',
            ),
      },
    );
  }
}
