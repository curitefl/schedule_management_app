import 'package:flutter/material.dart';
import 'package:schedule_management_app/view/view/carender_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalenderView(),
    );
  }
}
