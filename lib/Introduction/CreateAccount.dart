import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pain/HomeScreen.dart';
import 'package:pain/Introduction/DataUser.dart';
import 'package:pain/Introduction/PhysicallySelected.dart';
import 'package:pain/LoadingScreen.dart';
import 'package:pain/splashscreen.dart';


class PageCreate extends StatelessWidget {

  Data_user dataUser = Data_user();
  Data_profile dataProfile = Data_profile();

  PageCreate(this.dataUser,this.dataProfile);

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
                        image: AssetImage("asset/Image/BackgroundIntroduction/bgIntroScreen7.png"),
                        fit: BoxFit.cover
                    )
                ),
                child: Create_Account(dataUser,dataProfile),
              );
            },),
        ));
  }
}


class Create_Account extends StatefulWidget {

  Data_user dataUser = Data_user();
  Data_profile dataProfile = Data_profile();

  Create_Account(this.dataUser,this.dataProfile);

  @override
  _Create_AccountState createState() => _Create_AccountState();
}

class _Create_AccountState extends State<Create_Account> {

  Data_account dataAccout = Data_account();

  FirebaseAuth _auth = FirebaseAuth.instance;



  final textEmail = TextEditingController();
  final textUser = TextEditingController();
  final textPass = TextEditingController();
  final textConfirmPass = TextEditingController();

  bool textemail = false;
  bool textuser = false;
  bool textpass = false;
  bool textconfirmpass = false;

  bool visiblepass = false;
  bool visibleconfirmpass = false;

  bool cek(email){
    if (textemail == false || textuser== false ||
        textpass== false || textconfirmpass== false){
      return false;
    }
    else {
      if (emailValid(email) == true && textPass.text.length > 5 && textConfirmPass.text == textPass.text){
        return true;
      }
      else{
        return false;
      }
    }
  }
  
  bool emailChecker = true;

  checkIfEmailInUse(String emailAddress) async {
    try {
      // Fetch sign-in methods for the email address
      final list = await _auth.fetchSignInMethodsForEmail(emailAddress);

      // In case list is not empty
      if (list.isNotEmpty) {
        // Return true because there is an existing
        // user using the email address
        setState(() {
          emailChecker = true;
        });
      } else {
        // Return false because email adress is not in use
        setState(() {
          emailChecker = false;
        });
      }
    } catch (error) {
      // Handle error
      // ...
      setState(() {
        emailChecker = true;
      });
    }
  }
  DatabaseReference ref = FirebaseDatabase().ref();

  List<String> usernameChecker = [];


  database() async {
    final children = await ref.get();
    for (var child in children.children){
      String username_ = child.child("user").value.toString();
      log(username_);
      usernameChecker.add(username_);
    }
  }

  bool emailError(email){
    if (emailValid(email) == false && email.toString().isNotEmpty){
      return true;
    }
    else{
      return false;
    }
  }
  bool userError(String user){
    if(user.isNotEmpty && user.contains(" ")){
      return true;
    }
    else{
      return false;
    }
  }

  bool emailValid(email){
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  Map muscledata = {};
  @override
  void initState() {
    for (var i = 0; i < widget.dataUser.target.length;i++){
      muscledata["taget${i+1}"] = widget.dataUser.target[i];
    }
    // TODO: implement initState
    database();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 4.5.h),
          child: Image.asset("asset/Image/Pagination/pagination7.png",width: 188.w,height: 24.h,),
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 32.h),
          child: Text("Create Account",style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            fontFamily: 'PoppinsBoldSemi',
            fontSize: 24.5.sp,
          ),),
        ),

        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 8.h),
          child: Text("Set your Username & Password\nso you can keep your Account ",style: TextStyle(
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
                    keyboardType: TextInputType.emailAddress,
                    controller: textEmail,
                    onChanged: (text){
                      checkIfEmailInUse(textEmail.text);
                      setState(() {
                        if (textEmail.text.isEmpty){
                          textemail = false;
                        }
                        else{
                          textemail = true;
                        }
                        log(textemail.toString());
                      });

                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 1.w),
                      ),
                      errorText: emailError(textEmail.text) == true ? "your email is not valid" : null,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 4.5.w),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
                      hintText: "Insert Your Email",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontFamily: 'RubikMedium',
                          fontSize: 16.sp),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(left: 12.w,right: 8.w),
                        child: Image.asset("asset/Image/emaiIcon.png",scale: 14.r,),
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
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24.h),
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
                        setState(() {
                          textuser = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
                      hintText: "Insert Your Username",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontFamily: 'RubikMedium',
                          fontSize: 17.sp),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(left: 12.w,right: 8.w),
                        child: Image.asset("asset/Image/profileIcon.png",scale: 14.w,),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 1.w),
                      ),
                      errorText: userError(textUser.text) == true ? "Username can't contain any space" : null,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 4.5.w),
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
                      errorText: textPass.text.length < 6 && textPass.text.isNotEmpty ? "you have to enter at least 6 digit!" : null,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 4.5.w),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
                      hintText: "Set Your Password",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontFamily: 'RubikMedium',
                          fontSize: 16.sp),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(left: 12.w,right: 8.w),
                        child: Image.asset("asset/Image/passIcon.png",scale: 15.r,),
                      ),
                      suffixIcon: Container(
                        padding: EdgeInsets.only(right: 8.w),
                        child: IconButton(
                          icon: visiblepass == false ?
                          Image.asset("asset/Image/EyeInvsibleIcon.png",width: 24.w,height: 24.h,) :
                          Image.asset("asset/Image/EyeVisibleIcon.png",width: 24.w,height: 24.h,),
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
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24.h),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: textConfirmPass,
                    obscureText: visibleconfirmpass == false ? true : false,
                    onChanged: (text){
                      if (textConfirmPass.text.isEmpty){
                        setState(() {
                          textconfirmpass = false;
                        });
                      }
                      else{
                        setState(() {
                          textconfirmpass = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 1.w),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 24.w),
                      hintText: "Confirm Your password",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontFamily: 'RubikMedium',
                          fontSize: 16.sp),
                      errorText: textConfirmPass.text != textPass.text && textConfirmPass.text.isNotEmpty ?
                      "your password doesn't match" : null,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 4.5.w),
                      ),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(left: 12.w,right: 8.w),
                        child: Image.asset("asset/Image/passIcon.png",scale: 15.r,),
                      ),
                      suffixIcon: Container(
                        padding: EdgeInsets.only(right: 8.w),
                        child: IconButton(
                          icon: visibleconfirmpass == false ?
                          Image.asset("asset/Image/EyeInvsibleIcon.png",width: 24.w,height: 24.h,) :
                          Image.asset("asset/Image/EyeVisibleIcon.png",width: 24.w,height: 24.h,),
                          onPressed: () {
                            setState(() {
                              if (visibleconfirmpass == false) {
                                visibleconfirmpass = true;
                              }
                              else{
                                visibleconfirmpass = false;
                              }
                            });
                          },
                        ),
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
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            )
        ),
        Container(

          padding: EdgeInsets.only(left: 32.w,right: 32.w,top: 162.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 40.h),
                child: ElevatedButton(onPressed: () {
                  if (cek(textEmail.text) == true){
                    if (emailError(textEmail.text) == false && userError(textUser.text) == false && textConfirmPass.text == textPass.text){
                      log(emailChecker.toString());
                      if (emailChecker == false){
                        if (usernameChecker.contains(textUser.text)){
                          Fluttertoast.showToast(
                              msg: "Username is already in use",  // message
                              toastLength: Toast.LENGTH_SHORT, // length
                              gravity: ToastGravity.BOTTOM,    // location
                              timeInSecForIosWeb: 1               // duration
                          );
                        }
                        else{
                          dataAccout.email = textEmail.text;
                          dataAccout.pass = textPass.text;
                          dataAccout.username = textUser.text;
                          String id = ref.push().key.toString();

                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration: Duration(milliseconds: 450),
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
                                  pageBuilder: (context,animation,animationTime) =>
                                      Loading_Screen(id)));

                          _auth.createUserWithEmailAndPassword(
                              email: textEmail.text,
                              password: textPass.text).whenComplete(()
                          => ref.child(id).set({
                            "name" : widget.dataProfile.name,
                            "user" : dataAccout.username,
                            "email" : dataAccout.email,
                            "pass" : dataAccout.pass,
                            "age" : widget.dataProfile.age,
                            "height" : widget.dataProfile.height,
                            "weight" : widget.dataProfile.weight,
                            "goal" : widget.dataUser.goal,
                            "level" : widget.dataUser.level
                          }).whenComplete(() => ref.child(id).child("Muscle").set(
                              muscledata)).whenComplete(() =>
                              ref.child(id).child("Challange").set({
                                "FullBodyBeginner" : 0,
                                "AbsBeginner" : 0,
                                "TricepsBeginner" : 0,
                                "BicepsBeginner" : 0,
                                "ChestBeginner" : 0,
                                "LegsBeginner" : 0,
                                "CardioBeginner" : 0,
                                "FullBodyIntermediate" : 0,
                                "AbsIntermediate" : 0,
                                "TricepsIntermediate" : 0,
                                "BicepsIntermediate" : 0,
                                "ChestIntermediate" : 0,
                                "LegsIntermediate" : 0,
                                "CardioIntermediate" : 0,
                              }))).whenComplete(() => _auth.signInWithEmailAndPassword(
                              email: textEmail.text,
                              password: textPass.text));
                        }
                      }
                      else {
                        Fluttertoast.showToast(
                            msg: "Email is already in use",  // message
                            toastLength: Toast.LENGTH_SHORT, // length
                            gravity: ToastGravity.BOTTOM,    // location
                            timeInSecForIosWeb: 1               // duration
                        );
                      }
                    }
                    else{
                      Fluttertoast.showToast(
                          msg: "Complete the Error Message",  // message
                          toastLength: Toast.LENGTH_SHORT, // length
                          gravity: ToastGravity.BOTTOM,    // location
                          timeInSecForIosWeb: 1               // duration
                      );
                    }
                  }
                },

                  child: Text("Let’s Get Fit",style:
                  TextStyle(fontSize: 18.sp,
                      fontFamily: 'RubikMedium',
                      color: cek(textEmail.text) == true ? Colors.white : Color.fromRGBO(255, 255, 255, 0.4)),),
                  style: ElevatedButton.styleFrom(
                    splashFactory: cek(textEmail.text) == false ? NoSplash.splashFactory : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    primary: cek(textEmail.text)
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