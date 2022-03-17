import 'package:flutter/material.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:page_transition/page_transition.dart';
import '../translations.dart';
import 'end_shift_page.dart';
import 'finish_page.dart';

class FinalConfirm extends StatefulWidget {
  const FinalConfirm(
      {Key? key,
      required this.title,
      required this.dispenser1A,
      required this.dispenser1B,
      required this.dispenser2A,
      required this.dispenser2B,
      required this.dispenser3A,
      required this.dispenser3B,
      required this.totalShiftFunction,
      required this.totalShiftCash,
      required this.handShiftCash,
      required this.cardShiftCash})
      : super(key: key);

  final String title;

  final String dispenser1A;
  final String dispenser1B;
  final String dispenser2A;
  final String dispenser2B;
  final String dispenser3A;
  final String dispenser3B;

  final String totalShiftFunction;
  final String totalShiftCash;
  final String handShiftCash;
  final String cardShiftCash;

  @override
  State<FinalConfirm> createState() => _FinalConfirmState();
}

class _FinalConfirmState extends State<FinalConfirm> {
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
                        Translations.of(context).text("attention"),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        Translations.of(context).text("final_confirm_mess"),
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
                      Translations.of(context).text("dispenser") + " 1",
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
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
                                        value: widget.dispenser1A,
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
                                        value: widget.dispenser1B,
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
                                        value: widget.dispenser2A,
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
                                        value: widget.dispenser2B,
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
                                        value: widget.dispenser3A,
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
                                        value: widget.dispenser3B,
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Translations.of(context)
                                      .text("payment_function_mess"),
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: widget.totalShiftFunction,
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
                                Text('نقدی'),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: widget.handShiftCash,
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
                                Text('کارت خوان'),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: widget.cardShiftCash,
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
                                  Translations.of(context)
                                      .text("payment_cost_mess"),
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: widget.totalShiftCash,
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: EndShiftPage(
                                  operator: 'Zzzzzz',
                                  lastDispenserData1A: widget.dispenser1A,
                                  lastDispenserData1B: widget.dispenser1B,
                                  lastDispenserData2A: widget.dispenser2A,
                                  lastDispenserData2B: widget.dispenser2B,
                                  lastDispenserData3A: widget.dispenser3A,
                                  lastDispenserData3B: widget.dispenser3B,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            Translations.of(context).text("edit_data"),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 30.0),
                          ),
                        ),
                        const SizedBox(
                          width: 50.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const FinishPage(
                                  pageTitle: 'Finish Page',
                                ),
                              ),
                            );
                          },
                          child: Text(
                            Translations.of(context).text("finish"),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 30.0),
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
            locale: Locale('en'),
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
