import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ftm_service_app/screens/end_shift_page.dart';
import 'package:ftm_service_app/screens/home_page.dart';
import 'package:ftm_service_app/screens/start_shift_page.dart';
import 'package:ftm_service_app/services/network_adapter.dart';
import 'package:ftm_service_app/services/shared_preference.dart';
import 'package:ftm_service_app/structures/shift_data.dart';
import 'package:page_transition/page_transition.dart';

import '../constructor.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key, required this.keyPage, required this.operatorName})
      : super(key: key);
  final String keyPage;
  final String operatorName;

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  SharedPreference sharedPreference = SharedPreference();
  Future<ShiftData>? futureGetShiftData;
  ShiftData shiftData = ShiftData();

  Future<bool> fetchShiftData(String auth) async {
    futureGetShiftData = getShiftData(auth: auth);
    await futureGetShiftData!.then((value) {
      if (value.id != null) {
        shiftData.id = value.id;
        shiftData.nozzle_1 = value.nozzle_1;
        shiftData.nozzle_2 = value.nozzle_2;
        shiftData.nozzle_3 = value.nozzle_3;
        shiftData.nozzle_4 = value.nozzle_4;
        shiftData.nozzle_5 = value.nozzle_5;
        shiftData.nozzle_6 = value.nozzle_6;
        return true;
      }
    });
    return true;
  }

  _loadUserInfo() async {
    SharedPreference sharedPreference = SharedPreference();
    String token = await sharedPreference.read("token");
    fetchShiftData(token).then((value) {
      if (value) {
        if (widget.keyPage == 'end') {
          if (shiftData.id != null) {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: EndShiftPage(
                      lastDispenserData1A: shiftData.nozzle_1.toString(),
                      lastDispenserData1B: shiftData.nozzle_2.toString(),
                      lastDispenserData2A: shiftData.nozzle_3.toString(),
                      lastDispenserData2B: shiftData.nozzle_4.toString(),
                      lastDispenserData3A: shiftData.nozzle_5.toString(),
                      lastDispenserData3B: shiftData.nozzle_6.toString(),
                      operatorName: widget.operatorName,
                    ),
                    type: PageTransitionType.rightToLeft));
          } else {
            print("**dispenser get data is error**");
          }
        } else if (widget.keyPage == 'start') {
          if (shiftData.id != null) {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: StartShift(
                      lastDispenserData1A: shiftData.nozzle_1.toString(),
                      lastDispenserData1B: shiftData.nozzle_2.toString(),
                      lastDispenserData2A: shiftData.nozzle_3.toString(),
                      lastDispenserData2B: shiftData.nozzle_4.toString(),
                      lastDispenserData3A: shiftData.nozzle_5.toString(),
                      lastDispenserData3B: shiftData.nozzle_6.toString(),
                      operatorName: widget.operatorName,
                    ),
                    type: PageTransitionType.rightToLeft));
          } else {
            print("**dispenser get data is error**");
          }
        }
      }
    }).catchError((e) {
      showSnackBar(context,"اتصال برقرار نشد", widget.operatorName);
      print("loading error: " + e);
    });
  }

  @override
  void initState() {
    _loadUserInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        backgroundColor: kLightBackgroundColor,
        body: Center(
          child: SpinKitCircle(
            color: kPrimaryColor,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String text, String operatorName) {
  final snackBar = SnackBar(
    content: Text(
      text,
      style: const TextStyle(fontFamily: 'Yekan'),
    ),
    backgroundColor: kErrorColor,
    duration: const Duration(seconds: 60),
    action: SnackBarAction(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          PageTransition(
              child: HomePage(operatorName: operatorName),
              type: PageTransitionType.rightToLeft),
        );
      },
      label: 'بازگشت به صفحه اصلی',
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
