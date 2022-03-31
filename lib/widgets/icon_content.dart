import 'package:flutter/material.dart';
import 'package:ftm_service_app/constructor.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    Key? key,
    required this.label,
    required this.iconAddress,
  }) : super(key: key);
  final String? iconAddress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: kLightBackgroundColor,
              child: CircleAvatar(
                backgroundColor: kPrimaryColor,
                child: Image(
                  image: AssetImage(iconAddress ?? ""),
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(6),
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: buttonPanelPlateDecoration,
              child: Text(
                label,
                style: kMainTextStyle,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
