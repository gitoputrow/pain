import 'package:flutter/material.dart';
import 'package:pain/Main/HomePage/PreparePage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Workout_List extends StatefulWidget {

  String nameDays = "";
  String ImageSource = "";
  List <String> workoutList = [];

  Workout_List(this.nameDays,this.ImageSource,this.workoutList);

  @override
  _Workout_ListState createState() => _Workout_ListState("workout${nameDays.replaceAll(' ', '')}",workoutList);
}

class _Workout_ListState extends State<Workout_List> {

  String nameListWo = "";
  List <String> workoutList = [];

  _Workout_ListState(this.nameListWo,this.workoutList);

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
                                      image: AssetImage("asset/Image/${widget.ImageSource}.png"),
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
                                    fontSize: 21.8.sp,
                                    color: Colors.white
                                ),),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 1.3.h,left: 7.5.w),
                              alignment: Alignment.centerLeft,
                              child: Text("with 4 workouts",
                                style: TextStyle(
                                    fontFamily: 'RubikLight',
                                    fontSize: 15.8.sp,
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
                    padding: EdgeInsets.only(bottom: 3.8.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                    pageBuilder: (context,animation,animationTime) => Prepare_page("${widget.nameDays}",workoutList)));

                          },
                            child: Text("START",style:
                            TextStyle(fontSize: 16.sp,
                                fontFamily: 'RubikSemiBold',
                                color: Colors.white  ),),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 23.w),
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
              color: Color.fromRGBO(196, 196, 196, 1),
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
                        fontSize: 18.9.sp,
                        color: Colors.white
                    ),),
                ),
                Container(
                  padding: EdgeInsets.only(top: 0.5.h),
                  child: Text("X 6",
                    style: TextStyle(
                        fontFamily: 'RubikLight',
                        fontSize: 18.9.sp,
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

