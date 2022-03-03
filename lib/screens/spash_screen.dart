import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ftm_service_app/screens/home_page.dart';
import 'package:ftm_service_app/widgets/buttons.dart';
import 'package:ftm_service_app/constractor.dart';

import 'package:page_transition/page_transition.dart';
import 'sign_up_page.dart';
import 'sing_in_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getInternetStatus();
  }


  void getInternetStatus() async {
    Duration duration = const Duration(seconds: 3);
    await Future.delayed(duration,() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomePage(
              pageTitle: "Home",
            );
          },
        ),
          (route) => false,
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/ftm.png', width: 260, height: 210),
          const SpinKitCircle(
            color: Colors.indigo,
            size: 50.0,
          ),
        ],
      )),
      backgroundColor: bgColor2,
    );
  }
}
