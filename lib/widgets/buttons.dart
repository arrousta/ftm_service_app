import 'package:flutter/material.dart';

import '../constractor.dart';

TextButton ftmFlatBtn(String text, onPressed) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: const TextStyle(color: kWhite),
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
