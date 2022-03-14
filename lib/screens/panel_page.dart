import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ftm_service_app/constractor.dart';
import 'package:ftm_service_app/screens/start_shift_page.dart';
import 'package:intl/intl.dart';
import 'package:intl/locale.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../icon_content.dart';
import '../reusable_card.dart';
import 'loading_page.dart';

enum ShiftName { morning, evening, night }

class PanelPage extends StatefulWidget {
  const PanelPage({
    Key? key,
    required this.operator,
  }) : super(key: key);
  final String operator;

  @override
  State<PanelPage> createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> {
  String shiftName = " ";
  String? _timeString;
  String? _dateString;

  void _getTime() {
    final String formattedTime =
        DateFormat('kk : mm').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedTime;
    });
  }

  void _getDate() {
    final String formattedDate =
        DateFormat('yyyy / MM / dd').format(DateTime.now()).toString();
    setState(() {
      _dateString = formattedDate;
    });
  }

  @override
  void initState() {
    shiftName = widget.operator;
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getDate());
  }

//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
  //TODO Alireza : LogOut Function for delete user data :
  void _handleLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    //Navigator.pushNamed(context, '/login');
    print("username deleted");
    Navigator.pushNamedAndRemoveUntil(
        context, '/home', ModalRoute.withName('/home'));
  }
//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //-------------------------------------------------------------------------------------------
              ReusableCard(
                colour: kTextHint,
                cardChild: Container(
                  height: 150.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.operator,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Poppins',
                              )),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _dateString.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
                                fontFamily: 'Poppins'),
                          ),
                          Text(
                            _timeString.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 39.0,
                                fontFamily: 'Poppins'),
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
                        //TODO : START SHIFT button
                        setState(() {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const StartShift(
                                title: 'StartShift',
                              ),
                            ),
                          );
                        });
                      },
                      colour: kPrimaryColor,
                      cardChild: const IconContent(
                        icon: Icons.check,
                        label: 'START SHIFT',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        //TODO : END SHIFT button
                        setState(() {
                          // PageTransition(
                          //     type: PageTransitionType.rightToLeft,
                          //     child: LoadingPage(
                          //       //operatorName: name,
                          //       operatorName: 'alireza',
                          //     ));
                        });
                      },
                      colour: kPrimaryColor,
                      cardChild: const IconContent(
                        icon: Icons.call_missed_outgoing,
                        label: 'END SHIFT',
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

                        setState(() {});
                      },
                      colour: kPrimaryColor,
                      cardChild: const IconContent(
                        icon: Icons.account_box_outlined,
                        label: 'PROFILE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        //TODO : TAKE LEAVE button
                        setState(() {});
                      },
                      colour: kPrimaryColor,
                      cardChild: const IconContent(
                        icon: Icons.free_breakfast_outlined,
                        label: 'TAKE LEAVE',
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
                        //TODO : LOG OUT button
                        setState(() {
                          _handleLogout();
                        });
                      },
                      colour: kPrimaryColor,
                      cardChild: const IconContent(
                        icon: Icons.logout,
                        label: 'LOG OUT',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        //TODO : SETTING button
                        setState(() {});
                      },
                      colour: kPrimaryColor,
                      cardChild: const IconContent(
                        icon: Icons.settings,
                        label: 'SETTING',
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
}
