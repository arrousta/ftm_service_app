import 'package:flutter/material.dart';
import 'package:ftm_service_app/constructor.dart';

class OutlineTextCard extends StatelessWidget {
  const OutlineTextCard({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: kPrimaryColor, width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        alignment: Alignment.center,
        width: kBoxSizeWith,
        height: kBoxSizeHeight,
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: 'Yekan',
          ),
        ),
      ),
    );
  }
}