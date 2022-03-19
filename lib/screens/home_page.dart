import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/screens/loading_page.dart';
import 'package:ftm_service_app/screens/welcome_page.dart';
import 'package:intl/intl.dart';
import 'package:ftm_service_app/persian_date.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../icon_content.dart';
import '../reusable_card.dart';
import '../translations.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.operatorName,
  }) : super(key: key);
  final String operatorName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String operatorName = "";

  //---------------------Data And Time------------------------------------------
  String shiftName = "";
  String? _timeString;
  String? _dateString;

  String _formatDate(DateTime dateTime) {
    return DateFormat('yyyy/MM/dd').format(dateTime);
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  void _setDate() {
    final DateTime now = DateTime.now();
    final String formattedDate = _formatDate(now);
    if (mounted) {
      setState(() {
        _dateString = formattedDate;
      });
    }
  }

  void _setTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = _formatTime(now);
    String hour = "";
    late String partOfDay;

    for (int i = 0; i < 2; i++) {
      hour += formattedTime[i];
    }
    int _hour = int.parse(hour);

    if (7 <= _hour && _hour < 14) {
      partOfDay = "شیفت کاری صبح";
    } else if (14 <= _hour && _hour < 22) {
      partOfDay = "شیفت کاری عصر";
    } else {
      partOfDay = "شیفت کاری شب";
    }
    if (mounted) {
      setState(() {
        _timeString = formattedTime;
        shiftName = partOfDay;
      });
    }
  }

  String convertDate(String date) {
    PersianDate pDate = PersianDate(gregorian: date, format: 'dd MM yyyy');
    return pDate.getDate;
  }

  //----------------------------------------------------------------------------

  @override
  void initState() {
    operatorName = widget.operatorName;
    _dateString = _formatDate(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _setDate());
    _timeString = _formatTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _setTime());

    super.initState();
  }

//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
  void _handleLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    Navigator.pushReplacement(
      context,
      PageTransition(
          child: const WelcomePage(), type: PageTransitionType.leftToRight),
    );
  }
//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: kBackgroundColor2,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //-------------------------------------------------------------------------------------------
                ReusableCard(
                  colour: kBackgroundColor2,
                  cardChild: Container(
                    height: 150.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const CircleAvatar(
                                  radius: 40.0,
                                  backgroundColor: Colors.blue,
                                  backgroundImage:
                                      AssetImage("images/user.png"),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  operatorName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _timeString.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 50.0),
                                ),
                                Text(
                                  convertDate(_dateString.toString()),
                                  // _dateString.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 19.0),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  shiftName,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: panelPlateDecoration,
                  ),
                  onPress: () {},
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: LoadingPage(
                                    id: 'start',
                                    operatorName: widget.operatorName,
                                  )),
                            );
                          });
                        },
                        colour: kPrimaryColor,
                        cardChild: IconContent(
                          icon: Icons.check,
                          label: Translations.of(context).text("start_shift"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: LoadingPage(
                                    id: 'end',
                                    operatorName: widget.operatorName,
                                  ),
                                  type: PageTransitionType.rightToLeft));
                        },
                        colour: kPrimaryColor,
                        cardChild: IconContent(
                          icon: Icons.call_missed_outgoing,
                          label: Translations.of(context).text("end_shift"),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          //TODO : PROFILE button
                        },
                        colour: kPrimaryColor,
                        cardChild: IconContent(
                          icon: Icons.account_box_outlined,
                          label: Translations.of(context).text("profile"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          //TODO : TAKE LEAVE button
                        },
                        colour: kPrimaryColor,
                        cardChild: IconContent(
                          icon: Icons.free_breakfast_outlined,
                          label: Translations.of(context).text("take_leave"),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: kPrimaryColor,
                        cardChild: IconContent(
                          icon: Icons.logout,
                          label: Translations.of(context).text("log_out"),
                        ),
                        onPress: () {
                          setState(() {
                            _handleLogout();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          //TODO : SETTING button
                        },
                        colour: kPrimaryColor,
                        cardChild: IconContent(
                          icon: Icons.settings,
                          label: Translations.of(context).text("setting"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(Translations.of(context).text("close_app_mess")),
            actions: <Widget>[
              TextButton(
                child: Text(Translations.of(context).text("yes")),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
              TextButton(
                child: Text(Translations.of(context).text("no")),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
