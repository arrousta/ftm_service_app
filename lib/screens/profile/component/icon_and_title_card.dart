import 'package:flutter/material.dart';
class IconAndTitleCard extends StatelessWidget {
  const IconAndTitleCard({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.teal.shade900,
          size: 20.0,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.teal.shade900, fontSize: 20.0),
        ),
      ),
    );
  }
}