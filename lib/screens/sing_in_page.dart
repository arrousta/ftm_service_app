import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ftm_service_app/screens/dispenser_page.dart';
import 'package:ftm_service_app/services/network_adapter.dart';
import 'package:ftm_service_app/structures/user.dart';
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
  User user = User();
  Future<User>? futureInputUser;
  String userName = "";
  String password = "";

  Future<bool> futureGet(String _user, String _pass) async {
    futureInputUser = signInUser(
        url: 'https://test.helyasi.ir/login',
        userName: _user,
        password: _pass);
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
                child: const Text('Sign Up', style: kTextContrast),
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
                        const Text('Welcome Back!', style: kHeader3),
                        const Text('Hi, let\'s authenticate',
                            style: taglineText),
                        ftmPersonalCodeInput('Personnel Code'),
                        ftmPasswordInput('Password'),
                        TextButton(
                          onPressed: () {
                            //ToDo : Forgot Password onPressed Here ...
                          },
                          child: const Text('Forgot Password?',
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
                                name+= " ";
                                name += user.family ?? "name error";

                                if (user.name == null) {
                                  showSnackBar(context,
                                      'Personnel Code or Password is incorrect');
                                  print(user.name);

                                } else {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: DispenserPage(
                                        operator: name,
                                      ),
                                    ),
                                  );
                                }

                              }
                              ).catchError((_){
                                print("error");
                              }
                              );

                            });
                          },
                          child: const Text("Enter"),
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
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
            content: const Text('Do you want to exit?'),

            actions: <Widget>[
              TextButton(
                child: const Text("No"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text("Yes"),
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
