import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pain/Introduction/GenderSelected.dart';
import 'package:flutter/gestures.dart';
import 'package:pain/LoginActivity.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(10, 12, 13, 1),
        body: ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/Image/background2.png"),
                    fit: BoxFit.cover
                )
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 7.5.w,top: 2.8.h,bottom: 16),
                  child: Image.asset("asset/Image/Group_35.png",
                    width: 13.45.w,
                    height: 2.95.h,),
                ),
                Home_Screen()
              ],
            ),
          );
        },),
      ),
    );
  }
}

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.only(bottom: 6.55.h),
            alignment: Alignment.center,
            child :
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "Get in Shape",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      fontFamily: 'PoppinsBoldSemi',
                      fontSize: 21.sp,
                    ),),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 3.7.h),
                    child: Text(
                      "with several workout",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                        fontFamily: 'RubikLight',
                        fontSize: 19.5.sp,
                      ),)
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.only(),
                        child: ElevatedButton(onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PageGender())
                          );
                        },
                          child: Text("Getting Started",style:
                          TextStyle(fontSize: 17.05.sp,
                              fontFamily: 'RubikMedium',
                              color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 2.3.h),
                              primary: Color.fromRGBO(170, 5, 27, 1),
                              onPrimary: Color.fromRGBO(30, 5, 27, 1)
                          ),),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 2.3.h),
                        child: ElevatedButton(onPressed: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginActivtyy())
                          );

                        },
                          child: Text("Sign in",style:
                          TextStyle(fontSize: 17.05.sp,
                              fontFamily: 'RubikMedium'),),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 2.3.h),
                              primary: Color.fromRGBO(10, 12, 13, 0.8)
                          ),),
                      ),
                    ],
                  ),
                )
              ],
            )
        ),
      ],);
  }
}



