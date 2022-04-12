import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/main.dart';
import 'package:ftm_service_app/screens/profile/component/avatar_and_name.dart';
import 'package:ftm_service_app/screens/profile/profile_page.dart';
import 'package:ftm_service_app/widgets/persian_date.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);


  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  //---------------------Data And Time------------------------------------------

  String shiftNumber = "";
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
      partOfDay = "شیفت کاری اول";
    } else if (14 <= _hour && _hour < 22) {
      partOfDay = "شیفت کاری دوم";
    } else {
      partOfDay = "شیفت کاری سوم";
    }
    if (mounted) {
      setState(() {
        _timeString = formattedTime;
        shiftNumber = partOfDay;
      });
    }
  }

  String convertDate(String date) {
    PersianDate pDate = PersianDate(gregorian: date, format: 'dd MM yyyy');
    return pDate.getDate;
  }
  String _name = '';

  @override
  void initState() {
    super.initState();

    _name = MyApp.data.firstName;
    _name += ' ';
    _name += MyApp.data.lastName;

    _dateString = _formatDate(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _setDate());
    _timeString = _formatTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _setTime());
  }

  //----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 170,
      margin: const EdgeInsets.symmetric(horizontal: 24.5, vertical: 12),
      decoration: panelPlateDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: AvatarAndName(
                  name: _name,
                  avatarSize: 40,
                  fontSize: 17,
                ),
                onTap: () async {
                  await Navigator.push(
                    context,
                    PageTransition(
                      child: MiCard(),
                      type: PageTransitionType.leftToRight,
                    ),
                  );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _timeString.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 50.0),
                  ),
                  Text(
                    convertDate(_dateString.toString()),
                    // _dateString.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 19.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    shiftNumber,
                    style: const TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
            width: 160.0,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
           Text(
            MyApp.data.state,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
