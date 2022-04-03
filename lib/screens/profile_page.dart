import 'package:flutter/material.dart';
import 'package:ftm_service_app/services/network_adapter.dart';
import 'package:ftm_service_app/services/translations.dart';
import 'package:ftm_service_app/structures/user.dart';

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

class _BodyState extends State<Body> {
  User user = User();
  Future<User>? futureInputUsers;
  String userName = "کاربر";
  String userPhone = "+98 ";


  Future<bool> futureGet(String _user, String _pass) async {
    futureInputUsers = signInUser(userName: _user, password: _pass);
    await futureInputUsers!.then((value) {
      print(value.phone);

      if (value.firstName != null) {
        user.firstName = value.firstName;
        user.lastName = value.lastName;
        user.phone = value.phone;
        user.id = value.id;
        return true;
      }
    });
    return false;
  }

  @override
  void initState() {

    futureGet('1016', "0057").then((value) {
      String fullName = "";
      fullName += user.firstName ?? "fullName error";
      fullName += " ";
      fullName += user.lastName ?? "fullName error";
      if (user.firstName == null) {
        print('Personnel Code or Password is incorrect');
      } else {
        userName = user.firstName!;
        userPhone = user.phone!;
      }
    }).catchError((e) {
      print("**2: error"+e.toString());
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                setState(() {
                  futureGet('1016', "0057").then((value) {
                    String fullName = "";
                    fullName += user.firstName ?? "fullName error";
                    fullName += " ";
                    fullName += user.lastName ?? "fullName error";
                    if (user.firstName == null) {
                      print('Personnel Code or Password is incorrect');
                    } else {
                      userName = user.firstName ?? "کاربر";
                      userPhone = user.phone ?? "0000000";

                      print("**1: "+userPhone);
                    }
                  }).catchError((e) {
                    print("**2: eroor"+e.toString());
                  });
                });
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'سلام، $userName!',
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
              Translations.of(context).text("welcome_home"),
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
                      Icons.call,
                      size: 20.0,
                      color: Colors.teal.shade900,
                    ),
                    const SizedBox(
                      width: 36.0,
                    ),
                    Text(
                      userPhone,
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
                  Icons.mail,
                  color: Colors.teal.shade900,
                  size: 20.0,
                ),
                title: Text(
                  'Ali3nti@gmail.com',
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
