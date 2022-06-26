import 'dart:developer';
import 'dart:ffi';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pain/Introduction/GenderSelected.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'GoalSelected.dart';

bool cek = false;

class PagePhysically extends StatelessWidget {

  String gender;
  PagePhysically(this.gender);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/Image/BackgroundIntroduction/bgIntroScreen2.png"),
                      fit: BoxFit.cover
                  )
              ),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 5.6.h),
                    child: Image.asset("asset/Image/Pagination/pagination2.png",width: 44.5.w,height: 2.8.h,),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 12.65.h),
                    child: Text("How physically Active\nare you?",style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      fontFamily: 'PoppinsBoldSemi',
                      fontSize: 19.5.sp,
                    ),
                      textAlign: TextAlign.center,),
                  ),
                  Physically_Selected(gender)
                ],
              ),
            );
          },)
        ));
  }
}


class Physically_Selected extends StatefulWidget {

  String gender;
  Physically_Selected(this.gender);


  @override
  _Physically_SelectedState createState() => _Physically_SelectedState();
}

class _Physically_SelectedState extends State<Physically_Selected> {
  bool notmuch = false;
  bool onetotwo = false;
  bool threetofour = false;
  bool fivemore = false;

  String level = "";


  bool cek(){
    if (notmuch == true || onetotwo == true || threetofour == true || fivemore == true){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 24.4.h,left: 7.5.w,right: 7.5.w),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      level = "new";
                    });
                    if (notmuch == false){
                      setState(() {
                        notmuch = true;
                        threetofour = false;
                        onetotwo = false;
                        fivemore = false;
                      });
                    }
                    else{
                      setState(() {
                        notmuch = false;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 5.7.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Not much',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'RubikSemiBold',
                                fontSize: 18.sp,
                                color: notmuch == true ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8)
                            ),),),
                        Container(
                          padding: EdgeInsets.only(top: 0.6.h),
                          alignment: Alignment.bottomLeft,
                          child: Text('Out of shape',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'RubikRegular',
                                fontSize: 15.05.sp,
                                color: notmuch == true ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8)
                            ),),),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      primary: notmuch == true ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8),
                      padding: EdgeInsets.symmetric(vertical: 2.5.h)
                  ),
                ),),

              Container(
                padding: EdgeInsets.only(top: 2.35.h),
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      level = "new";
                    });
                    if (onetotwo == false){
                      setState(() {
                        onetotwo = true;
                        notmuch = false;
                        threetofour =false;
                        fivemore = false;
                      });
                    }
                    else{
                      setState(() {
                        onetotwo = false;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 5.7.w,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('1-2 Workouts',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'RubikSemiBold',
                                fontSize: 18.sp,
                                color: onetotwo == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                            ),),),
                        Container(
                          padding: EdgeInsets.only(top: 0.6.h),
                          alignment: Alignment.bottomLeft,
                          child: Text('a weeks',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'RubikRegular',
                                fontSize: 15.05.sp,
                                color: onetotwo == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                            ),),),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      primary: onetotwo == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                      padding: EdgeInsets.symmetric(vertical: 2.5.h)
                  ),
                ),),

              Container(
                padding: EdgeInsets.only(top: 2.35.h),
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      level = "pro";
                    });
                    if (threetofour == false){
                      setState(() {
                        threetofour = true;
                        notmuch = false;
                        onetotwo = false;
                        fivemore = false;
                      });
                    }
                    else{
                      setState(() {
                        threetofour = false;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 5.7.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('3-4 Workouts',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'RubikSemiBold',
                                fontSize: 18.sp,
                                color: threetofour == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                            ),),),
                        Container(
                          padding: EdgeInsets.only(top: 0.6.h),
                          alignment: Alignment.bottomLeft,
                          child: Text('a weeks',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'RubikRegular',
                                fontSize: 15.05.sp,
                                color: threetofour == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                            ),),),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      primary: threetofour == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                      padding: EdgeInsets.symmetric(vertical: 2.5.h)
                  ),
                ),),

              Container(
                padding: EdgeInsets.only(top: 2.35.h),
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      level = "master";
                    });
                    if (fivemore == false){
                      setState(() {
                        fivemore = true;
                        notmuch = false;
                        onetotwo = false;
                        threetofour = false;
                      });
                    }
                    else{
                      setState(() {
                        fivemore = false;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 5.7.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('5+ Workouts',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'RubikSemiBold',
                                fontSize: 18.sp,
                                color: fivemore == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                            ),),),
                        Container(
                          padding: EdgeInsets.only(top: 0.6.h),
                          alignment: Alignment.bottomLeft,
                          child: Text('a weeks',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'RubikRegular',
                                fontSize: 15.05.sp,
                                color: fivemore == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                            ),),),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      primary: fivemore == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                      padding: EdgeInsets.symmetric(vertical: 2.5.h)
                  ),
                ),),

            ],
          ),
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

                  if (cek() == true){
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
                            pageBuilder: (context,animation,animationTime) => PageGoal(widget.gender,level)));
                  }

                },
                  child: Text("Continue",style:
                  TextStyle(fontSize: 17.05.sp,
                      fontFamily: 'RubikMedium',

                      color: cek() == true ? Colors.white : Color.fromRGBO(255, 255, 255, 0.4)),),
                  style: ElevatedButton.styleFrom(
                      splashFactory: cek() == true ? null : NoSplash.splashFactory,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2.3.h),
                      primary: cek() == true ? Color.fromRGBO(170, 5, 27, 1) : Color.fromRGBO(205, 2, 27, 0.4),
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







