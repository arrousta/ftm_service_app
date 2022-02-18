import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFieldCustomized extends StatefulWidget {
  MyTextFieldCustomized({
    Key? key,
    // required this.controller,
    required this.title,
    required this.color
    // required this.value,
  }) : super(key: key);

  final String title;
  Color color;

  @override
  _MyTextFieldCustomizedState createState() => _MyTextFieldCustomizedState();
}

class _MyTextFieldCustomizedState extends State<MyTextFieldCustomized> {
  // final TextEditingController controller;
  // final String value;

  String value = TextEditingController().text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 110.0,
            height: 40.0,
            padding: const EdgeInsets.all(3),
            child: TextField(
              textInputAction: TextInputAction.next,
              // onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              showCursor: true,
              cursorColor: widget.color,
              style: TextStyle(color: widget.color),
              controller: TextEditingController(),
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.color),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.color),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.color),
                ),
                labelText: widget.title,
                labelStyle: TextStyle(
                  color: widget.color,
                ),
              ),
              onChanged: (mValue) {
                setState(() {
                  value = mValue;
                });
              },
            ),
          ),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            margin: const EdgeInsets.all(6.0),
            child: Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 8.0),
              width: 100.0,
              height: 34.0,
              child: Text(
                // '$_counter',
                '$value',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
