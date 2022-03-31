import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

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
            child: Scrollbar(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Image(
                    image: AssetImage("assets/images/ftm.png"),
                    height: 100,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  const Text("شماره تماس:"),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(onPressed: () => _launcherCaller("tel:+989171502049"),
                    child: const Text(
                      "09171502049",
                      locale: Locale('EN'),
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: 4,
                        locale: Locale('en'),
                      ),
                    ),
                  ),
                  TextButton(onPressed: () => _launcherCaller("tel:+989227073767"),
                    child: const Text(
                      "09227073767",
                      locale: Locale('EN'),
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: 4,
                        locale: Locale('en'),
                      ),
                    ),
                  ),
                  TextButton(onPressed: () => _launcherCaller("tel:+989175363564"),
                    child: const Text(
                      "09175363564",
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
      ),
    );
  }
}
