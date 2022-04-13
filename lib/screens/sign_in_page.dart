import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ftm_service_app/main.dart';
import 'package:ftm_service_app/screens/home/home_page.dart';
import 'package:ftm_service_app/services/network_adapter.dart';
import 'package:ftm_service_app/services/shared_preference.dart';
import 'package:ftm_service_app/structures/data_structures.dart';
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

  late Future<DataStructures>? dataResponse;

  Future<String> getResponse(
      {String auth = '', String username = '', String password = ''}) async {
    dataResponse = connect(auth: auth, userName: username, password: password);
    String response = "stop";
    await dataResponse!.then((value) {
      MyApp.data = value;
      response = "ok";
    }, onError: (e) {
      if (e.toString().startsWith('NoSuchMethodError')) {
        print(e.toString());

        response = "er-pass";
      } else if (e.toString().startsWith('SocketException')) {
        response = "er-internet";
      } else {
        print("**" + e.toString());
        response = "onError";
      }
    });

    return response;
  }

  String userName = "";
  String password = "";

  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
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
                      height: 26,
                    ),
                    const Hero(
                      tag: "ftm-logo",
                      child: Image(
                        image: AssetImage("assets/images/ftm-logo.png"),
                        width: 250,
                      ),
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    Text(getTranslated(context, 'lets_get_start'),
                        style: taglineText),
                    ftmPersonalCodeInput(
                      getTranslated(context, 'personnel_code'),
                    ),
                    ftmPasswordInput(
                      getTranslated(context, 'password'),
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     //ToDo : Forgot Password onPressed Here ...
                    //   },
                    //   child: Text(
                    //       Translations.of(context).text('forgot_password'),
                    //       style: kTextBoldContrast),
                    // ),
                    const SizedBox(height: 26),
                    (!flag)
                        ? SignInButton()
                        : const SpinKitThreeBounce(
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
        setState(
          () {
            userName = personnelCodeController.text;
            password = passwordController.text;

            if (userName == '' || password == '') {
              flag = false;
              setState(() {});
              showSnackBar(context, 'لطفا فیلد ها را به درستی وارد کنید');
            } else {
              // futureGet(userName, password).then(
              //   (value) {
              //     // print(value);
              //     if (value == 'ok') {
              //       String name = "";
              //       String token = "";
              //       String role = "";
              //       String phone = "";
              //       String userId = "";
              //
              //       name += user.firstName ?? "name error";
              //       name += " ";
              //       name += user.lastName ?? "name error";
              //
              //       token = user.token ?? "**null token";
              //
              //       role = user.role ?? "null role";
              //       phone = user.phone ?? "null phone";
              //       userId = user.userId ?? "null userId";
              //
              //       if (user.firstName == null) {
              //         showSnackBar(
              //             context, 'Personnel Code or Password is incorrect');
              //       } else {
              //         sharedPreference.save("username", name);
              //         sharedPreference.save("token", token);
              //         sharedPreference.save("role", role);
              //         sharedPreference.save("phone", phone);
              //         sharedPreference.save("user_id", userId);
              //
              //         Navigator.pushReplacement(
              //           context,
              //           PageTransition(
              //             type: PageTransitionType.rightToLeft,
              //             child: HomePage(
              //               userName: name,
              //             ),
              //           ),
              //         );
              //       }
              //     } else if (value == 'er-pass') {
              //       flag = false;
              //       setState(() {});
              //       showSnackBar(
              //         context,
              //         getTranslated(context, 'snackBar_Login_Error'),
              //       );
              //     } else if (value == 'er-internet') {
              //       flag = false;
              //       setState(() {});
              //       showSnackBar(context, "اتصال اینترنت را بررسی کنید");
              //     } else if (value == 'onError') {
              //       flag = false;
              //       setState(() {});
              //       showSnackBar(context, "خطای نامشخص!");
              //     }
              //   },
              // ).catchError(
              //   (e) {
              //     print(e);
              //     flag = false;
              //     setState(() {});
              //     showSnackBar(context, e);
              //   },
              // );
              getResponse(username: userName, password: password).then(
                (value) {

                  if (value == 'ok') {
                    String name = "";
                    String token = "";

                    name += MyApp.data.firstName ?? "name error";
                    name += " ";
                    name += MyApp.data.lastName ?? "name error";

                    token = MyApp.data.token ?? "**null token";

                    if (MyApp.data.firstName == null) {
                      showSnackBar(
                          context, 'Personnel Code or Password is incorrect');
                    } else {
                      sharedPreference.save("username", name);
                      sharedPreference.save("token", token);

                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: HomePage(
                          ),
                        ),
                      );
                    }
                  } else if (value == 'er-pass') {
                    flag = false;
                    setState(() {});
                    showSnackBar(
                      context,
                      getTranslated(context, 'snackBar_Login_Error'),
                    );
                  } else if (value == 'er-internet') {
                    flag = false;
                    setState(() {});
                    showSnackBar(context, "اتصال اینترنت را بررسی کنید");
                  } else if (value == 'onError') {
                    flag = false;
                    setState(() {});
                    showSnackBar(context, "خطای نامشخص!");
                  }
                },
              ).catchError(
                (e) {
                  print(e);
                  flag = false;
                  setState(() {});
                  showSnackBar(context, e.toString());
                },
              );
            }
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            getTranslated(context, 'enter'),
          ),
        ],
      ),
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

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(fontFamily: 'Yekan'),
      ),
      backgroundColor: kErrorColor,
      // duration: const Duration(seconds: 6),
      // action: SnackBarAction(
      // label: "Refresh",
      // textColor: kTextDarkColor,
      // onPressed: () {
      //   setState(() {
      //     flag = false;
      //   });
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
      // },
      // ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
