import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pain/Main/HomePage/PreparePage.dart';
import 'package:pain/Main/WorkoutPage/ChallangeStart.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WorkoutList_Challange extends StatefulWidget {

  String nameWorkout = "";
  String ImageSource = "";
  String WorkoutMuch = "";
  String id = "";
  String level = "";
  List <String> workoutList = [];

  WorkoutList_Challange(this.nameWorkout,this.workoutList,this.WorkoutMuch,this.ImageSource,this.id,this.level);

  @override
  _WorkoutList_ChallangeState createState() => _WorkoutList_ChallangeState(workoutList);
}

class _WorkoutList_ChallangeState extends State<WorkoutList_Challange> {

  List <String> workoutList = [];
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  String reps = "6";

  data() async {
    final finished = await ref.child(widget.id).child("Challange").child("${widget.nameWorkout.replaceAll(' ', '')}${widget.level}").get();
    setState(() {
      reps = (6 + (int.parse(finished.value.toString())*2)).toString();
    });
  }
  _WorkoutList_ChallangeState(this.workoutList);

  @override
  void initState() {
    data();
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
                                      image: AssetImage("asset/Image/ChallangeWorkoutList/${widget.ImageSource}.png"),
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
                              child: Text("${widget.nameWorkout} Workout",
                                style: TextStyle(
                                    fontFamily: 'RubikSemiBold',
                                    fontSize: 21.sp,
                                    color: Colors.white
                                ),),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 1.3.h,left: 7.5.w),
                              alignment: Alignment.centerLeft,
                              child: Text("with ${widget.WorkoutMuch} workouts",
                                style: TextStyle(
                                    fontFamily: 'RubikLight',
                                    fontSize: 15.5.sp,
                                    color: Colors.white
                                ),),
                            ),
                            for(var i = 0; i < workoutList.length;i++)
                              workoutlistt(workoutList[i],reps),
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
                                    pageBuilder: (context,animation,animationTime) => Challange_Start(workoutList,widget.id,reps,"${widget.nameWorkout.replaceAll(' ', '')}${widget.level}")));

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
  String reps = "";
  workoutlistt(this.nama_workout,this.reps);

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
                  child: Text("X $reps",
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

