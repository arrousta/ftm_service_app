import 'package:flutter/material.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/main.dart';
import 'package:ftm_service_app/screens/call_page.dart';
import 'package:ftm_service_app/screens/home/components/home_header.dart';
import 'package:ftm_service_app/screens/info_page.dart';
import 'package:ftm_service_app/screens/profile/component/avatar_and_name.dart';
import 'package:ftm_service_app/screens/profile/profile_page.dart';
import 'package:ftm_service_app/screens/sign_in_page.dart';
import 'package:ftm_service_app/screens/welcome_page.dart';
import 'package:ftm_service_app/services/shared_preference.dart';
import 'package:ftm_service_app/services/translations.dart';
import 'package:page_transition/page_transition.dart';

import 'components/body.dart';


class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  void _handleLogout(BuildContext context) async {
    SharedPreference sharedPreference = SharedPreference();

    sharedPreference.remove("username");
    sharedPreference.remove("token");

    Navigator.pushReplacement(
      context,
      PageTransition(
          child: const SignInPage(), type: PageTransitionType.leftToRight),
    );
  }

  String _name = '';


  @override
  Widget build(BuildContext context) {

    _name = MyApp.data.firstName;
    _name += ' ';
    _name += MyApp.data.lastName;

    return Scaffold(
      backgroundColor: kLightBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kLightBackgroundColor,
        elevation: 0,
        foregroundColor: kTextDarkColor,
        actions: <Widget>[
          const Hero(
            tag: "ftm-logo",
            child: Image(
              height: 80,
              width: 80,
              image: AssetImage("assets/images/ftm-logo.png"),
            ),
          ),
          // const SizedBox(
          //   width: 110,
          // ),
          IconButton(
            icon: Image.asset("assets/icon/notifications-off.png"),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                    child: const HomeHeader(
                    ),
                    type: PageTransitionType.leftToRight),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  kDarkBackgroundColor,
                  Colors.blueGrey,
                ]),
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AvatarAndName(
                        name: _name,
                        avatarSize: 30,
                        fontSize: 14,
                      ),
                      const Divider(),
                      GestureDetector(
                        onTap: () {
                          _handleLogout(context);
                        },
                        child: Text(
                          getTranslated(context, 'log_out'),
                          style:
                              const TextStyle(color: kErrorColor, fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.supervised_user_circle),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      getTranslated(context, 'profile'),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageTransition(
                      child: MiCard(), type: PageTransitionType.leftToRight),
                );
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.coffee),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      getTranslated(context, 'take_leave'),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   PageTransition(
                //       child: MiCard(),
                //       type: PageTransitionType.leftToRight),
                // );
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.settings),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      getTranslated(context, 'setting'),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   PageTransition(
                //       child: MiCard(),
                //       type: PageTransitionType.leftToRight),
                // );
                // Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.call),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      getTranslated(context, 'contact_us'),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageTransition(
                      child: const CallPage(),
                      type: PageTransitionType.leftToRight),
                );
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.info),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      getTranslated(context, 'about'),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: const InfoPage(),
                      type: PageTransitionType.rightToLeft),
                );
              },
            ),
          ],
        ),
      ),
      body: Body(),
    );
  }
}
