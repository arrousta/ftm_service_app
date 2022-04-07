import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ftm_service_app/widgets/input_fields.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:page_transition/page_transition.dart';
import '../services/translations.dart';
import 'sign_in_page.dart';
import 'sms_confirmation_page.dart';

class SignUpPage extends StatefulWidget {
  final String pageTitle;

  const SignUpPage({Key? key, required this.pageTitle}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kLightBackgroundColor,
          title: Text(
            getTranslated(context, 'sign_up'),
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const SignInPage(),
                  ),
                );
              },
              child:
                  Text(getTranslated(context, 'sign_in'), style: kTextContrast),
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
                      Text(getTranslated(context, 'welcome_ftm'),
                          style: kHeader3),
                      Text(getTranslated(context, 'lets_get_start'),
                          style: taglineText),
                      ftmFullNameTextInput(
                        getTranslated(context, 'full_name'),
                      ),
                      ftmPersonalCodeInput(
                        getTranslated(context, 'personnel_code'),
                      ),
                      ftmNationalCodeInput(
                        getTranslated(context, 'national_code'),
                      ),
                      ftmPhoneNumInput(
                        getTranslated(context, 'phone_number'),
                      ),
                      ftmPasswordInput(
                        getTranslated(context, 'password'),
                      ),
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
                          child: Text(
                            getTranslated(context, 'enter'),
                          ),
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
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // title: const Text("Error"),
            content: Text(
              getTranslated(context, 'close_app_mess'),
            ),

            actions: <Widget>[
              TextButton(
                child: Text(
                  getTranslated(context, 'no'),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text(
                  getTranslated(context, 'yes'),
                ),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          );
        });
  }
}
