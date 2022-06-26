import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pain/HomeScreen.dart';
import 'package:pain/Main/MainActivity.dart';
import 'package:pain/splashscreen.dart';

class Validation_page extends StatefulWidget {

  List<String> id = [];
  List<String> emaill = [];
  Validation_page(this.id,this.emaill);

  @override
  _Validation_pageState createState() => _Validation_pageState();
}

class _Validation_pageState extends State<Validation_page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 12, 13, 1),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          if (snapshot.hasData){
            var email_ = snapshot.data!.email.toString();
            var i = widget.emaill.indexOf(email_);
            return Main_Activity(widget.id[i],0);
          }
          else{
            return HomeScreen();
          }
        },
      ),
    );
  }
}
