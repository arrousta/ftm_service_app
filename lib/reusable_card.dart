import 'package:flutter/material.dart';

import 'constructor.dart';

class ReusableCard extends StatelessWidget {
  //const ReusableCard({Key? key,}) : super(key: key);
  const ReusableCard({Key? key, required this.colour, required this.cardChild , required this.onPress}) : super(key: key);

  final Color colour;
  final Widget cardChild;
  final Function()? onPress;
  //final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.black26,
      splashColor: Colors.lightBlue.shade600,
      focusColor: Colors.blue,
      highlightColor: Colors.blueGrey.shade700,
      onTap: onPress,
      child: Container(
        height: 160,
        child: cardChild,
        margin: const EdgeInsets.all(14.5),
          decoration: buttonPanelPlateDecoration,
      ),
    );
  }
}
