import 'package:flutter/material.dart';
import 'package:ftm_service_app/translations.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/ftm.png', width: 260, height: 210),
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
                  Navigator.of(context).pushReplacementNamed('/sign_up');
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: kBackgroundColor2,
    );
  }
}
