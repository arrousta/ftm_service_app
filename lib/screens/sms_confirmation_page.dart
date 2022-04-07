import 'package:flutter/material.dart';
import 'package:ftm_service_app/widgets/input_fields.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:page_transition/page_transition.dart';
import '../services/translations.dart';
import 'sign_in_page.dart';

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
        backgroundColor: kLightBackgroundColor,
        title: Text(
          getTranslated(context, "confirmation_sms"),
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
                Text(getTranslated(context, "sign_in"), style: kTextContrast),
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
                    Text(getTranslated(context, "confirmation_sms_message1"),
                        style: kHeader7),
                    Text(getTranslated(context, "confirmation_sms_message2"),
                        style: taglineText2),
                    ftmConfirmCodeInput(
                      getTranslated(context, "confirmation_sms_message3"),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Positioned(
                      bottom: 15,
                      right: 8,
                      //TODO : Confirm SMS : after user press Enter button Send Data To Server And Do Confirmation :
                      child: ElevatedButton(
                        onPressed: () {
                          print(confirmCodeController
                              .text); // Print name current value
                        },
                        child: Text(
                          getTranslated(context, "send_code"),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          padding: const EdgeInsets.all(8),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            height: 220,
            width: double.infinity,
            decoration: authPlateDecoration,
          ),
        ],
      ),
    );
  }
}
