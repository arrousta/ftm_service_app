import 'package:flutter/material.dart';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/screens/end-shift/end_shift_page.dart';
import 'package:ftm_service_app/services/translations.dart';

import 'outline_text_card.dart';

List<int> editShiftList = [0, 0, 0, 0, 0, 0, 0];

class EditNozzleWidget extends StatefulWidget {
  final int id;
  final String title;
  final String lastShift;

  const EditNozzleWidget(
      {Key? key,
        required this.id,
        required this.title,
        required this.lastShift})
      : super(key: key);

  @override
  _EditNozzleWidgetState createState() => _EditNozzleWidgetState();
}

class _EditNozzleWidgetState extends State<EditNozzleWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  int _functionResult = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: dispensersPlateDecoration,
      padding: const EdgeInsets.only(top: 3),
      child: Column(
        children: [
          Text(
            widget.title,
            style: kHeader7,
          ),
          Container(
            margin: const EdgeInsets.all(6.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'پایان شیفت قبل',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: kBoxSizeWith,
                    height: kBoxSizeHeight,
                    child: OutlineTextCard(
                      value: widget.lastShift,
                    ),
                  ),
                  Text(
                    'شروع شیفت شما',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: kFieldSizeWith,
                    height: kFieldSizeHeight,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          if (value != '') {
                            _functionResult = int.parse(value);

                            editShiftList[widget.id] = _functionResult;
                            print("EditNozzleWidget 1 : " + editShiftList.toString());

                            // if (_functionResult >= int.parse(widget.lastShift)) {
                            //   editShiftList[widget.id] = _functionResult;
                            //   print("EditNozzleWidget 1 : " + editShiftList.toString());
                            // } else {//-----------------------------------------------------------------------------------------------------
                            //   editShiftList.insert(widget.id, _functionResult);
                            //   print("EditNozzleWidget 2 : " + editShiftList.toString());
                            // }
                          } else {
                            _functionResult = 0;
                            print("EditNozzleWidget 2 : " + editShiftList.toString());

                          }
                        });
                      },
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: kPrimaryColor,
                      style: inputFieldTextStyleDispenser,
                      controller: _textEditingController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          focusColor: kPrimaryColor,
                          fillColor: kTextWhiteColor,
                          filled: true,
                          hintText: getTranslated(context, 'enter_number'),
                          hintStyle: inputFieldHintTextStyleDispenser,
                          focusedBorder: inputFieldFocusedBorderStyle,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          border: inputFieldDefaultBorderStyle),
                    ),
                  ),

                  /*
                  Text(
                    getTranslated(context, 'function'),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),


                  SizedBox(
                    width: kBoxSizeWith,
                    height: kBoxSizeHeight,
                    child: OutlineTextCard(
                      value: (_functionResult > int.parse(widget.startShift))
                          ? "${_functionResult - int.parse(widget.startShift)}"
                          : "0",
                    ),
                  ),

                   */
                  const SizedBox(
                    height: 12,
                  ),
                  const ImageCardWidget(),
                ],
              ),
            ),
            decoration: dispenserPlateDecoration,
          ),
        ],
      ),
    );
  }
}