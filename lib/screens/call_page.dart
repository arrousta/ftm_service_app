import 'package:flutter/material.dart';
import 'package:ftm_service_app/services/translations.dart';
import 'package:url_launcher/url_launcher.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key}) : super(key: key);

  _launcherCaller(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Material(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/images/ftm.png"),
                  height: 100,
                ),
                const SizedBox(
                  height: 26,
                ),
                Text(Translations.of(context).text("call_number")),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () => _launcherCaller(
                      Translations.of(context).text("tel1_local_code")),
                  child: Text(
                    Translations.of(context).text("tel1"),
                    locale: Locale('EN'),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 4,
                      locale: Locale('en'),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _launcherCaller(
                      Translations.of(context).text("tel2_local_code")),
                  child: Text(
                    Translations.of(context).text("tel2"),
                    locale: Locale('EN'),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 4,
                      locale: Locale('en'),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _launcherCaller(
                      Translations.of(context).text("tel3_local_code")),
                  child: Text(
                    Translations.of(context).text("tel3"),
                    locale: Locale('EN'),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 4,
                      locale: Locale('en'),
                    ),
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
//test a commit form Alireza