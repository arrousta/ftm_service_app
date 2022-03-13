import 'package:flutter/material.dart';

import 'constractor.dart';

class ReusableCard extends StatelessWidget {
  //const ReusableCard({Key? key,}) : super(key: key);
  const ReusableCard({Key? key, required this.colour, required this.cardChild , required this.onPress}) : super(key: key);

  final Color colour;
  final Widget cardChild;
  final Function()? onPress;
  //final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
