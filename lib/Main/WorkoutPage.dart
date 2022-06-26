import 'package:flutter/material.dart';
import 'package:pain/Main/WorkoutPage/LevelPage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Workout_Page extends StatefulWidget {

  String id;
  Workout_Page(this.id);

  @override
  _Workout_PageState createState() => _Workout_PageState();
}

class _Workout_PageState extends State<Workout_Page> {

  List <String> WorkoutName = [
    "Full Body",
    "Triceps",
    "Biceps",
    "Abs",
    "Chest",
    "Legs",
    "Cardio",
  ];

  List <List<String>> WorkoutList = [
    ["Push Up","Crunch Sit Up","Squat","Leg Raise"],
    ["Push Up","Tricep Dips","Crunch Sit Up","Leg Raise","Squat","Leg Calf Raise"],
    ["Tricep Dips","Diamond Push Up","Mountain Climber","Shoulder Tap"],
    ["Tricep Dips","Push Up","Diamond Push Up","Mountain Climber","Shoulder Tap","Tricep Extension"],
    ["Pull Up","Chin Up","Australian Pull Up","Australian Chin Up"],
    ["Pull Up","Close Grip Pull Up","Chin Up","Close Grip Chin Up","Australian Pull Up","Australian Chin Up"],
    ["Crunch Sit Up", "Sit Up", "Leg Raise", "Modified V Ups"],
    ["Crunch Sit Up", "Sit Up", "Leg Raise", "Bicycle Crunch","Russian Twist","Modified V Ups"],
    ["Push Up","Diamond Push Up","Incline Push Up","Decline Push Up"],
    ["Archer Push Up","Incline Push Up","Wide Push Up","Push Up","Diamond Push Up","Decline Push Up"],
    ["Leg Calf Raise", "Squat", "Lunges", "Step Ups and Down"],
    ["Leg Calf Raise", "Squat", "Lunges", "Step Ups and Down","Leg Calf Raise","Plie Squat"],
    ["High Knee", "Mountain Climber", "Jumping Jack", "Burpie"],
    ["High Knee", "Mountain Climber", "Jumping Jack", "Side Jump","Front Back Jump","Burpie"],
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
      return SafeArea(
          child: Scaffold(
            backgroundColor: Color.fromRGBO(10, 12, 13, 1),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 7.5.w,top: 3.5.h,right: 7.5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Text(
                        "Workouts From Home",
                        style: TextStyle(
                            fontSize: 18.5.sp,
                            fontFamily: 'PoppinsBoldSemi',
                            color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 46.6.w,top: 0.4.h),
                      child: Divider(
                        thickness: 0.3.h,
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0.4.h),
                      child: Text(
                        "All Workouts Challenge",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'PoppinsRegular',
                            fontSize: 15.5.sp
                        ),
                      ),
                    ),
                    for (var i = 0; i < WorkoutName.length;i++)
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Level_Page(
                              WorkoutName[i],
                              WorkoutList[i*2],
                              WorkoutList[i*2+1],
                          widget.id)));
                        },
                          child: Container(
                            padding: EdgeInsets.only(top: 3.5.h),
                            child: BoxWorkout(WorkoutName[i]),
                          )
                      )
                  ],
                ),
              ),
            )
          ));
    },);
  }
}

class BoxWorkout extends StatelessWidget {

  String WorkoutName = "";
  BoxWorkout(this.WorkoutName);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 3.h,horizontal: 6.5.w),
      alignment: Alignment.bottomLeft,
      height: 14.h,
      decoration: BoxDecoration(
          // color: Colors.white38,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage("asset/Image/Challange/${WorkoutName.replaceAll(' ', '')}challange.png"),
            fit: BoxFit.cover,
          )
      ),
      child: Text(
        "$WorkoutName Workouts",
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'RubikReguler',
            fontSize: 18.5.sp
        ),
      ),
    );
  }
}
