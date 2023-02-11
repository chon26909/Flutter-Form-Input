import 'package:flutter/material.dart';
import 'package:form_input/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: "ลงทะเบียน",
      home: HomeScreen(),
    );
  }
}
