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
  late String _dispenser1A = "0.0",
      _dispenser1B = "0.0",
      _dispenser2A = "0.0",
      _dispenser2B = "0.0",
      _dispenser3A = "0.0",
      _dispenser3B = "0.0";

  int fractionDigits = 2;

  final dispenser1A = TextEditingController();
  final dispenser1B = TextEditingController();
  final dispenser2A = TextEditingController();
  final dispenser2B = TextEditingController();
  final dispenser3A = TextEditingController();
  final dispenser3B = TextEditingController();

  void _incrementCounter() {
    setState(() {
      double dis1 = double.parse(dispenser1A.text);
      double dis2 = double.parse(dispenser1B.text);
      double dis3 = double.parse(dispenser2A.text);
      double dis4 = double.parse(dispenser2B.text);
      double dis5 = double.parse(dispenser3A.text);
      double dis6 = double.parse(dispenser3B.text);

      double result = 1.0;
      _dispenser1A = (result * dis1 * 0.01).toStringAsFixed(fractionDigits);
      _dispenser1B = (result * dis2 * 0.01).toStringAsFixed(fractionDigits);
      _dispenser2A = (result * dis3 * 0.01).toStringAsFixed(fractionDigits);
      _dispenser2B = (result * dis4 * 0.01).toStringAsFixed(fractionDigits);
      _dispenser3A = (result * dis5 * 0.01).toStringAsFixed(fractionDigits);
      _dispenser3B = (result * dis6 * 0.01).toStringAsFixed(fractionDigits);
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
                padding: const EdgeInsets.all(6.0),
                margin: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dispenser1'),
                    Card(
                      color: Colors.blueGrey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            MyTextFieldCustomized(
                                title: "A",
                                color: Colors.red,
                                controller: dispenser1A,
                                value: _dispenser1A),
                            MyTextFieldCustomized(
                                title: "B",
                                color: Colors.red,
                                controller: dispenser1B,
                                value: _dispenser1B),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    const Text('Dispenser2'),
                    Card(
                      color: Colors.blueGrey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            MyTextFieldCustomized(
                                title: "A",
                                color: Colors.red,
                                controller: dispenser2A,
                                value: _dispenser2A),
                            MyTextFieldCustomized(
                                title: "B",
                                color: Colors.red,
                                controller: dispenser2B,
                                value: _dispenser2B),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 18.0,
                    ),
                    const Text('Dispenser3'),
                    Card(
                      color: Colors.blueGrey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            MyTextFieldCustomized(
                                title: "A",
                                color: Colors.red,
                                controller: dispenser3A,
                                value: _dispenser3A),
                            MyTextFieldCustomized(
                                title: "B",
                                color: Colors.red,
                                controller: dispenser3B,
                                value: _dispenser3B),
                          ],
                        ),
                      ),
                    ),
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
          width: 110.0,
          height: 40.0,
          padding: const EdgeInsets.all(3),
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
                fillColor: Colors.white,
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
    );
  }
}
