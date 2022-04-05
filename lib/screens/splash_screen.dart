import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/screens/home_page.dart';
import 'package:ftm_service_app/services/shared_preference.dart';
import 'package:ftm_service_app/structures/user.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.version}) : super(key: key);
  final String version;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<User>? futureUser;
  String _username = "";
  String version = "نسخه: ";

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

  // @override
  // void initState() {
  //   // futureUser = fetchData();
  //   getInternetStatus();
  //   super.initState();
  // }

  _loadUserInfo() async {
    SharedPreference sharedPreference = SharedPreference();
    _username = await sharedPreference.read('username');
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
    Duration duration = const Duration(seconds: 3);
    await Future.delayed(duration, () {
      //*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
      _loadUserInfo();
      //*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
    });
  }

  @override
  void initState() {
    getInternetStatus();

    version = version + widget.version;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "ftm-logo",
              child: Image.asset('assets/images/ftm-logo.png',
                  width: 260, height: 70),
            ),
            Image.asset('assets/images/ftm-type.png', width: 160, height: 70),
            const SpinKitCircle(
              color: Colors.indigo,
              size: 50.0,
            ),
            const SizedBox(
              height: 100,
            ),
            Text(
              version,
              style: const TextStyle(color: kPrimaryColor),
            ),
            // (futureUser == null) ? BuildButtonReload() : futureBuilderGet(context),
          ],
        ),
      ),
    );
  }

  TextButton BuildButtonReload() {
    return TextButton(
      onPressed: () {},
      child: const Text("Reload"),
    );
  }
}
