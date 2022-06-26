import 'package:flutter/material.dart';
import 'package:pain/Main/HomePage/PreparePage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Workout_List extends StatefulWidget {

  String nameDays = "";
  String ImageSource = "";
  String username = "";

  Workout_List(this.nameDays,this.ImageSource,this.username);

  @override
  _Workout_ListState createState() => _Workout_ListState();
}

class _Workout_ListState extends State<Workout_List> {

  List <String> workoutList = [];

  @override
  void initState() {
    if (widget.nameDays == "Full Body"){
      workoutList = [
        "Diamond Push Up",
        "Squat",
        "Crunch Sit Up",
        "Modified V Ups"
      ];
    }
    else if (widget.nameDays == "Abs"){
      workoutList = [
        "Crunch Sit Up",
        "Sit Up",
        "Leg Raise",
        "Modified V Ups"
      ];
    }
    else if (widget.nameDays == "Abs and Chest"){
      workoutList = [
        "Crunch Sit Up",
        "Push Up",
        "Leg Raise",
        "Incline Push Up"
      ];
    }
    else if (widget.nameDays == "Abs and Arm"){
      workoutList = [
        "Crunch Sit Up",
        "Push Up",
        "Leg Raise",
        "Tricep Dips"
      ];
    }
    else if (widget.nameDays == "Abs and Legs"){
      workoutList = [
        "Crunch Sit Up",
        "Squat",
        "Leg Raise",
        "Leg Calf Raise"
      ];
    }
    else if (widget.nameDays == "Chest"){
      workoutList = [
        "Diamond Push Up",
        "Incline Push Up",
        "Push Up",
        "Wide Push Up"
      ];
    }
    else if (widget.nameDays == "Chest and Legs"){
      workoutList = [
        "Push Up",
        "Incline Push Up",
        "Squat",
        "Leg Calf Raise"
      ];
    }
    else if (widget.nameDays == "Arm"){
      workoutList = [
        "Push Up",
        "Tricep Dips",
        "Mountain Climber",
        "Shoulder Tap"
      ];
    }else if (widget.nameDays == "Arm and Chest"){
      workoutList = [
        "Push Up",
        "Tricep Dips",
        "Shoulder Tap",
        "Incline Push Up"
      ];
    }
    else if (widget.nameDays == "Arm and Legs"){
      workoutList = [
        "Squat",
        "Tricep Dips",
        "Shoulder Tap",
        "Leg Calf Raise"
      ];
    }
    else if (widget.nameDays == "Legs"){
      workoutList = [
        "Leg Calf Raise",
        "Squat",
        "Lunges",
        "Step Ups and Down"
      ];
    }
    else if (widget.nameDays == "Cardio"){
      workoutList = [
        "High Knee",
        "Mountain Climber",
        "Jumping Jack",
        "Burpie"
      ];
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(10, 12, 13, 1),
          body: ResponsiveSizer(
            builder: (context, orientation, screenType) {
              return Stack(
                children: [
                  SingleChildScrollView(
                      child:
                      Container(
                        padding: EdgeInsets.only(bottom: 14.1.h),
                        child: Column(
                          children: [
                            Container(
                              height: 70.3.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24)),
                                  image: DecorationImage(
                                      image: AssetImage("asset/Image/CarouselPic/${widget.ImageSource}.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                              child: Container(
                                padding: EdgeInsets.only(left: 5.5.w,top: 3.h),
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  icon: Image.asset("asset/Image/backwo.png"),
                                  iconSize: 40,
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 3.25.h,left: 7.5.w),
                              alignment: Alignment.centerLeft,
                              child: Text("${widget.nameDays}'s Day",
                                style: TextStyle(
                                    fontFamily: 'RubikSemiBold',
                                    fontSize: 21.sp,
                                    color: Colors.white
                                ),),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 1.3.h,left: 7.5.w),
                              alignment: Alignment.centerLeft,
                              child: Text("with 4 workouts",
                                style: TextStyle(
                                    fontFamily: 'RubikLight',
                                    fontSize: 15.5.sp,
                                    color: Colors.white
                                ),),
                            ),
                            for(var i = 0; i < workoutList.length;i++)
                              workoutlistt(workoutList[i]),
                          ],
                        ),
                      )
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 3.8.h,left: 24.w,right: 24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: ElevatedButton(onPressed: () {

                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    transitionDuration: Duration(milliseconds: 400),
                                    reverseTransitionDuration: Duration(milliseconds: 400),
                                    transitionsBuilder:
                                        (context,animation,animationTime,child){
                                      animation = CurvedAnimation(parent: animation, curve: Curves.ease);
                                      return SlideTransition(
                                        position: Tween(
                                          begin: Offset(0,1),
                                          end: Offset.zero,).animate(animation),
                                        child: child,);
                                    },
                                    pageBuilder: (context,animation,animationTime) => Prepare_page("${widget.nameDays}",workoutList,widget.username)));

                          },
                            child: Text("Start",style:
                            TextStyle(fontSize: 17.05.sp,
                                fontFamily: 'RubikSemiBold',
                                color: Colors.white  ),),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                padding: EdgeInsets.symmetric(vertical: 2.h),
                                primary: Color.fromRGBO(170, 5, 27, 1),
                                onPrimary: Color.fromRGBO(0, 0, 0, 1.0)
                            ),),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}

class workoutlistt extends StatelessWidget {

  String nama_workout = "";
  workoutlistt(this.nama_workout);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.8.h,left: 7.5.w),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: AssetImage("asset/Image/ListGif/${nama_workout.replaceAll(" ", "")}.gif"),
                  fit: BoxFit.cover
              ),
            ),
            height: 10.55.h,
            width: 21.28.w,
          ),
          Container(
            padding: EdgeInsets.only(left: 7.1.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("$nama_workout",
                    style: TextStyle(
                        fontFamily: 'RubikMedium',
                        fontSize: 18.5.sp,
                        color: Colors.white
                    ),),
                ),
                Container(
                  padding: EdgeInsets.only(top: 0.5.h),
                  child: Text("X 6",
                    style: TextStyle(
                        fontFamily: 'RubikLight',
                        fontSize: 18.sp,
                        color: Colors.white
                    ),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

