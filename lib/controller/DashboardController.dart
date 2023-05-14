import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pain/Page/IntroPage/HomeScreen.dart';
import 'package:pain/Page/IntroPage/splashscreen.dart';
import 'package:pain/Page/MainPage/DashboardPage/ChallangePage.dart';
import 'package:pain/Page/MainPage/DashboardPage/HomePage.dart';
import 'package:pain/Page/MainPage/DashboardPage/ProfilePage.dart';
import 'package:pain/Page/MainPage/DashboardPage/SosmedPage.dart';
import 'package:pain/StorageProvider.dart';
import 'package:pain/model/Challange.dart';
import 'package:pain/model/ProgramWO.dart';
import 'package:pain/model/UserData.dart';
import 'package:pain/model/WorkoutData.dart';
import 'package:pain/widget/BasicLoader.dart';
import 'package:pain/widget/CustomAlertDialog.dart';
import 'package:pain/widget/ToastMessageCustom.dart';

import '../model/UserPhoto.dart';

class DashboardController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();
  DatabaseReference database = FirebaseDatabase().ref();
  Rx<ScrollController> scrollController = ScrollController().obs;

  // ScrollController scrollController = ScrollController();

  Rx<int> _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int currentIndex) => _currentIndex.value = currentIndex;

  Rx<int> _challangeIndex = 0.obs;
  int get challangeIndex => _challangeIndex.value;
  set challangeIndex(int challangeIndex) => _challangeIndex.value = challangeIndex;

  Rx<String> _urlPhoto = "".obs;
  String get urlPhoto => _urlPhoto.value;
  set urlPhoto(String urlPhoto) => _urlPhoto.value = urlPhoto;

  Rx<String> _dayTitle = "".obs;
  String get dayTitle => _dayTitle.value;
  set dayTitle(String dayTitle) => _dayTitle.value = dayTitle;

  Rx<bool> _loading = true.obs;
  bool get loading => _loading.value;
  set loading(bool loading) => _loading.value = loading;

  Rx<UserData> _user = UserData().obs;
  UserData get user => _user.value;
  set user(UserData user) => _user.value = user;

  Rx<WorkoutData> _workoutData = WorkoutData().obs;
  WorkoutData get workoutData => _workoutData.value;
  set workoutData(WorkoutData workoutData) => _workoutData.value = workoutData;

  RxList<ProgramWO> _programWO = <ProgramWO>[].obs;
  List<ProgramWO> get programWO => _programWO.value;
  set programWO(List<ProgramWO> programWO) => _programWO.value = programWO;

  RxList<UserPhoto> _userPhoto = <UserPhoto>[].obs;
  List<UserPhoto> get userPhoto => _userPhoto.value;
  set userPhoto(List<UserPhoto> userPhoto) => _userPhoto.value = userPhoto;

  RxList<Challange> _challangeData = <Challange>[].obs;
  List<Challange> get challangeData => _challangeData.value;
  set challangeData(List<Challange> challangeData) => _challangeData.value = challangeData;

  List<Widget> pages = [HomePage(), ChallangePage(), 
  // SosmedPage(),
  ProfilePage()];

  RxList<String> _muscle = <String>[].obs;
  List<String> get muscle => _muscle.value;
  set muscle(List<String> muscle) => _muscle.value = muscle;

  Rx<String> _goalTemp = "".obs;
  String get goalTemp => _goalTemp.value;
  set goalTemp(String goalTemp) => _goalTemp.value = goalTemp;

  Rx<String> _challengeSelected = "".obs;
  String get challengeSelected => _challengeSelected.value;
  set challengeSelected(String challengeSelected) => _challengeSelected.value = challengeSelected;

  Rx<String> _physicTemp = "".obs;
  String get physicTemp => _physicTemp.value;
  set physicTemp(String physicTemp) => _physicTemp.value = physicTemp;

  RxList<String> _muscleTemp = <String>[].obs;
  List<String> get muscleTemp => _muscleTemp;
  set muscleTemp(List<String> muscleTemp) => _muscleTemp.value = muscleTemp;

  RxList<int> _finishedChallange = <int>[].obs;
  List<int> get finishedChallange => _finishedChallange;
  set finishedChallange(List<int> finishedChallange) =>
      _finishedChallange.value = finishedChallange;

  bool changeDataCheck = false;

  String userid = "";

  Rx<int> _userPhotoLength = 0.obs;
  int get userPhotoLength => _userPhotoLength.value;
  set userPhotoLength(int userPhotoLength) => _userPhotoLength.value = userPhotoLength;

  Rx<File?> _imageSource = (null as File?).obs;
  File? get imageSource => _imageSource.value;
  set imageSource(File? imageSource) => _imageSource.value = imageSource;

  Rx<String> _imagepath = "".obs;
  String get imagepath => _imagepath.value;
  set imagepath(String imagepath) => _imagepath.value = imagepath;

  Rx<String> test = "Save".obs;
  Rx<String> testw = "Discard".obs;

  List<String> sortedDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];


  //Function to changing page
  void changePage(int index) {
    if (goalTemp == user.goal! && physicTemp == user.physical! && listEquals(muscleTemp, muscle)) {
      currentIndex = index;
    } else {
      Get.dialog(CustomAlertDialog(
          onPressedno: () {
            muscleTemp.clear();
            muscleTemp.addAll(muscle);
            physicTemp = user.physical!;
            goalTemp = user.goal!;
            Get.back();
            currentIndex = index;
          },
          onPressedyes: () async {
            Get.back();
            Get.dialog(BasicLoader());
            muscleTemp.sort();
            List<Map<String, dynamic>> muscledata = [];
            for (var i = 0; i < muscleTemp.length; i++) {
              muscledata.add({"muscle": muscleTemp[i]});
            }
            user.physical = physicTemp;
            user.goal = goalTemp;

            await database.child("$userid").set(user.toJson());
            await database.child("$userid").child("targetMuscle").set(muscledata);
            await getUserData();
            await getProgramData();
            Get.back();
            currentIndex = index;
          },
          backgroundColor: Color.fromRGBO(10, 12, 13, 0.8),
          title: "Do you want to change your program?",
          fontColor: Color.fromARGB(204, 255, 255, 255),
          fontSize: 20,
          iconColor: Colors.white));
    }
  }

  //Function to get user data
  Future getUserData() async {
    try {
      final data = await database.child("$userid").get();
      user = UserData.fromJson(json.decode(json.encode(data.value)));
      goalTemp = user.goal!;
      physicTemp = user.physical!;
      muscleTemp.clear();
      muscle.clear();
      for (int i = 0; i < user.targetMuscle!.length; i++) {
        muscleTemp.add(user.targetMuscle![i].muscle!);
        muscle.add(user.targetMuscle![i].muscle!);
      }
      muscle.sort();
      muscleTemp.sort();
    } catch (e) {
      print("$e a");
    }
  }

  //Function to get workout list data
  Future getWorkoutList(String workoutName) async {
    Get.dialog(BasicLoader());
    print(workoutName);
    try {
      final data = await database.child("WorkoutData").child(workoutName).get();
      print(data.key);
      workoutData = WorkoutData.fromJson(json.decode(json.encode(data.value)));
      final finished = await database.child("$userid").child("challengeData").get();
      if (workoutName.contains("Beginner") || workoutName.contains("Intermediate")) {
        int finished_ = int.parse(finished.child("$workoutName").value.toString());
        workoutData.reps = workoutData.reps! + finished_ * 2;
      }
      challengeSelected = workoutName;
      Get.back();
      Get.toNamed("/workoutlist",arguments: [finishedChallange,workoutData,challangeIndex,challangeData]);
    } catch (e) {
      print(e);
    }
  }

  //Function to get workout program data
  Future getProgramData() async {
    try {
      int indexMuscle = 0;
      programWO.clear();
      final data = await database.child("ProgramWO").child(user.physical!).child(user.goal!).get();
      data.children.forEach((element) {
        programWO.add(ProgramWO.fromJson(json.decode(json.encode(element.value))));
      });
      programWO.sort((a, b) => sortedDays.indexOf(a.day!).compareTo(sortedDays.indexOf(b.day!)));
      for (var i = 0; i < programWO.length; i++) {
        if (!programWO[i].title!.contains("Cardio") && !programWO[i].title!.contains("Full Body")) {
          await getMuscleSplit(programWO, i, muscle, indexMuscle)
              .then((value) => indexMuscle = indexMuscle + 1);
        }
      }
      if (data.child(DateFormat('EEEE').format(DateTime.now())).exists) {
        dayTitle = programWO[programWO.indexWhere(
                (element) => element.day!.contains(DateFormat('EEEE').format(DateTime.now())))]
            .dayDesc!;
      } else {
        dayTitle = "Today is Rest day";
      }
    } catch (e) {
      print("$e ada");
    }
  }

  //Function to get challenge data
  Future getChallengeData() async {
    try {
      final data = await database.child("ChallengeWO").get();
      data.children.forEach((element) {
        challangeData.add(Challange.fromJson(json.decode(json.encode(element.value))));
        loading = true;
      });
    } catch (e) {
      print(e);
    }
  }

  //Function to get finished challenge data
  Future getFinishedData() async {
    finishedChallange.clear();
    try {
      Get.dialog(BasicLoader());
      
      for (int index = 0; index < challangeData[challangeIndex].level!.length; index++) {
        final data = await database
            .child("$userid")
            .child("challengeData")
            .child(
                "${challangeData[challangeIndex].title}${challangeData[challangeIndex].level![index].title}")
            .get();
        int finished = int.parse(data.value.toString());
        finishedChallange.add(finished);
      }
      Get.back();
    } catch (e) {
      Get.back();
    }
  }

  //Function to split workout for user program
  Future getMuscleSplit(List<ProgramWO> programWO, int i, List muscle, int iMuscle) async {
    String splitMuscleDesc = programWO[i].title!;
    String splitMuscleDay = programWO[i].dayDesc!;
    String splitMuscleName = programWO[i].workoutName!;
    String splitMuscleImg = "";
    if (user.physical == "new" || user.physical == "pro") {
      splitMuscleDesc = splitMuscleDesc.replaceAll(
          "name_",
          muscle.length == 1
              ? muscle[0]
              : muscle.length == 2
                  ? muscle[iMuscle]
                  : muscle.length == 4
                      ? "${muscle[iMuscle + iMuscle]} And ${muscle[iMuscle + iMuscle + 1]}"
                      : muscle.length == 3
                          ? iMuscle == 1
                              ? muscle[2]
                              : "${muscle[0]} And ${muscle[1]}"
                          : "a");
      splitMuscleDay = splitMuscleDay.replaceAll(
          "name_",
          muscle.length == 1
              ? muscle[0]
              : muscle.length == 2
                  ? muscle[iMuscle]
                  : muscle.length == 4
                      ? "${muscle[iMuscle + iMuscle]} And ${muscle[iMuscle + iMuscle + 1]}"
                      : muscle.length == 3
                          ? iMuscle == 1
                              ? muscle[2]
                              : "${muscle[0]} And ${muscle[1]}"
                          : "a");
      splitMuscleName = splitMuscleName.replaceAll(
          "name_",
          muscle.length == 1
              ? muscle[0]
              : muscle.length == 2
                  ? muscle[iMuscle]
                  : muscle.length == 4
                      ? "${muscle[iMuscle + iMuscle]}and${muscle[iMuscle + iMuscle + 1]}"
                      : muscle.length == 3
                          ? iMuscle == 1
                              ? muscle[2]
                              : "${muscle[0]}and${muscle[1]}"
                          : "a");
      splitMuscleImg = muscle.length == 1
          ? "${muscle[0]}Pic.png"
          : muscle.length == 2
              ? "${muscle[iMuscle]}Pic.png"
              : muscle.length == 4
                  ? "${muscle[iMuscle + iMuscle]}and${muscle[iMuscle + iMuscle + 1]}Pic.png"
                  : muscle.length == 3
                      ? iMuscle == 1
                          ? "${muscle[2]}Pic.png"
                          : "${muscle[0]}and${muscle[1]}Pic.png"
                      : "a";
    } else if (user.physical == "master") {
      splitMuscleDesc = splitMuscleDesc.replaceAll(
          "name_",
          muscle.length == 1
              ? muscle[0]
              : muscle.length == 3
                  ? muscle[iMuscle]
                  : muscle.length == 2
                      ? iMuscle == 2
                          ? "${muscle[iMuscle - 2]} And ${muscle[iMuscle - 1]}"
                          : muscle[iMuscle]
                      : muscle.length == 4
                          ? iMuscle != 2
                              ? "${muscle[iMuscle]}"
                              : "${muscle[iMuscle]} And ${muscle[iMuscle + 1]}"
                          : "a");
      splitMuscleDay = splitMuscleDay.replaceAll(
          "name_",
          muscle.length == 1
              ? muscle[0]
              : muscle.length == 3
                  ? muscle[iMuscle]
                  : muscle.length == 2
                      ? iMuscle == 2
                          ? "${muscle[iMuscle - 2]} And ${muscle[iMuscle - 1]}"
                          : muscle[iMuscle]
                      : muscle.length == 4
                          ? iMuscle != 2
                              ? "${muscle[iMuscle]}"
                              : "${muscle[iMuscle]} And ${muscle[iMuscle + 1]}"
                          : "a");
      splitMuscleName = splitMuscleName.replaceAll(
          "name_",
          muscle.length == 1
              ? muscle[0]
              : muscle.length == 3
                  ? muscle[iMuscle]
                  : muscle.length == 2
                      ? iMuscle == 2
                          ? "${muscle[iMuscle - 2]}and${muscle[iMuscle - 1]}"
                          : muscle[iMuscle]
                      : muscle.length == 4
                          ? iMuscle != 2
                              ? "${muscle[iMuscle]}"
                              : "${muscle[iMuscle]}and${muscle[iMuscle + 1]}"
                          : "a");
      splitMuscleImg = muscle.length == 1
          ? muscle[0]
          : muscle.length == 3
              ? "${muscle[iMuscle]}Pic.png"
              : muscle.length == 2
                  ? iMuscle == 2
                      ? "${muscle[iMuscle - 2]}and${muscle[iMuscle - 1]}Pic.png"
                      : "${muscle[iMuscle]}Pic.png"
                  : muscle.length == 4
                      ? iMuscle != 2
                          ? "${muscle[iMuscle]}Pic.png"
                          : "${muscle[iMuscle]}and${muscle[iMuscle + 1]}Pic.png"
                      : "a";
    }
    programWO[i].dayDesc = splitMuscleDay;
    programWO[i].title = splitMuscleDesc;
    programWO[i].workoutName = splitMuscleName;
    await storageRef
        .child("Program_Image")
        .child(splitMuscleImg)
        .getDownloadURL()
        .then((value) => programWO[i].picture = value.toString());
  }

  //Function to get user photo
  Future getUserPhoto() async {
    userPhotoLength = 0;
    try {
      final data = await database.child(userid).child("userPhoto").get();
      if (data.exists) {
        userPhoto.clear();
        data.children.forEach((element) {
          userPhoto.add(UserPhoto.fromJson(json.decode(json.encode(element.value))));
        });
        userPhoto.sort((a, b) => a.date!.compareTo(b.date!));
        userPhotoLength = userPhoto.length;
      } else {}
    } catch (e) {
      print("$e aa");
    }
  }

  //Function to logout
  Future logout() async {
    Get.dialog(BasicLoader());
    await StorageProvider.removeUserToken();
    Get.offAll(SplashScreen());
  }

  //Function to delete account
  Future deleteAccount() async {
    Get.dialog(BasicLoader());
    print("$userid/");
    for (int i = 0; i < userPhoto.length; i++) {
      await storageRef.child(userid).child("${userPhoto[i].id}").delete();
    }
    await database.child(userid).remove();
    await StorageProvider.removeUserToken();
    Get.offAll(SplashScreen());
  }

  void changeData(String section, String value) {
    if (section == "goal") {
      goalTemp = value;
    } else if (section == "muscleTarget") {
      if (muscleTemp.contains(value)) {
        if (muscleTemp.length == 1) {
          ToastMessageCustom.ToastMessage(
              "you have to select at least one", Color.fromRGBO(10, 12, 13, 0.8));
        } else {
          muscleTemp.remove(value);
        }
      } else {
        muscleTemp.add(value);
        muscleTemp.sort();
      }
    } else if (section == "physic") {
      physicTemp = value;
    }
  }

  //Function to pick a image
  Future PickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? imageTemporary = File(image.path);
      print("$imageTemporary");
      imageSource = imageTemporary;
      imagepath = imageTemporary.path;
      Get.back();
      Timer.periodic(Duration(milliseconds: 500), (_) {
        scrollController.value.animateTo(scrollController.value.position.maxScrollExtent,
            duration: Duration(milliseconds: 200), curve: Curves.easeOut);
        _.cancel();
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future uploadImage() async {
    try {
      Get.dialog(BasicLoader());
      Map imageFolder = {};
      final idPic = "pic${DateFormat('dd-MM-y_H:mm:ss').format(DateTime.now())}";
      print(idPic);
      await storageRef.child(userid).child(idPic).putFile(imageSource!).whenComplete(() async =>
          await storageRef.child(userid).child(idPic).getDownloadURL().then((value) async {
            imageFolder['days'] = DateFormat('EEEE').format(DateTime.now()).toString();
            imageFolder['date'] = DateFormat('d MMMM yyyy').format(DateTime.now()).toString();
            imageFolder['url'] = value;
            imageFolder['id'] = idPic;
            await database
                .child(userid)
                .child("userPhoto")
                .child(idPic)
                .set(imageFolder)
                .whenComplete(() async {
              imageSource = null;
              await getUserPhoto();
              update();
              print(userPhoto.length);
              Get.back();
            });
          }));
    } catch (e) {}
  }

  @override
  void onInit() async {
    currentIndex = Get.arguments as int;
    loading = true;
    final user = await StorageProvider.getUserToken();
    print(user);
    if (user != null) {
      userid = user;
      await getUserData();
      await getChallengeData();
      await getProgramData();
      await getUserPhoto();
    }
    loading = false;
    super.onInit();
  }
}
