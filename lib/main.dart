import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ftm_service_app/screens/welcome_page.dart';
import 'package:ftm_service_app/screens/home_page.dart';
import 'package:ftm_service_app/screens/splash_screen.dart';
import 'package:ftm_service_app/services/translations.dart';
import 'package:package_info_plus/package_info_plus.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp(version: version));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.version}) : super(key: key);
  final String version;
  static late Locale locale = const Locale('fa','IR');
  @override
  Widget build(BuildContext context) {
    print("00: "+ locale.languageCode);
    return MaterialApp(
      locale: locale,
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
      title: 'FTM.CO',
      theme: ThemeData(
        fontFamily: 'Yekan',
      ),
      home: const WelcomePage(),
      initialRoute: '/.',
      routes: {
        '/.': (BuildContext context) => SplashScreen(version: version),
        '/welcome': (BuildContext context) => const WelcomePage(),
        '/sign_in': (BuildContext context) => const SignInPage(),
        '/sign_up': (BuildContext context) => const SignUpPage(
              pageTitle: 'SignUpPage',
            ),
        '/home': (BuildContext context) => const HomePage(
              operatorName: 'operatorName',
            ),
      },
    );
  }
}
