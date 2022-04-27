import 'dart:developer';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pain/HomeScreen.dart';
import 'package:pain/Introduction/FragmentValue.dart';
import 'package:pain/Introduction/GenderSelected.dart';
import 'package:pain/Introduction/GoalSelected.dart';
import 'package:pain/Introduction/MotivationSelected.dart';
import 'package:pain/Introduction/PhysicallySelected.dart';
import 'package:pain/Introduction/TargetSelected.dart';


class Introduction_Screen extends StatefulWidget {

  String value = '';
  // final Value = ValueFrgament();

  @override
  _Introduction_ScreenState createState() => _Introduction_ScreenState();
}

class _Introduction_ScreenState extends State<Introduction_Screen> {

  int index = 0;

  final List<Widget> fragment = [
    gender_selected(),
    Physically_Selected(),
    Goal_selected(),
    Motivation_Selected(),
    Target_Selected()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor: Color.fromRGBO(10, 12, 13, 100),
      body: Stack(
        children: [
          fragment[index],
          Container(
            padding: EdgeInsets.only(top: 34,bottom: 34,left: 24),
            child: Row(
              children: [
                Container(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: IconButton(onPressed: (){
                      if (index != 0){
                        setState(() {
                          index -= 1;
                        });
                      }
                      else{
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                                (route) => false);
                      }
                   },
                      icon: Image.asset("asset/Image/back_intro.png",),
                        color: Colors.white,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 28),
                  child: Image.asset("asset/Image/Group16.png",scale: 3,),
                ),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 40),
                  child: ElevatedButton(onPressed: () {
                    if (index != fragment.length-1){
                      setState(() {
                        // log(widget.Value.male);
                        index += 1;
                      });
                    }
                    else{
                      Fluttertoast.showToast(
                          msg: "baru segini desainnya susah soalnye",  // message
                          toastLength: Toast.LENGTH_SHORT, // length
                          gravity: ToastGravity.CENTER,    // location
                          timeInSecForIosWeb: 1               // duration
                      );
                    }
                  },
                    child: Text("Continue",style:
                    TextStyle(fontSize: 18,
                        fontFamily: 'RubikBoldItalic',
                        color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        padding: EdgeInsets.symmetric(vertical: 24),
                        primary: Color.fromRGBO(170, 5, 27, 1),
                        onPrimary: Color.fromRGBO(0, 0, 0, 1.0)
                    ),),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
