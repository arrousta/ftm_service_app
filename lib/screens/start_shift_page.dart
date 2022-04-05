import 'package:flutter/material.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/screens/home_page.dart';
import 'package:page_transition/page_transition.dart';
import '../services/translations.dart';
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 12.0),
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
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  height: 1.4, letterSpacing: 1.0),
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
                            Translations.of(context).text("dispenser") + " 1",
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
                                          value: widget.lastDispenserData1A,
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
                                          value: widget.lastDispenserData1B,
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
                            Translations.of(context).text("dispenser") + " 2",
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
                                          value: widget.lastDispenserData2A,
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
                                          value: widget.lastDispenserData2B,
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
                            Translations.of(context).text("dispenser") + " 3",
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
                                          value: widget.lastDispenserData3A,
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
                                          value: widget.lastDispenserData3B,
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
                                child: HomePage(
                                  operatorName: widget.operatorName,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Translations.of(context)
                                    .text("contradiction_data"),
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
                            showAlertDialog(context, widget.operatorName);
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

  Future<bool> _onBackPressed() async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // title: const Text("Error"),
            content: Text(Translations.of(context).text("close_page_mess")),

            actions: <Widget>[
              TextButton(
                child: Text(Translations.of(context).text("yes")),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: HomePage(
                            operatorName: widget.operatorName,
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

showAlertDialog(BuildContext context, String operatorName) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      Translations.of(context).text("no"),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text(
      Translations.of(context).text("yes"),
    ),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        PageTransition(
            child: HomePage(
              operatorName: operatorName,
            ),
            type: PageTransitionType.fade),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      Translations.of(context).text("warning"),
      style: TextStyle(
        color: kErrorColor,
      ),
    ),
    content: Text(
      Translations.of(context).text("start_shift_mess_warning"),
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
