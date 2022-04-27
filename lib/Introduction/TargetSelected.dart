import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pain/Introduction/DataProfile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


bool cek = false;

class PageTarget extends StatelessWidget {
  const PageTarget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/Image/bgIntroScreen5.png"),
                      fit: BoxFit.cover
                  )
              ),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 5.6.h),
                    child: Image.asset("asset/Image/pagination5.png",width: 44.5.w,height: 2.8.h,),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 12.65.h),
                    child: Text("Choose your target zones!",style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      fontFamily: 'PoppinsBoldSemi',
                      fontSize: 19.7.sp,
                    ),
                      textAlign: TextAlign.center,),
                  ),
                  Target_Selected()
                ],
              ),
            );
          },),
        ));
  }
}


class Target_Selected extends StatefulWidget {

  @override
  _Target_Selected createState() => _Target_Selected();
}

class _Target_Selected extends State<Target_Selected> {

  bool chest = false;
  bool arm = false;
  bool legs = false;
  bool abs = false;

  bool cekin(){
    if(chest == true || arm == true || legs == true || abs == true){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  void dispose() {
    cek = false;
    super.dispose();
  }

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
                          chest = true;
                        });
                      }
                      else{
                        if (chest == false){
                          setState(() {
                            chest = true;
                          });
                        }
                        else{
                          setState(() {
                            chest = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5.7.w),
                      alignment: Alignment.centerLeft,
                      child: Text("Chest",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'RubikSemiBold',
                            fontSize: 18.sp,
                            color: chest == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                        ),),),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        primary: chest == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                        padding: EdgeInsets.symmetric(vertical: 2.95.h)
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.7.w),
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
                          arm = true;
                        });
                      }
                      else{
                        if (arm == false){
                          setState(() {
                            arm = true;
                          });
                        }
                        else{
                          setState(() {
                            arm = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5.7.w),
                      alignment: Alignment.centerLeft,
                      child: Text("Arm",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'RubikSemiBold',
                            fontSize: 18.sp,
                            color: arm == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                        ),),),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        primary: arm == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                        padding: EdgeInsets.symmetric(vertical: 2.95.h)
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.7.w),
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
                          legs = true;
                        });
                      }
                      else{
                        if (legs == false){
                          setState(() {
                            legs = true;
                          });
                        }
                        else{
                          setState(() {
                            legs = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5.7.w),
                      alignment: Alignment.centerLeft,
                      child: Text("Legs",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'RubikSemiBold',
                            fontSize: 18.sp,
                            color: legs == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                        ),),),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        primary: legs == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                        padding: EdgeInsets.symmetric(vertical: 2.95.h)
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.7.w),
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
                          abs = true;
                        });
                      }
                      else{
                        if (abs == false){
                          setState(() {
                            abs = true;
                          });
                        }
                        else{
                          setState(() {
                            abs = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5.7.w),
                      alignment: Alignment.centerLeft,
                      child: Text("Abs",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'RubikSemiBold',
                            fontSize: 18.sp,
                            color: abs == false ? Color.fromRGBO(255, 255, 255, 0.8) : Color.fromRGBO(10, 12, 13, 0.8)
                        ),),),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        primary: abs == false ? Color.fromRGBO(10, 12, 13, 0.8) : Color.fromRGBO(255, 255, 255, 0.8),
                        padding: EdgeInsets.symmetric(vertical: 2.95.h)
                    ),
                  ),
                ),

                // groupbutton("Chest",0),
                // groupbutton("Arm",24),
                // groupbutton("Legs",24),
                // groupbutton("Abs",24),
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
                            pageBuilder: (context,animation,animationTime) => PageData()));
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
  bool cek =false;

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
            });
          } else{
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

