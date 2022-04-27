import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pain/Main/HomePage/WorkoutList.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  List <String> workoutArm = [
    "Push Up",
    "Tricep Dips",
    "Mountain Climber",
    "Shoulder Tap"
  ];

  List <String> workoutAbs = [
    "Crunch Sit Up",
    "Sit Up",
    "Leg Raise",
    "Modified V Ups"
  ];

  List <String> workoutChest = [
    "Diamond Push Up",
    "Incline Push Up",
    "Push Up",
    "Wide Push Up"
  ];

  List <String> workoutLegs = [
    "Leg Calf Raise",
    "Squat",
    "Lunges",
    "Step Ups and Down"
  ];

  List <String> workoutFullbody = [
    "Diamond Push Up",
    "Squat",
    "Crunch Sit Up",
    "Modified V Ups"
  ];

  List <String> workoutCardio = [
    "High Knee",
    "Mountain Climber",
    "Jumping Jack",
    "Burpie"
  ];

  List <String> workoutlist =[
    "Arm",
    "Chest",
    "Abs",
    "Legs",
    "Full body",
    "Cardio"
  ];

  List <String> days =[
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];

  List <String> gambarlist =[
    "ArmPic",
    "ChestPic",
    "AbsPic",
    "LegsPic",
    "FullBodyPic",
    "CardioPic"
  ];

  int activePage = 0;

  String namedays = "";

  var day = DateFormat('EEEE').format(DateTime.now());

  String setnamedays(){
    if (day.toString() == "Monday"){
      return "Arm";
    }
    else if (day.toString() == "Tuesday"){
      return "Chest";
    }
    else if (day.toString() == "Wednesday"){
      return "Abs";
    }
    else if (day.toString() == "Thursday"){
      return "Legs";
    }
    else if (day.toString() == "Friday"){
      return "Full Body";
    }
    else if (day.toString() == "Saturday"){
      return "Cardio";
    }
    return "";
  }

  @override
  void initState() {
    // TODO: implement initState
    setnamedays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(10, 12, 13, 1),
          body: ResponsiveSizer(
            builder: (context, orientation, screenType) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 7.5.w,top: 3.5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${DateFormat('EEEE, d MMMM yyyy').format(DateTime.now())}",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.75),
                                    fontFamily: 'RubikLight',
                                    fontSize: 15.5.sp
                                ),),
                              Container(
                                padding: EdgeInsets.only(top: 0.8.h),
                                child: Text("Hi! mhmmdnugroh",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'RubikSemiBold',
                                      fontSize: 19.85.sp
                                  ),),
                              ),
                            ],
                          ),
                          // Container(
                          //   padding: EdgeInsets.only(right: 7.5.w),
                          //   child: Image.asset("asset/Image/settingwo.png",width: 8.5.w,height: 6.h,),
                          // )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 1.4.h,left: 7.5.w),
                      child: Text("Today’s Goal is for ${setnamedays()} Workout",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'PoppinsRegular',
                            fontSize: 15.47.sp
                        ),),
                    ),
                    Container(
                      width: 450.w,
                      height: 84.4.h,
                      padding: EdgeInsets.only(top: 3.h),
                      child: Container(
                          child: PageView(

                            controller: PageController(viewportFraction: 0.87,initialPage: 0),
                            padEnds: true,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Workout_List("${workoutlist[0]}","${gambarlist[0]}",workoutArm)));
                                },
                                child: carausel(workoutlist[0], days[0], gambarlist[0]),
                              ),

                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Workout_List("${workoutlist[1]}","${gambarlist[1]}",workoutChest)));
                                },
                                child: carausel(workoutlist[1], days[1], gambarlist[1]),
                              ),

                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Workout_List("${workoutlist[2]}","${gambarlist[2]}",workoutAbs)));
                                },
                                child: carausel(workoutlist[2], days[2], gambarlist[2]),
                              ),

                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Workout_List("${workoutlist[3]}","${gambarlist[3]}",workoutLegs)));
                                },
                                child: carausel(workoutlist[3], days[3], gambarlist[3]),
                              ),

                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Workout_List("${workoutlist[4]}","${gambarlist[4]}",workoutFullbody)));
                                },
                                child: carausel(workoutlist[4], days[4], gambarlist[4]),
                              ),

                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Workout_List("${workoutlist[5]}","${gambarlist[5]}",workoutCardio)));
                                },
                                child: carausel(workoutlist[5], days[5], gambarlist[5]),
                              ),
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}

class carausel extends StatelessWidget {

  String workout = "";
  String days = "";
  String gambar = "";

  carausel(this.workout,this.days,this.gambar);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6.5.w,left: 1.1.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
            image: AssetImage("asset/Image/$gambar.png"),
            fit: BoxFit.cover
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 6.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text("$days",
                style: TextStyle(
                    fontSize: 23.45.sp,
                    fontFamily: 'RubikSemiBold',
                    color: Colors.white
                ),),
            ),
            Container(
              padding: EdgeInsets.only(top: 1.5.h),
              child: Text("$workout's day with 4 workout",
                style: TextStyle(
                    fontSize: 16.55.sp,
                    fontFamily: 'RubikRegular',
                    color: Colors.white
                ),),
            ),
          ],
        ),
      ),
    );
  }
}

