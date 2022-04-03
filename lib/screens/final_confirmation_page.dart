import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/screens/home_page.dart';
import 'package:ftm_service_app/services/network_adapter.dart';
import 'package:ftm_service_app/structures/dispensers.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import '../services/translations.dart';
import 'end_shift_page.dart';

class FinalConfirm extends StatefulWidget {
  const FinalConfirm(
      {Key? key,
      required this.dispenser1A,
      required this.dispenser1B,
      required this.dispenser2A,
      required this.dispenser2B,
      required this.dispenser3A,
      required this.dispenser3B,
      required this.dispenser1Ad,
      required this.dispenser1Bd,
      required this.dispenser2Ad,
      required this.dispenser2Bd,
      required this.dispenser3Ad,
      required this.dispenser3Bd,
      required this.totalShiftFunction,
      required this.totalShiftCash,
      required this.handShiftCash,
      required this.cardShiftCash,
      required this.operatorName})
      : super(key: key);

  final String operatorName;

  final String dispenser1A;
  final String dispenser1B;
  final String dispenser2A;
  final String dispenser2B;
  final String dispenser3A;
  final String dispenser3B;
  final String dispenser1Ad;
  final String dispenser1Bd;
  final String dispenser2Ad;
  final String dispenser2Bd;
  final String dispenser3Ad;
  final String dispenser3Bd;

  final String totalShiftFunction;
  final String totalShiftCash;
  final String handShiftCash;
  final String cardShiftCash;

  @override
  State<FinalConfirm> createState() => _FinalConfirmState();
}

class _FinalConfirmState extends State<FinalConfirm> {
  var persianInUSFormat = NumberFormat.currency(locale: 'fa', symbol: '');

  final Dispensers _dispensers = Dispensers();
  Future<Dispensers>? futureInputUser;
  Future<bool> futureGet() async {
    String user = "1";
    String dis_1 = widget.dispenser1A;
    String dis_2 = widget.dispenser1B;
    String dis_3 = widget.dispenser2A;
    String dis_4 = widget.dispenser2B;
    String dis_5 = widget.dispenser3A;
    String dis_6 = widget.dispenser3B;
    String hcash = widget.handShiftCash;
    String ccash = widget.cardShiftCash;
    String total_cash = widget.totalShiftCash;
    String sum_dis = widget.totalShiftFunction;
    print("***" + total_cash);

    futureInputUser = setShiftData(
        url: 'https://app.srahmadi.ir/setshiftdata.php',
        user: user,
        dis_1: dis_1,
        dis_2: dis_2,
        dis_3: dis_3,
        dis_4: dis_4,
        dis_5: dis_5,
        dis_6: dis_6,
        sum_dis: sum_dis,
        total_cash: total_cash,
        hcash: hcash,
        ccash: ccash);
    await futureInputUser!.then((value) {
      if (value.id != null) {
        _dispensers.id = value.id;
        return true;
      }
    });
    return false;
  }

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
                      Translations.of(context).text("dispenser_function") +
                          " 1",
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
                      Translations.of(context).text("dispenser_function") +
                          " 2",
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
                      Translations.of(context).text("dispenser_function") +
                          " 3",
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
                                Text(
                                  Translations.of(context).text("cash"),
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: persianInUSFormat.format(
                                        int.parse(widget.handShiftCash)),
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
                                  Translations.of(context).text("card_reader"),
                                ),
                                SizedBox(
                                  width: kBoxSizeWith,
                                  height: kBoxSizeHeight,
                                  child: CardWidget(
                                    value: persianInUSFormat.format(
                                        int.parse(widget.cardShiftCash)),
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
                                    value: persianInUSFormat.format(
                                        int.parse(widget.totalShiftCash)),
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
                                  operatorName: widget.operatorName,
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
                            futureGet().then((value) {
                              String id = '';
                              id = _dispensers.id.toString();
                              if (id != '') {
                                showAlertDialog(context, widget.operatorName);
                                print(id);
                              }
                            });
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
          value,
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

showAlertDialog(BuildContext context, String operatorName) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      Translations.of(context).text("exit_app"),
    ),
    onPressed: () {
      SystemNavigator.pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text(
      Translations.of(context).text("login_main_page"),
    ),
    onPressed: () {
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: HomePage(
                operatorName: operatorName,
              ),
              type: PageTransitionType.fade));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text(Translations.of(context).text("god_bless_you"),),
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
