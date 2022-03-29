import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/screens/home_page.dart';
import 'package:ftm_service_app/structures/user.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<User> futureUser;
  String _username = "";

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

  // String futureGet() {
  //   futureUser = fetchData();
  //   futureUser.then((value) {
  //     if (value.name != null) {
  //       print(value.name);
  //       return value.name;
  //     }
  //   });
  //   return "null";
  // }

  @override
  void initState() {
    // futureUser = fetchData();
    getInternetStatus();
    super.initState();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _username = (prefs.getString('username') ?? "");
    if (_username == "") {
      Navigator.pushNamedAndRemoveUntil(
          context, '/welcome', ModalRoute.withName('/welcome'));
    } else {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.leftToRightWithFade,
          duration: const Duration(seconds: 1),
          child: HomePage(
            operatorName: _username,
          ),
        ),
      );
    }
  }

  void getInternetStatus() async {
    // String operator = futureGet();
    Duration duration = const Duration(seconds: 1);
    await Future.delayed(duration, () {
      //*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
      _loadUserInfo();
      //*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
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
          Image.asset('assets/images/ftm.png', width: 260, height: 210),
          const SpinKitCircle(
            color: Colors.indigo,
            size: 50.0,
          ),
          // (futureUser == null) ? BuildButtonReload() : futureBuilderGet(context),
        ],
      )),
      backgroundColor: kBackgroundColor2,
    );
  }

  TextButton BuildButtonReload() {
    return TextButton(onPressed: () {}, child: const Text("Reload"));
  }
}
