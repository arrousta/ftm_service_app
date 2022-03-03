import 'package:flutter/material.dart';
import 'package:ftm_service_app/screens/dispenser_page.dart';
import 'package:ftm_service_app/shared/colors.dart';
import 'package:ftm_service_app/shared/inputFields.dart';
import 'package:ftm_service_app/shared/styles.dart';
import 'package:page_transition/page_transition.dart';
import 'sing_in_page.dart';

class ConfirmationPage extends StatefulWidget {
  final String pageTitle;

  const ConfirmationPage({Key? key, required this.pageTitle}) : super(key: key);

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: const Text('Confirmation SMS',
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/signin');
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SignInPage(
                          pageTitle: 'SignInPage',
                        )));
              },
              child: const Text('Sign In', style: contrastText),
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
                      const Text('Please wait to receive text message from Us',
                          style: h7),
                      const Text('Enter Received Code here :',
                          style: taglineText2),
                      ftmConfirmCodeInput('Enter Received Code'),
                    ],
                  ),
                  Positioned(
                    bottom: 15,
                    right: 8,
                    //TODO : Confirm SMS : after user press Enter button Send Data To Server And Do Confirmation :
                    child: ElevatedButton(
                      onPressed: () {
                        print(confirmCodeController
                            .text); // Print name current value
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const DispenserPage(
                              title: 'Dispenser Page',
                            ),
                          ),
                        );
                      },
                      child: const Text("Send Code"),
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        padding: const EdgeInsets.all(15),
                      ),
                    ),
                  )
                ],
              ),
              height: 220,
              width: double.infinity,
              decoration: authPlateDecoration,
            ),
          ],
        ));
  }
}
