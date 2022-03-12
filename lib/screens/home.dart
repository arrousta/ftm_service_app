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
  late String endDispenser1A = "0",
      endDispenser1B = "0",
      endDispenser2A = "0",
      endDispenser2B = "0",
      endDispenser3A = "0",
      endDispenser3B = "0";

  final String startDispenser1A = "22361",
      startDispenser1B = "487347",
      startDispenser2A = "668703",
      startDispenser2B = "866302",
      startDispenser3A = "2757459",
      startDispenser3B = "2825774";

  final dispenser1A = TextEditingController(text: "0");
  final dispenser1B = TextEditingController(text: "0");
  final dispenser2A = TextEditingController(text: "0");
  final dispenser2B = TextEditingController(text: "0");
  final dispenser3A = TextEditingController(text: "0");
  final dispenser3B = TextEditingController(text: "0");

  void _incrementCounter() {
    setState(() {

      endDispenser1A = (int.parse(dispenser1A.text) - int.parse(startDispenser1A)).toString();
      endDispenser1B = (int.parse(dispenser1B.text) - int.parse(startDispenser1B)).toString();
      endDispenser2A = (int.parse(dispenser2A.text) - int.parse(startDispenser2A)).toString();
      endDispenser2B = (int.parse(dispenser2B.text) - int.parse(startDispenser2B)).toString();
      endDispenser3A = (int.parse(dispenser3A.text) - int.parse(startDispenser3A)).toString();
      endDispenser3B = (int.parse(dispenser3B.text) - int.parse(startDispenser3B)).toString();



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
                    // TimeAndDate(),
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
                                value: endDispenser1A),
                            MyTextFieldCustomized(
                                title: "B",
                                color: Colors.red,
                                controller: dispenser1B,
                                value: endDispenser1B),
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
                                value: endDispenser2A),
                            MyTextFieldCustomized(
                                title: "B",
                                color: Colors.red,
                                controller: dispenser2B,
                                value: endDispenser2B),
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
                                value: endDispenser3A),
                            MyTextFieldCustomized(
                                title: "B",
                                color: Colors.red,
                                controller: dispenser3B,
                                value: endDispenser3B),
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
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            width: 52,
            height: 34.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.camera_alt, size: 12,),
                SizedBox(
                  width: 2,
                ),
                Text(
                  // '$_counter',
                  'Image',
                  style: TextStyle(
                    fontSize: 12,
                  )
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
