import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Introduction/GenderSelected.dart';
import 'LoadingScreen.dart';


class LoginActivtyy extends StatelessWidget {
  const LoginActivtyy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(10, 12, 13, 1),
        body: ScreenUtilInit(
          designSize: Size(423,897),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context,widget) {
            return Container(
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 32.w,top: 22.h,bottom: 18.h),
                    child: Image.asset("asset/Image/Group_35.png",
                      width: 57.w,
                      height: 29.h,
                      color: Color.fromRGBO(255, 255, 255, 0.8),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 8.h),
                    child: Text("Login",style:
                    TextStyle(
                        fontFamily: 'PoppinsBoldSemi',
                        fontSize: 27.3.sp,
                        color: Color.fromRGBO(255, 255, 255, 0.8)
                    ),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 8),
                    child: Text("Sign in to your Account",style:
                    TextStyle(
                        fontFamily: 'RubikLight',
                        fontSize: 23.5.sp,
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                    ),),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 34.w,right: 34.w,top: 40.h),
                    child: Login_Activity(),
                  ),

                ],
              ),
            );
          },)
    );
  }
}


class Login_Activity extends StatefulWidget {
  const Login_Activity({Key? key}) : super(key: key);

  @override
  _Login_ActivityState createState() => _Login_ActivityState();
}

class _Login_ActivityState extends State<Login_Activity> {

  final textUser = TextEditingController();
  final textPass = TextEditingController();

  bool textuser = false;
  bool textpass = false;

  bool visiblepass = false;
  bool visibleconfirmpass = false;

  bool cek(){
    if (textuser == false || textpass== false){
      return false;
    }
    else {
      return true;
    }
  }


  bool emailValid(email){
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  bool exist = false;
  String email = "";
  String pass = "";
  String id = "";
  database() async {
      final snap = await ref.get();
      for(var child in snap.children){
        var user = child.child("user").value.toString();
        if (user == textUser.text){
          setState(() {
            exist = true;
            email = child.child("email").value.toString();
            pass = child.child("pass").value.toString();
            id = child.key.toString();
          });
          break;
        }
      }
      log(exist.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 0),
          child: TextField(
            keyboardType: TextInputType.name,
            controller: textUser,
            onChanged: (text){
              if (textUser.text.isEmpty){
                setState(() {
                  textuser = false;
                });
              }
              else{
                database();
                setState(() {
                  textuser = true;
                });
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 24.w),
              hintText: "Insert Your Username",
              hintStyle: TextStyle(
                fontFamily: 'RubikMedium',
                color: Color.fromRGBO(10,12,13, 0.5),
                fontSize: 17.sp,),
              prefixIcon: Container(
                padding: EdgeInsets.only(left: 12.w,right: 8.w),
                child: Image.asset("asset/Image/profileIconLogin.png",scale: 15.r,),
              ),
              prefixIconColor: Color.fromRGBO(10, 12, 13, 1),
              fillColor: Color.fromRGBO(255, 255, 255, 0.4),
              filled: true,
              iconColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 2.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 2.w),
              ),
            ),
            style: TextStyle(
              color: Color.fromRGBO(10, 12, 13, 1),
              fontSize: 18.sp,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 28.h),
          child: TextField(

            keyboardType: TextInputType.text,
            controller: textPass,
            obscureText: visiblepass == false ? true : false,
            onChanged: (text){
              if (textPass.text.isEmpty){
                setState(() {
                  textpass = false;
                });
              }
              else{
                setState(() {
                  textpass = true;
                });
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 1.w),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 24.w),
              hintText: "Set Your Password",
              hintStyle: TextStyle(
                fontFamily: 'RubikMedium',
                color: Color.fromRGBO(10,12,13, 0.5),
                fontSize: 17.sp,),
              prefixIcon: Container(
                padding: EdgeInsets.only(left: 12.w,right: 8.w),
                child: Image.asset("asset/Image/passIconLogin.png",scale: 16.r,),
              ),
              fillColor: Color.fromRGBO(255, 255, 255, 0.4),
              suffixIcon: Container(
                padding: EdgeInsets.only(right: 8.w),
                child: IconButton(
                  icon: visiblepass == false ?
                  Image.asset("asset/Image/EyeVisibleIconBlack.png",width: 24.w,height: 24.h,) :
                  Image.asset("asset/Image/EyeInvisibleIconBlack.png",width: 24.w,height: 24.h,),
                  onPressed: () {
                    setState(() {
                      if (visiblepass == false) {
                        visiblepass = true;
                      }
                      else{
                        visiblepass = false;
                      }
                    });
                  },
                ),
              ),
              filled: true,
              iconColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 2.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 2.w),
              ),
            ),
            style: TextStyle(
              color: Color.fromRGBO(10, 12, 13, 1),
              fontSize: 18.sp,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(top: 16.h),
          child: Text("Forgot your Password?",
            style: TextStyle(
              fontFamily: 'PoppinsMedium',
              fontSize: 12.sp,
              color: Color.fromRGBO(255, 255, 255, 0.6),
            ),),
        ),
        Container(
          padding: EdgeInsets.only(top: 304.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 16.h),
                child: ElevatedButton(onPressed: (){
                  if (cek() == true){
                    FirebaseAuth _auth = FirebaseAuth.instance;
                    if (exist == true){
                      if(pass == textPass.text){
                        _auth.signInWithEmailAndPassword(
                            email: email,
                            password: textPass.text).whenComplete(()
                        => Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 450),
                                transitionsBuilder:
                                    (context,animation,animationTime,child){
                                  animation = CurvedAnimation(parent: animation, curve: Curves.ease);
                                  return SlideTransition(
                                    position: Tween(
                                      begin: Offset(1,0),
                                      end: Offset.zero,).animate(animation),
                                    child: child,);
                                },
                                pageBuilder: (context,animation,animationTime) => Loading_Screen(id))));
                      }
                      else{
                        Fluttertoast.showToast(
                            msg: "Wrong Password",  // message
                            toastLength: Toast.LENGTH_SHORT, // length
                            gravity: ToastGravity.BOTTOM,    // location
                            timeInSecForIosWeb: 1               // duration
                        );
                      }
                    }
                    else{
                      Fluttertoast.showToast(
                          msg: "Username not found",  // message
                          toastLength: Toast.LENGTH_SHORT, // length
                          gravity: ToastGravity.BOTTOM,    // location
                          timeInSecForIosWeb: 1               // duration
                      );
                    }
                  }
                },

                  child: Text("Login",style:
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
        Container(
          child: RichText(
            text: TextSpan(
                text: "Don’t have an Account? ",
                style: TextStyle(
                  fontFamily: "PoppinsRegular",
                  fontSize: 16.sp,
                  color: Color.fromRGBO(255, 255, 255, 0.6),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Sign up",
                    style: TextStyle(
                      fontFamily: "PoppinsBoldSemi",
                      fontSize: 16.sp,
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PageGender())
                        );
                      },
                  )
                ]
            ),
          ),
        )
      ],
    );
  }
}
