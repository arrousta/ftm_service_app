import 'package:flutter/material.dart';
import 'package:ftm_service_app/main.dart';
import 'package:ftm_service_app/widgets/input_fields.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import '../services/translations.dart';
import 'final_confirmation_page.dart';

class Payment extends StatefulWidget {
  const Payment({
    Key? key,
  }) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int aPrice = 6568;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String totalShiftFunction = "";
    totalShiftFunction = MyApp.data.totalShiftResult;
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
                          getTranslated(context, 'payment_message'),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  getTranslated(
                                      context, 'payment_function_mess'),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: totalShiftFunction,
                                  ),
                                ),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  getTranslated(context, 'payment_cost_mess'),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: totalWithFormat,
                                  ),
                                ),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  getTranslated(context, 'payment_user_mess'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: kFieldSizeWith,
                                  height: kFieldSizeHeight,
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        if (value != '') {
                                          paymentChangeValue = int.parse(value);
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
                                        hintText: getTranslated(
                                            context, 'enter_number'),
                                        hintStyle:
                                            inputFieldHintTextStyleDispenser,
                                        focusedBorder:
                                            inputFieldFocusedBorderStyle,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 5),
                                        border: inputFieldDefaultBorderStyle),
                                  ),
                                ),
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
                                  Expanded(
                                    child: Text(
                                      getTranslated(context, 'payment_cash_mess'),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: kBoxSizeWith,
                                      height: kBoxSizeHeight,
                                      child: CardWidget(
                                        value: persianInUSFormat.format(
                                            totalWithoutFormat -
                                                paymentChangeValue),
                                      ),
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
                          if (_textEditingController.text == '') {
                            showSnackBar(context, "کارت خوان را وارد نمایید");
                          } else {
                            MyApp.data.totalShiftCash =
                                totalWithoutFormat.toString();
                            MyApp.data.cardCash =
                                _textEditingController.text;
                            MyApp.data.handCash = (totalWithoutFormat -
                                    int.parse(_textEditingController.text))
                                .toString();

                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const FinalConfirm(),
                              ),
                            );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              getTranslated(context, 'next_step'),
                            ),
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

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(
      text,
      style: const TextStyle(fontFamily: 'Yekan'),
    ),
    backgroundColor: kErrorColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
