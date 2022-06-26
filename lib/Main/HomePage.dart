import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pain/Main/HomePage/WorkoutList.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Home_Page extends StatefulWidget {

  String id;
  Home_Page(this.id);

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

  DatabaseReference ref = FirebaseDatabase.instance.ref();

  List <String> Muscle = [];
  String level = "";
  String goal  = "";

  List<String> daySplit = [];
  List<String> workoutSplit = [];
  String namedays = "";

  var day = DateFormat('EEEE').format(DateTime.now());

  String username = "";

  data() async {
    log(widget.id);
    final data = await ref.child(widget.id).get();
    for (var muscle in data.child("Muscle").children){
      var muscletarget = muscle.value.toString();
      log(muscletarget);
      setState(() {
        Muscle.add(muscletarget);
      });
    }
    Muscle.sort();
    setState(() {
      username = data.child("user").value.toString();
      level = data.child("level").value.toString();
      goal = data.child("goal").value.toString();
    });
    if (level == "new"){
      setState(() {
        daySplit = [
          "Monday",
          "Wednesday",
          "Friday"
        ];
      });
      if (goal == "build muscle"){
        if (Muscle.length == 1){
          workoutSplit = [
            Muscle[0],
            Muscle[0],
            Muscle[0],
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else {
            namedays = "is Rest Day";
          }
        }
        else if (Muscle.length == 2){
          workoutSplit = [
            Muscle[0],
            Muscle[1],
            "Full Body",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 3){
          workoutSplit = [
            Muscle[0],
            Muscle[1],
            Muscle[2],
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 4){
          workoutSplit = [
            "${Muscle[0]} and ${Muscle[1]}",
            "${Muscle[2]} and ${Muscle[3]}",
            "Full Body",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
      }
      else if (goal == "burn fat"){
        if (Muscle.length == 1){
          workoutSplit = [
            Muscle[0],
            Muscle[0],
            "Cardio",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 2){
          workoutSplit = [
            Muscle[0],
            Muscle[1],
            "Cardio",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 3){
          workoutSplit = [
            "${Muscle[0]} and ${Muscle[1]}",
            Muscle[2],
            "Cardio",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 4){
          workoutSplit = [
            "${Muscle[0]} and ${Muscle[1]}",
            "${Muscle[2]} and ${Muscle[3]}",
            "Cardio",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
      }
    }
    else if (level == "pro"){
      setState(() {
        daySplit = [
          "Monday",
          "Wednesday",
          "Friday",
          "Saturday"
        ];
      });
      if (goal == "build muscle"){
        if (Muscle.length == 1){
          workoutSplit = [
            Muscle[0],
            Muscle[0],
            "Full Body",
            "Full Body",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 2){
          workoutSplit = [
            Muscle[0],
            Muscle[1],
            "${Muscle[0]} and ${Muscle[1]}",
            "Full Body",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 3){
          workoutSplit = [
            Muscle[0],
            Muscle[1],
            Muscle[2],
            "Full Body"
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 4){
          workoutSplit = [
            "${Muscle[0]} and ${Muscle[1]}",
            "${Muscle[2]} and ${Muscle[3]}",
            "Full Body",
            "Full Body"
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
      }
      else if (goal == "burn fat"){
        if (Muscle.length == 1){
          workoutSplit = [
            Muscle[0],
            Muscle[0],
            Muscle[0],
            "Cardio",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 2){
          workoutSplit = [
            Muscle[0],
            Muscle[1],
            "${Muscle[0]} and ${Muscle[1]}",
            "Cardio",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 3){
          workoutSplit = [
            Muscle[0],
            Muscle[1],
            Muscle[2],
            "Cardio",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 4){
          workoutSplit = [
            Muscle[0],
            Muscle[1],
            "${Muscle[2]} and ${Muscle[3]}",
            "Cardio",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
      }
    }
    else if (level == "master"){
      setState(() {
        daySplit = [
          "Monday",
          "Tuesday",
          "Thursday",
          "Friday",
          "Saturday"
        ];
      });
      if (goal == "build muscle"){
        if (Muscle.length == 1){
          workoutSplit = [
            Muscle[0],
            Muscle[0],
            Muscle[0],
            "Full Body",
            "Full Body",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else if (day.toString() == daySplit[4]){
            namedays = "'s Goal is for ${workoutSplit[4]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 2){
          workoutSplit = [
            Muscle[0],
            Muscle[1],
            "${Muscle[0]} and ${Muscle[1]}",
            "${Muscle[0]} and ${Muscle[1]}",
            "Full Body",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else if (day.toString() == daySplit[4]){
            namedays = "'s Goal is for ${workoutSplit[4]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 3){
          workoutSplit = [
            Muscle[0],
            Muscle[1],
            Muscle[2],
            "Full Body",
            "Full Body"
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else if (day.toString() == daySplit[4]){
            namedays = "'s Goal is for ${workoutSplit[4]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 4){
          workoutSplit = [
            Muscle[0],
            Muscle[1],
            Muscle[2],
            Muscle[3],
            "Full Body"
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else if (day.toString() == daySplit[4]){
            namedays = "'s Goal is for ${workoutSplit[4]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
      }
      else if (goal == "burn fat"){
        if (Muscle.length == 1){
          workoutSplit = [
            Muscle[0],
            Muscle[0],
            "Cardio",
            Muscle[0],
            "Cardio",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else if (day.toString() == daySplit[4]){
            namedays = "'s Goal is for ${workoutSplit[4]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 2){
          workoutSplit = [
            Muscle[0],
            Muscle[1],
            "Cardio",
            "${Muscle[0]} and ${Muscle[1]}",
            "Cardio",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else if (day.toString() == daySplit[4]){
            namedays = "'s Goal is for ${workoutSplit[4]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 3){
          workoutSplit = [
            Muscle[0],
            Muscle[1],
            "Cardio",
            Muscle[2],
            "Cardio",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else if (day.toString() == daySplit[4]){
            namedays = "'s Goal is for ${workoutSplit[4]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
        else if (Muscle.length == 4){
          workoutSplit = [
            Muscle[0],
            Muscle[1],
            "Cardio",
            "${Muscle[2]} and ${Muscle[3]}",
            "Cardio",
          ];
          if (day.toString() == daySplit[0]){
            namedays = "'s Goal is for ${workoutSplit[0]} Workout";
          }
          else if (day.toString() == daySplit[1]){
            namedays = "'s Goal is for ${workoutSplit[1]} Workout";
          }
          else if (day.toString() == daySplit[2]){
            namedays = "'s Goal is for ${workoutSplit[2]} Workout";
          }
          else if (day.toString() == daySplit[3]){
            namedays = "'s Goal is for ${workoutSplit[3]} Workout";
          }
          else if (day.toString() == daySplit[4]){
            namedays = "'s Goal is for ${workoutSplit[4]} Workout";
          }
          else {
            namedays = " is Rest Day";
          }
        }
      }
    }
    log(Muscle.toString());
  }

  int activePage = 0;



  @override
  void initState() {
    // TODO: implement initState
    data();
    log(Muscle.toString());
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
                                child: Text("Hi! $username",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'RubikSemiBold',
                                      fontSize: 21.sp
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
                      child: Text("Today$namedays",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'PoppinsRegular',
                            fontSize: 15.5.sp
                        ),),
                    ),
                    Container(
                      width: 450.w,
                      height: 85.3.h,
                      padding: EdgeInsets.only(top: 3.h),
                      child: Container(
                          child: PageView(

                            controller: PageController(viewportFraction: 0.87,initialPage: 0),
                            padEnds: true,
                            children: [
                              for(var i = 0; i < daySplit.length; i++)
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Workout_List(workoutSplit[i],"${workoutSplit[i].replaceAll(' ', '')}Pic",widget.id)));
                                  },
                                  child: carausel(workoutSplit[i], daySplit[i], "${workoutSplit[i].replaceAll(' ', '')}Pic"),
                                ),


                              // GestureDetector(
                              //   onTap: (){
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(builder: (context) => Workout_List("${workoutlist[0]}","${gambarlist[0]}",workoutArm)));
                              //   },
                              //   child: carausel(workoutlist[0], days[0], gambarlist[0]),
                              // ),
                              //
                              // GestureDetector(
                              //   onTap: (){
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(builder: (context) => Workout_List("${workoutlist[1]}","${gambarlist[1]}",workoutChest)));
                              //   },
                              //   child: carausel(workoutlist[1], days[1], gambarlist[1]),
                              // ),
                              //
                              // GestureDetector(
                              //   onTap: (){
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(builder: (context) => Workout_List("${workoutlist[2]}","${gambarlist[2]}",workoutAbs)));
                              //   },
                              //   child: carausel(workoutlist[2], days[2], gambarlist[2]),
                              // ),
                              //
                              // GestureDetector(
                              //   onTap: (){
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(builder: (context) => Workout_List("${workoutlist[3]}","${gambarlist[3]}",workoutLegs)));
                              //   },
                              //   child: carausel(workoutlist[3], days[3], gambarlist[3]),
                              // ),
                              //
                              // GestureDetector(
                              //   onTap: (){
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(builder: (context) => Workout_List("${workoutlist[4]}","${gambarlist[4]}",workoutFullbody)));
                              //   },
                              //   child: carausel(workoutlist[4], days[4], gambarlist[4]),
                              // ),
                              //
                              // GestureDetector(
                              //   onTap: (){
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(builder: (context) => Workout_List("${workoutlist[5]}","${gambarlist[5]}",workoutCardio)));
                              //   },
                              //   child: carausel(workoutlist[5], days[5], gambarlist[5]),
                              // ),
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
            image: AssetImage("asset/Image/CarouselPic/$gambar.png"),
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
                    fontSize: 23.sp,
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

