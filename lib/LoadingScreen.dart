import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pain/Main/MainActivity.dart';

import 'Introduction/DataUser.dart';

class Loading_Screen extends StatefulWidget {
  // Data_user dataUser = Data_user();
  // Data_profile dataProfile = Data_profile();
  // Data_account dataAccout = Data_account();
  String id;
  Loading_Screen(this.id);

  @override
  _Loading_ScreenState createState() => _Loading_ScreenState();
}

class _Loading_ScreenState extends State<Loading_Screen> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..addListener(() {
      setState(() {

      });
    });
    controller.repeat(reverse: false);
    Timer(Duration(milliseconds: 5700), (){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Main_Activity(widget.id,0)),
              (route) => false);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(10, 12, 13, 1),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset("asset/Image/loadingscreen.png",width: 112,height: 54,),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 76,vertical: 12),
                child: LinearProgressIndicator(
                  value: controller.value,
                  color: Color.fromRGBO(205, 5, 27, 1),
                  backgroundColor: Colors.white,
                  semanticsLabel: 'Linear progress indicator',
                ),
              )
            ],
          ),
        ));
  }
}
