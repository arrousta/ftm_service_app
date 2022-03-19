import 'package:flutter/material.dart';
import 'package:ftm_service_app/widgets/input_fields.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:page_transition/page_transition.dart';
import '../translations.dart';
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
          title: Text(
            Translations.of(context).text("sing_up"),
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/sign_in');
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const SignInPage(),
                  ),
                );
              },
              child: Text(Translations.of(context).text("sing_in"),
                  style: kTextContrast),
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
                      Text(Translations.of(context).text("welcome_ftm"),
                          style: kHeader3),
                      Text(Translations.of(context).text("lets_get_start"),
                          style: taglineText),
                      ftmFullNameTextInput(
                          Translations.of(context).text("full_name")),
                      ftmPersonalCodeInput(
                          Translations.of(context).text("personnel_code")),
                      ftmNationalCodeInput(
                          Translations.of(context).text("national_code")),
                      ftmPhoneNumInput(
                          Translations.of(context).text("phone_number")),
                      ftmPasswordInput(
                          Translations.of(context).text("password")),
                      // ],
                      //),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Positioned(
                        bottom: 15,
                        right: 8,
                        //TODO : SignUpPage : after user press Enter button Send Data To Server And Save on DataBase :
                        child: ElevatedButton(
                          onPressed: () {
                            print(nameController
                                .text); // Print name current value
                            print(personnelCodeController
                                .text); // Print personnel Code current value
                            print(nationalCodeController
                                .text); // Print national Code current value
                            print(phoneNumCodeController
                                .text); // Print phone Num current value
                            print(passwordController
                                .text); // Print password current value

                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: const ConfirmationPage(
                                      pageTitle: 'ConfirmationPage',
                                    )));
                          },
                          child: Text(Translations.of(context).text("enter")),
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            padding: const EdgeInsets.all(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              height: 500,
              width: double.infinity,
              decoration: authPlateDecoration,
            ),
          ],
        ));
  }
}
