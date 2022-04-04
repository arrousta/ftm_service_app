import 'package:flutter/material.dart';

import '../constructor.dart';

class ReusableCard extends StatelessWidget {
  //const ReusableCard({Key? key,}) : super(key: key);
  const ReusableCard(
      {Key? key,
      required this.colour,
      required this.cardChild,
      required this.onPress})
      : super(key: key);

  final Color colour;
  final Widget cardChild;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: onPress,
      child: Container(
        height: 170,
        margin: const EdgeInsets.symmetric(horizontal: 24.5, vertical: 12),
        decoration: BoxDecoration(
          color: colour,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .3),
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: const BorderRadiusDirectional.all(
            Radius.circular(8),
          ),
        ),
          child: cardChild,
      ),
    );
  }
}
