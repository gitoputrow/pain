import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pain/Introduction/GoalSelected.dart';
import 'package:pain/Introduction/TargetSelected.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

bool ceknotif = false;

class PageMotivation extends StatelessWidget {
  const PageMotivation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/Image/bgIntroScreen4.png"),
                      fit: BoxFit.cover
                  )
              ),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 5.6.h),
                    child: Image.asset("asset/Image/pagination4.png",width: 44.5.w,height: 2.8.h,),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 12.65.h),
                    child: Text("What motivates you to\nExercises?",style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      fontFamily: 'PoppinsBoldSemi',
                      fontSize: 19.7.sp,
                    ),
                      textAlign: TextAlign.center,),
                  ),
                  Motivation_Selected()
                ],
              ),
            );
          },),
        ));
  }
}


class Motivation_Selected extends StatefulWidget {

  @override
  _Motivation_Selected createState() => _Motivation_Selected();
}

class _Motivation_Selected extends State<Motivation_Selected> {

  bool mot1 =false;
  bool mot2 = false;
  bool mot3 = false;
  bool mot4 = false;
  bool mot5 = false;


  @override
  void dispose() {
    cek = false;
    ceknotif = false;
    super.dispose();
  }

  bool cekin(){
    if (mot1 == true || mot2 == true || mot3 == true ||
    mot4 == true || mot5 == true){
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 0),
                  child: ElevatedButton(
                    onPressed: (){
                      if (cekin()== false){
                        Fluttertoast.showToast(
                            msg: "You Can Select more than one",  // message
                            toastLength: Toast.LENGTH_SHORT, // length
                            gravity: ToastGravity.BOTTOM,    // location
                            timeInSecForIosWeb: 1               // duration
                        );
                        setState(() {
                          mot1 = true;
                        });
                      }
                      else{
                        if (mot1 == false){
                          setState(() {
                            mot1 = true;
                          });
                        }
                        else{
                          setState(() {
                            mot1 = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5.7.w),
                      alignment: Alignment.centerLeft,
                      child: Text("Being healthier",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'RubikSemiBold',
                            fontSize: 18.sp,
                            color: mot1 == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                        ),),),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        primary: mot1 == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                        padding: EdgeInsets.symmetric(vertical: 2.95.h)
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 2.8.h),
                  child: ElevatedButton(
                    onPressed: (){
                      if (cekin()== false){
                        Fluttertoast.showToast(
                            msg: "You Can Select more than one",  // message
                            toastLength: Toast.LENGTH_SHORT, // length
                            gravity: ToastGravity.BOTTOM,    // location
                            timeInSecForIosWeb: 1               // duration
                        );
                        setState(() {
                          mot2 = true;
                        });
                      }
                      else{
                        if (mot2 == false){
                          setState(() {
                            mot2 = true;
                          });
                        }
                        else{
                          setState(() {
                            mot2 = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5.7.w),
                      alignment: Alignment.centerLeft,
                      child: Text("Looking better",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'RubikSemiBold',
                            fontSize: 18.sp,
                            color: mot2 == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                        ),),),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        primary: mot2 == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                        padding: EdgeInsets.symmetric(vertical: 2.95.h)
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 2.8.h),
                  child: ElevatedButton(
                    onPressed: (){
                      if (cekin()== false){
                        Fluttertoast.showToast(
                            msg: "You Can Select more than one",  // message
                            toastLength: Toast.LENGTH_SHORT, // length
                            gravity: ToastGravity.BOTTOM,    // location
                            timeInSecForIosWeb: 1               // duration
                        );
                        setState(() {
                          mot3 = true;
                        });
                      }
                      else{
                        if (mot3 == false){
                          setState(() {
                            mot3 = true;
                          });
                        }
                        else{
                          setState(() {
                            mot3 = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5.7.w),
                      alignment: Alignment.centerLeft,
                      child: Text("For strength & endurance",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'RubikSemiBold',
                            fontSize: 18.sp,
                            color: mot3 == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                        ),),),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        primary: mot3 == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                        padding: EdgeInsets.symmetric(vertical: 2.95.h)
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 2.8.h),
                  child: ElevatedButton(
                    onPressed: (){
                      if (cekin()== false){
                        Fluttertoast.showToast(
                            msg: "You Can Select more than one",  // message
                            toastLength: Toast.LENGTH_SHORT, // length
                            gravity: ToastGravity.BOTTOM,    // location
                            timeInSecForIosWeb: 1               // duration
                        );
                        setState(() {
                          mot4 = true;
                        });
                      }
                      else{
                        if (mot4 == false){
                          setState(() {
                            mot4 = true;
                          });
                        }
                        else{
                          setState(() {
                            mot4 = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5.7.w),
                      alignment: Alignment.centerLeft,
                      child: Text("Reducing stress or tension",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'RubikSemiBold',
                            fontSize: 18.sp,
                            color: mot4 == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                        ),),),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        primary: mot4 == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                        padding: EdgeInsets.symmetric(vertical: 2.95.h)
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 2.8.h),
                  child: ElevatedButton(
                    onPressed: (){
                      if (cekin()== false){
                        Fluttertoast.showToast(
                            msg: "You Can Select more than one",  // message
                            toastLength: Toast.LENGTH_SHORT, // length
                            gravity: ToastGravity.BOTTOM,    // location
                            timeInSecForIosWeb: 1               // duration
                        );
                        setState(() {
                          mot5 = true;
                        });
                      }
                      else{
                        if (mot5 == false){
                          setState(() {
                            mot5 = true;
                          });
                        }
                        else{
                          setState(() {
                            mot5 = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5.7.w),
                      alignment: Alignment.centerLeft,
                      child: Text("Boosting confidence",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'RubikSemiBold',
                            fontSize: 18.sp,
                            color: mot5 == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                        ),),),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        primary: mot5 == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                        padding: EdgeInsets.symmetric(vertical: 2.95.h)
                    ),
                  ),
                ),

                // groupbutton("Being healthier",0),
                // groupbutton("Looking better",24,),
                // groupbutton("For strength & endurance",24),
                // groupbutton("Reducing stress or tension",24),
                // groupbutton("Boosting confidence",24),
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
                padding: EdgeInsets.only(bottom: 5.05.h),
                child: ElevatedButton(onPressed: () {

                  if(cekin() == true){
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
                            pageBuilder: (context,animation,animationTime) => PageTarget()));
                  }
                },
                  child: Text("Continue",style:
                  TextStyle(fontSize: 17.05.sp,
                      fontFamily: 'RubikMedium',
                      color: cekin() == true ? Colors.white : Color.fromRGBO(255, 255, 255, 0.4)),),
                  style: ElevatedButton.styleFrom(
                      splashFactory: cekin() == true ? null : NoSplash.splashFactory,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2.3.h),
                      primary: cekin() == true ? Color.fromRGBO(170, 5, 27, 1) : Color.fromRGBO(205, 2, 27, 0.4),
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

class groupbutton extends StatefulWidget {

  String judul = "";
  double topPadding = 0;
  bool cek = false;

  groupbutton (this.judul,this.topPadding);

  @override
  _groupbuttonState createState() => _groupbuttonState();
}

class _groupbuttonState extends State<groupbutton> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: widget.topPadding),
      child: ElevatedButton(
        onPressed: (){
          if (widget.cek == false){
            setState(() {
              widget.cek = true;
              cek = true;
              if (ceknotif == false){
                Fluttertoast.showToast(
                    msg: "You Can Select more than one",  // message
                    toastLength: Toast.LENGTH_SHORT, // length
                    gravity: ToastGravity.BOTTOM,    // location
                    timeInSecForIosWeb: 1               // duration
                );
                ceknotif = true;
              }
            });
          }
          else{
            setState(() {
              widget.cek = false;
              cek = false;
            });
          }
        },
        child: Container(
          padding: EdgeInsets.only(left: 32),
          alignment: Alignment.centerLeft,
          child: Text(widget.judul,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: 'RubikSemiBold',
                fontSize: 20,
                color: widget.cek == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
            ),),),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            primary: widget.cek == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
            padding: EdgeInsets.symmetric(vertical: 25)
        ),
      ),
    );
  }
}

