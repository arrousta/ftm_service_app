import 'package:flutter/material.dart';

class AvatarAndName extends StatelessWidget {
  const AvatarAndName({
    Key? key,
    required this.name,
    required this.avatarSize,
    required this.fontSize,
  }) : super(key: key);

  final String name;
  final double avatarSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         CircleAvatar(
          radius: avatarSize,
          backgroundColor: Colors.red,
          backgroundImage: AssetImage('assets/images/user.png'),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Yekan',
            fontSize: fontSize,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
