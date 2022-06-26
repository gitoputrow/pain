import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pain/HomeScreen.dart';
import 'package:pain/ValidationPage.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  DatabaseReference ref = FirebaseDatabase.instance.ref();

  List<String> id = [];
  List<String> emaill = [];

  data() async {
    final usersnap = await ref.get();
    for (var child in usersnap.children){
      var idkey = child.key.toString();
      var email = child.child("email").value.toString();
      setState(() {
        id.add(idkey);
        emaill.add(email);
      });
    }
  }

  @override
  void initState() {
    data();
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Validation_page(id,emaill)));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 12, 13, 1),
      body: FadeTransition(
        opacity: _animation,
        child: Center(
          child: Image.asset("asset/Image/Group_35.png",width: 112,height: 54,),
        ),
      ),
    );
  }
}
