import 'package:flutter/material.dart';
import 'package:ftm_service_app/screens/home_page.dart';
import 'screens/confirmation_page.dart';
import 'screens/sign_up_page.dart';
import 'screens/sing_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/.': (BuildContext context) => HomePage(pageTitle: 'SignInPage',),
        '/signin': (BuildContext context) =>  SignInPage(pageTitle: 'SignInPage',),
        '/signup': (BuildContext context) =>   SignUpPage(pageTitle: 'SignUpPage',),
        '/confirmpage': (BuildContext context) =>   ConfirmationPage(pageTitle: 'ConfirmationPage',),
      },
    );
  }
}