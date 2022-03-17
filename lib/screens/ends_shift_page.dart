import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ftm_service_app/screens/panel_page.dart';
import 'package:ftm_service_app/widgets/input_fields.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:page_transition/page_transition.dart';
import '../translations.dart';
import 'payment_page.dart';

class EndShiftPage extends StatefulWidget {
  EndShiftPage({
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
  _EndShiftPageState createState() => _EndShiftPageState();
}

class _EndShiftPageState extends State<EndShiftPage> {
  String operatorName = "";
  String shiftName = "";

  String result = '0';

  late String _startDispenser1A,
      _startDispenser1B,
      _startDispenser2A,
      _startDispenser2B,
      _startDispenser3A,
      _startDispenser3B;

  String _calculateDispenserResult(
      {required String startShift, required int endSift}) {
    int start = 0;
    int end = 0;
    String _result;

    start = int.parse(startShift);
    end = endSift;
    end -= start;
    _result = end.toString();

    return _result;
  }

  void _calculateDispenserResul(
      {required String startShift, required int endSift}) {
    int start = 0;
    int end = 0;

    start = int.parse(startShift);
    end = endSift;
    end -= start;

    if (end > 0) {
      result = end.toString();
    } else {
      result = '0';
    }
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

  int totalShift() {
    int total = 0;

    total += dispenser1AChangedValue - int.parse(widget.lastDispenserData1A);
    total += dispenser1BChangedValue - int.parse(widget.lastDispenserData1B);
    total += dispenser2AChangedValue - int.parse(widget.lastDispenserData2A);
    total += dispenser2BChangedValue - int.parse(widget.lastDispenserData2B);
    total += dispenser3AChangedValue - int.parse(widget.lastDispenserData3A);
    total += dispenser3BChangedValue - int.parse(widget.lastDispenserData3B);

    return total;
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
                    color: kBackgroundColor3,
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
                            Translations.of(context).text("dispenser") + " 1",
                            style: const TextStyle(color: kBackgroundColor1),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //-----------------------------------------1A------------------------------------------
                          Container(
                            decoration: dispensersPlateDecoration,
                            padding: const EdgeInsets.only(top: 3),
                            child: Column(
                              children: [
                                const Text(
                                  'A',
                                  style: kHeader7,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(6.0),
                                  decoration: dispenserPlateDecoration,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          Translations.of(context)
                                              .text('start_shift'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kBoxSizeWith,
                                          height: kBoxSizeHeight,
                                          child: CardWidget(
                                            value: _startDispenser1A,
                                          ),
                                        ),
                                        Text(
                                          Translations.of(context)
                                              .text('end_shift'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kFieldSizeWith,
                                          height: kFieldSizeHeight,
                                          child: ftmDispenser1AInput(
                                            hintText: Translations.of(context)
                                                .text('enter_number'),
                                            onChanged: (value) {
                                              if (value != '') {
                                                dispenser1AChangedValue =
                                                    int.parse(value);
                                                setState(() {
                                                  _calculateDispenserResul(
                                                      startShift:
                                                          _startDispenser1A,
                                                      endSift:
                                                          dispenser1AChangedValue);
                                                });
                                              } else {
                                                dispenser1AChangedValue = 0;
                                              }
                                            },
                                          ),
                                        ),
                                        Text(
                                          Translations.of(context)
                                              .text('function'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kBoxSizeWith,
                                          height: kBoxSizeHeight,
                                          child: CardWidget(
                                            value: result,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const ImageCardWidget(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //-----------------------------------------1B------------------------------------------
                          Container(
                            decoration: dispensersPlateDecoration,
                            padding: const EdgeInsets.only(top: 3),
                            child: Column(
                              children: [
                                const Text(
                                  'B',
                                  style: kHeader7,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(6.0),
                                  decoration: dispenserPlateDecoration,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          Translations.of(context)
                                              .text('start_shift'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kBoxSizeWith,
                                          height: kBoxSizeHeight,
                                          child: CardWidget(
                                            value: _startDispenser1B,
                                          ),
                                        ),
                                        Text(
                                          Translations.of(context)
                                              .text('end_shift'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kFieldSizeWith,
                                          height: kFieldSizeHeight,
                                          child: ftmDispenser1BInput(
                                            hintText: Translations.of(context)
                                                .text("enter_number"),
                                            onChanged: (value) {
                                              if (value != '') {
                                                dispenser1BChangedValue =
                                                    int.parse(value);
                                                setState(() {
                                                  _calculateDispenserResult(
                                                      startShift:
                                                          _startDispenser1B,
                                                      endSift:
                                                          dispenser1BChangedValue);
                                                });
                                              } else {
                                                dispenser1BChangedValue = 0;
                                              }
                                            },
                                          ),
                                        ),
                                        Text(
                                          Translations.of(context)
                                              .text('function'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kBoxSizeWith,
                                          height: kBoxSizeHeight,
                                          child: CardWidget(
                                            value: result,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const ImageCardWidget(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                            Translations.of(context).text("dispenser") + " 2",
                            style: const TextStyle(color: kBackgroundColor1),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //-----------------------------------------2A------------------------------------------
                          Container(
                            decoration: dispensersPlateDecoration,
                            padding: const EdgeInsets.only(top: 3),
                            child: Column(
                              children: [
                                const Text(
                                  'A',
                                  style: kHeader7,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(6.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          Translations.of(context)
                                              .text('start_shift'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kBoxSizeWith,
                                          height: kBoxSizeHeight,
                                          child: CardWidget(
                                            value: _startDispenser2A,
                                          ),
                                        ),
                                        Text(
                                          Translations.of(context)
                                              .text('end_shift'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kFieldSizeWith,
                                          height: kFieldSizeHeight,
                                          child: ftmDispenser2AInput(
                                              Translations.of(context)
                                                  .text('enter_number')),
                                        ),
                                        Text(
                                          Translations.of(context)
                                              .text('function'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kBoxSizeWith,
                                          height: kBoxSizeHeight,
                                          child: CardWidget(
                                            value: (dispenser2AChangedValue >
                                                    int.parse(
                                                        _startDispenser2A))
                                                ? _calculateDispenserResult(
                                                    startShift:
                                                        _startDispenser2A,
                                                    endSift:
                                                        dispenser2AChangedValue)
                                                : "0",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const ImageCardWidget(),
                                      ],
                                    ),
                                  ),
                                  decoration: dispenserPlateDecoration,
                                ),
                              ],
                            ),
                          ),
                          //-----------------------------------------2B------------------------------------------
                          Container(
                            decoration: dispensersPlateDecoration,
                            padding: const EdgeInsets.only(top: 3),
                            child: Column(
                              children: [
                                const Text(
                                  'B',
                                  style: kHeader7,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(6.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          Translations.of(context)
                                              .text('start_shift'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kBoxSizeWith,
                                          height: kBoxSizeHeight,
                                          child: CardWidget(
                                            value: _startDispenser2B,
                                          ),
                                        ),
                                        Text(
                                          Translations.of(context)
                                              .text('end_shift'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kFieldSizeWith,
                                          height: kFieldSizeHeight,
                                          child: ftmDispenser2BInput(
                                              Translations.of(context)
                                                  .text('enter_number')),
                                        ),
                                        Text(
                                          Translations.of(context)
                                              .text('function'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kBoxSizeWith,
                                          height: kBoxSizeHeight,
                                          child: CardWidget(
                                            value: (dispenser2BChangedValue >
                                                    int.parse(
                                                        _startDispenser2B))
                                                ? _calculateDispenserResult(
                                                    startShift:
                                                        _startDispenser2B,
                                                    endSift:
                                                        dispenser2BChangedValue)
                                                : "0",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const ImageCardWidget(),
                                      ],
                                    ),
                                  ),
                                  decoration: dispenserPlateDecoration,
                                ),
                              ],
                            ),
                          ),
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
                            Translations.of(context).text("dispenser") + " 3",
                            style: const TextStyle(color: kBackgroundColor1),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //-----------------------------------------3A------------------------------------------
                          Container(
                            decoration: dispensersPlateDecoration,
                            padding: const EdgeInsets.only(top: 3),
                            child: Column(
                              children: [
                                const Text(
                                  'A',
                                  style: kHeader7,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(6.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          Translations.of(context)
                                              .text('start_shift'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kBoxSizeWith,
                                          height: kBoxSizeHeight,
                                          child: CardWidget(
                                            value: _startDispenser3A,
                                          ),
                                        ),
                                        Text(
                                          Translations.of(context)
                                              .text('end_shift'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kFieldSizeWith,
                                          height: kFieldSizeHeight,
                                          child: ftmDispenser3AInput(
                                              Translations.of(context)
                                                  .text('enter_number')),
                                        ),
                                        Text(
                                          Translations.of(context)
                                              .text('function'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kBoxSizeWith,
                                          height: kBoxSizeHeight,
                                          child: CardWidget(
                                            value: (dispenser3AChangedValue >
                                                    int.parse(
                                                        _startDispenser3A))
                                                ? _calculateDispenserResult(
                                                    startShift:
                                                        _startDispenser3A,
                                                    endSift:
                                                        dispenser3AChangedValue)
                                                : "0",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const ImageCardWidget(),
                                      ],
                                    ),
                                  ),
                                  decoration: dispenserPlateDecoration,
                                ),
                              ],
                            ),
                          ),
                          //-----------------------------------------3B------------------------------------------
                          Container(
                            decoration: dispensersPlateDecoration,
                            padding: const EdgeInsets.only(top: 3),
                            child: Column(
                              children: [
                                const Text(
                                  'B',
                                  style: kHeader7,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(6.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          Translations.of(context)
                                              .text('start_shift'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kBoxSizeWith,
                                          height: kBoxSizeHeight,
                                          child: CardWidget(
                                            value: _startDispenser3B,
                                          ),
                                        ),
                                        Text(
                                          Translations.of(context)
                                              .text('end_shift'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kFieldSizeWith,
                                          height: kFieldSizeHeight,
                                          child: ftmDispenser3BInput(
                                            Translations.of(context)
                                                .text('enter_number'),
                                          ),
                                        ),
                                        Text(
                                          Translations.of(context)
                                              .text('function'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kBoxSizeWith,
                                          height: kBoxSizeHeight,
                                          child: CardWidget(
                                            value: (dispenser3BChangedValue >
                                                    int.parse(
                                                        _startDispenser3B))
                                                ? _calculateDispenserResult(
                                                    startShift:
                                                        _startDispenser3B,
                                                    endSift:
                                                        dispenser3BChangedValue)
                                                : "0",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const ImageCardWidget(),
                                      ],
                                    ),
                                  ),
                                  decoration: dispenserPlateDecoration,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
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
                          int _total = totalShift();
                          if (_total > 0) {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: Payment(
                                      total: "$_total",
                                      dispenser1A: dispenser1AController.text,
                                      dispenser1B: dispenser1BController.text,
                                      dispenser2A: dispenser2AController.text,
                                      dispenser2B: dispenser2BController.text,
                                      dispenser3A: dispenser3AController.text,
                                      dispenser3B: dispenser3BController.text,
                                    )));
                          } else if (_total == 0) {
                            print("***Total= $_total");
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
            content: Text(Translations.of(context).text("close_app_mess")),

            actions: <Widget>[
              TextButton(
                child: Text(Translations.of(context).text("yes")),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: PanelPage(
                            operator: widget.operator,
                          ),
                          type: PageTransitionType.rightToLeft));
                },
              ),
              TextButton(
                child: Text(Translations.of(context).text("no")),
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
      child: Container(
        alignment: Alignment.center,
        width: kBoxSizeWith,
        height: kBoxSizeHeight,
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 17,
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
            children: const [
              Icon(Icons.camera_alt, size: 16, color: kPrimaryColor),
              SizedBox(
                width: 6,
              ),
              Text('بارگزاری تصویر',
                  style: TextStyle(fontSize: 12, color: kPrimaryColor)),
            ],
          ),
        ),
      ),
    );
  }
}
