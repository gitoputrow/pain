import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pain/Introduction/MotivationSelected.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class PageGoal extends StatelessWidget {
  String gender;
  String level;


  PageGoal(this.gender,this.level);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/Image/BackgroundIntroduction/bgIntroScreen3.png"),
                    fit: BoxFit.cover
                )
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 5.6.h),
                  child: Image.asset("asset/Image/Pagination/pagination3.png",width: 44.5.w,height: 2.8.h,),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 12.65.h),
                  child: Text("Set your Goal",style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                    fontFamily: 'PoppinsBoldSemi',
                    fontSize: 19.5.sp,
                  ),),
                ),
                Goal_selected(gender,level)
              ],
            ),
          );
        },),
      ),
    );
  }
}



class Goal_selected extends StatefulWidget {
  String gender;
  String level;

  Goal_selected(this.gender,this.level);

  @override
  _Goal_selected createState() => _Goal_selected();
}

class _Goal_selected extends State<Goal_selected> {

  bool builmucle = false;
  bool burnfat = false;

  String goal = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.only(top: 20.6.h,right: 7.5.w,left: 7.5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        goal = "build muscle";
                      });
                      if (burnfat == true){
                        setState(() {
                          burnfat = false;
                        });
                      }
                      if (builmucle == false){
                        setState(() {
                          builmucle = true;
                        });
                      } else{
                        setState(() {
                          builmucle = false;
                        });
                      }
                    },
                    child: Container(padding: EdgeInsets.only(left: 5.7.w),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: Text("Build Muscle",
                            textAlign: TextAlign.left,
                            style:
                            TextStyle(
                                fontFamily: 'RubikSemiBold',
                                fontSize: 18.sp,
                                color: builmucle == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                            ),),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0.6.h),
                          child: Text("Build mass & Strength",
                            textAlign: TextAlign.left,
                            style:
                            TextStyle(
                                fontFamily: 'RubikRegular',
                                fontSize: 15.05.sp,
                                color: builmucle == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                            ),),
                        )

                      ],
                    ),),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        primary: builmucle == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                        padding: EdgeInsets.symmetric(vertical: 2.5.h)
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2.35.h),
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        goal = "burn fat";
                      });
                      if (builmucle == true) {
                        setState(() {
                          builmucle = false;
                        });
                      }
                      if (burnfat == false){
                        setState(() {
                          burnfat = true;
                        });
                      } else{
                        setState(() {
                          burnfat = false;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5.7.w),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            child: Text("Burn Fat",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'RubikSemiBold',
                                  fontSize: 18.sp,
                                  color: burnfat == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                              ),),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 0.6.h),
                            child: Text("Burn extra fat & Feel energized",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'RubikRegular',
                                  fontSize: 15.05.sp,
                                  color: burnfat == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                              ),),
                          )
                        ],
                      ),),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        primary: burnfat == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                        padding: EdgeInsets.symmetric(vertical: 2.5.h)
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.7.w,top: 1.9.h),
                  child: Column(

                    children: [
                      Text(
                        "Change your goal anytime in Settings.",
                        style: TextStyle(
                            fontFamily: 'PoppinsBoldSemi',
                            fontSize: 15.05.sp,
                            color: Color.fromRGBO(255, 255, 255, 0.6)),)
                    ],
                  ),
                )
              ],
            )

        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 7.5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 6.55.h),
                child: ElevatedButton(onPressed: () {

                  if (builmucle == true || burnfat == true){
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 0),
                            reverseTransitionDuration: Duration(milliseconds: 0),
                            transitionsBuilder:
                                (context,animation,animationTime,child){
                              animation = CurvedAnimation(parent: animation, curve: Curves.ease);
                              return SlideTransition(
                                position: Tween(
                                  begin: Offset(1,0),
                                  end: Offset.zero,).animate(animation),
                                child: child,);
                            },
                            pageBuilder: (context,animation,animationTime) => PageMotivation(widget.gender,widget.level,goal)));
                  }

                },
                  child: Text("Continue",style:
                  TextStyle(fontSize: 17.05.sp,
                      fontFamily: 'RubikMedium',
                      color: burnfat == true || builmucle == true ? Colors.white : Color.fromRGBO(255, 255, 255, 0.4)),),
                  style: ElevatedButton.styleFrom(
                      splashFactory: burnfat == true || builmucle == true ? null : NoSplash.splashFactory,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2.3.h),
                      primary: burnfat == true || builmucle == true ? Color.fromRGBO(170, 5, 27, 1) : Color.fromRGBO(205, 2, 27, 0.4),
                      onPrimary: Color.fromRGBO(0, 0, 0, 1.0)
                  ),),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
