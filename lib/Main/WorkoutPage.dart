import 'package:flutter/material.dart';

class Workout_Page extends StatefulWidget {
  const Workout_Page({Key? key}) : super(key: key);

  @override
  _Workout_PageState createState() => _Workout_PageState();
}

class _Workout_PageState extends State<Workout_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(10, 12, 13, 1),
          body: Center(
            child: Text("Workout",style:
            TextStyle(
                color: Colors.white
            ),),
          ),
        ));
  }
}
