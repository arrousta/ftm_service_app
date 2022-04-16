import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ftm_service_app/main.dart';
import 'package:ftm_service_app/screens/home/home_page.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/screens/payment_page.dart';
import 'package:ftm_service_app/services/network_adapter.dart';
import 'package:ftm_service_app/services/translations.dart';
import 'package:ftm_service_app/structures/data_structures.dart';
import 'package:page_transition/page_transition.dart';
import 'components/edit_nozzle_widget.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    Key? key,
  }) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String userName = "";
  String shiftName = "";

  String result = '0';

  late String _startDispenser1A,
      _startDispenser1B,
      _startDispenser2A,
      _startDispenser2B,
      _startDispenser3A,
      _startDispenser3B;

  void _setStartShiftData() {
    _startDispenser1A = MyApp.data.nozzle1start;
    _startDispenser1B = MyApp.data.nozzle2start;
    _startDispenser2A = MyApp.data.nozzle3start;
    _startDispenser2B = MyApp.data.nozzle4start;
    _startDispenser3A = MyApp.data.nozzle5start;
    _startDispenser3B = MyApp.data.nozzle6start;
  }
//*************************************************************************************

  late Future<dynamic>? dataResponse;
  Future<String> getResponse(
      {String auth = '', required DataStructures data}) async {
    dataResponse = contradiction(auth: auth, data: data);
    String response = "stop";
    await dataResponse!.then((value) {
      print(value);
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
    _setStartShiftData();
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //-----------------------------------------------***Dispensers***-----------------------------------
                Container(
                  padding: const EdgeInsets.all(3.0),
                  margin: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: kDarkBackgroundColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //-----------------------------------------Dispenser1------------------------------------------
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
                            getTranslated(context, "dispenser") + " 1",
                            style:
                                const TextStyle(color: kLightBackgroundColor),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //-----------------------------------------1A------------------------------------------
                          EditNozzleWidget(
                              id: 1,
                              title: 'A',
                              lastShift:
                                  _startDispenser1A), //-----------------------------------------1B------------------------------------------
                          EditNozzleWidget(
                              id: 2, title: 'B', lastShift: _startDispenser1B),
                        ],
                      ),
                      //-----------------------------------------Dispenser2------------------------------------------
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
                            getTranslated(context, "dispenser") + " 2",
                            style:
                                const TextStyle(color: kLightBackgroundColor),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //-----------------------------------------2A------------------------------------------
                          EditNozzleWidget(
                              id: 3, title: 'A', lastShift: _startDispenser2A),
                          //-----------------------------------------2B------------------------------------------
                          EditNozzleWidget(
                              id: 4, title: 'B', lastShift: _startDispenser2B),
                        ],
                      ),
                      //-----------------------------------------Dispenser3------------------------------------------
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
                            getTranslated(context, "dispenser") + " 3",
                            style:
                                const TextStyle(color: kLightBackgroundColor),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //-----------------------------------------3A------------------------------------------
                          EditNozzleWidget(
                              id: 5, title: 'A', lastShift: _startDispenser3A),
                          //-----------------------------------------3B------------------------------------------
                          EditNozzleWidget(
                              id: 6, title: 'B', lastShift: _startDispenser3B),
                        ],
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.arrow_back_ios_sharp),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "تایید و اعلام مغایرت",
                                style: const TextStyle(fontFamily: 'Yekan'),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: kRedColor,
                            padding: const EdgeInsets.all(8),
                          ),
                          onPressed: () {
                            // showAlert(context, onPress: () {
                            //   Navigator.pop(context);
                            //   showProgressAlertDialog(context);
                            //   DataStructures contData = DataStructures();

                            if (editShiftList[1] == 0 ||
                                editShiftList[2] == 0 ||
                                editShiftList[3] == 0 ||
                                editShiftList[4] == 0 ||
                                editShiftList[5] == 0 ||
                                editShiftList[6] == 0) {
                              showSnackBar(
                                context,
                                getTranslated(
                                    context, "dispenser_data_warning1"),
                              );
                            } else {
                              showAlert(context, onPress: () {
                                Navigator.pop(context);
                                showProgressAlertDialog(context);
                                DataStructures contData = DataStructures();

                                contData.nozzle1 = '${editShiftList[1]}';
                                contData.nozzle2 = '${editShiftList[2]}';
                                contData.nozzle3 = '${editShiftList[3]}';
                                contData.nozzle4 = '${editShiftList[4]}';
                                contData.nozzle5 = '${editShiftList[5]}';
                                contData.nozzle6 = '${editShiftList[6]}';

                                getResponse(
                                  auth: MyApp.data.token,
                                  data: contData,
                                ).then(
                                  (value) {
                                    if (value == 'ok') {
                                      MyApp.data.shiftStatus = 'shift_start';
                                      MyApp.data.nozzle1start =
                                          contData.nozzle1;
                                      MyApp.data.nozzle2start =
                                          contData.nozzle2;
                                      MyApp.data.nozzle3start =
                                          contData.nozzle3;
                                      MyApp.data.nozzle4start =
                                          contData.nozzle4;
                                      MyApp.data.nozzle5start =
                                          contData.nozzle5;
                                      MyApp.data.nozzle6start =
                                          contData.nozzle6;
                                      Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: HomePage(),
                                        ),
                                      );
                                    } else if (value == 'er-pass') {
                                      Navigator.pop(context);

                                      showSnackBar(
                                        context,
                                        getTranslated(
                                            context, 'snackBar_Login_Error'),
                                      );
                                    } else if (value == 'er-internet') {
                                      Navigator.pop(context);
                                      showSnackBar(context,
                                          "اتصال اینترنت را بررسی کنید");
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
                            }
                          }),
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
                          type: PageTransitionType.rightToLeft));
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

class ImageCardWidget extends StatelessWidget {
  const ImageCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: kPrimaryColor, width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(6),
          child: Row(
            children: [
              const Icon(Icons.camera_alt, size: 16, color: kPrimaryColor),
              const SizedBox(
                width: 6,
              ),
              Text(getTranslated(context, 'upload_image'),
                  style: const TextStyle(fontSize: 12, color: kPrimaryColor)),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String userName) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      getTranslated(context, 'cancel'),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text(
      getTranslated(context, 'confirm_breakdown_dispenser'),
    ),
    onPressed: () {
      Navigator.pushReplacement(context,
          PageTransition(child: HomePage(), type: PageTransitionType.fade));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text(userName),
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
