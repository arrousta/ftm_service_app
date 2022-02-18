import 'package:flutter/material.dart';
import 'package:ftm_service_app/widgets/my_text_field_customized.dart';

class DispenserView extends StatefulWidget {
  const DispenserView({Key? key}) : super(key: key);

  @override
  _DispenserViewState createState() => _DispenserViewState();
}


class _DispenserViewState extends State<DispenserView> {
  late String _dispenser1A = "0.0",
      _dispenser1B = "0.0",
      _dispenser2A = "0.0",
      _dispenser2B = "0.0",
      _dispenser3A = "0.0",
      _dispenser3B = "0.0";

  int fractionDigits = 2;

  final String dispenser1A = TextEditingController().text;
  final dispenser1B = TextEditingController().text;
  final dispenser2A = TextEditingController().text;
  final dispenser2B = TextEditingController().text;
  final dispenser3A = TextEditingController().text;
  final dispenser3B = TextEditingController().text;

  void _incrementCounter() {
    setState(() {
      // double dis1 = double.parse(dispenser1A.text);
      // double dis2 = double.parse(dispenser1B.text);
      // double dis3 = double.parse(dispenser2A.text);
      // double dis4 = double.parse(dispenser2B.text);
      // double dis5 = double.parse(dispenser3A.text);
      // double dis6 = double.parse(dispenser3B.text);

      _dispenser1A = dispenser1A;
      _dispenser1B = dispenser1B;
      _dispenser2A = dispenser2A;
      _dispenser2B = dispenser2B;
      _dispenser3A = dispenser3A;
      _dispenser3B = dispenser3B;

      // _dispenser1A = dis1.toStringAsFixed(fractionDigits);
      // _dispenser1B = dis2.toStringAsFixed(fractionDigits);
      // _dispenser2A = dis3.toStringAsFixed(fractionDigits);
      // _dispenser2B = dis4.toStringAsFixed(fractionDigits);
      // _dispenser3A = dis5.toStringAsFixed(fractionDigits);
      // _dispenser3B = dis6.toStringAsFixed(fractionDigits);
    });
  }




  @override
  Widget build(BuildContext context) {
    return Column(
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
                    // controller: dispenser1A,
                    // value: _dispenser1A
                ),
                MyTextFieldCustomized(
                    title: "B",
                    color: Colors.red,
                    // controller: dispenser1B,
                    // value: _dispenser1B
                ),
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
                    // controller: dispenser2A,
                    // value: _dispenser2A
                ),
                MyTextFieldCustomized(
                    title: "B",
                    color: Colors.red,
                    // controller: dispenser2B,
                    // value: _dispenser2B
                ),
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
                    // controller: dispenser3A,
                    // value: _dispenser3A
                ),
                MyTextFieldCustomized(
                    title: "B",
                    color: Colors.red,
                    // controller: dispenser3B,
                    // value: _dispenser3B
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
