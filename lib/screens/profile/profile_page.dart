import 'package:flutter/material.dart';
import 'package:ftm_service_app/constructor.dart';
import 'component/body.dart';

class MiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Body(),
    );
  }
}

