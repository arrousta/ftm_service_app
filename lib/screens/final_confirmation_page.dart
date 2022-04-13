import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/main.dart';
import 'package:ftm_service_app/screens/home/home_page.dart';
import 'package:ftm_service_app/services/network_adapter.dart';
import 'package:ftm_service_app/services/shared_preference.dart';
import 'package:ftm_service_app/structures/data_structures.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import '../services/translations.dart';
import 'home/components/body.dart';

class FinalConfirm extends StatefulWidget {
  const FinalConfirm({Key? key}) : super(key: key);

  @override
  State<FinalConfirm> createState() => _FinalConfirmState();
}

class _FinalConfirmState extends State<FinalConfirm> {
  var persianInUSFormat = NumberFormat.currency(locale: 'fa', symbol: '');

  final DataStructures data = DataStructures();

  Future<dynamic>? futureShiftData;

  Future<String> sendShiftData() async {
    SharedPreference sharedPreference = SharedPreference();
    String auth = await sharedPreference.read('token');

    data.nozzle1 = MyApp.data.nozzle1;
    data.nozzle2 = MyApp.data.nozzle2;
    data.nozzle3 = MyApp.data.nozzle3;
    data.nozzle4 = MyApp.data.nozzle4;
    data.nozzle5 = MyApp.data.nozzle5;
    data.nozzle6 = MyApp.data.nozzle6;
    data.result1 = MyApp.data.result1;
    data.result2 = MyApp.data.result2;
    data.result3 = MyApp.data.result3;
    data.result4 = MyApp.data.result4;
    data.result5 = MyApp.data.result5;
    data.result6 = MyApp.data.result6;
    data.handCash = MyApp.data.handCash;
    data.cardCash = MyApp.data.cardCash;
    data.totalShiftCash = MyApp.data.totalShiftCash;
    data.totalShiftResult = MyApp.data.totalShiftResult;

    futureShiftData = sendData(auth: auth, shiftData: data);
    String response = "stop";
    await futureShiftData!.then((value) {

      if (value["shift"] == 'ended') {
        response = "ok";
      }
    }, onError: (e) {
      if (e.toString().startsWith('NoSuchMethodError')) {
        print(e.toString());
        response = "er-pass";
      } else if (e.toString().startsWith('SocketException')) {
        response = "er-internet";
      } else {
        print("**" + e.toString());
        showSnackBar(context, e.toString());
        response = "onError";
      }
    }).catchError((e){
      print("*/*" + e.toString());
      showSnackBar(context, e.toString());
      response = "onError";
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(10.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 12.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        getTranslated(context, 'attention'),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        getTranslated(context, 'final_confirm_mess'),
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
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getTranslated(context, 'dispenser') + " 1",
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'A',
                                  style: kHeader7,
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: MyApp.data.nozzle1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'B',
                                  style: kHeader7,
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: MyApp.data.nozzle2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      decoration: dispenserPlateDecoration,
                    ),
                    //-----------------------------------------------------------------------------------------
                    Text(
                      getTranslated(context, 'dispenser') + " 2",
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'A',
                                  style: kHeader7,
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: MyApp.data.nozzle3,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'B',
                                  style: kHeader7,
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: MyApp.data.nozzle4,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      decoration: dispenserPlateDecoration,
                    ),
                    //--------------------------------------------------------------------------------------------------------
                    Text(
                      getTranslated(context, 'dispenser') + " 3",
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'A',
                                  style: kHeader7,
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: MyApp.data.nozzle5,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'B',
                                  style: kHeader7,
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: MyApp.data.nozzle6,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      decoration: dispenserPlateDecoration,
                    ),
                    //-------------------------------------------------------------------------------------
                    const SizedBox(
                      height: 10.0,
                      width: 330,
                      child: Divider(
                        color: kPrimaryColor,
                        thickness: 1,
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex:2,
                              child: Text(
                                getTranslated(
                                    context, 'payment_function_mess'),
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: SizedBox(
                                width: kBoxSizeWith,
                                height: kBoxSizeHeight,
                                child: CardWidget(
                                  value: MyApp.data.totalShiftResult,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: dispenserPlateDecoration,
                    ),
                    const SizedBox(
                      height: 10.0,
                      width: 330,
                      child: Divider(
                        color: kPrimaryColor,
                        thickness: 1,
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  getTranslated(context, 'cash'),
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: persianInUSFormat
                                        .format(int.parse(MyApp.data.handCash)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      decoration: dispenserPlateDecoration,
                    ),

                    const SizedBox(
                      height: 8.0,
                    ),

                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  getTranslated(context, 'card_reader'),
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: persianInUSFormat
                                        .format(int.parse(MyApp.data.cardCash)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      decoration: dispenserPlateDecoration,
                    ),

                    const SizedBox(
                      height: 8.0,
                    ),

                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  getTranslated(context, 'payment_cost_mess'),
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: persianInUSFormat.format(
                                        int.parse(MyApp.data.totalShiftCash)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      decoration: dispenserPlateDecoration,
                    ),

                    const SizedBox(
                      height: 8.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showProgressAlertDialog(context);
                        sendShiftData().then(
                          (value) {
                            if (value == 'ok') {
                              Navigator.pop(context);
                              MyApp.data.shiftStatus = 'shift_end';
                              showAlertDialog(context, "Hello");
                            } else if (value == 'er-pass') {
                              Navigator.pop(context);

                              showSnackBar(
                                context,
                                getTranslated(context, 'snackBar_Login_Error'),
                              );
                            } else if (value == 'er-internet') {
                              Navigator.pop(context);

                              showSnackBar(
                                  context, "اتصال اینترنت را بررسی کنید");
                            } else if (value == 'onError') {
                              Navigator.pop(context);

                              showSnackBar(context, "خطای نامشخص!");
                            }
                          },
                        ).catchError((e) {
                          showSnackBar(context, e.toString());
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            getTranslated(context, 'finish'),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
            locale: Locale('en'),
            fontWeight: FontWeight.bold,
            fontSize: 17,
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
      getTranslated(context, 'exit_app'),
    ),
    onPressed: () {
      SystemNavigator.pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text(
      getTranslated(context, 'login_main_page'),
    ),
    onPressed: () {
      // Navigator.pushReplacement(context,
      //     PageTransition(child: HomePage(), type: PageTransitionType.fade));
      Navigator.pushAndRemoveUntil(context, PageTransition(child: HomePage(), type: PageTransitionType.leftToRight), (route) => false);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: SizedBox(
      height: 100,
      width: 100,
      child: Center(
        child: Text(
          getTranslated(context, 'god_bless_you'),
          style: const TextStyle(
            fontSize: 26,
          ),
        ),
      ),
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
