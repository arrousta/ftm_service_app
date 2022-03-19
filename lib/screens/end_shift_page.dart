import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ftm_service_app/screens/home_page.dart';
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
                          NozzleWidget(
                              id: 1, title: 'A', startShift: _startDispenser1A),                          //-----------------------------------------1B------------------------------------------
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
                            Translations.of(context).text("dispenser") + " 2",
                            style: const TextStyle(color: kBackgroundColor1),
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
                            Translations.of(context).text("dispenser") + " 3",
                            style: const TextStyle(color: kBackgroundColor1),
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

                          int _total = 1;

                          for(int i = 0; i < endSiftList.length ; i++){
                            _total += endSiftList[i];
                            print(endSiftList[i]);
                          }

                          if (_total > 0) {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: Payment(
                                      total: '$_total',
                                      dispenser1A: '${endSiftList[1]}',
                                      dispenser1B: '${endSiftList[2]}',
                                      dispenser2A: '${endSiftList[3]}',
                                      dispenser2B: '${endSiftList[4]}',
                                      dispenser3A: '${endSiftList[5]}',
                                      dispenser3B: '${endSiftList[6]}',
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
                          child: HomePage(
                            operatorName: widget.operator,
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

List<int> endSiftList = [0,0,0,0,0,0];

class NozzleWidget extends StatefulWidget {
  final int id;
  final String title;
  final String startShift;

  const NozzleWidget(
      {Key? key,
      required this.id,
      required this.title,
      required this.startShift})
      : super(key: key);

  @override
  _NozzleWidgetState createState() => _NozzleWidgetState();
}

class _NozzleWidgetState extends State<NozzleWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  int _functionResult = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: dispensersPlateDecoration,
      padding: const EdgeInsets.only(top: 3),
      child: Column(
        children: [
          Text(
            widget.title,
            style: kHeader7,
          ),
          Container(
            margin: const EdgeInsets.all(6.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    Translations.of(context).text('start_shift'),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: kBoxSizeWith,
                    height: kBoxSizeHeight,
                    child: CardWidget(
                      value: widget.startShift,
                    ),
                  ),
                  Text(
                    Translations.of(context).text('end_shift'),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: kFieldSizeWith,
                    height: kFieldSizeHeight,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          if (value != '') {
                            _functionResult = int.parse(value);
                            if(_functionResult >= int.parse(widget.startShift)) {
                              endSiftList.insert(widget.id, _functionResult -
                                  int.parse(widget.startShift));
                              print(endSiftList[widget.id]);
                            }
                          } else {
                            _functionResult = 0;
                          }
                        });
                      },
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: kPrimaryColor,
                      style: inputFieldTextStyleDispenser,
                      controller: _textEditingController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText:
                              Translations.of(context).text('enter_number'),
                          hintStyle: inputFieldHintTextStyleDispenser,
                          focusedBorder: inputFieldFocusedBorderStyle,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          border: inputFieldDefaultBorderStyle),
                    ),
                  ),
                  Text(
                    Translations.of(context).text('function'),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: kBoxSizeWith,
                    height: kBoxSizeHeight,
                    child: CardWidget(
                      value: (_functionResult > int.parse(widget.startShift))
                          ? "${_functionResult - int.parse(widget.startShift)}"
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
    );
  }
}
