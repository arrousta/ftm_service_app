import 'package:flutter/material.dart';
import 'package:ftm_service_app/main.dart';
import 'package:ftm_service_app/services/translations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'avatar_and_name.dart';
import 'icon_and_title_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String _userName;
  late String _phone;
  late String _userId;
  late String _role;

  @override
  void initState() {
    super.initState();

    _userName = MyApp.data.firstName;
    _userName += ' ';
    _userName += MyApp.data.lastName;

    _loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AvatarAndName(
              name: _userName,
              avatarSize: 50,
              fontSize: 40,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              getTranslated(context, "welcome_home"),
              style: TextStyle(
                fontFamily: 'Yekan',
                fontSize: 20.0,
                color: Colors.teal.shade100,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            IconAndTitleCard(
              title: _role,
              icon: Icons.verified_user_outlined,
            ),
            const SizedBox(
              width: 10.0,
            ),
            IconAndTitleCard(
              title: _phone,
              icon: Icons.call,
            ),
            const SizedBox(
              width: 10.0,
            ),
            IconAndTitleCard(
              title: _userId,
              icon: Icons.credit_card,
            ),
          ],
        ),
      ),
    );
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _phone = MyApp.data.phone;
      _userId = MyApp.data.userId;

      String userRole = MyApp.data.role;

      if (userRole == 'admin') {
        _role = 'سرپرست';
      }
      if (userRole == 'operator') {
        _role = 'اپراتور';
      }
    });
  }
}
