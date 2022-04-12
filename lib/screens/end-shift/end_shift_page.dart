import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ftm_service_app/main.dart';
import 'package:ftm_service_app/screens/home/home_page.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/screens/payment_page.dart';
import 'package:ftm_service_app/services/translations.dart';
import 'package:page_transition/page_transition.dart';
import 'components/nozzle_widget.dart';

class EndShiftPage extends StatefulWidget {
  const EndShiftPage({
    Key? key,
  }) : super(key: key);


  @override
  _EndShiftPageState createState() => _EndShiftPageState();
}

class _EndShiftPageState extends State<EndShiftPage> {
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
                          NozzleWidget(
                              id: 1,
                              title: 'A',
                              startShift:
                                  _startDispenser1A), //-----------------------------------------1B------------------------------------------
                          NozzleWidget(
                              id: 2, title: 'B', startShift: _startDispenser1B),
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
                          NozzleWidget(
                              id: 3, title: 'A', startShift: _startDispenser2A),
                          //-----------------------------------------2B------------------------------------------
                          NozzleWidget(
                              id: 4, title: 'B', startShift: _startDispenser2B),
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
                          NozzleWidget(
                              id: 5, title: 'A', startShift: _startDispenser3A),
                          //-----------------------------------------3B------------------------------------------
                          NozzleWidget(
                              id: 6, title: 'B', startShift: _startDispenser3B),
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
                              getTranslated(context, "confirm_and_continue"),
                              style: const TextStyle(fontFamily: 'Yekan'),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          padding: const EdgeInsets.all(8),
                        ),
                        onPressed: () {
                          int _total = 0;
                          for (int i = 0; i < endSiftFunctionList.length; i++) {
                            _total += endSiftFunctionList[i];
                          }
                          if (_total > 0) {
                            if (endSiftList[1] == 0 ||
                                endSiftList[2] == 0 ||
                                endSiftList[3] == 0 ||
                                endSiftList[4] == 0 ||
                                endSiftList[5] == 0 ||
                                endSiftList[6] == 0) {
                              showSnackBar(
                                context,
                                getTranslated(
                                    context, "dispenser_data_warning1"),
                              );
                            } else if (endSiftList[1] <
                                    int.parse(_startDispenser1A) ||
                                endSiftList[2] < int.parse(_startDispenser1B) ||
                                endSiftList[3] < int.parse(_startDispenser2A) ||
                                endSiftList[4] < int.parse(_startDispenser2B) ||
                                endSiftList[5] < int.parse(_startDispenser3A) ||
                                endSiftList[6] < int.parse(_startDispenser3B)) {
                              showSnackBar(
                                  context,
                                  getTranslated(
                                      context, "dispenser_data_warning2"));
                            } else {
                              MyApp.data.nozzle1 = '${endSiftList[1]}';
                              MyApp.data.nozzle2 = '${endSiftList[2]}';
                              MyApp.data.nozzle3 = '${endSiftList[3]}';
                              MyApp.data.nozzle4 = '${endSiftList[4]}';
                              MyApp.data.nozzle5 = '${endSiftList[5]}';
                              MyApp.data.nozzle6 = '${endSiftList[6]}';
                              MyApp.data.result1 = '${endSiftFunctionList[1]}';
                              MyApp.data.result2 = '${endSiftFunctionList[2]}';
                              MyApp.data.result3 = '${endSiftFunctionList[3]}';
                              MyApp.data.result4 = '${endSiftFunctionList[4]}';
                              MyApp.data.result5 = '${endSiftFunctionList[5]}';
                              MyApp.data.result6 = '${endSiftFunctionList[6]}';
                              MyApp.data.totalShiftResult = _total.toString();

                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const Payment(),
                                ),
                              );
                            }
                          } else if (_total == 0) {
                            showAlertDialog(
                              context,
                              getTranslated(context, "breakdown_dispenser"),
                            );
                          } else {
                            print("Error in total dispenser");
                          }
                        },
                      ),
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
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: HomePage(), type: PageTransitionType.fade));
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
