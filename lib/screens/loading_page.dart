import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ftm_service_app/screens/end_shift_page.dart';
import 'package:ftm_service_app/screens/start_shift_page.dart';
import 'package:ftm_service_app/services/network_adapter.dart';
import 'package:ftm_service_app/structures/dispensers.dart';
import 'package:page_transition/page_transition.dart';

import '../constructor.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key, required this.id, required this.operatorName})
      : super(key: key);
  final String id;
  final String operatorName;

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<Dispensers>? futureGetDispenserData;
  Dispensers dispensers = Dispensers();

  Future<bool> getData(String id) async {
    futureGetDispenserData = getDispenserData(
        url: 'https://app.srahmadi.ir/getdispenserdata.php', id: id);
    await futureGetDispenserData!.then((value) {
      if (value.id != null) {
        dispensers.id = value.id;
        dispensers.dis_1 = value.dis_1;
        dispensers.dis_2 = value.dis_2;
        dispensers.dis_3 = value.dis_3;
        dispensers.dis_4 = value.dis_4;
        dispensers.dis_5 = value.dis_5;
        dispensers.dis_6 = value.dis_6;

        return true;
      }
    });
    return true;
  }

  @override
  void initState() {
    getData("1").then((value) {
      if (value) {
        if (widget.id == 'end') {
          if (dispensers.id != '') {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: EndShiftPage(
                      lastDispenserData1A: dispensers.dis_1.toString(),
                      lastDispenserData1B: dispensers.dis_2.toString(),
                      lastDispenserData2A: dispensers.dis_3.toString(),
                      lastDispenserData2B: dispensers.dis_4.toString(),
                      lastDispenserData3A: dispensers.dis_5.toString(),
                      lastDispenserData3B: dispensers.dis_6.toString(),
                      operator: widget.id,
                    ),
                    type: PageTransitionType.rightToLeft));
          } else {
            print("**dispenser get data is error**");
          }
        } else if (widget.id == 'start') {
          if (dispensers.id != '') {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: StartShift(
                      lastDispenserData1A: dispensers.dis_1.toString(),
                      lastDispenserData1B: dispensers.dis_2.toString(),
                      lastDispenserData2A: dispensers.dis_3.toString(),
                      lastDispenserData2B: dispensers.dis_4.toString(),
                      lastDispenserData3A: dispensers.dis_5.toString(),
                      lastDispenserData3B: dispensers.dis_6.toString(),
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
    return const Scaffold(
      backgroundColor: kBackgroundColor1,
      body: Center(
        child: SpinKitCircle(
          color: kPrimaryColor,
          size: 50.0,
        ),
      ),
    );
  }
}
