import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pain/Main/HomePage/StartTraining.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Prepare_page extends StatefulWidget {

  String workout = "";
  List <String> workoutList = [];

  Prepare_page(this.workout,this.workoutList);

  @override
  _Prepare_pageState createState() => _Prepare_pageState();
}

class _Prepare_pageState extends State<Prepare_page> with SingleTickerProviderStateMixin {

  int second = 11;
  Timer? timer;

  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10090),
    )..addListener(() {
      setState(() {

      });
    });
    Timer(Duration(milliseconds: 11150), (){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Start_Training(widget.workoutList)));
    });
    timer = Timer.periodic(Duration(seconds: 1), (_){
      setState(() {
        second--;
      });
      if(second==0){
        timer?.cancel();
        controller.stop();
      }
      else if(second==10){
        controller.repeat(reverse: true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(10, 12, 13, 1),
          body: ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
            return Stack(
              children: [
                Center(
                    child: SizedBox(
                      height: 35.h,
                      width: 70.w,
                      child: CircularProgressIndicator(
                        value: controller.value,
                        color: Color.fromRGBO(10, 12, 13, 1),
                        backgroundColor: second==0? Color.fromRGBO(10, 12, 13, 1) :Color.fromRGBO(205, 5, 27, 1),
                        semanticsLabel: 'Linear progress indicator',
                        strokeWidth: 7.w,
                      ),
                    )
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Prepare your self",
                        style: TextStyle(
                            fontFamily: 'RubikMedium',
                            fontSize: 18.5.sp,
                            color: Color.fromRGBO(255, 255, 255, 0.8)
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 1.5.h),
                      alignment: Alignment.center,
                      child: Text(
                        "for ${widget.workout}’s workout",
                        style: TextStyle(
                            fontFamily: 'RubikReguler',
                            fontSize: 15.5.sp,
                            color: Color.fromRGBO(255, 255, 255, 0.8)
                        ),
                      ),
                    ),
                    if(second>=10)
                      Container(
                        padding: EdgeInsets.only(top: 1.8.h),
                        alignment: Alignment.center,
                        child:
                        Text(
                          "00:10",
                          style: TextStyle(
                              fontFamily: 'RubikMedium',
                              fontSize: 25.5.sp,
                              color: Color.fromRGBO(205, 5, 27, 1)
                          ),
                        ),
                      ),
                    if(second<10)
                      Container(
                        padding: EdgeInsets.only(top: 1.8.h),
                        alignment: Alignment.center,
                        child:
                        Text(
                          "00:0$second",
                          style: TextStyle(
                              fontFamily: 'RubikMedium',
                              fontSize: 25.5.sp,
                              color: Color.fromRGBO(205, 5, 27, 1)
                          ),
                        ),
                      ),

                  ],
                )
              ],
            );
          },),
        ));
  }
}
