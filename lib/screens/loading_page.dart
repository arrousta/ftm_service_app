import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ftm_service_app/screens/end_shift_page.dart';
import 'package:ftm_service_app/screens/sing_in_page.dart';
import 'package:ftm_service_app/screens/start_shift_page.dart';
import 'package:ftm_service_app/services/network_adapter.dart';
import 'package:ftm_service_app/services/shared_preference.dart';
import 'package:ftm_service_app/structures/dispensers.dart';
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
  // Dispensers dispensers = Dispensers();
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

  // Future<bool> getData(String id) async {
  //   futureGetDispenserData = getDispenserData(
  //       url: 'https://app.srahmadi.ir/getdispenserdata.php', id: id);
  //   await futureGetDispenserData!.then((value) {
  //     if (value.id != null) {
  //       dispensers.id = value.id;
  //       dispensers.dis_1 = value.dis_1;
  //       dispensers.dis_2 = value.dis_2;
  //       dispensers.dis_3 = value.dis_3;
  //       dispensers.dis_4 = value.dis_4;
  //       dispensers.dis_5 = value.dis_5;
  //       dispensers.dis_6 = value.dis_6;
  //
  //       return true;
  //     }
  //   });
  //   return true;
  // }

  @override
  void initState() {
    //TODO:share3
    String token = sharedPreference.read("token").toString();
    print(token);
    fetchShiftData(token).then((value) {
      if (value) {
        if (widget.keyPage == 'end') {
          if (shiftData.id != '') {
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
          if (shiftData.id != '') {
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
    }).catchError((_) {
      print("loading error");
    });
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
