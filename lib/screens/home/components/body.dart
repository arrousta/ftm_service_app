import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/main.dart';
import 'package:ftm_service_app/screens/end-shift/end_shift_page.dart';
import 'package:ftm_service_app/screens/home/components/home_header.dart';
import 'package:ftm_service_app/screens/start_shift_page.dart';
import 'package:ftm_service_app/services/shared_preference.dart';
import 'package:ftm_service_app/services/translations.dart';
import 'package:ftm_service_app/screens/home/components/icon_content.dart';

import 'package:page_transition/page_transition.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  SharedPreference sharedPreference = SharedPreference();
  String userName = "";

  @override
  void initState() {
    userName = MyApp.data.firstName;
    userName += ' ';
    userName += MyApp.data.lastName;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //-------------------------------------------------------------------------------------------
              const HomeHeader(),
              const SizedBox(
                height: 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconContent(
                    color: kGreenColor,
                    iconAddress: "assets/icon/fuel-start.png",
                    label: getTranslated(context, "start_shift"),
                    onPress: () {
                      if (MyApp.data.shiftStatus == 'shift_ready') {
                        setState(
                          () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const StartShiftPage()),
                            );
                          },
                        );
                      } else if (MyApp.data.shiftStatus == 'shift_start') {
                        showSnackBar(context, 'شیفت شما شروع شده است');
                      } else if (MyApp.data.shiftStatus == 'shift_close') {
                        showSnackBar(
                            context, 'این شیفت برای شما تعریف نشده است');
                      } else if (MyApp.data.shiftStatus == 'shift_end') {
                        showSnackBar(context, 'شیفت شما به پایان رسیده است');
                      }
                    },
                  ),
                  IconContent(
                    color: kRedColor,
                    iconAddress: "assets/icon/fuel-end.png",
                    label: getTranslated(context, 'end_shift'),
                    onPress: () {
                      if (MyApp.data.shiftStatus == 'shift_start') {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: const EndShiftPage(),
                              type: PageTransitionType.rightToLeft),
                        );
                      } else if (MyApp.data.shiftStatus == 'shift_ready') {
                        showSnackBar(context, 'ابتدا شیفت خود را شروع کنید');
                      }  else if (MyApp.data.shiftStatus == 'shift_end') {
                        showSnackBar(context, 'شیفت شما به پایان رسیده است');
                      } else if (MyApp.data.shiftStatus == 'shift_close') {
                        showSnackBar(
                            context, 'این شیفت برای شما تعریف نشده است');
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
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
            content: Text(
              getTranslated(context, 'close_app_mess'),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  getTranslated(context, 'yes'),
                ),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
              TextButton(
                child: Text(
                  getTranslated(context, 'no'),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(
      text,
      style: const TextStyle(fontFamily: 'Yekan'),
    ),
    backgroundColor: kErrorColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
