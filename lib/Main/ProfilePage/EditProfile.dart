import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EP_Page extends StatelessWidget {

  String id;
  EP_Page(this.id);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(47, 47, 47, 1),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 3.25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5.5.w),
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Image.asset("asset/Image/backsetting.png"),
                          iconSize: 36,
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 1.1.h),
                        alignment: Alignment.center,
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontSize: 18.5.sp,
                              fontFamily: 'PoppinsBoldSemi',
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                      child : Edit_Profile(id),
                  )

                ],
              ),
            ),
          ),
        ),);
    },);
  }
}


class Edit_Profile extends StatefulWidget {

  String id;
  Edit_Profile(this.id);

  @override
  _Edit_ProfileState createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {

  String hintUser = "";
  String hintEmail = "";
  String hintName = "";
  String hintHeight = "";
  String hintWeight = "";

  String key = "";

  final textEmail = TextEditingController();
  final textUser = TextEditingController();
  final textName = TextEditingController();
  final textWeight = TextEditingController();
  final textHeight = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  updateEmail(String email) async {
    final user = await _auth.currentUser;
    String path = "email";
    user!.updateEmail(email).whenComplete(() =>
    changeData(path, email));
  }

  database() async {
    final data = await ref.child(widget.id).get();
    setState(() {
      hintUser = data.child("user").value.toString();
      hintName = data.child("name").value.toString();
      hintEmail = data.child("email").value.toString();
      hintHeight = data.child("height").value.toString();
      hintWeight = data.child("weight").value.toString();
    });
  }

  bool userError(String user){
    if(user.isNotEmpty && user.contains(" ")){
      return true;
    }
    else{
      return false;
    }
  }

  bool user = false;
  bool name = false;
  bool email = false;
  bool height = false;
  bool weight = false;

  bool cek(){
    if (user == false && email == false && name == false
        && height == false && weight == false){
      return false;
    }
    else{
      return true;
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
  bool emailValid(email){
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  changeData(String path,String value){
    ref.child(widget.id).child(path).set(value);
  }

  @override
  void initState() {
    database();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 2.8.h),
          child: Text(
            "Username",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'RubikLight',
                fontSize: 14.sp),
          ),
        ),
        Container(
          child: TextField(
            keyboardType: TextInputType.name,
            controller: textUser,
            onChanged: (text){
              if(textUser.text.isNotEmpty){
                user = true;
              }
              else{
                user = false;
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 2.w),
              hintText: hintUser,
              hintStyle: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontFamily: 'RubikMedium',
                  fontSize: 16.sp),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              errorText: userError(textUser.text) == true ? "Username can't contain any space" : null,
            ),
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.8),
              fontSize: 16.sp,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 2.h),
          child: Text(
            "Email",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'RubikLight',
                fontSize: 14.sp),
          ),
        ),
        Container(
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            controller: textEmail,
            onChanged: (text){
              if(textEmail.text.isNotEmpty){
                email = true;
              }
              else{
                email = false;
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 2.w),
              hintText: hintEmail,
              hintStyle: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontFamily: 'RubikMedium',
                  fontSize: 16.sp),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(16.0)),
              //   borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.9), width: 1.w),
              // ),
              errorText: emailError(textEmail.text) == true ? "your email is not valid" : null,
            ),
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.8),
              fontSize: 16.sp,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 2.h),
          child: Text(
            "Full Name",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'RubikLight',
                fontSize: 14.sp),
          ),
        ),
        Container(
          child: TextField(
            keyboardType: TextInputType.name,
            controller: textName,
            onChanged: (text){
              if(textName.text.isNotEmpty){
                name = true;
              }
              else{
                name = false;
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 2.w),
              hintText: hintName,
              hintStyle: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontFamily: 'RubikMedium',
                  fontSize: 16.sp),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.8),
              fontSize: 16.sp,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 2.h),
          child: Text(
            "Height",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'RubikLight',
                fontSize: 14.sp),
          ),
        ),
        Container(
          child: TextField(
            keyboardType: TextInputType.number,
            controller: textHeight,
            onChanged: (text){
              if(textHeight.text.isNotEmpty){
                height = true;
              }
              else{
                height = false;
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 2.w,top: 1.8.h),
              hintText: hintHeight,
              hintStyle: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontFamily: 'RubikMedium',
                  fontSize: 16.sp),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              suffixIcon: Container(
                padding: EdgeInsets.only(left:3.w,top: 2.h),
                child: Text("Cm",style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontSize: 16.sp,
                ),),
              ),
            ),
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.8),
              fontSize: 16.sp,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 2.h),
          child: Text(
            "Weight",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'RubikLight',
                fontSize: 14.sp),
          ),
        ),
        Container(
          child: TextField(
            keyboardType: TextInputType.number,
            controller: textWeight,
            onChanged: (text){
              if(textWeight.text.isNotEmpty){
                weight = true;
              }
              else{
                weight = false;
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 2.w,top: 1.8.h),
              hintText: hintWeight,
              hintStyle: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontFamily: 'RubikMedium',
                  fontSize: 16.sp),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              suffixIcon: Container(
                padding: EdgeInsets.only(left:3.5.w,top: 2.h),
                child: Text("Kg",style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontSize: 16.sp,
                ),),
              ),
            ),
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.8),
              fontSize: 16.sp,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 29.h),
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 4.w),
                          child: ElevatedButton(onPressed: () {

                            textUser.text = "";
                            textEmail.text = "";
                            textName.text = "";
                            textHeight.text = "";
                            textWeight.text = "";

                          },
                            child: Text("Discard",style:
                            TextStyle(fontSize: 16.sp,
                                fontFamily: 'RubikMedium',
                                color: cek() == false ? Color.fromRGBO(255, 255, 255, 0.4) : Color.fromRGBO(255, 255, 255, 1) ),),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                padding: EdgeInsets.symmetric(vertical: 1.8.h,),
                                primary: cek() == false ? Color.fromRGBO(255, 255, 255, 0.1) : Color.fromRGBO(255, 255, 255, 0.3),
                                onPrimary: Color.fromRGBO(0, 0, 0, 1.0)
                            ),),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 4.w),
                          child: ElevatedButton(onPressed: () {
                            if (cek() == true){
                              if (emailError(textEmail.text) == true || userError(textUser.text) == true){
                                Fluttertoast.showToast(
                                    msg: "Complete the Error Message",  // message
                                    toastLength: Toast.LENGTH_SHORT, // length
                                    gravity: ToastGravity.BOTTOM,    // location
                                    timeInSecForIosWeb: 1               // duration
                                );
                              }
                              else{
                                showDialog(
                                    context: context,
                                    builder: (context){
                                      return AlertDialog(
                                        backgroundColor: Color.fromRGBO(180, 180, 180, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8.w))),
                                        contentPadding: EdgeInsets.symmetric(vertical: 3.5.h,horizontal: 12.w),
                                        content: Container(
                                          // height: 15.h,
                                          width: 10.w,
                                          // decoration: BoxDecoration(
                                          //     // borderRadius: BorderRadius.circular(160),
                                          // ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Are You Sure Want",
                                                style: TextStyle(
                                                    fontFamily: "RubikRegular",
                                                    fontSize: 18.sp,
                                                    color: Color.fromRGBO(0, 0, 0, 0.8)
                                                ),),
                                              Text(
                                                "The Changes?",
                                                style: TextStyle(
                                                    fontFamily: "RubikRegular",
                                                    fontSize: 18.sp,
                                                    color: Color.fromRGBO(0, 0, 0, 0.8)
                                                ),),
                                              Container(
                                                padding: EdgeInsets.only(top: 2.h),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets.only(right: 4.w),
                                                            child: ElevatedButton(onPressed: () {

                                                              Navigator.of(context).pop();

                                                            },
                                                              child: Text("No",style:
                                                              TextStyle(fontSize: 16.sp,
                                                                  fontFamily: 'RubikMedium',
                                                                  color: Colors.black  ),),
                                                              style: ElevatedButton.styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(10)
                                                                  ),
                                                                  padding: EdgeInsets.symmetric(vertical: 1.8.h,),
                                                                  primary: Colors.white ,
                                                                  onPrimary: Color.fromRGBO(0, 0, 0, 1.0)
                                                              ),),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets.only(left: 4.w),
                                                            child: ElevatedButton(onPressed: () {
                                                              FirebaseAuth _auth = FirebaseAuth.instance;
                                                              if (textUser.text.isNotEmpty){
                                                                changeData("user", textUser.text);
                                                              }
                                                              if (textName.text.isNotEmpty){
                                                                changeData("name", textName.text);
                                                              }
                                                              if (textHeight.text.isNotEmpty){
                                                                changeData("height", textHeight.text);
                                                              }
                                                              if (textWeight.text.isNotEmpty){
                                                                changeData("Weight", textWeight.text);
                                                              }
                                                              if(emailValid(textEmail.text) == true){
                                                                updateEmail(textEmail.text);
                                                              }
                                                              Navigator.of(context).pop();
                                                              Navigator.pop(context);
                                                            },
                                                              child: Text("Yes",style:
                                                              TextStyle(fontSize: 16.sp,
                                                                  fontFamily: 'RubikMedium',
                                                                  color: Colors.white),),
                                                              style: ElevatedButton.styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(10)
                                                                  ),
                                                                  padding: EdgeInsets.symmetric(vertical: 1.8.h,),
                                                                  primary: Color.fromRGBO(205, 5, 27, 0.8),
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
                                        ),
                                      );
                                    });
                              }
                            }
                          },
                            child: Text("Save",style:
                            TextStyle(fontSize: 16.sp,
                                fontFamily: 'RubikMedium',
                                color: cek() == false ? Color.fromRGBO(0, 0, 0, 0.6) : Color.fromRGBO(0, 0, 0, 1)),),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                padding: EdgeInsets.symmetric(vertical: 1.8.h,),
                                primary: cek() == false ? Color.fromRGBO(255, 255, 255, 0.5) : Color.fromRGBO(255, 255, 255, 1),
                                onPrimary: Color.fromRGBO(0, 0, 0, 1.0)
                            ),),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          )
        )
      ],
    );
  }
}

