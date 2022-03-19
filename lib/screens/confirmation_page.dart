import 'package:flutter/material.dart';
import 'package:ftm_service_app/screens/end_shift_page.dart';
import 'package:ftm_service_app/widgets/input_fields.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:page_transition/page_transition.dart';
import '../translations.dart';
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
          backgroundColor: kWhite,
          title: Text(
            Translations.of(context).text("confirmation_sms"),
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
                      Text(
                          Translations.of(context)
                              .text("confirmation_sms_message1"),
                          style: kHeader7),
                      Text(
                          Translations.of(context)
                              .text("confirmation_sms_message2"),
                          style: taglineText2),
                      ftmConfirmCodeInput(Translations.of(context)
                          .text("confirmation_sms_message3")),
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
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: EndShiftPage(
                                  operator: 'Dispenser Page',
                                  lastDispenserData1A: '10',
                                  lastDispenserData1B: '20',
                                  lastDispenserData2A: '30',
                                  lastDispenserData2B: '40',
                                  lastDispenserData3A: '50',
                                  lastDispenserData3B: '60',
                                ),
                              ),
                            );
                          },
                          child:
                              Text(Translations.of(context).text("send_code")),
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
        ));
  }
}
