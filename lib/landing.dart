import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Alireza : Added landing function for save user info
class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  String _username = "";

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _username = (prefs.getString('username') ?? "");
    if (_username == "") {
      print("_username is empty");
      //Navigator.pushNamed(context, '/login');
      Navigator.pushNamedAndRemoveUntil(
         // context, '/login', ModalRoute.withName('/login'));
          context, '/home', ModalRoute.withName('/home'));
    } else {
      print("_username is true");
      Navigator.pushNamedAndRemoveUntil(
          context, '/panelpage', ModalRoute.withName('/panelpage'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
