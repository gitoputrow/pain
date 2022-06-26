import 'dart:async';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:pain/Main/HomePage/RestPage.dart';

import 'ChallangeDone.dart';
import 'ChallangeRest.dart';



class Challange_Start extends StatefulWidget {

  List <String> workoutList = [];
  String id = "";
  String reps = "";
  String level = "";

  Challange_Start(this.workoutList,this.id,this.reps,this.level);

  @override
  _Challange_StartState createState() => _Challange_StartState();
}

class _Challange_StartState extends State<Challange_Start> {

  int index = 0;

  Timer? time;


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
                      height: 70.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage("asset/Image/WorkoutListGif/${widget.workoutList[index].replaceAll(" ", "")}.gif"),
                          fit: BoxFit.cover
                        ),
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
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(top: 3.2.h,right: 7.5.w),
                      child: Text(
                        "${index+1} of ${widget.workoutList.length}",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontFamily:'RubikReguler'
                        ),
                      ),
                    ),

                    Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(top: 3.5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Text(
                                "${widget.workoutList[index]}",
                                style: TextStyle(
                                    fontSize: 21.sp,
                                    color: Colors.white,
                                    fontFamily:'RubikSemiBold'
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.only(left: 3.9.w),
                              child: Text(
                                "x ${widget.reps}",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontFamily:'RubikReguler'
                                ),
                              ),
                            )
                          ],
                        )
                    ),

                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(top: 5.7.h,left: 24.w,right: 24.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            child: ElevatedButton(onPressed: () {

                              if (index == widget.workoutList.length - 1){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Challange_Done(widget.id,widget.level)));
                              }

                              else{
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Challange_Rest(
                                        "${widget.workoutList[index+1]}",
                                        widget.reps
                                    )));
                                time = Timer.periodic(Duration(milliseconds: 500),(_){
                                  setState(() {
                                    index++;
                                  });
                                  _.cancel();
                                });

                              }

                            },
                              child: Text("Continue",style:
                              TextStyle(fontSize: 17.05.sp,
                                  fontFamily: 'RubikSemiBold',
                                  color: Colors.white  ),),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 2.h,),
                                  primary: Color.fromRGBO(170, 5, 27, 1),
                                  onPrimary: Color.fromRGBO(0, 0, 0, 1.0)
                              ),),
                          ),
                        ],
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
