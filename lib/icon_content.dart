import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({Key? key, required this.icon, required this.label}) : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          //FontAwesomeIcons.mars,
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
