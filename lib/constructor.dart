import 'package:flutter/material.dart';

const URL = "https://www.test.helyasi.ir";

//Colors used in project
const Color kLightBackgroundColor = Color(0xfff4f7fa);
const Color kDarkBackgroundColor = Color(0xffdbdbde);
const Color kPrimaryColor = Color(0xff4469c6);
const Color kTextDarkColor = Colors.black54;
const Color kTextWhiteColor = Colors.white;
const Color kTextPrimaryColor = Color(0xFF222222);
const Color kTextHintColor = Color(0xFF555555);
const Color kErrorColor = Color(0xD2911C1C);
const Color kBoxBackgroundColor = Color(0xFFA0A0A0);

const Color kRedColor = Color(0xAAE42825);
const Color kGreenColor = Color(0xFF5CBA95);

//////////////////////////////
//////////Size////////////////
//////////////////////////////

const kFieldSizeWith = 125.0;
const kFieldSizeHeight = 35.0;

const kBoxSizeWith = 135.0;
const kBoxSizeHeight = 45.0;



//////////////////////////////
//////////Text Style//////////
//////////////////////////////

const kMainTextStyle = TextStyle(
color: kTextPrimaryColor,
fontFamily: 'Yekan',
fontSize: 14.0,
fontWeight: FontWeight.w700
);

///////////Text Style/////////
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
const kTextBoldContrast =
    TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w300);

const kHeader3 = TextStyle(
  color: Colors.black,
  fontSize: 24,
  fontWeight: FontWeight.w800,
);

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

const kAttention = TextStyle(
  color: Colors.red,
  fontSize: 19,
  fontWeight: FontWeight.w600,
);

const tabLinkStyle = TextStyle(fontWeight: FontWeight.w500);

const taglineText = TextStyle(
  color: Colors.grey,
);
const taglineText2 = TextStyle(color: Colors.red, fontFamily: 'Poppins');

const categoryText = TextStyle(
    color: Color(0xff444444),
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins');

const inputFieldTextStyle = TextStyle(
    fontWeight: FontWeight.w500, color: kTextPrimaryColor, letterSpacing: 2);

const inputFieldHintTextStyle = TextStyle(
  color: Color(0xff444444),
);

const inputFieldPasswordTextStyle =
    TextStyle(fontWeight: FontWeight.w500, letterSpacing: 3,locale: Locale('en'));

const inputFieldHintPasswordTextStyle = TextStyle(
  color: Color(0xff444444),
);

const inputFieldTextStyleDispenser = TextStyle(
  fontFamily: 'Yekan',
  fontWeight: FontWeight.w100,
  color: kTextPrimaryColor,
);

const inputFieldHintTextStyleDispenser = TextStyle(
  fontFamily: 'Yekan',
  fontSize: 14,
  color: kTextHintColor,
);

///////////////////////////////////
/// BOX DECORATION STYLES
//////////////////////////////////

const authPlateDecoration = BoxDecoration(
    color: kLightBackgroundColor,
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
  color: kLightBackgroundColor,
  boxShadow: [
    BoxShadow(
        color: Color.fromRGBO(0, 0, 0, .1),
        blurRadius: 10,
        spreadRadius: 5,
        offset: Offset(0, 1))
  ],
  borderRadius: BorderRadiusDirectional.all(
    Radius.circular(8),
  ),
);

const dispensersPlateDecoration = BoxDecoration(
  color: Color(0xFFBBBBBB),
  boxShadow: [
    BoxShadow(
        color: Color.fromRGBO(0, 0, 0, .1),
        blurRadius: 10,
        spreadRadius: 5,
        offset: Offset(0, 1))
  ],
  borderRadius: BorderRadiusDirectional.all(
    Radius.circular(8),
  ),
);

//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
const panelPlateDecoration = BoxDecoration(
    color: Colors.blueGrey,
    boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, .3),
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, 5))
    ],
    borderRadius: BorderRadiusDirectional.all(Radius.circular(8)));

const buttonPanelPlateDecoration = BoxDecoration(
  color: kLightBackgroundColor,
  boxShadow: [
    BoxShadow(
        color: Color.fromRGBO(0, 0, 0, .3),
        blurRadius: 6,
        spreadRadius: 4,
        offset: Offset(0, 3))
  ],
  borderRadius: BorderRadiusDirectional.all(
    Radius.circular(8),
  ),
);
//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

/////////////////////////////////////
/// INPUT FIELD DECORATION STYLES
////////////////////////////////////

const inputFieldFocusedBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(6),
  ),
  borderSide: BorderSide(
    color: kPrimaryColor,

  ),
);

const inputFieldDefaultBorderStyle = OutlineInputBorder(
  gapPadding: 0,
  borderRadius: BorderRadius.all(
    Radius.circular(6),
  ),
);
