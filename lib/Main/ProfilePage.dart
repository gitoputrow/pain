import 'package:flutter/material.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({Key? key}) : super(key: key);

  @override
  _Profile_PageState createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(10, 12, 13, 1),
          body: Center(
            child: Text("Profile",style:
            TextStyle(
                color: Colors.white
            ),),
          ),
        ));
  }
}
