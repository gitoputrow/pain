import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pain/StorageProvider.dart';
import 'package:win32/win32.dart';

import '../../../model/UserPost.dart';
import '../../../widget/BasicLoader.dart';
import '../../../widget/CustomAlertDialog.dart';
import '../../../widget/ToastMessageCustom.dart';

class SocialMediaController extends GetxController {
  final storageRef = FirebaseStorage.instance.ref();
  DatabaseReference database = FirebaseDatabase.instance.ref();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final ScrollController scrollController = ScrollController();

  Rx<TextEditingController> _searchValue = TextEditingController().obs;
  TextEditingController get searchValue => _searchValue.value;
  set searchValue(TextEditingController searchValue) =>
      _searchValue.value = searchValue;

  RxList<UserPost> _userPostData = <UserPost>[].obs;
  List<UserPost> get userPostData => _userPostData;
  set userPostData(List<UserPost> userPostData) =>
      _userPostData.value = userPostData;

  Rx<bool> _loading = true.obs;
  bool get loading => _loading.value;
  set loading(bool loading) => _loading.value = loading;

  Rx<bool> _loadMore = true.obs;
  bool get loadMore => _loadMore.value;
  set loadMore(bool loadMore) => _loadMore.value = loadMore;

  Rx<File?> _imageSource = (null as File?).obs;
  File? get imageSource => _imageSource.value;
  set imageSource(File? imageSource) => _imageSource.value = imageSource;

  Rx<String> _imagepath = "".obs;
  String get imagepath => _imagepath.value;
  set imagepath(String imagepath) => _imagepath.value = imagepath;

  Rx<bool> _hasMore = false.obs;
  bool get hasMore => _hasMore.value;
  set hasMore(bool hasMore) => _hasMore.value = hasMore;

  String? userid = "";

  int page = 1;
  QueryDocumentSnapshot? documentSnapshot;

  Future search(String username) async {
    if (username == "user.username") {
      // currentIndex = 3;
      // selectedValue = "My Profile";
      // searchValue.text = "";
    } else {
      Get.dialog(BasicLoader());
      final data = await database.child("userDatabase").get();
      bool found = false;
      for (var child in data.children) {
        if (child.child("username").value.toString() == username) {
          found = true;
          Get.back();
          searchValue.text = "";
          Get.toNamed("/profilepostpage", arguments: [
            // userid,
            {"user_post": child.key},
            "userpostdetail"
          ])!
              .then((value) async => await getUserPostData());
        }
      }
      if (found == false) {
        Get.back();
        ToastMessageCustom.ToastMessage(
            "Username Not Found", Color.fromRGBO(173, 5, 24, 1));
      }
    }
  }

  Future getUserPostData({bool isRefresh = false}) async {
    try {
      loading = isRefresh;
      loadMore = true;
      if (isRefresh) {
        List<UserPost> temp = [];
        userPostData = temp;
        hasMore = false;
        documentSnapshot = null;
      }
      final QuerySnapshot<Map<String, dynamic>> data;
      if (documentSnapshot == null) {
        data = await firestore
            .collection("socialMediaData")
            .orderBy("date", descending: true)
            .limit(5)
            .get();
      } else {
        data = await firestore
            .collection("socialMediaData")
            .orderBy("date", descending: true)
            .startAfterDocument(documentSnapshot!)
            .limit(5)
            .get();
      }

      if (data.docs.isNotEmpty) {
        List<UserPost> tempPayload = List<UserPost>.from(data.docs
            .map((e) => UserPost.fromJson(json.decode(json.encode(e.data())))));

        for (var element in tempPayload) {
          await firestore
              .collection("usersData")
              .doc(element.idUser)
              .get()
              .then(
            (value) {
              element.profilepicture = value.data()?['photo_profile'];
              element.username = value.data()?['username'];
            },
          );
          await firestore
              .collection("socialMediaData")
              .doc(element.id)
              .get()
              .then(
            (value) {
              element.liked = value.data()?["liked"]?[userid] != null;
              element.like = value.data()?["liked"] == null
                  ? 0
                  : (value.data()?["liked"] as Map<String, dynamic>)
                      .entries
                      .length;
            },
          );
        }

        if (documentSnapshot == null) {
          userPostData = tempPayload;
        } else {
          userPostData.addAll(tempPayload);
        }

        documentSnapshot = data.docs.last;
      }

      hasMore = data.docs.length == 5;

      loadMore = hasMore;

      // if (!hasMore) {
      //   userPostData = List<UserPost>.from(data.docs
      //       .map((e) => UserPost.fromJson(json.decode(json.encode(e.data())))));
      // } else {
      //   List<UserPost> itemTemp = List<UserPost>.from(data.docs
      //       .map((e) => UserPost.fromJson(json.decode(json.encode(e.data())))));
      //   userPostData.addAll(itemTemp);
      // }

      // final dataChild = await database.child("SosialMedia").get();
      // if (dataChild.exists) {
      //   final Iterable<DataSnapshot> item;
      //   final DataSnapshot data;
      //   data = await database.child("SosialMedia").limitToLast(10).get();

      //   item = data.children;

      //   if (!hasMore) {
      //     userPostData = List<UserPost>.from(item.toList().map(
      //         (e) => UserPost.fromJson(json.decode(json.encode(e.value)))));
      //   } else {
      //     List<UserPost> itemTemp = List<UserPost>.from(item.toList().map(
      //         (e) => UserPost.fromJson(json.decode(json.encode(e.value)))));
      //     userPostData.addAll(itemTemp);
      //   }

      // for (var item in dataChild.child("SosialMedia").children) {
      //   for (var data in item.children) {
      //     userPostData
      //         .add(UserPost.fromJson(json.decode(json.encode(data.value))));
      //     // userPostData = List.from(data.children.map(
      //     //     (e) => UserPost.fromJson(json.decode(json.encode(e.value)))));
      //   }
      // }

      //   for (var element in userPostData) {
      //     await database
      //         .child("userDatabase")
      //         .child(element.id!.substring(element.id!.indexOf("|") + 1))
      //         .get()
      //         .then((value) {
      //       element.profilepicture =
      //           value.child("photoprofile").value.toString();
      //       element.username = value.child("username").value.toString();
      //     });
      //     await database
      //         .child("SosialMedia")
      //         .child(element.id!)
      //         .get()
      //         .then((value) {
      //       if (value.child("liked").exists) {
      //         element.liked = value.child("liked").child(userid!).exists;
      //         element.like = value.child("liked").children.length;
      //         // test.value = "adad";
      //       }
      //       if (value.child("commented").exists) {
      //         element.comment = value.child("commented").children.length;
      //       }
      //     });
      //   }

      //   userPostData.sort((a, b) {
      //     return DateTime.parse(a.date!).compareTo(DateTime.parse(b.date!));
      //   });
      //   log("masuk");
      //   hasMore = (item as List).length == 10;
      // }
    } catch (e) {
      print(e);
    }
    loading = false;
  }

  Future deletePost(String id) async {
    final userid = await StorageProvider.getUserToken();
    Get.dialog(CustomAlertDialog(
        onPressedno: () {
          Get.back();
        },
        onPressedyes: () async {
          Get.back();
          Get.dialog(BasicLoader());
          await storageRef.child("$userid").child(id).delete().whenComplete(
              () async => await firestore
                  .collection("socialMediaData")
                  .doc(id)
                  .delete());
          await getUserPostData(isRefresh: true);
          Get.back();
        },
        backgroundColor: Color.fromRGBO(69, 63, 63, 0.773),
        title: "Do you want to delete this post?",
        fontColor: Color.fromARGB(204, 255, 255, 255),
        fontSize: 20,
        iconColor: Colors.white));
  }

  Future like(String userId, String idPost) async {
    final data =
        await firestore.collection("socialMediaData").doc(idPost).get();

    final userid = await StorageProvider.getUserToken();

    if (data.data()?["liked"]?["$userid"] != null) {
      await firestore
          .collection("socialMediaData")
          .doc(idPost)
          .update({"liked.$userid": FieldValue.delete()}).then(
        (value) async {
          final dataPost =
              await firestore.collection("socialMediaData").doc(idPost).get();
          await firestore.collection("socialMediaData").doc(idPost).set({
            "like": (dataPost.data()?["liked"] as Map<String, dynamic>)
                .entries
                .length
          }, SetOptions(merge: true)).then(
            (value) async {
              final dataLike = await firestore
                  .collection("socialMediaData")
                  .doc(idPost)
                  .get();
              userPostData[userPostData
                      .indexWhere((element) => element.id == idPost)] =
                  userPostData[userPostData
                          .indexWhere((element) => element.id == idPost)]
                      .copyWith(liked: false, like: dataLike.data()?['like']);
            },
          );
        },
      );
    } else {
      await firestore.collection("socialMediaData").doc(idPost).set({
        "liked": {userid: "liked"}
      }, SetOptions(merge: true)).then((value) async {
        final dataPost =
            await firestore.collection("socialMediaData").doc(idPost).get();
        await firestore.collection("socialMediaData").doc(idPost).set({
          "like":
              (dataPost.data()?["liked"] as Map<String, dynamic>).entries.length
        }, SetOptions(merge: true)).then(
          (value) async {
            final dataLike =
                await firestore.collection("socialMediaData").doc(idPost).get();
            userPostData[userPostData
                .indexWhere((element) => element.id == idPost)] = userPostData[
                    userPostData.indexWhere((element) => element.id == idPost)]
                .copyWith(liked: true, like: dataLike.data()?['like']);
          },
        );
      });
    }

    // final dataPost =
    //     await database.child("SosialMedia").child(userId).child(idPost).get();
    // final userid = await StorageProvider.getUserToken();
    // if (dataPost.child("liked").child(userid!).exists) {
    //   await database
    //       .child("SosialMedia")
    //       .child(userId)
    //       .child(idPost)
    //       .child("liked")
    //       .child(userid)
    //       .remove()
    //       .whenComplete(() {
    //     userPostData[userPostData
    //         .indexWhere((element) => element.id == idPost)] = userPostData[
    //             userPostData.indexWhere((element) => element.id == idPost)]
    //         .copyWith(
    //             liked: false,
    //             like: dataPost.child("liked").children.length - 1);
    //     // testa.value = "b${userPostData[userPostData.indexWhere((element) => element.id == idPost)].id}";
    //   });
    // } else {
    //   await database
    //       .child("SosialMedia")
    //       .child(userId)
    //       .child(idPost)
    //       .child("liked")
    //       .child(userid)
    //       .set("liked")
    //       .whenComplete(() {
    //     userPostData[userPostData
    //         .indexWhere((element) => element.id == idPost)] = userPostData[
    //             userPostData.indexWhere((element) => element.id == idPost)]
    //         .copyWith(
    //             liked: true, like: dataPost.child("liked").children.length + 1);
    //   });
    // }
  }

  Future pickImage(ImageSource source) async {
    try {
      final image =
          await ImagePicker().pickImage(source: source, imageQuality: 50);
      if (image == null) return;
      File? imageTemporary = File(image.path);
      imageSource = imageTemporary;
      imagepath = imageTemporary.path;
      Get.back();
      Get.toNamed("/addpostpage", arguments: {"img_file": imageSource});
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    userid = await StorageProvider.getUserToken();

    await getUserPostData(isRefresh: true);

    scrollController.addListener(() async {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        if (hasMore == true) {
          await getUserPostData();
        }
      }
    });
    super.onInit();
  }
}