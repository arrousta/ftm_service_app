import 'package:flutter/material.dart';
import './colors.dart';
import './styles.dart';

TextEditingController nameController = TextEditingController(); // Full Name
TextEditingController passwordController = TextEditingController(); // Password
TextEditingController nationalCodeController =
    TextEditingController(); // National code
TextEditingController personnelCodeController =
    TextEditingController(); // Personnel code
TextEditingController phoneNumCodeController =
    TextEditingController(); // Phone Number
TextEditingController confirmCodeController =
    TextEditingController(); // Confirm SMS Code

TextEditingController dispenserA1Controller =
    TextEditingController(); // dispenser A1
TextEditingController dispenserB1Controller =
    TextEditingController(); // dispenser B1
TextEditingController dispenserA2Controller =
    TextEditingController(); // dispenser A2
TextEditingController dispenserB2Controller =
    TextEditingController(); // dispenser B2
TextEditingController dispenserA3Controller =
    TextEditingController(); // dispenser A3
TextEditingController dispenserB3Controller =
    TextEditingController(); // dispenser B3

TextEditingController paymentController =
TextEditingController(); // dispenser B3

textFieldContainer ftmFullNameTextInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: primaryColor,
    style : inputFieldTextStyle,
    controller: nameController,
    keyboardType: TextInputType.text,
    hintText: hintText,
    hintStyle: inputFieldHintTextStyle,
    horizontal: 20,
    vertical: 10,
    marginTop: 13,
  );
}

Container ftmPasswordInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return Container(
    margin: const EdgeInsets.only(top: 13),
    child: TextField(
      onTap: onTap,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      obscureText: true,
      cursorColor: primaryColor,
      style: inputFieldHintPaswordTextStyle,
      controller: passwordController,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: inputFieldHintPaswordTextStyle,
          focusedBorder: inputFieldFocusedBorderStyle,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: inputFieldDefaultBorderStyle),
    ),
  );
}

textFieldContainer ftmNationalCodeInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: primaryColor,
    style : inputFieldTextStyle,
    controller: nationalCodeController,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldHintTextStyle,
    horizontal: 20,
    vertical: 10,
    marginTop: 13,
  );
}

textFieldContainer ftmPersonalCodeInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: primaryColor,
    style : inputFieldTextStyle,
    controller: personnelCodeController,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldHintTextStyle,
    horizontal: 20,
    vertical: 10,
    marginTop: 13,
  );
}

textFieldContainer ftmPhoneNumInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: primaryColor,
    style : inputFieldTextStyle,
    controller: phoneNumCodeController,
    keyboardType: TextInputType.phone,
    hintText: hintText,
    hintStyle: inputFieldHintTextStyle,
    horizontal: 20,
    vertical: 10,
    marginTop: 13,
  );
}

textFieldContainer ftmConfirmCodeInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: primaryColor,
    style : inputFieldTextStyle,
    controller: confirmCodeController,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldHintTextStyle,
    horizontal: 20,
    vertical: 10,
    marginTop: 13,
  );
}

textFieldContainer ftmDispenser1AInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: dispenserColor,
    style : inputFieldTextStyleDispenser,
    controller: dispenserA1Controller,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldTextStyleDispenser,
    horizontal: 10,
    vertical: 5,
    marginTop: 5,
  );
}

textFieldContainer ftmDispenser1BInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: dispenserColor,
    style : inputFieldTextStyleDispenser,
    controller: dispenserB1Controller,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldTextStyleDispenser,
    horizontal: 10,
    vertical: 5,
    marginTop: 5,
  );
}

textFieldContainer ftmDispenser2AInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: dispenserColor,
    style : inputFieldTextStyleDispenser,
    controller: dispenserA2Controller,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldTextStyleDispenser,
    horizontal: 10,
    vertical: 5,
    marginTop: 5,
  );
}

textFieldContainer ftmDispenser2BInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: dispenserColor,
    style : inputFieldTextStyleDispenser,
    controller: dispenserB2Controller,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldTextStyleDispenser,
    horizontal: 10,
    vertical: 5,
    marginTop: 5,
  );
}

textFieldContainer ftmDispenser3AInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: dispenserColor,
    style : inputFieldTextStyleDispenser,
    controller: dispenserA3Controller,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldTextStyleDispenser,
    horizontal: 10,
    vertical: 5,
    marginTop: 5,
  );
}

textFieldContainer ftmDispenser3BInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: dispenserColor,
    style : inputFieldTextStyleDispenser,
    controller: dispenserB3Controller,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldTextStyleDispenser,
    horizontal: 10,
    vertical: 5,
    marginTop: 5,
  );
}

textFieldContainer ftmPaymentInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: dispenserColor,
    style : inputFieldTextStyleDispenser,
    controller: paymentController,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldTextStyleDispenser,
    horizontal: 10,
    vertical: 5,
    marginTop: 5,
  );
}

//---------------------------------- textFieldContainer ------------------------------
class textFieldContainer extends StatelessWidget {
  const textFieldContainer(
      {Key? key,
      required this.onTap,
      required this.onChanged,
      required this.onEditingComplete,
      required this.onSubmitted,
      required this.cursorColor,
      required this.style,
      required this.controller,
      required this.keyboardType,
      required this.hintText,
      required this.hintStyle,
      required this.horizontal,
      required this.vertical,
      required this.marginTop,
      })
      : super(key: key);

  final dynamic onTap;
  final dynamic onChanged;
  final dynamic onEditingComplete;
  final dynamic onSubmitted;
  final dynamic cursorColor;
  final dynamic style;
  final dynamic controller;
  final dynamic keyboardType;
  final dynamic hintText;
  final dynamic hintStyle;
  final double horizontal ;
  final double vertical ;
  final double marginTop ;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: TextField(
        onTap: onTap,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
        cursorColor: cursorColor,
        style: style,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            focusedBorder: inputFieldFocusedBorderStyle,
            contentPadding:
                 EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
            border: inputFieldDefaultBorderStyle),
      ),
    );
  }
}
