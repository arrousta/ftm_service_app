import 'package:flutter/material.dart';
import 'package:ftm_service_app/constructor.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    Key? key,
    required this.label,
    this.iconAddress,
  }) : super(key: key);
  final String? iconAddress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            backgroundColor: kPrimaryColor,
            child: Image(
              image: AssetImage(iconAddress ?? ""),
              width: 80,
              height: 80,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          flex: 1,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18.0,
              color: kTextPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
