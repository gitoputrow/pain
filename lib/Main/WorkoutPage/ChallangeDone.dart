import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pain/Main/HomePage.dart';
import 'package:pain/Main/MainActivity.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Challange_Done extends StatefulWidget {
  String id = "";
  String level = "";
  Challange_Done(this.id,this.level);

  @override
  _Challange_DoneState createState() => _Challange_DoneState();
}

class _Challange_DoneState extends State<Challange_Done> {

  DatabaseReference ref = FirebaseDatabase.instance.ref();

  String finished = "0";

  data() async {
    final data = await ref.child(widget.id).child("Challange").child(widget.level).get();
    setState(() {
      finished = (int.parse(data.value.toString()) + 1).toString();
    });
  }

  @override
  void initState() {
    data();
    // TODO: implement initState
    super.initState();
  }

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
                            fontSize: 18.5.sp,
                            color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 4.h,left: 24.w,right: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(onPressed: () {

                              ref.child(widget.id).child("Challange").child(widget.level).set(finished);

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => Main_Activity(widget.id,1)),
                                      (route) => false);

                            },
                              child: Text("Finish",style:
                              TextStyle(fontSize: 17.05.sp,
                                  fontFamily: 'RubikSemiBold',
                                  color: Colors.white  ),),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 2.h,),
                                  primary: Color.fromRGBO(170, 5, 27, 1),
                                  onPrimary: Color.fromRGBO(0, 0, 0, 1.0)
                              ),),
                          ],
                        )
                    ),
                  ],
                ),
              );
            },)
        ));
  }
}

