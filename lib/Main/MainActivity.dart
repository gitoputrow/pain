import 'package:flutter/material.dart';
import 'package:pain/Main/HomePage.dart';
import 'package:pain/Main/ProfilePage.dart';
import 'package:pain/Main/WorkoutPage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Main_Activity extends StatefulWidget {
  
  String id = "";
  int currentindex = 0;
  Main_Activity(this.id,this.currentindex);

  @override
  _Main_ActivityState createState() => _Main_ActivityState(currentindex);
}

class _Main_ActivityState extends State<Main_Activity> {

  int currentIndex=0;

  _Main_ActivityState(this.currentIndex);
  
  List<Widget> _page = [];
  
  @override
  void initState() {
    _page = [
      Home_Page(widget.id),
      Workout_Page(widget.id),
      Profile_Page(widget.id)
    ];
    // TODO: implement initState
    super.initState();
  }

  void OnTappedBar(int Index){
    setState(() {
      currentIndex = Index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(10, 12, 13, 1),
          extendBody: false,
          body: _page[currentIndex],
          bottomNavigationBar: ResponsiveSizer(
            builder: (context, orientation, screenType) {
              return Container(
                child: BottomNavigationBar(
                  elevation: 0,
                  onTap: OnTappedBar,
                  currentIndex: currentIndex,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Color.fromRGBO(10, 12, 13, 1),
                  items: [
                    BottomNavigationBarItem(
                        activeIcon: Container(
                          padding: EdgeInsets.only(bottom: 1.5.h,top: 1.5.h),
                          // padding: EdgeInsets.symmetric(vertical: 15),
                          child: Image.asset("asset/Image/HomeActiveIcon.png",width: 40.w, height: 4.7.h,),
                        ),
                        icon: Container(
                          padding: EdgeInsets.only(bottom: 1.5.h,top: 1.5.h),
                          // padding: EdgeInsets.symmetric(vertical: 15),
                          child: Image.asset("asset/Image/HomeIcon.png",width: 32.w, height: 3.8.h,),
                        ),
                        label: "a",
                        backgroundColor: Colors.black),
                    BottomNavigationBarItem(
                        activeIcon: Container(
                          padding: EdgeInsets.only(bottom: 1.5.h,top: 1.5.h),
                          // padding: EdgeInsets.symmetric(vertical: 15),
                          child: Image.asset("asset/Image/workoutIconActive.png",width: 40.w, height: 4.7.h,),
                        ),
                        icon: Container(
                          padding: EdgeInsets.only(bottom: 1.5.h,top: 1.5.h),
                          // padding: EdgeInsets.symmetric(vertical: 15),
                          child: Image.asset("asset/Image/workoutIcon.png",width: 32.w, height: 3.8.h,),
                        ),
                        label: "a",
                        backgroundColor: Colors.black),
                    BottomNavigationBarItem(
                        activeIcon: Container(
                          padding: EdgeInsets.only(bottom: 1.5.h,top: 1.5.h),
                          // padding: EdgeInsets.symmetric(vertical: 15),
                          child: Image.asset("asset/Image/profilepageIconActive.png",width: 40.w, height: 4.7.h,),
                        ),
                        icon: Container(
                          padding: EdgeInsets.only(bottom: 1.5.h,top: 1.5.h),
                          // padding: EdgeInsets.symmetric(vertical: 15),
                          child: Image.asset("asset/Image/profilepageIcon.png",width: 32.w, height: 3.8.h,),
                        ),
                        label: "a",
                        backgroundColor: Colors.black),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
