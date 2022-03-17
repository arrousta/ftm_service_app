import 'package:flutter/material.dart';
import '../constructor.dart';

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

TextEditingController dispenser1AController =
    TextEditingController(); // dispenser A1
TextEditingController dispenser1BController =
    TextEditingController(); // dispenser B1
TextEditingController dispenser2AController =
    TextEditingController(); // dispenser A2
TextEditingController dispenser2BController =
    TextEditingController(); // dispenser B2
TextEditingController dispenser3AController =
    TextEditingController(); // dispenser A3
TextEditingController dispenser3BController =
    TextEditingController(); // dispenser B3

TextEditingController paymentController =
    TextEditingController(); // dispenser B3

int paymentChangeValue = 0;

int dispenser1AChangedValue = 0;
int dispenser1BChangedValue = 0;
int dispenser2AChangedValue = 0;
int dispenser2BChangedValue = 0;
int dispenser3AChangedValue = 0;
int dispenser3BChangedValue = 0;


textFieldContainer ftmFullNameTextInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: kPrimaryColor,
    style: inputFieldTextStyle,
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
      cursorColor: kPrimaryColor,
      style: inputFieldHintPasswordTextStyle,
      controller: passwordController,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: inputFieldHintPasswordTextStyle,
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
    cursorColor: kPrimaryColor,
    style: inputFieldTextStyle,
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
    cursorColor: kPrimaryColor,
    style: inputFieldTextStyle,
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
    cursorColor: kPrimaryColor,
    style: inputFieldTextStyle,
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
    cursorColor: kPrimaryColor,
    style: inputFieldTextStyle,
    controller: confirmCodeController,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldHintTextStyle,
    horizontal: 20,
    vertical: 10,
    marginTop: 13,
  );
}

textFieldContainer ftmDispenser1AInput({required String hintText, required Function onChanged, onTap, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: kPrimaryColor,
    style: inputFieldTextStyleDispenser,
    controller: dispenser1AController,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldHintTextStyleDispenser,
    horizontal: 5,
    vertical: 5,
    marginTop: 0,
  );
}

textFieldContainer ftmDispenser1BInput({required String hintText, onTap, required Function onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: (value) {
      if (value != '') {
        dispenser1BChangedValue = int.parse(value);
      } else {
        dispenser1BChangedValue = 0;
      }
    },
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: kPrimaryColor,
    style: inputFieldTextStyleDispenser,
    controller: dispenser1BController,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldHintTextStyleDispenser,
    horizontal: 5,
    vertical: 5,
    marginTop: 0,
  );
}

textFieldContainer ftmDispenser2AInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: (value) {
      if (value != '') {
        dispenser2AChangedValue = int.parse(value);
      } else {
        dispenser2AChangedValue = 0;
      }
    },
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: kPrimaryColor,
    style: inputFieldTextStyleDispenser,
    controller: dispenser2AController,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldHintTextStyleDispenser,
    horizontal: 5,
    vertical: 5,
    marginTop: 0,
  );
}

textFieldContainer ftmDispenser2BInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: (value) {
      if (value != '') {
        dispenser2BChangedValue = int.parse(value);
      } else {
        dispenser2BChangedValue = 0;
      }
    },
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: kPrimaryColor,
    style: inputFieldTextStyleDispenser,
    controller: dispenser2BController,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldHintTextStyleDispenser,
    horizontal: 5,
    vertical: 5,
    marginTop: 0,
  );
}

textFieldContainer ftmDispenser3AInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: (value) {
      if (value != '') {
        dispenser3AChangedValue = int.parse(value);
      } else {
        dispenser3AChangedValue = 0;
      }
    },
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: kPrimaryColor,
    style: inputFieldTextStyleDispenser,
    controller: dispenser3AController,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldHintTextStyleDispenser,
    horizontal: 5,
    vertical: 5,
    marginTop: 0,
  );
}

textFieldContainer ftmDispenser3BInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: (value) {
      if (value != '') {
        dispenser3BChangedValue = int.parse(value);
      } else {
        dispenser3BChangedValue = 0;
      }
    },
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: kPrimaryColor,
    style: inputFieldTextStyleDispenser,
    controller: dispenser3BController,
    keyboardType: TextInputType.number,
    hintText: hintText,
    hintStyle: inputFieldHintTextStyleDispenser,
    horizontal: 5,
    vertical: 5,
    marginTop: 0,
  );
}

textFieldContainer ftmPaymentInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return textFieldContainer(
    onTap: onTap,
    onChanged: (value){
      if(value != ''){
        paymentChangeValue = int.parse(value);
      }else{
        paymentChangeValue = 0;
      }
    },
    onEditingComplete: onEditingComplete,
    onSubmitted: onSubmitted,
    cursorColor: kPrimaryColor,
    style: inputFieldTextStyleDispenser,
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
  const textFieldContainer({
    Key? key,
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
  }) : super(key: key);

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
  final double horizontal;
  final double vertical;
  final double marginTop;

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
            contentPadding: EdgeInsets.symmetric(
                horizontal: horizontal, vertical: vertical),
            border: inputFieldDefaultBorderStyle),
      ),
    );
  }
}
