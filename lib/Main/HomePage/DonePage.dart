import 'package:flutter/material.dart';
import 'package:pain/Main/HomePage.dart';
import 'package:pain/Main/MainActivity.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Done_Page extends StatelessWidget {
  const Done_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(10, 12, 13, 1),
          body: ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset("asset/Image/DoneImage.png",width: 60.w,height: 30.h,),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 0),
                    child: Text(
                      "Well Done! You Are Great",
                      style: TextStyle(
                          fontFamily: 'RubikReguler',
                          fontSize: 17.sp,
                          color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 6.h),
                    child: ElevatedButton(onPressed: () {

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Main_Activity()),
                              (route) => false);

                    },
                      child: Text("Finish",style:
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
            );
          },)
        ));
  }
}
