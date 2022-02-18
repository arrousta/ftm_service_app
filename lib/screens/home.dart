import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:ftm_service_app/widgets/time_and_date.dart';

enum ShiftName { morning, evening, night }

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _rBlue = "0.0",
      _rBrown = "0.0",
      _rBeige = "0.0",
      _rBlack = "0.0",
      _rYellow = "0.0";

  int fractionDigits = 2;

  final mNumber = TextEditingController();
  final mBlue = TextEditingController();
  final mBrown = TextEditingController();
  final mBeige = TextEditingController();
  final mBlack = TextEditingController();
  final mYellow = TextEditingController();

  void _incrementCounter() {
    setState(() {
      double number = double.parse(mNumber.text);
      double blue = double.parse(mBlue.text);
      double brown = double.parse(mBrown.text);
      double beige = double.parse(mBeige.text);
      double black = double.parse(mBlack.text);
      double yellow = double.parse(mYellow.text);

      String mResult = (number * 65 * 65 * 0.0001).toStringAsFixed(4);
      double result = double.parse(mResult);
      _rBlue = (result * blue * 0.01).toStringAsFixed(fractionDigits);
      _rBrown = (result * brown * 0.01).toStringAsFixed(fractionDigits);
      _rBeige = (result * beige * 0.01).toStringAsFixed(fractionDigits);
      _rBlack = (result * black * 0.01).toStringAsFixed(fractionDigits);
      _rYellow = (result * yellow * 0.01).toStringAsFixed(fractionDigits);
    });
  }

  String shiftName = "null";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffc7c7c7),
        elevation: 0.0,
        title: Text(widget.title),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 21.0,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    // Text(
                    //   'Operator',
                    //   style: TextStyle(fontSize: 18, color: Colors.black),
                    // ),
                    TimeAndDate(),
                    // Text(
                    //   'First Shift',
                    //   style: TextStyle(fontSize: 18, color: Colors.black),
                    // ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const TimeAndDate(),

                    MyTextFieldCustomized(
                        title: "Blue",
                        color: Colors.blue,
                        controller: mBlue,
                        value: _rBlue),
                    MyTextFieldCustomized(
                        title: "Brown",
                        color: Colors.brown,
                        controller: mBrown,
                        value: _rBrown),
                    MyTextFieldCustomized(
                        title: "Beige",
                        color: Colors.deepOrangeAccent,
                        controller: mBeige,
                        value: _rBeige),
                    MyTextFieldCustomized(
                        title: "Black",
                        color: Colors.black,
                        controller: mBlack,
                        value: _rBlack),
                    MyTextFieldCustomized(
                        title: "Yellow",
                        color: Colors.yellow.shade800,
                        controller: mYellow,
                        value: _rYellow),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF2F2F2F),
      ),
    );
  }
}

class MyTextFieldCustomized extends StatelessWidget {
  MyTextFieldCustomized({
    Key? key,
    required this.controller,
    required this.title,
    required this.color,
    required this.value,
  }) : super(key: key);

  final TextEditingController controller;
  final String value;
  final String title;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 150.0,
          height: 60.0,
          padding: const EdgeInsets.all(10),
          child: TextField(
            // textInputAction: textInputAction,
            textInputAction: TextInputAction.next,
            // onSubmitted: (_) => FocusScope.of(context).nextFocus(),
            showCursor: true,
            cursorColor: color,
            style: TextStyle(color: color),
            controller: controller,
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: color),
                ),
                labelText: title,
                labelStyle: TextStyle(
                  color: color,
                )),
          ),
        ),
        const Text(
          ' ---> Result:   ',
        ),
        Text(
          // '$_counter',
          '$value',
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
