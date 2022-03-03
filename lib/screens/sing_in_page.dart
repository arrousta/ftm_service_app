import 'package:flutter/material.dart';
import 'package:ftm_service_app/widgets/input_fields.dart';
import 'package:ftm_service_app/constractor.dart';
import 'package:page_transition/page_transition.dart';

import 'sign_up_page.dart';

class SignInPage extends StatefulWidget {
  final String pageTitle;

  SignInPage({Key? key, required this.pageTitle}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: const Text('Sign In',
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/signup');
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const SignUpPage(
                          pageTitle: 'SignUpPage',
                        )));
              },
              child: const Text('Sign Up', style: contrastText),
            )
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text('Welcome Back!', style: h3),
                      const Text('Hi, let\'s authenticate', style: taglineText),
                      ftmPersonalCodeInput('Personnel Code'),
                      ftmPasswordInput('Password'),
                      TextButton(
                        onPressed: () {

                          //ToDo : Forgot Password onPressed Here ...

                        },
                        child: const Text('Forgot Password?',
                            style: contrastTextBold),
                      ),
                      ElevatedButton(
                        //TODO : SignInPage : after user press Enter button Send Data To Server And Check authentication :
                        onPressed: () {

                          print(personnelCodeController.text); // Print name current value
                          print(passwordController.text); // Print password current value

                          // if(authentication == true) {
                          //   // Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: Dashboard()));
                          // }

                        },
                        child: const Text("Enter"),
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          padding: const EdgeInsets.all(15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              height: 300,
              width: double.infinity,
              decoration: authPlateDecoration,
            ),
          ],
        ));
  }
}
