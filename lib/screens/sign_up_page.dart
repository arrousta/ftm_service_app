import 'package:flutter/material.dart';
import 'package:ftm_service_app/widgets/input_fields.dart';
import 'package:ftm_service_app/constractor.dart';
import 'package:page_transition/page_transition.dart';
import 'sing_in_page.dart';
import 'confirmation_page.dart';


class SignUpPage extends StatefulWidget {
  final String pageTitle;

  const SignUpPage({Key? key, required this.pageTitle}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhite,
        title: const Text('Sign Up',
            style: TextStyle(
                color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/signin');
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: SignInPage(pageTitle: 'SignInPage',)));

            },
            child: const Text('Sign In', style: kTextContrast),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Welcome to FTM.CO!', style: kHeader3),
                const Text('Let\'s get started', style: taglineText),
                ftmFullNameTextInput('Full Name'),
                ftmPersonalCodeInput('Personnel Code'),
                ftmNationalCodeInput('National Code'),
                ftmPhoneNumInput('Phone Number'),
                ftmPasswordInput('Password')
              ],
            ),
            Positioned(
              bottom: 15,
              right: 8,
              //TODO : SignUpPage : after user press Enter button Send Data To Server And Save on DataBase :
              child: ElevatedButton(
                onPressed: () {

                  print(nameController.text); // Print name current value
                  print(personnelCodeController.text); // Print personnel Code current value
                  print(nationalCodeController.text); // Print national Code current value
                  print(phoneNumCodeController.text); // Print phone Num current value
                  print(passwordController.text); // Print password current value

                  Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: const ConfirmationPage(pageTitle: 'ConfirmationPage',)));
                },
                child: const Text("Enter"),
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  padding: const EdgeInsets.all(15),
                ),
              ),
            )
          ],
        ),
        height: 450,
        width: double.infinity,
        decoration: authPlateDecoration,
      ),
        ],
      )
    );
  }
}
