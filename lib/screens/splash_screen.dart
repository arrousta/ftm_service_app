import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/main.dart';
import 'package:ftm_service_app/screens/home/home_page.dart';
import 'package:ftm_service_app/services/network_adapter.dart';
import 'package:ftm_service_app/services/shared_preference.dart';
import 'package:ftm_service_app/services/translations.dart';
import 'package:ftm_service_app/structures/data_structures.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.version}) : super(key: key);
  final String version;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<DataStructures>? dataResponse;

  String _username = "";
  String _auth = "";
  String version = "نسخه: ";

  bool flag = false;

  Future<String> getResponse({String auth = ''}) async {
    String response = "logout";

    if (auth != '') {
      dataResponse = connect(auth: auth);

      await dataResponse!.then((value) {
        MyApp.data = value;
        response = "ok";
      }, onError: (e) {
        if (e.toString().startsWith('NoSuchMethodError')) {
          print(e.toString());
          response = "er-pass";
        } else if (e.toString().startsWith('SocketException')) {
          response = "er-internet";
        } else {
          print("**" + e.toString());
          response = "onError";
        }
      });
    }
    return response;
  }

  void getDataServer() async {
    Duration duration = const Duration(seconds: 3);

    await Future.delayed(duration, () async {
      SharedPreference sharedPreference = SharedPreference();
      _username = await sharedPreference.read('username');
      _auth = await sharedPreference.read('token');

      if (_username == '' || _auth == '') {
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign_in', ModalRoute.withName('/sign_in'));
      } else {
        getResponse(auth: _auth).then(
          (value) {
            if (value == 'ok') {
              String name = "";
              String token = "";

              token = MyApp.data.token ?? "**null token";

              if (MyApp.data.firstName == null) {
                showSnackBar(
                    context, 'Personnel Code or Password is incorrect');
              } else {
                name += MyApp.data.firstName ?? "name error";
                name += " ";
                name += MyApp.data.lastName ?? "name error";
                sharedPreference.save("username", name);

                sharedPreference.save("token", token);

                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: HomePage(),
                  ),
                );
              }
            } else if (value == 'er-pass') {
              flag = false;
              setState(() {});
              showSnackBar(
                context,
                getTranslated(context, 'snackBar_Login_Error'),
              );
            } else if (value == 'er-internet') {
              flag = false;
              setState(() {});
              showSnackBar(context, "اتصال اینترنت را بررسی کنید");
            } else if (value == 'onError') {
              flag = false;
              setState(() {});
              showSnackBar(context, "خطای نامشخص!");
            }
          },
        ).catchError((e) {
          print(e);
          flag = false;
          setState(() {});
          showSnackBar(context, e.toString());
        });
      }
    });
  }

  @override
  void initState() {
    getDataServer();
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
          ],
        ),
      ),
    );
  }

  ElevatedButton buildButtonReload() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('تلاش مجدد'),
    );
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
}
