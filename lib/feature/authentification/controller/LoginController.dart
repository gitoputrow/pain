import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:pain/theme/colors.dart';
import 'package:pain/widget/BasicLoader.dart';
import 'package:pain/widget/ToastMessageCustom.dart';

import '../../../StorageProvider.dart';

class LoginController extends GetxController {
  DatabaseReference database = FirebaseDatabase.instance.ref();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final GlobalKey<FormBuilderState> form = GlobalKey();

  Rx<bool> _passVisble = false.obs;
  bool get passVisble => _passVisble.value;
  set passVisble(bool passVisble) => _passVisble.value = passVisble;

  Rx<bool> _usernameExist = false.obs;
  bool get usernameExist => _usernameExist.value;
  set usernameExist(bool usernameExist) => _usernameExist.value = usernameExist;

  Rx<bool> _passCheck = false.obs;
  bool get passCheck => _passCheck.value;
  set passCheck(bool passCheck) => _passCheck.value = passCheck;

  Rx<TextEditingController> tecUsername = TextEditingController().obs;
  Rx<TextEditingController> tecPassword = TextEditingController().obs;

  Future login() async {
    if (!form.currentState!.saveAndValidate()) {
      return;
    }
    Get.dialog(BasicLoader());
    final data = await firestore
        .collection("usersData")
        .where('username', isEqualTo: form.currentState!.value['username'])
        .get();
    if (data.docs.isEmpty) {
      Get.back();
      ToastMessageCustom.ToastMessage("Username Not Found", primaryDarkColor,
          textColor: Colors.white);
    } else {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: data.docs.first.data()['email'],
            password: form.currentState!.value['pass']);
        final token = data.docs.first.id;
        await StorageProvider.setUserToken(token);
        Get.offAllNamed("/dashboard", arguments: 0);
      } on FirebaseAuthException catch (e) {
        log("catch firebase : " + e.code.toString());
        if (e.code == 'wrong-password') {
          Get.back();
          ToastMessageCustom.ToastMessage("Wrong Password", primaryDarkColor,
              textColor: Colors.white);
        }
      } catch (e) {
        log("catch : " + e.toString());
      }
    }
  }
}
