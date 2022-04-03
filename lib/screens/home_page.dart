import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/screens/call_page.dart';
import 'package:ftm_service_app/screens/info_page.dart';
import 'package:ftm_service_app/screens/loading_page.dart';
import 'package:ftm_service_app/screens/profile_page.dart';
import 'package:ftm_service_app/screens/welcome_page.dart';
import 'package:ftm_service_app/services/shared_preference.dart';
import 'package:intl/intl.dart';
import 'package:ftm_service_app/widgets/persian_date.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/icon_content.dart';
import '../widgets/reusable_card.dart';
import '../services/translations.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.operatorName,
  }) : super(key: key);
  final String operatorName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBackgroundColor,
      appBar: AppBar(
        backgroundColor: kLightBackgroundColor,
        elevation: 0,
        foregroundColor: kTextDarkColor,
        actions: <Widget>[
          const Image(
            height: 80,
            width: 80,
            image: AssetImage("assets/images/ftm-logo.png"),
          ),
          const SizedBox(
            width: 110,
          ),
          IconButton(
            icon: Image.asset("assets/icon/notifications-off.png"),
            onPressed: () {},
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
                      const CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.blue,
                        child: Image(
                          image: AssetImage("assets/images/user.png"),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        Translations.of(context).text("hi_user"),
                      ),
                      const Divider(),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          Translations.of(context).text("log_out"),
                          style: TextStyle(color: kErrorColor, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.call),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(Translations.of(context).text("contact_us")),
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
                  Icon(Icons.info),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text(Translations.of(context).text("about")),
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
      body: HomePageBody(operatorName: operatorName),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    Key? key,
    required this.operatorName,
  }) : super(key: key);
  final String operatorName;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  SharedPreference sharedPreference = SharedPreference();
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

  void _handleLogout() async {
    sharedPreference.remove("username");
    Navigator.pushReplacement(
      context,
      PageTransition(
          child: const WelcomePage(), type: PageTransitionType.leftToRight),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //-------------------------------------------------------------------------------------------
              ReusableCard(
                colour: kLightBackgroundColor,
                onPress: () {},
                cardChild: Container(
                  height: 150.0,
                  decoration: panelPlateDecoration,
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
                                    AssetImage("assets/images/user.png"),
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
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ReusableCard(
                    colour: kGreenColor,
                    cardChild: IconContent(
                      iconAddress: "assets/icon/gas-green.png",
                      label: Translations.of(context).text("start_shift"),
                    ),
                    onPress: () {
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: LoadingPage(
                                keyPage: 'start',
                                operatorName: widget.operatorName,
                              )),
                        );
                      });
                    },
                  ),
                  ReusableCard(
                    colour: kRedColor,
                    cardChild: IconContent(
                      iconAddress: "assets/icon/gas-red.png",
                      label: Translations.of(context).text("end_shift"),
                    ),
                    onPress: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: LoadingPage(
                                keyPage: 'end',
                                operatorName: widget.operatorName,
                              ),
                              type: PageTransitionType.rightToLeft));
                    },
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              child: MiCard(),
                              type: PageTransitionType.leftToRight),
                        );
                      },
                      colour: kBoxBackgroundColor,
                      cardChild: IconContent(
                        iconAddress: "assets/icon/engineer.png",
                        label: Translations.of(context).text("profile"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        //TODO : TAKE LEAVE button
                      },
                      colour: kBoxBackgroundColor,
                      cardChild: IconContent(
                        iconAddress: "assets/icon/letter.png",
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
                      colour: kBoxBackgroundColor,
                      cardChild: IconContent(
                        iconAddress: "assets/icon/flame.png",
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
                      colour: kBoxBackgroundColor,
                      cardChild: IconContent(
                        iconAddress: "assets/icon/maintenance.png",
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
