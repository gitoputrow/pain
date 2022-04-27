import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Rest_Page extends StatefulWidget {

  String nextWorkout = "";
  Rest_Page(this.nextWorkout);

  @override
  _Rest_PageState createState() => _Rest_PageState();
}

class _Rest_PageState extends State<Rest_Page> with SingleTickerProviderStateMixin {

  int second = 30;
  Timer? timer;

  @override
  void initState() {

    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if(second==0){
        Navigator.pop(context);
      }
      else{
        setState(() {
          second--;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(10, 12, 13, 1),
          body: ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Rest",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27.sp,
                        fontFamily: 'RubikMedium',
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 1.5.h),
                    child: Text(
                      "Next is ${widget.nextWorkout} 6 x",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                        fontSize: 18.sp,
                        fontFamily: 'RubikReguler',
                      ),
                    ),
                  ),
                  if (second>=60)
                    if (second<70)
                      Container(
                        padding: EdgeInsets.only(top: 2.h),
                        alignment: Alignment.center,
                        child:
                        Text(
                          "01:0${second-60}",
                          style: TextStyle(
                              fontFamily: 'RubikMedium',
                              fontSize: 40,
                              color: Color.fromRGBO(205, 5, 27, 1)
                          ),
                        ),
                      ),
                  if (second>=70)
                    Container(
                      padding: EdgeInsets.only(top: 2.h),
                      alignment: Alignment.center,
                      child:
                      Text(
                        "01:${second-60}",
                        style: TextStyle(
                            fontFamily: 'RubikMedium',
                            fontSize: 24.5.sp,
                            color: Color.fromRGBO(205, 5, 27, 1)
                        ),
                      ),
                    ),
                  if (second<60)
                    if (second>=10)
                      Container(
                        padding: EdgeInsets.only(top: 2.h),
                        alignment: Alignment.center,
                        child:
                        Text(
                          "00:$second",
                          style: TextStyle(
                              fontFamily: 'RubikMedium',
                              fontSize: 24.5.sp,
                              color: Color.fromRGBO(205, 5, 27, 1)
                          ),
                        ),
                      ),
                  if (second<10)
                    Container(
                      padding: EdgeInsets.only(top: 2.h),
                      alignment: Alignment.center,
                      child:
                      Text(
                        "00:0$second",
                        style: TextStyle(
                            fontFamily: 'RubikMedium',
                            fontSize: 24.5.sp,
                            color: Color.fromRGBO(205, 5, 27, 1)
                        ),
                      ),
                    ),
                  Container(
                    padding: EdgeInsets.only(left: 11.8.w,right: 11.8.w,top: 5.h),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 4.w),
                                child: ElevatedButton(onPressed: () {

                                  setState(() {
                                    second+=10;
                                  });

                                },
                                  child: Text("+10s",style:
                                  TextStyle(fontSize: 16.sp,
                                      fontFamily: 'RubikSemiBold',
                                      color: Colors.black  ),),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 1.6.h,),
                                      primary: Colors.white,
                                      onPrimary: Color.fromRGBO(0, 0, 0, 1.0)
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 4.w),
                                child: ElevatedButton(onPressed: () {

                                  Navigator.pop(context);

                                },
                                  child: Text("SKIP",style:
                                  TextStyle(fontSize: 16.sp,
                                      fontFamily: 'RubikSemiBold',
                                      color: Colors.white  ),),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 1.6.h,),
                                      primary: Color.fromRGBO(170, 5, 27, 1),
                                      onPrimary: Color.fromRGBO(0, 0, 0, 1.0)
                                  ),),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  )

                ],
              ),
            );
          },

          ),
        ));
  }
}
