import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

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

  String selectedDesign = "null";


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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    // const TimeAndDate(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200.0,
                          height: 65.0,
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: mNumber,
                            autofocus: true,
                            showCursor: false,
                            keyboardType: TextInputType.number,
                            // inputFormatters: <TextInputFormatter>[
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
                            textAlign: TextAlign.center,
                            // style: TextStyle(
                            //     fontSize: 17.0,
                            //     height: 3.0,
                            //     color: Colors.black
                            // ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Number of pieces produced',
                              labelStyle: TextStyle(
                                  fontSize: 12.0,
                                  height: 1.0,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ColorField(
                        title: "Blue",
                        color: Colors.blue,
                        controller: mBlue,
                        value: _rBlue),
                    ColorField(
                        title: "Brown",
                        color: Colors.brown,
                        controller: mBrown,
                        value: _rBrown),
                    ColorField(
                        title: "Beige",
                        color: Colors.deepOrangeAccent,
                        controller: mBeige,
                        value: _rBeige),
                    ColorField(
                        title: "Black",
                        color: Colors.black,
                        controller: mBlack,
                        value: _rBlack),
                    ColorField(
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

class ColorField extends StatelessWidget {
  ColorField({
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
    // TextInputAction textInputAction = TextInputAction.next;
    // if(){
    //
    // }
    // else
    // if (title == "Yellow") {
    //   textInputAction = TextInputAction.done;
    // } else {
    //   textInputAction = TextInputAction.next;
    // }

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
