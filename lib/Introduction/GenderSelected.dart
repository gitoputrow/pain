import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pain/HomeScreen.dart';
import 'package:pain/Introduction/DataUser.dart';
import 'package:pain/Introduction/PhysicallySelected.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class PageGender extends StatelessWidget {
  const PageGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(10, 12, 13, 1),
        body: ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/Image/BackgroundIntroduction/bgIntroScreen1.png"),
                    fit: BoxFit.cover
                )
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 5.6.h),
                  child: Image.asset("asset/Image/Pagination/pagination1.png",width: 44.5.w,height: 2.8.h,),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 12.65.h),
                  child: Text("What is your Gender?",style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                    fontFamily: 'PoppinsBoldSemi',
                    fontSize: 19.5.sp,
                  ),),
                ),
                gender_selected()
              ],
            ),
          );
        },),
      ),
    );
  }
}


class gender_selected extends StatefulWidget {


  @override
  _gender_selectedState createState() => _gender_selectedState();
}

class _gender_selectedState extends State<gender_selected> {

  bool male = false;
  bool female = false;

  String gender = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.only(top: 20.6.h,right: 7.5.w,left: 7.5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        gender = "Male";
                      });
                      if (female == true){
                        setState(() {
                          female = false;
                        });
                      }
                      if (male == false){
                        setState(() {
                          male = true;
                        });
                      } else{
                        setState(() {
                          male = false;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5.7.w),
                      alignment: Alignment.centerLeft,
                      child: Text("Male",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'RubikSemiBold',
                            fontSize: 18.sp,
                            color: male == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                        ),),),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        primary: male == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                        padding: EdgeInsets.symmetric(vertical: 2.95.h)
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2.8.h),
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        gender = "Female";
                      });
                      if (male == true) {
                        setState(() {
                          male = false;
                        });
                      }
                      if (female == false){
                        setState(() {
                          female = true;
                        });
                      } else{
                        setState(() {
                          female = false;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5.7.w),
                      alignment: Alignment.centerLeft,
                      child: Text("Female",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'RubikSemiBold',
                            fontSize: 18.sp,
                            color: female == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                        ),),),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        primary: female == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                        padding: EdgeInsets.symmetric(vertical: 2.95.h)
                    ),
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

                  if (male == true || female == true){
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
                            pageBuilder: (context,animation,animationTime) => PagePhysically(gender)));
                  }

                },
                  child: Text("Continue",style:
                  TextStyle(fontSize: 17.05.sp,
                      fontFamily: 'RubikMedium',
                      color: male == true || female == true ? Colors.white : Color.fromRGBO(255, 255, 255, 0.4)),),
                  style: ElevatedButton.styleFrom(
                      splashFactory: male == true || female == true ? null : NoSplash.splashFactory,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2.3.h),
                      primary: male == true || female == true ? Color.fromRGBO(170, 5, 27, 1) : Color.fromRGBO(205, 2, 27, 0.4),
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
