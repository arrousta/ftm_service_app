import 'package:flutter/material.dart';
import 'package:ftm_service_app/services/translations.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;


class CallPage extends StatelessWidget {
  const CallPage({Key? key}) : super(key: key);

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

                Text(getTranslated(context, "call_number"),),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () => UrlLauncher.launch(
                    getTranslated(context, "tel1_local_code"),),
                  child: Text(
                    getTranslated(context, "tel1"),
                    locale: const Locale('EN'),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 4,
                      locale: Locale('en'),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => UrlLauncher.launch(
                    getTranslated(context, "tel2_local_code"),),
                  child: Text(
                    getTranslated(context, "tel2"),
                    locale: Locale('EN'),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 4,
                      locale: Locale('en'),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => UrlLauncher.launch(
                    getTranslated(context, "tel3_local_code"),),
                  child: Text(
                      getTranslated(context, "tel3"),
                    locale: const Locale('EN'),
                    style: const TextStyle(
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