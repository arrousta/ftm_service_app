import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ftm_service_app/widgets/input_fields.dart';
import 'package:ftm_service_app/constractor.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'payment_page.dart';

enum ShiftName { morning, evening, night }

class DispenserPage extends StatefulWidget {
  const DispenserPage({Key? key, required this.operator}) : super(key: key);
  final String operator;

  @override
  State<DispenserPage> createState() => _DispenserPageState();
}

//***************************************************************************************
//Todo : Delete this section if not use :

class _DispenserPageState extends State<DispenserPage> {
  String operatorName = "";
  String _timeString = "";
  String _dateString = "";
  String shiftName = "";

  late String _dispenser1A = "0.0",
      _dispenser1B = "0.0",
      _dispenser2A = "0.0",
      _dispenser2B = "0.0",
      _dispenser3A = "0.0",
      _dispenser3B = "0.0";

  int fractionDigits = 2;

  final dispenser1A = TextEditingController();
  final dispenser1B = TextEditingController();
  final dispenser2A = TextEditingController();
  final dispenser2B = TextEditingController();
  final dispenser3A = TextEditingController();
  final dispenser3B = TextEditingController();

  void _incrementCounter() {
    setState(() {
      double dis1 = double.parse(dispenser1A.text);
      double dis2 = double.parse(dispenser1B.text);
      double dis3 = double.parse(dispenser2A.text);
      double dis4 = double.parse(dispenser2B.text);
      double dis5 = double.parse(dispenser3A.text);
      double dis6 = double.parse(dispenser3B.text);

      double result = 1.0;
      _dispenser1A = (result * dis1 * 0.01).toStringAsFixed(fractionDigits);
      _dispenser1B = (result * dis2 * 0.01).toStringAsFixed(fractionDigits);
      _dispenser2A = (result * dis3 * 0.01).toStringAsFixed(fractionDigits);
      _dispenser2B = (result * dis4 * 0.01).toStringAsFixed(fractionDigits);
      _dispenser3A = (result * dis5 * 0.01).toStringAsFixed(fractionDigits);
      _dispenser3B = (result * dis6 * 0.01).toStringAsFixed(fractionDigits);
    });
  }
//*************************************************************************************

  String _formatDate(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy').format(dateTime);
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  @override
  initState() {
    operatorName = widget.operator;
    _dateString = _formatDate(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getDate());
    _timeString = _formatTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getDate() {
    final DateTime now = DateTime.now();
    final String formattedDate = _formatDate(now);
    // print(formattedDate);
    if (mounted) {
      setState(() {
        _dateString = formattedDate;
      });
    }
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = _formatTime(now);
    String hour = "";
    late String partOfDay;

    for (int i = 0; i < 2; i++) {
      hour += formattedTime[i];
    }
    int _hour = int.parse(hour);

    if (7 <= _hour && _hour < 14) {
      partOfDay = "First";
    } else if (14 <= _hour && _hour < 22) {
      partOfDay = "Second";
    } else {
      partOfDay = "Third";
    }
    if (mounted) {
      setState(() {
        _timeString = formattedTime;
        shiftName = partOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: kPrimaryColor, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Operator: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 1.0,
                        ),
                        Text(
                          widget.operator,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Column(
                          children: [
                            Text(_dateString),
                            Text(_timeString),
                          ],
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        const Text(
                          "Shift: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(shiftName),
                      ],
                    ),
                  ),
                ),
                //-----------------------------------------------***Dispensers***-----------------------------------
                Container(
                  padding: const EdgeInsets.all(3.0),
                  margin: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: kBackgroundColor3,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //-----------------------------------------Dispenser1------------------------------------------
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: kPrimaryColor,
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                          child: Text(
                            'Dispenser 1',
                            style: TextStyle(color: kBackgroundColor1),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //-----------------------------------------1A------------------------------------------
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    ' A: ',
                                    style: kHeader7,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "شروع شیفت:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value: '870853',
                                        ),
                                      ),
                                      Text(
                                        "پایان شیفت:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kFieldSizeWith,
                                        height: kFieldSizeHeight,
                                        child: ftmDispenser1AInput(
                                            'عدد را وارد کنید'),
                                      ),
                                      Text(
                                        "کارکرد:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value:
                                              '${dispenserA1Controller.text}',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      ImageCardWidget(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            decoration: dispenserPlateDecoration,
                          ),
                          //-----------------------------------------1B------------------------------------------
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    ' B: ',
                                    style: kHeader7,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "شروع شیفت:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value: '870853',
                                        ),
                                      ),
                                      Text(
                                        "پایان شیفت:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kFieldSizeWith,
                                        height: kFieldSizeHeight,
                                        child: ftmDispenser1BInput(
                                            'عدد را وارد کنید'),
                                      ),
                                      Text(
                                        "کارکرد:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value:
                                              '${dispenserB1Controller.text}',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      ImageCardWidget(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            decoration: dispenserPlateDecoration,
                          ),
                        ],
                      ),
                      //-----------------------------------------Dispenser2------------------------------------------
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: kPrimaryColor,
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                          child: Text(
                            'Dispenser 2',
                            style: TextStyle(color: kBackgroundColor1),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //-----------------------------------------2A------------------------------------------
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    ' A: ',
                                    style: kHeader7,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "شروع شیفت:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value: '870853',
                                        ),
                                      ),
                                      Text(
                                        "پایان شیفت:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kFieldSizeWith,
                                        height: kFieldSizeHeight,
                                        child: ftmDispenser2AInput(
                                            'عدد را وارد کنید'),
                                      ),
                                      Text(
                                        "کارکرد:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value:
                                              '${dispenserA2Controller.text}',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      ImageCardWidget(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            decoration: dispenserPlateDecoration,
                          ),
                          //-----------------------------------------2B------------------------------------------
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    ' B: ',
                                    style: kHeader7,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "شروع شیفت:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value: '870853',
                                        ),
                                      ),
                                      Text(
                                        "پایان شیفت:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kFieldSizeWith,
                                        height: kFieldSizeHeight,
                                        child: ftmDispenser2BInput(
                                            'عدد را وارد کنید'),
                                      ),
                                      Text(
                                        "کارکرد:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value:
                                              '${dispenserB2Controller.text}',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      ImageCardWidget(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            decoration: dispenserPlateDecoration,
                          ),
                        ],
                      ),
                      //-----------------------------------------Dispenser3------------------------------------------
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: kPrimaryColor,
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                          child: Text(
                            'Dispenser 3',
                            style: TextStyle(color: kBackgroundColor1),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //-----------------------------------------3A------------------------------------------
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    ' A: ',
                                    style: kHeader7,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "شروع شیفت:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value: '870853',
                                        ),
                                      ),
                                      Text(
                                        "پایان شیفت:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kFieldSizeWith,
                                        height: kFieldSizeHeight,
                                        child: ftmDispenser3AInput(
                                            'عدد را وارد کنید'),
                                      ),
                                      Text(
                                        "کارکرد:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value:
                                              '${dispenserA3Controller.text}',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      ImageCardWidget(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            decoration: dispenserPlateDecoration,
                          ),
                          //-----------------------------------------3B------------------------------------------
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    ' B: ',
                                    style: kHeader7,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "شروع شیفت:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value: '870853',
                                        ),
                                      ),
                                      Text(
                                        "پایان شیفت:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kFieldSizeWith,
                                        height: kFieldSizeHeight,
                                        child: ftmDispenser3BInput(
                                            'عدد را وارد کنید'),
                                      ),
                                      Text(
                                        "کارکرد:",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Container(
                                        width: kBoxSizeWith,
                                        height: kBoxSizeHeight,
                                        child: CardWidget(
                                          value:
                                              '${dispenserB3Controller.text}',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      ImageCardWidget(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            decoration: dispenserPlateDecoration,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),

                      const SizedBox(
                        height: 8.0,
                      ),
                      ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back_ios_sharp),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "تایید و ادامه",
                              style: TextStyle(fontFamily: 'Yekan'),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          padding: const EdgeInsets.all(8),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const Payment(
                                    title: 'Payment Page',
                                  )));
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
      child: Container(
        alignment: Alignment.center,
        width: kBoxSizeWith,
        height: kBoxSizeHeight,
        child: Text(
          '$value',
          style: TextStyle(
            fontSize: 17,
            // fontWeight: FontWeight.bold,
            fontFamily: 'Yekan',
          ),
        ),
      ),
    );
  }
}

class ImageCardWidget extends StatelessWidget {
  const ImageCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: kPrimaryColor, width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(6),
        child: Row(
          children: const [
            Icon(Icons.camera_alt, size: 16, color: kPrimaryColor),
            SizedBox(
              width: 6,
            ),
            Text(
                // '$_counter',
                'بارگزاری تصویر',
                style: TextStyle(fontSize: 12, color: kPrimaryColor)),
          ],
        ),
      ),
    );
  }
}
