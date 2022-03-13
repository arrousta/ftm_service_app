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
  DispenserPage({
    Key? key,
    required this.operator,
    required this.lastDispenserData1A,
    required this.lastDispenserData1B,
    required this.lastDispenserData2A,
    required this.lastDispenserData2B,
    required this.lastDispenserData3A,
    required this.lastDispenserData3B,
  }) : super(key: key);
  final String operator;

  String lastDispenserData1A;
  String lastDispenserData1B;
  String lastDispenserData2A;
  String lastDispenserData2B;
  String lastDispenserData3A;
  String lastDispenserData3B;

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

  late String
      _startDispenser1A,
      _startDispenser1B,
      _startDispenser2A,
      _startDispenser2B,
      _startDispenser3A,
      _startDispenser3B;


  late int
      _endDispenser1A,
      _endDispenser1B,
      _endDispenser2A,
      _endDispenser2B,
      _endDispenser3A,
      _endDispenser3B;

  late int
      _resultDispenser1A,
      _resultDispenser1B,
      _resultDispenser2A,
      _resultDispenser2B,
      _resultDispenser3A,
      _resultDispenser3B;

   String _calculateDispenserResult({required String startShift, required String endSift}){
     int start = 0;
     int end = 0;
     String result;

     start = int.parse(startShift);
     end = int.parse(endSift);
     end -= start;
     result = end.toString();
    return result;
  }




  void _setStartShiftData() {

      _startDispenser1A = widget.lastDispenserData1A;
      _startDispenser1B = widget.lastDispenserData1B;
      _startDispenser2A = widget.lastDispenserData2A;
      _startDispenser2B = widget.lastDispenserData2B;
      _startDispenser3A = widget.lastDispenserData3A;
      _startDispenser3B = widget.lastDispenserData3B;
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
    _setStartShiftData();
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
                                          value: '$_startDispenser1A',
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
                                          _calculateDispenserResult(startShift: _startDispenser1A, endSift: ),
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
                                          value: '$_startDispenser1B',
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
                                          value: '$_startDispenser2A',
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
                                          value: '$_startDispenser2B',
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
                                          value: '$_startDispenser3A',
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
                                          value: '$_startDispenser3B',
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
