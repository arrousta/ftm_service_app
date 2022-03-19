import 'package:flutter/material.dart';
import 'package:ftm_service_app/widgets/input_fields.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import '../translations.dart';
import 'final_confirmation_page.dart';

class Payment extends StatefulWidget {
  const Payment(
      {Key? key,
      required this.total,
      required this.dispenser1A,
      required this.dispenser1B,
      required this.dispenser2A,
      required this.dispenser2B,
      required this.dispenser3A,
      required this.dispenser3B})
      : super(key: key);

  final String total;
  final String dispenser1A;
  final String dispenser1B;
  final String dispenser2A;
  final String dispenser2B;
  final String dispenser3A;
  final String dispenser3B;

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int aPrice = 6568;

  @override
  Widget build(BuildContext context) {
    String totalShiftFunction = "";
    totalShiftFunction = widget.total;
    int totalInt = int.parse(totalShiftFunction);

    var persianInUSFormat = NumberFormat.currency(locale: 'fa', symbol: '');
    // var persianInUSFormat = NumberFormat.currency(locale: "fa", symbol: "ريال");

    String totalWithFormat = persianInUSFormat.format(totalInt * aPrice);
    int totalWithoutFormat = totalInt * aPrice;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
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
                    side: const BorderSide(color: kPrimaryColor, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 40.0,
                        child: Text(
                          Translations.of(context).text("payment_message"),
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
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Translations.of(context)
                                        .text("payment_function_mess"),
                                  ),
                                  SizedBox(
                                    width: kBoxSizeWith,
                                    height: kBoxSizeHeight,
                                    child: CardWidget(
                                      value: totalShiftFunction,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        decoration: dispenserPlateDecoration,
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Translations.of(context)
                                        .text("payment_cost_mess"),
                                  ),
                                  SizedBox(
                                    width: kBoxSizeWith,
                                    height: kBoxSizeHeight,
                                    child: CardWidget(
                                      value: totalWithFormat,
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
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Translations.of(context)
                                        .text("payment_user_mess"),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    width: kBoxSizeWith,
                                    height: kBoxSizeHeight,
                                    padding: const EdgeInsets.all(3),
                                    child: ftmPaymentInput('وارد کنید'),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Translations.of(context)
                                        .text("payment_cash_mess"),
                                  ),
                                  SizedBox(
                                    width: kBoxSizeWith,
                                    height: kBoxSizeHeight,
                                    child: CardWidget(
                                      value: persianInUSFormat.format(
                                          totalWithoutFormat -
                                              paymentChangeValue),
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
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: FinalConfirm(
                                title: 'Final Confirmation',
                                dispenser1A: widget.dispenser1A,
                                dispenser1B: widget.dispenser1B,
                                dispenser2A: widget.dispenser2A,
                                dispenser2B: widget.dispenser2B,
                                dispenser3A: widget.dispenser3A,
                                dispenser3B: widget.dispenser3B,
                                totalShiftFunction: '$totalInt',
                                totalShiftCash: totalWithFormat,
                                cardShiftCash: paymentController.text,
                                handShiftCash:
                                    '${totalWithoutFormat - int.parse(paymentController.text)}',
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(Translations.of(context).text("next_step")),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          padding: const EdgeInsets.all(8),
                        ),
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
        width: kBoxSizeWith,
        height: kBoxSizeHeight,
        child: Text(
          value,
          locale: const Locale('en'),
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
