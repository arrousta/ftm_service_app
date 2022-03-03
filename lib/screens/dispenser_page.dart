import 'package:flutter/material.dart';
import 'package:ftm_service_app/shared/colors.dart';
import 'package:ftm_service_app/shared/inputFields.dart';
import 'package:ftm_service_app/shared/styles.dart';
import 'package:ftm_service_app/widgets/time_and_date.dart';
import 'package:page_transition/page_transition.dart';
import 'payment_page.dart';

enum ShiftName { morning, evening, night }

class DispenserPage extends StatefulWidget {
  const DispenserPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<DispenserPage> createState() => _DispenserPageState();
}

//***************************************************************************************
//Todo : Delete this section if not use :

class _DispenserPageState extends State<DispenserPage> {
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


  String shiftName = "null";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffc7c7c7),
        elevation: 0.0,
        title: Text(widget.title),
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
                  side: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    // Text(
                    //   'Operator',
                    //   style: TextStyle(fontSize: 18, color: Colors.black),
                    // ),
                    TimeAndDate(),
                    // Text(
                    //   'First Shift',
                    //   style: TextStyle(fontSize: 18, color: Colors.black),
                    // ),
                  ],
                ),
              ),
              //-------------------------------------------------------------------------------------------
              Container(
                padding: const EdgeInsets.all(3.0),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xffdbdbde),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dispenser1',
                      style: h7,
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
                                  style: h7,
                                ),
                                Container(
                                  width: 140.0,
                                  height: 50.0,
                                  padding: const EdgeInsets.all(3),
                                  child: ftmDispenser1AInput('Enter Number'),
                                ),
                                Container(
                                  width: 140.0,
                                  height: 50.0,
                                  child: const CardWidget(
                                    value: '0.0',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'B',
                                  style: h7,
                                ),
                                Container(
                                  width: 140.0,
                                  height: 50.0,
                                  padding: const EdgeInsets.all(3),
                                  child: ftmDispenser1BInput('Enter Number'),
                                ),
                                Container(
                                  width: 140.0,
                                  height: 50.0,
                                  child: const CardWidget(
                                    value: '0.1',
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
                      height: 18.0,
                    ),
                    const Text(
                      'Dispenser2',
                      style: h7,
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
                                  style: h7,
                                ),
                                Container(
                                  width: 140.0,
                                  height: 50.0,
                                  padding: const EdgeInsets.all(3),
                                  child: ftmDispenser2AInput('Enter Number'),
                                ),
                                Container(
                                  width: 140.0,
                                  height: 50.0,
                                  child: const CardWidget(
                                    value: '0.0',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'B',
                                  style: h7,
                                ),
                                Container(
                                  width: 140.0,
                                  height: 50.0,
                                  padding: const EdgeInsets.all(3),
                                  child: ftmDispenser2BInput('Enter Number'),
                                ),
                                Container(
                                  width: 140.0,
                                  height: 50.0,
                                  child: const CardWidget(
                                    value: '0.1',
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
                      height: 18.0,
                    ),
                    const Text(
                      'Dispenser3',
                      style: h7,
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
                                  style: h7,
                                ),
                                Container(
                                  width: 140.0,
                                  height: 50.0,
                                  padding: const EdgeInsets.all(3),
                                  child: ftmDispenser3AInput('Enter Number'),
                                ),
                                Container(
                                  width: 140.0,
                                  height: 50.0,
                                  child: const CardWidget(
                                    value: '0.0',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'B',
                                  style: h7,
                                ),
                                Container(
                                  width: 140.0,
                                  height: 50.0,
                                  padding: const EdgeInsets.all(3),
                                  child: ftmDispenser3BInput('Enter Number'),
                                ),
                                Container(
                                  width: 140.0,
                                  height: 50.0,
                                  child: const CardWidget(
                                    value: '0.1',
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
                        //TODO: Receive Data from Dispensers Field and do Calculations :

                        print(dispenserA1Controller.text); // Print name current value
                        print(dispenserB1Controller.text); // Print name current value
                        print(dispenserA2Controller.text); // Print name current value
                        print(dispenserB2Controller.text); // Print name current value
                        print(dispenserA3Controller.text); // Print name current value
                        print(dispenserB3Controller.text); // Print name current value
                        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: const Payment(title: 'Payment Page',)));
                      },
                      child: const Text("Next Step"),
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        padding: const EdgeInsets.all(13),
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
        side: const BorderSide(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 10.0),
        width: 100.0,
        height: 34.0,
        child: Text(
          // '$_counter',
          '$value',
          //'کارکرد 0.0',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}