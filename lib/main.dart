import 'package:flutter/material.dart';
import 'package:pain/HomeScreen.dart';
import 'package:pain/Introduction/GenderSelected.dart';
import 'package:pain/Introduction/GoalSelected.dart';
import 'package:pain/Introduction/Introduction_Screen.dart';
import 'package:pain/Introduction/PhysicallySelected.dart';
import 'package:pain/splashscreen.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart';


void main() async {
  Intl.defaultLocale = await findSystemLocale();
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

