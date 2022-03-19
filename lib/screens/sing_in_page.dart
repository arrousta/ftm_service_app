import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ftm_service_app/screens/home_page.dart';
import 'package:ftm_service_app/services/network_adapter.dart';
import 'package:ftm_service_app/structures/user.dart';
import 'package:ftm_service_app/widgets/input_fields.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../translations.dart';
import 'sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  User user = User();
  Future<User>? futureInputUser;
  String userName = "";
  String password = "";

  //*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
  void _handleSubmitted(user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", user);
    print("username saved");
  }
  //*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

  Future<bool> futureGet(String _user, String _pass) async {
    futureInputUser = signInUser(
        url: 'https://test.helyasi.ir/login', userName: _user, password: _pass);
    await futureInputUser!.then((value) {
      if (value.name != null) {
        user.name = value.name;
        user.family = value.family;
        user.id = value.id;
        return true;
      }
    });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kWhite,
            title: Text(
              Translations.of(context).text('sing_in'),
              style: const TextStyle(color: Colors.grey, fontSize: 15),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/sign_up');
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const SignUpPage(
                            pageTitle: 'SignUpPage',
                          )));
                },
                child: Text(
                  Translations.of(context).text('sing_up'),
                  style: const TextStyle(color: kPrimaryColor),
                ),
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
                        const SizedBox(
                          height: 56,
                        ),
                        Text(Translations.of(context).text('lets_get_start'),
                            style: taglineText),

                        // Text(Translations.of(context).text('lets_get_start'),
                        //     style: taglineText),
                        ftmPersonalCodeInput(
                          Translations.of(context).text('personnel_code'),
                        ),
                        ftmPasswordInput(
                          Translations.of(context).text('password'),
                        ),
                        TextButton(
                          onPressed: () {
                            //ToDo : Forgot Password onPressed Here ...
//**********************************************************************************************************
//                             Navigator.pushReplacement(
//                               context,
//                               PageTransition(
//                                 type: PageTransitionType.rightToLeft,
//                                 child: PanelPage(pageTitle: 'pannel',
//                                 ),
//                               ),
//                             );
//**********************************************************************************************************
                          },
                          child: Text(
                              Translations.of(context).text('forgot_password'),
                              style: kTextBoldContrast),
                        ),
                        ElevatedButton(
                          //TODO : SignInPage : after user press Enter button Send Data To Server And Check authentication :
                          onPressed: () async {
                            setState(() {
                              userName = personnelCodeController.text;
                              password = passwordController.text;
                              futureGet(userName, password).then((value) {
                                String name = "";
                                name += user.name ?? "name error";
                                name += " ";
                                name += user.family ?? "name error";

                                if (user.name == null) {
                                  showSnackBar(context,
                                      'Personnel Code or Password is incorrect');
                                } else {
                                  _handleSubmitted(name);
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: HomePage(
                                          operatorName: name,
                                        )),
                                  );
                                }
                              }).catchError((_) {
                                showSnackBar(context, 'Connecting Error');
                              });
                            });
                          },
                          child: Text(Translations.of(context).text("enter")),
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            padding: const EdgeInsets.all(8),
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
          )),
    );
  }

  Future<bool> _onBackPressed() async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // title: const Text("Error"),
            content: Text(Translations.of(context).text("close_app_mess"),),

            actions: <Widget>[
              TextButton(
                child: Text(Translations.of(context).text("no"),),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text(Translations.of(context).text("yes"),),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          );
        });
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: kPrimaryColor,
      action: SnackBarAction(
        label: "Sign Up",
        textColor: kTextDark,
        onPressed: () {
          Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.leftToRightWithFade,
                  duration: const Duration(seconds: 1),
                  child: const SignUpPage(
                    pageTitle: 'SignUpPage',
                  )));
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
