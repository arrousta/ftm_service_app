import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/main.dart';
import 'package:ftm_service_app/screens/home/home_page.dart';
import 'package:ftm_service_app/services/network_adapter.dart';
import 'package:page_transition/page_transition.dart';
import '../services/translations.dart';
import 'edit/edit_page.dart';

class StartShiftPage extends StatefulWidget {
  const StartShiftPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StartShiftPage> createState() => _StartShiftPageState();
}

class _StartShiftPageState extends State<StartShiftPage> {
  late Future<dynamic>? dataResponse;
  Future<String> getResponse({String auth = ''}) async {
    dataResponse = start(auth: auth);
    String response = "stop";
    await dataResponse!.then((value) {
      response = "ok";
    }, onError: (e) {
      if (e.toString().startsWith('NoSuchMethodError')) {
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: const Color(0xffc7c7c7),
        //   elevation: 0.0,
        //   title: Text(Translations.of(context).text("start_shift")),
        //   titleTextStyle: const TextStyle(
        //     color: Colors.black,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 21.0,
        //   ),
        //   centerTitle: true,
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 12.0),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          getTranslated(context, 'attention'),
                          style: kAttention,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          getTranslated(context, 'start_shift_mess'),
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(height: 1.4, letterSpacing: 1.0),
                        ),
                      ],
                    ),
                  ),
                ),
                //-------------------------------------------------------------------------------------------
                Container(
                  padding: const EdgeInsets.all(3.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffdbdbde),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: kPrimaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 16),
                          child: Text(
                            getTranslated(context, 'dispenser') + " 1",
                            style:
                                const TextStyle(color: kLightBackgroundColor),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(6.0),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'A',
                                        style: kHeader7,
                                      ),
                                      SizedBox(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value: MyApp.data.nozzle1start,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'B',
                                        style: kHeader7,
                                      ),
                                      SizedBox(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value: MyApp.data.nozzle2start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        decoration: dispenserPlateDecoration,
                      ),
                      //-----------------------------------------------------------------------------------------
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: kPrimaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 16),
                          child: Text(
                            getTranslated(context, 'dispenser') + " 2",
                            style:
                                const TextStyle(color: kLightBackgroundColor),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(6.0),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'A',
                                        style: kHeader7,
                                      ),
                                      SizedBox(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value: MyApp.data.nozzle3start,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'B',
                                        style: kHeader7,
                                      ),
                                      SizedBox(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value: MyApp.data.nozzle4start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        decoration: dispenserPlateDecoration,
                      ),
                      //--------------------------------------------------------------------------------------------------------
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: kPrimaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 16),
                          child: Text(
                            getTranslated(context, 'dispenser') + " 3",
                            style:
                                const TextStyle(color: kLightBackgroundColor),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: dispenserPlateDecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'A',
                                        style: kHeader7,
                                      ),
                                      SizedBox(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value: MyApp.data.nozzle5start,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'B',
                                        style: kHeader7,
                                      ),
                                      SizedBox(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value: MyApp.data.nozzle6start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      //-------------------------------------------------------------------------------------
                      const SizedBox(
                        height: 8.0,
                      ),
                      /////////////////////--EDIT Button--/////////////////////////////
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kRedColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 40.0),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const EditPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                getTranslated(context, 'contradiction_data'),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Yekan',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      /////////////////////--START Button--/////////////////////////////
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kGreenColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 40.0),
                          ),
                          onPressed: () {
                            showAlert(context,onPress: (){
                              Navigator.pop(context);
                              showProgressAlertDialog(context);
                              getResponse(auth: MyApp.data.token).then((value) {
                                if (value == 'ok') {
                                  MyApp.data.shiftStatus = 'shift_start';
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: HomePage(
                                        ),
                                      ),
                                    );
                                } else if (value == 'er-pass') {
                                  Navigator.pop(context);
                                  showSnackBar(
                                    context,
                                    getTranslated(context, 'snackBar_Login_Error'),
                                  );
                                } else if (value == 'er-internet') {
                                  Navigator.pop(context);
                                  showSnackBar(context, "اتصال اینترنت را بررسی کنید");
                                } else if (value == 'onError') {
                                  Navigator.pop(context);
                                  showSnackBar(context, "خطای نامشخص!");
                                }
                              },
                              ).catchError(
                                    (e) {
                                      Navigator.pop(context);
                                  showSnackBar(context, e.toString());
                                },
                              );
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                getTranslated(context, 'start_shift'),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlert(BuildContext context, {required Function() onPress}) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        getTranslated(context, 'no'),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        getTranslated(context, 'yes'),
      ),
      onPressed: onPress,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        getTranslated(context, 'warning'),
        style: const TextStyle(
          color: kErrorColor,
        ),
      ),
      content: Text(
        getTranslated(context, 'start_shift_mess_warning'),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
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
              getTranslated(context, 'close_page_mess'),
            ),

            actions: <Widget>[
              TextButton(
                child: Text(
                  getTranslated(context, 'yes'),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: HomePage(),
                        type: PageTransitionType.rightToLeft),
                  );
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

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: kPrimaryColor, width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 2.0),
        width: 100.0,
        height: 34.0,
        child: Text(
          value,
          style: const TextStyle(
            fontFamily: 'Yekan',
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}

showProgressAlertDialog(BuildContext context) {
  // set up the buttons

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: SizedBox(
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SpinKitCircle(
            size: 50.0,
            color: Colors.indigo,
          ),
          Text(
            'لطفا منتظر بمانید',
          )
        ],
      ),
    ),
    actions: [],
  );
  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}