import 'package:flutter/material.dart';
import 'package:ftm_service_app/constractor.dart';
import '../icon_content.dart';
import '../reusable_card.dart';

enum ShiftName { morning, evening, night }

class PanelPage extends StatefulWidget {
  const PanelPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PanelPage> createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> {
  String shiftName = "null";

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
                        children: const [
                          Text("Zahra Nematollahi",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Poppins',
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "22 / 12 / 1400",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "12:33:25",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
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
                        setState(() {});
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
                        setState(() {});
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
                        setState(() {});
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
