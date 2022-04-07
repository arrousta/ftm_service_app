import 'package:flutter/material.dart';
import 'package:ftm_service_app/services/translations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constructor.dart';

class MiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

String ? _operatorName;
String ? _phone;
String ? _user_id;
String ? _role;

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _operatorName = (prefs.getString('username')??'');
      _phone = (prefs.getString('phone')??'');
      _user_id = (prefs.getString('user_id')??'');

      String userRole = (prefs.getString('role')??'');
      if(userRole == 'admin'){
        _role = 'سرپرست';
      }
      if(userRole == 'operator'){
        _role = 'اپراتور';
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    //_loadUserInfo();
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: const CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              onTap: () async {
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '$_operatorName',
              style: const TextStyle(
                fontFamily: 'Yekan',
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
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
            Card(
              color: Colors.white,
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.verified_user_outlined,
                      size: 20.0,
                      color: Colors.teal.shade900,
                    ),
                    const SizedBox(
                      width: 36.0,
                    ),
                    Text(
                      '$_role',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 20.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Card(
              color: Colors.white,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.call,
                      size: 20.0,
                      color: Colors.teal.shade900,
                    ),
                    const SizedBox(
                      width: 36.0,
                    ),
                    Text(
                      '$_phone',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 20.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Card(
              color: Colors.white,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.credit_card,
                  color: Colors.teal.shade900,
                  size: 20.0,
                ),
                title: Text(
                  '$_user_id',
                  style: TextStyle(color: Colors.teal.shade900, fontSize: 20.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}