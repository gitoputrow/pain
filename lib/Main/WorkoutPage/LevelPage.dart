import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'WorkoutListChallange.dart';

class Level_Page extends StatefulWidget {

  String WorkoutNames = "";
  String id = "";
  List <String> WorkoutBeginner = [];
  List <String> WorkoutIntermediate = [];
  Level_Page(this.WorkoutNames,this.WorkoutBeginner,this.WorkoutIntermediate,this.id);

  @override
  _Level_PageState createState() => _Level_PageState();
}

class _Level_PageState extends State<Level_Page> {

  DatabaseReference ref = FirebaseDatabase.instance.ref();
  String finishbeg = "0";
  String finishinter = "0";

  int timesFinish = 0;

  finished() async {
    final beginner = await ref.child(widget.id).child("Challange").child("${widget.WorkoutNames.replaceAll(' ', '')}Beginner").get();
    final intermediate = await ref.child(widget.id).child("Challange").child("${widget.WorkoutNames.replaceAll(' ', '')}Intermediate").get();
    setState(() {
      finishbeg = beginner.value.toString();
      finishinter = intermediate.value.toString();
    });
    log(finishbeg);
  }

  @override
  void initState(){
    finished();
    log(finishbeg);
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
      return SafeArea(
          child: Scaffold(
            backgroundColor: Color.fromRGBO(10, 12, 13, 1),
            body: Container(
              padding: EdgeInsets.only(top: 3.5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5.5.w),
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Image.asset("asset/Image/backwo.png"),
                          iconSize: 36,
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 1.1.h),
                        alignment: Alignment.center,
                        child: Text(
                          "${widget.WorkoutNames} Workouts",
                          style: TextStyle(
                              fontSize: 18.5.sp,
                              fontFamily: 'PoppinsBoldSemi',
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 7.5.w,top: 2.5.h),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Choose your Level!",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'PoppinsRegular',
                          fontSize: 15.5.sp
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 2.h),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)
                            => WorkoutList_Challange(
                                "${widget.WorkoutNames}",
                                widget.WorkoutBeginner,
                                "4",
                                "${widget.WorkoutNames.replaceAll(' ', '')}Beginner",
                                widget.id,
                                "Beginner")));

                      },
                      child: BoxLevel("Beginner","${widget.WorkoutNames}","4","${widget.WorkoutNames.replaceAll(' ', '')}Beginner",finishbeg),
                    )
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 3.5.h),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)
                            => WorkoutList_Challange(
                                "${widget.WorkoutNames}",
                                widget.WorkoutIntermediate,
                                "6",
                                "${widget.WorkoutNames.replaceAll(' ', '')}Intermediate",
                                widget.id,
                                "Intermediate")));
                      },
                      child: BoxLevel("Intermediate","${widget.WorkoutNames}","6","${widget.WorkoutNames.replaceAll(' ', '')}Intermediate",finishinter),
                    )
                  )
                ],
              ),
            ),
          ),);
    },);
  }
}

class BoxLevel extends StatelessWidget {

  String WorkoutLevel = "";
  String WorkoutNames = "";
  String WorkoutReps = "";
  String GambarWorkout = "";
  String finish = "";

  BoxLevel(this.WorkoutLevel,this.WorkoutNames,this.WorkoutReps,this.GambarWorkout,this.finish);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 7.5.w,right: 7.5.w),
      child: Container(
        height: 32.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          image: DecorationImage(
            image: AssetImage("asset/Image/ChallangeLevel/$GambarWorkout.png"),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 3.h,horizontal: 6.5.w),
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                    text: "Finished ",
                    style: TextStyle(
                      fontFamily: "RubikReguler",
                      fontSize: 15.sp,
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                    ),
                    children: <TextSpan>[
                      if (int.parse(finish) == 0)
                        TextSpan(
                          text: "$finish Times",
                          style: TextStyle(
                            fontFamily: "RubikMedium",
                            fontSize: 15.sp,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        )
                      else
                        TextSpan(
                          text: "$finish Time",
                          style: TextStyle(
                            fontFamily: "RubikMedium",
                            fontSize: 15.sp,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        )
                    ]
                ),
              ),
            ),

            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3.h,horizontal: 6.5.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "$WorkoutLevel",
                          style: TextStyle(
                            fontFamily: "RubikSemiBold",
                            fontSize: 18.5.sp,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 0.8.h),
                        child: Text(
                          "$WorkoutNames’s workout with $WorkoutReps workout's",
                          style: TextStyle(
                              fontSize: 15.5.sp,
                              fontFamily: 'RubikRegular',
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

