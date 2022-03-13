import 'package:flutter/material.dart';
import 'package:ftm_service_app/constractor.dart';
import 'package:page_transition/page_transition.dart';
import 'dispenser_page.dart';
import 'finish_page.dart';

enum ShiftName { morning, evening, night }

class StartShift extends StatefulWidget {
  const StartShift({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StartShift> createState() => _StartShiftState();
}

class _StartShiftState extends State<StartShift> {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 70.0,
                      child: const Text(
                        'If there is a mistake in the entered data,\n press the edit key and correct the data',
                        style: kHeader5,
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
                    const Text(
                      'Dispenser1',
                      style: kHeader7,
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
                                Container(
                                  //TODO : get dispenser1 A Data
                                  width: 130.0,
                                  height: 50.0,
                                  child: const CardWidget(
                                    value: '111111111',
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  'B',
                                  style: kHeader7,
                                ),
                                Container(
                                  //TODO : get dispenser1 B Data
                                  width: 130.0,
                                  height: 50.0,
                                  child: const CardWidget(
                                    value: '111111111',
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
                    const Text(
                      'Dispenser2',
                      style: kHeader7,
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
                                Container(
                                  //TODO : get dispenser2 A Data
                                  width: 130.0,
                                  height: 50.0,
                                  child: const CardWidget(
                                    value: '22222222',
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  'B',
                                  style: kHeader7,
                                ),
                                Container(
                                  //TODO : get dispenser2 B Data
                                  width: 130.0,
                                  height: 50.0,
                                  child: const CardWidget(
                                    value: '22222222',
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
                    const Text(
                      'Dispenser3',
                      style: kHeader7,
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
                                Container(
                                  //TODO : get dispenser3 A Data
                                  width: 130.0,
                                  height: 50.0,
                                  child: const CardWidget(
                                    value: '333333333',
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  'B',
                                  style: kHeader7,
                                ),
                                Container(
                                  //TODO : get dispenser3 B Data
                                  width: 130.0,
                                  height: 50.0,
                                  child: const CardWidget(
                                    value: '333333333',
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
                    SizedBox(
                      height: 10.0,
                      width: 330,
                      child: Divider(
                        color: Colors.blue.shade700,
                        thickness: 1.5,
                      ),
                    ),

                    const SizedBox(
                      height: 8.0,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //TODO: Go to Edit Again :

                            Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: DispenserPage(operator: 'Dispenser Page',)));
                          },
                          child: const Text("EDIT" , style: TextStyle( fontSize: 15,fontFamily: 'Poppins-Regular',),),
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 13.0 , horizontal: 30.0),
                          ),
                        ),
                        const SizedBox(
                          width: 50.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //TODO: Finish and Complete :

                            Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: const FinishPage(pageTitle: 'Finish Page',)));
                          },
                          child: const Text("Start Shift" , style: TextStyle( fontSize: 15,fontFamily: 'Poppins-Regular',),),
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 13.0 , horizontal: 30.0),
                          ),
                        ),
                      ],
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
        side: const BorderSide(color: Colors.teal, width: 2),
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
          '$value',
          //'کارکرد 0.0',
          style: kHeader7,
        ),
      ),
    );
  }
}
