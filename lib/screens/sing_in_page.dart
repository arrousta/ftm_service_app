import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ftm_service_app/screens/home_page.dart';
import 'package:ftm_service_app/services/network_adapter.dart';
import 'package:ftm_service_app/services/shared_preference.dart';
import 'package:ftm_service_app/structures/user.dart';
import 'package:ftm_service_app/widgets/input_fields.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:page_transition/page_transition.dart';

import '../services/translations.dart';
import 'sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SharedPreference sharedPreference = SharedPreference();

  User user = User();
  Future<User>? futureInputUser;

  String userName = "";
  String password = "";

  Future<bool> futureGet(String _user, String _pass) async {
    futureInputUser = signInUser(userName: _user, password: _pass);

    await futureInputUser!.then((value) {
      if (value.id != null) {
        user.id = value.id;
        user.firstName = value.firstName;
        user.lastName = value.lastName;
        user.role = value.role;
        user.token = value.token;
        user.phone = value.phone;
        user.userId = value.userId;

        return true;
      }
    });

    return false;
  }

  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: kLightBackgroundColor,
            title: Text(
              Translations.of(context).text('sing_in'),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
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
                        ftmPersonalCodeInput(
                          Translations.of(context).text('personnel_code'),
                        ),
                        ftmPasswordInput(
                          Translations.of(context).text('password'),
                        ),
                        TextButton(
                          onPressed: () {
                            //ToDo : Forgot Password onPressed Here ...
                          },
                          child: Text(
                              Translations.of(context).text('forgot_password'),
                              style: kTextBoldContrast),
                        ),
                        (!flag)
                            ? SignInButton()
                            : SpinKitThreeBounce(
                                size: 30,
                                color: kPrimaryColor,
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

  ElevatedButton SignInButton() {
    return ElevatedButton(
      onPressed: () async {
        flag = true;
        setState(() {
          userName = personnelCodeController.text;
          password = passwordController.text;
          futureGet(userName, password).then((value) {
            String name = "";
            String token = "";
            String role = "";
            String phone = "";
            String userId = "";

            name += user.firstName ?? "name error";
            name += " ";
            name += user.lastName ?? "name error";

            token = user.token ?? "**null token";

            role = user.role ?? "null role";
            phone = user.phone ?? "null phone";
            userId = user.userId ?? "null userId";

            if (user.firstName == null) {
              showSnackBar(context, 'Personnel Code or Password is incorrect');
            } else {
              sharedPreference.save("username", name);
              sharedPreference.save("token", token);
              sharedPreference.save("role", role);
              sharedPreference.save("phone", phone);
              sharedPreference.save("user_id", userId);

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
            setState(() {
              flag = false;
              showSnackBar(context, 'Connecting Error');
            });

          });
        });
      },
      child: Text(Translations.of(context).text("enter")),
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        padding: const EdgeInsets.all(8),
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
              Translations.of(context).text("close_app_mess"),
            ),

            actions: <Widget>[
              TextButton(
                child: Text(
                  Translations.of(context).text("no"),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text(
                  Translations.of(context).text("yes"),
                ),
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
        textColor: kTextDarkColor,
        onPressed: () {
          setState(() {
            flag = false;
          });
          // Navigator.pushReplacement(
          //   context,
          //   PageTransition(
          //     type: PageTransitionType.leftToRightWithFade,
          //     duration: const Duration(seconds: 1),
          //     child: const SignUpPage(
          //       pageTitle: 'SignUpPage',
          //     ),
          //   ),
          // );
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
