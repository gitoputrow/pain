import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pain/HomeScreen.dart';
import 'package:pain/Introduction/CreateAccount.dart';
import 'package:pain/Introduction/PhysicallySelected.dart';
import 'package:pain/splashscreen.dart';

import 'DataUser.dart';


class PageData extends StatelessWidget {

  Data_user data = Data_user();
  PageData(this.data);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: ScreenUtilInit(
            designSize: Size(423,897),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context,widget) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/Image/BackgroundIntroduction/bgIntroScreen6.png"),
                        fit: BoxFit.cover
                    )
                ),
                child: Data_Profile(data),
              );
            },)
        ));
  }
}


class Data_Profile extends StatefulWidget {

  Data_user dataUser = Data_user();
  Data_Profile(this.dataUser);

  @override
  _Data_ProfileState createState() => _Data_ProfileState();
}

class _Data_ProfileState extends State<Data_Profile> {

  final textName = TextEditingController();
  final textAge = TextEditingController();
  final textWeight = TextEditingController();
  final textWeightTarget = TextEditingController();
  final textHeight = TextEditingController();

  bool textname = false;
  bool textage = false;
  bool textweight = false;
  bool textweighttarget = false;
  bool textheight = false;

  bool cek(){
    if (textname == false || textage== false || textheight== false ||
    textweight== false || textweighttarget== false){
      return false;
    }
    else {
      return true;
    }
}

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 4.5.h),
          child: Image.asset("asset/Image/Pagination/pagination6.png",width: 188.w,height: 24.h,),
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 32.h),
          child: Text("Profile Details",style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            fontFamily: 'PoppinsBoldSemi',
            fontSize: 24.5.sp,
          ),),
        ),

        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 4.h),
          child: Text("Enter your parameters to get a\npersonalized plan",style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            fontFamily: 'RubikLight',
            fontSize: 23.sp,
          ),
            textAlign: TextAlign.center,),
        ),
        Container(
            padding: EdgeInsets.only(left: 32.w,right: 32.w,top: 32.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: TextField(
                    keyboardType: TextInputType.name,
                    controller: textName,
                    onChanged: (text){
                      setState(() {
                        if (textName.text.isEmpty){
                          textname = false;
                        }
                        else{
                          textname = true;
                        }
                        log(textname.toString());
                      });

                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
                      hintText: "Insert Your Name",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontFamily: 'RubikMedium',
                          fontSize: 17.sp),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(left: 12.w,right: 8.w),
                        child: Image.asset("asset/Image/profileIcon.png",scale: 14.r,),
                      ),
                      fillColor: Color.fromRGBO(0, 0, 0, 0.9),
                      filled: true,
                      iconColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 2.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 2.w),
                      ),
                    ),
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24.h),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: textAge,
                    onChanged: (text){
                      if (textAge.text.isEmpty){
                        setState(() {
                          textage = false;
                        });
                      }
                      else{
                        setState(() {
                          textage = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
                      hintText: "Insert Your Age",
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 18.sp
                      ),
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 17.sp,
                          fontFamily: 'RubikMedium',),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(left: 12.w,right: 8.w),
                        child: Image.asset("asset/Image/ageIcon.png",scale: 14.r,),
                      ),
                      // suffixText: "Years Old",
                      suffixIcon: textAge.text.isNotEmpty ? Container(
                        padding: EdgeInsets.only(top: 12.5.h,right: 24.w),
                        child: Text("Years Old",style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 17.sp,
                        ),),
                      ) : null,
                      fillColor: Color.fromRGBO(0, 0, 0, 0.9),
                      filled: true,
                      iconColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 2.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 2.w),
                      ),
                    ),
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24.h),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: textWeight,
                    onChanged: (text){
                      if (textWeight.text.isEmpty){
                        setState(() {
                          textweight = false;
                        });
                      }
                      else{
                        setState(() {
                          textweight = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 24.w),
                      hintText: "Current Weight",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 17.sp,
                          fontFamily: 'RubikMedium',),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(left: 12.w,right: 8.w),
                        child: Image.asset("asset/Image/weightIcon.png",scale: 14.r,),
                      ),
                      suffixIcon: textWeight.text.isNotEmpty ? Container(
                        padding: EdgeInsets.only(top: 12.5.h,right: 24.w),
                        child: Text("KG",style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 17.sp,
                        ),),
                      ) : null,
                      fillColor: Color.fromRGBO(0, 0, 0, 0.9),
                      filled: true,
                      iconColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 2.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 2.w),
                      ),
                    ),
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24.h),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: textWeightTarget,
                    onChanged: (text){
                      if (textWeightTarget.text.isEmpty){
                        setState(() {
                          textweighttarget = false;
                        });
                      }
                      else{
                        setState(() {
                          textweighttarget = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
                      hintText: "Target Weight",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 17.sp,
                          fontFamily: 'RubikMedium',),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(left: 12.w,right: 8.w),
                        child: Image.asset("asset/Image/TargetIcon.png",scale: 14.r,),
                      ),
                      suffixIcon: textWeightTarget.text.isNotEmpty ? Container(
                        padding: EdgeInsets.only(top: 12.5.h,right: 24.w),
                        child: Text("KG",style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 17.sp,
                        ),),
                      ) : null,
                      fillColor: Color.fromRGBO(0, 0, 0, 0.9),
                      filled: true,
                      iconColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 2.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 2.w),
                      ),
                    ),
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24.h),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: textHeight,
                    onChanged: (text){
                      if (textHeight.text.isEmpty){
                        setState(() {
                          textheight = false;
                        });
                      }
                      else{
                        setState(() {
                          textheight = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
                      hintText: "Height",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontFamily: 'RubikMedium',
                          fontSize: 17.sp),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(left: 12.w,right: 8.w),
                        child: Image.asset("asset/Image/heightIcon.png",scale: 14.r,),
                      ),
                      suffixIcon: textHeight.text.isNotEmpty ? Container(
                        padding: EdgeInsets.only(top: 12.5.h,right: 24.w),
                        child: Text("CM",style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 17.sp,
                        ),),
                      ) : null,
                      fillColor: Color.fromRGBO(0, 0, 0, 0.9),
                      filled: true,
                      iconColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 2.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 2.w),
                      ),
                    ),
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      fontSize: 18.sp,
                    ),
                  ),
                )
              ],
            )
        ),
        Container(

          padding: EdgeInsets.only(left: 32.w,right: 32.w,top: 67.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 40.h),
                child: ElevatedButton(onPressed: () {
                  if (cek() == true){
                    Data_profile dataProfile = Data_profile();
                    log(widget.dataUser.toString());
                    dataProfile.name = textName.text;
                    dataProfile.age = textAge.text;
                    dataProfile.weight = textWeight.text;
                    dataProfile.height = textHeight.text;
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
                            pageBuilder: (context,animation,animationTime) => PageCreate(widget.dataUser,dataProfile)));
                  }
                },

                  child: Text("Finish",style:
                  TextStyle(fontSize: 18.sp,
                      fontFamily: 'RubikMedium',
                      color: cek() == true ? Colors.white : Color.fromRGBO(255, 255, 255, 0.4)),),
                  style: ElevatedButton.styleFrom(
                    splashFactory: cek() == false ? NoSplash.splashFactory : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    primary: cek()
                        == false ? Color.fromRGBO(205, 2, 27, 0.5) : Color.fromRGBO(170, 5, 27, 1),
                    onPrimary: Color.fromRGBO(0, 0, 0, 1.0),
                  ),),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
