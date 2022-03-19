import 'package:flutter/material.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/screens/home_page.dart';
import 'package:page_transition/page_transition.dart';
import '../translations.dart';
import 'end_shift_page.dart';

class StartShift extends StatefulWidget {
  const StartShift({
    Key? key,
    required this.operatorName,
    required this.lastDispenserData1A,
    required this.lastDispenserData1B,
    required this.lastDispenserData2A,
    required this.lastDispenserData2B,
    required this.lastDispenserData3A,
    required this.lastDispenserData3B,
  }) : super(key: key);

  final String operatorName;

  final String lastDispenserData1A;
  final String lastDispenserData1B;
  final String lastDispenserData2A;
  final String lastDispenserData2B;
  final String lastDispenserData3A;
  final String lastDispenserData3B;

  @override
  State<StartShift> createState() => _StartShiftState();
}

class _StartShiftState extends State<StartShift> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffc7c7c7),
        elevation: 0.0,
        title: Text(Translations.of(context).text("start_shift")),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 21.0,
        ),
        centerTitle: true,
      ),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 12.0),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            Translations.of(context).text("attention"),
                            style: kAttention,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            Translations.of(context).text("start_shift_mess"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //-------------------------------------------------------------------------------------------
              Container(
                padding: const EdgeInsets.all(3.0),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color(0xffdbdbde),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Translations.of(context).text("dispenser") + " 1",
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
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
                                    value: widget.lastDispenserData1A,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  'B',
                                  style: kHeader7,
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: widget.lastDispenserData1B,
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
                      Translations.of(context).text("dispenser") + " 2",
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
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
                                    value: widget.lastDispenserData2A,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  'B',
                                  style: kHeader7,
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: widget.lastDispenserData2B,
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
                      Translations.of(context).text("dispenser") + " 3",
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
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
                                    value: widget.lastDispenserData3A,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  'B',
                                  style: kHeader7,
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: widget.lastDispenserData3B,
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
                      height: 8.0,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: EndShiftPage(
                                  operator: 'Dispenser Page',
                                  lastDispenserData1A:
                                      widget.lastDispenserData1A,
                                  lastDispenserData1B:
                                      widget.lastDispenserData1B,
                                  lastDispenserData2A:
                                      widget.lastDispenserData2A,
                                  lastDispenserData2B:
                                      widget.lastDispenserData2B,
                                  lastDispenserData3A:
                                      widget.lastDispenserData3A,
                                  lastDispenserData3B:
                                      widget.lastDispenserData3B,
                                )));
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Translations.of(context).text("edit_data"),
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Yekan',
                              ),
                            ),
                          ]),
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 40.0),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: HomePage(
                                  operatorName: widget.operatorName,
                                )));
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Translations.of(context).text("start_shift"),
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ]),
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 40.0),
                      ),
                    )
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
        side: const BorderSide(color: kPrimaryColor, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 2.0),
        width: 100.0,
        height: 34.0,
        child: Text(
          // '$_counter',
          value,
          //'کارکرد 0.0',
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
