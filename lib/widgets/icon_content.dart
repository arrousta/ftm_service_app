import 'package:flutter/material.dart';
import 'package:ftm_service_app/constructor.dart';

class IconContent extends StatefulWidget {
  const IconContent(
      {Key? key,
      required this.label,
      required this.iconAddress,
      required this.color,
      required this.onPress})
      : super(key: key);
  final String? iconAddress;
  final String label;
  final Color? color;
  final Function()? onPress;

  @override
  State<IconContent> createState() => _IconContentState();
}

class _IconContentState extends State<IconContent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        height: 190,
        width: 110,
        margin: const EdgeInsets.symmetric(horizontal: 24.5, vertical: 12),
        decoration: BoxDecoration(
          color: widget.color,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: CircleAvatar(
                radius: 45,
                backgroundColor: kLightBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Image(
                    image: AssetImage(widget.iconAddress ?? ""),
                    width: 70,
                    height: 70,
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
                  widget.label,
                  style: kMainTextStyle,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
