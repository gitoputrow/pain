import 'package:flutter/material.dart';
import 'package:pain/Main/HomePage.dart';
import 'package:pain/Main/ProfilePage.dart';
import 'package:pain/Main/WorkoutPage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Main_Activity extends StatefulWidget {
  const Main_Activity({Key? key}) : super(key: key);

  @override
  _Main_ActivityState createState() => _Main_ActivityState();
}

class _Main_ActivityState extends State<Main_Activity> {

  int _currentIndex = 0;

  final List<Widget> _page = [
    Home_Page(),
    Workout_Page(),
    Profile_Page()
  ];

  void OnTappedBar(int Index){
    setState(() {
      _currentIndex = Index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(10, 12, 13, 1),
          extendBody: false,
          body: _page[_currentIndex],
          bottomNavigationBar: ResponsiveSizer(
            builder: (context, orientation, screenType) {
              return Container(
                padding: EdgeInsets.only(bottom: 1.5.h),
                child: BottomNavigationBar(
                  elevation: 0,
                  onTap: OnTappedBar,
                  currentIndex: _currentIndex,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Color.fromRGBO(10, 12, 13, 1),
                  items: [
                    BottomNavigationBarItem(
                        activeIcon: Container(
                          // padding: EdgeInsets.symmetric(vertical: 15),
                          child: Image.asset("asset/Image/HomeActiveIcon.png",width: 40.w, height: 4.7.h,),
                        ),
                        icon: Container(
                          // padding: EdgeInsets.symmetric(vertical: 15),
                          child: Image.asset("asset/Image/HomeIcon.png",width: 32.w, height: 3.8.h,),
                        ),
                        title: Text("a"),
                        backgroundColor: Colors.black),
                    BottomNavigationBarItem(
                        activeIcon: Container(
                          // padding: EdgeInsets.symmetric(vertical: 15),
                          child: Image.asset("asset/Image/workoutIconActive.png",width: 40.w, height: 4.7.h,),
                        ),
                        icon: Container(
                          // padding: EdgeInsets.symmetric(vertical: 15),
                          child: Image.asset("asset/Image/workoutIcon.png",width: 32.w, height: 3.8.h,),
                        ),
                        title: Text("a"),
                        backgroundColor: Colors.black),
                    BottomNavigationBarItem(
                        activeIcon: Container(
                          // padding: EdgeInsets.symmetric(vertical: 15),
                          child: Image.asset("asset/Image/profilepageIconActive.png",width: 40.w, height: 4.7.h,),
                        ),
                        icon: Container(
                          // padding: EdgeInsets.symmetric(vertical: 15),
                          child: Image.asset("asset/Image/profilepageIcon.png",width: 32.w, height: 3.8.h,),
                        ),
                        title: Text("a"),
                        backgroundColor: Colors.black),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
