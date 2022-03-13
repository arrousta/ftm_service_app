import 'package:flutter/material.dart';

//Colors used in project
const Color kBackgroundColor1 = Color(0xfff4f7fa);
const Color kBackgroundColor2 = Colors.white;
const Color kBackgroundColor3 = Color(0xffdbdbde);
//  const Color primaryColor = Colors.green;
const Color kPrimaryColor = Color(0xff4469c6);
const Color kWhite = Colors.white;
const Color kTextDark = Colors.black54;
const Color kTextPrimary = Color(0xFF222222);
const Color kTextHint = Color(0xFF555555);

//////////////////////////////
//////////Size////////////////
//////////////////////////////

const kFieldSizeWith = 105.0;
const kFieldSizeHeight = 35.0;

const kBoxSizeWith = 115.0;
const kBoxSizeHeight = 45.0;

//Text Style
//TODO : App Logo Style :
const kLogoStyle = TextStyle(
    fontFamily: 'Pacifico',
    fontSize: 30,
    color: Colors.black54,
    letterSpacing: 5);

const kLogoWhiteStyle = TextStyle(
    fontFamily: 'Pacifico',
    fontSize: 21,
    letterSpacing: 2,
    color: Colors.white);
const kTextWhite = TextStyle(color: Colors.white, fontFamily: 'Poppins');
const kTextDisabled = TextStyle(color: Colors.grey, fontFamily: 'Poppins');
const kTextContrast = TextStyle(color: kPrimaryColor, fontFamily: 'Poppins');
const kTextBoldContrast = TextStyle(
    color: kPrimaryColor, fontFamily: 'Poppins', fontWeight: FontWeight.w600);

const kHeader3 = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w800,
    fontFamily: 'Poppins');

const kHeader4 = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins');

const kHeader5 = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins');

const kHeader6 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins');

const kHeader7 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins-Regular');

const kTextPrice = TextStyle(
    color: Colors.black,
    fontSize: 19,
    fontWeight: FontWeight.w800,
    fontFamily: 'Poppins');

const kTextName = TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins');

const tabLinkStyle = TextStyle(fontWeight: FontWeight.w500);

const taglineText = TextStyle(color: Colors.grey, fontFamily: 'Poppins');
const taglineText2 = TextStyle(color: Colors.red, fontFamily: 'Poppins');
const categoryText = TextStyle(
    color: Color(0xff444444),
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins');

const inputFieldTextStyle =
    TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500, color: kTextPrimary);

const inputFieldHintTextStyle =
    TextStyle(fontFamily: 'Poppins', color: Color(0xff444444));

const inputFieldPasswordTextStyle = TextStyle(
    fontFamily: 'Poppins', fontWeight: FontWeight.w500, letterSpacing: 3);

const inputFieldHintPasswordTextStyle = TextStyle(
    fontFamily: 'Poppins', color: Color(0xff444444), letterSpacing: 2);

const inputFieldTextStyleDispenser = TextStyle(
    fontFamily: 'Yekan', fontWeight: FontWeight.w100, color: Color(0xFF222222));

const inputFieldHintTextStyleDispenser = TextStyle(
  fontFamily: 'Yekan',
  fontSize: 14,
  color: kTextHint,
);

///////////////////////////////////
/// BOX DECORATION STYLES
//////////////////////////////////

const authPlateDecoration = BoxDecoration(
    color: kWhite,
    boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, .1),
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, 1))
    ],
    borderRadius: BorderRadiusDirectional.only(
        bottomEnd: Radius.circular(20), bottomStart: Radius.circular(20)));

const dispenserPlateDecoration = BoxDecoration(
    color: kWhite,
    boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, .1),
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, 1))
    ],
    borderRadius: BorderRadiusDirectional.all(Radius.circular(8)));

/////////////////////////////////////
/// INPUT FIELD DECORATION STYLES
////////////////////////////////////

const inputFieldFocusedBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
    borderSide: BorderSide(
      color: kPrimaryColor,
    ));

const inputFieldDefaultBorderStyle = OutlineInputBorder(
    gapPadding: 0, borderRadius: BorderRadius.all(Radius.circular(6)));
