import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ftm_service_app/screens/home_page.dart';
import 'package:ftm_service_app/constractor.dart';
import 'package:ftm_service_app/services/network_adapter.dart';
import 'package:ftm_service_app/structures/user.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<User> futureUser;

  // FutureBuilder<User> futureBuilderGet(BuildContext context) {
  //   return FutureBuilder<User>(
  //     future: futureUser,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return Navigator(
  //           onGenerateRoute: (settings) {
  //             setState(()  {
  //               Duration duration = const Duration(seconds: 100);
  //               Future.delayed(duration, ()
  //               {
  //                 Navigator.pushReplacement(context, MaterialPageRoute(
  //                   builder: (context) {
  //                     return HomePage(
  //                       pageTitle: snapshot.data!.operator.toString(),
  //                     );
  //                   },
  //                 ),);
  //               });
  //             });
  //           },
  //         );
  //       } else if (snapshot.hasError) {
  //         return Column(
  //           children: [
  //             Text('errrror: ${snapshot.error}'),
  //             // buildButtonReload(),
  //           ],
  //         );
  //       }
  //       // By default, show a loading spinner.
  //       return const SpinKitCircle(
  //         color: Colors.indigo,
  //         size: 50.0,
  //       );
  //     },
  //   );
  // }

  String futureGet() {
    futureUser = fetchUser();
    futureUser.then((value) {
      if (value.operator != null) {
        print(value.operator);
        return value.operator;
      }
    });
    return "null";
  }

  @override
  void initState() {
    super.initState();
    HttpOverrides.global = MyHttpOverrides();
    futureUser = fetchUser();
    getInternetStatus();
  }

  void getInternetStatus() async {
    String operator = futureGet();
    Duration duration = const Duration(seconds: 3);
    await Future.delayed(duration, () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage(
              pageTitle: "operator",
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
          // (futureUser == null) ? BuildButtonReload() : futureBuilderGet(context),

        ],
      )),
      backgroundColor: bgColor2,
    );
  }

  TextButton BuildButtonReload() {
    return TextButton(onPressed: () {}, child: const Text("Reload"));
  }
}
