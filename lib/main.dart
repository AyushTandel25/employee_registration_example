import 'package:employee_registration_example/components/screen/container_widget.dart';
import 'package:employee_registration_example/components/screen/login_screen.dart';
import 'package:employee_registration_example/components/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'components/screen/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway',
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
