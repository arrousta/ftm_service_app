import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FTM.CO',
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xffc7c7c7),
        backgroundColor: const Color(0xffc7c7c7),
        scaffoldBackgroundColor: const Color(0xffc7c7c7),
      ),
      home: const Home(title: 'FTM.CO'),
    );
  }
}