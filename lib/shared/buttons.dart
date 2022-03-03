import 'package:flutter/material.dart';
import './colors.dart';

TextButton ftmFlatBtn(String text, onPressed) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: const TextStyle(color: white),
    ),
    style: TextButton.styleFrom(
      primary: primaryColor,
      backgroundColor: const Color(0xff4469c6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
  );
}

OutlinedButton ftmOutlineBtn(String text, onPressed) {
  return OutlinedButton(
    onPressed: onPressed,
    child: Text(text, style: const TextStyle(color: primaryColor)),
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: primaryColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
  );
}
