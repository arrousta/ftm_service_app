import 'package:flutter/material.dart';

import '../constructor.dart';

TextButton ftmFlatBtn(String text, onPressed) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: const TextStyle(color: kTextWhiteColor),
    ),
    style: TextButton.styleFrom(
      primary: kPrimaryColor,
      backgroundColor: const Color(0xff4469c6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
  );
}

OutlinedButton ftmOutlineBtn(String text, onPressed) {
  return OutlinedButton(
    onPressed: onPressed,
    child: Text(text, style: const TextStyle(color: kPrimaryColor)),
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: kPrimaryColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
  );
}
