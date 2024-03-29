import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain/controller/AuthetificationController.dart';
import 'package:pain/widget/CustomRadioButton.dart';

class RegistPageStep2 extends GetView<AuthentificationController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      // height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: width * 0.075),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/BackgroundImage/bgIntroScreen2.png"),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height < 800 ? 115 : 125,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "How physically Active\nare you?",
              textScaleFactor: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                fontFamily: 'PoppinsBoldSemi',
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height < 800 ? 35 : 50,
          ),
          Obx(
            () => CustomRadioButton(
                onPressed: () {
                  controller.DropButFunction(2, "new");
                },
                title: "Not much",
                fontSize: 21,
                subText: Text(
                  'Out of shape',
                  textScaleFactor: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'RubikRegular',
                      fontSize: 16,
                      color: controller.physicalRes == "new"
                          ? Color.fromRGBO(10, 12, 13, 0.8)
                          : Color.fromRGBO(255, 255, 255, 0.8)),
                ),
                colorText: controller.physicalRes != "new"
                    ? Color.fromRGBO(255, 255, 255, 0.8)
                    : Color.fromRGBO(10, 12, 13, 0.8),
                colorButton: controller.physicalRes != "new"
                    ? Color.fromRGBO(10, 12, 13, 0.8)
                    : Color.fromRGBO(255, 255, 255, 0.8),),
          ),
          SizedBox(
            height: 26,
          ),
          Obx(
            () => CustomRadioButton(
                onPressed: () {
                  controller.DropButFunction(2, "newb");
                },
                title: "1-2 Workouts",
                fontSize: 21,
                subText: Text(
                  'a week',
                  textScaleFactor: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'RubikRegular',
                      fontSize: 16,
                      color: controller.physicalRes == "newb"
                          ? Color.fromRGBO(10, 12, 13, 0.8)
                          : Color.fromRGBO(255, 255, 255, 0.8)),
                ),
                colorText: controller.physicalRes != "newb"
                    ? Color.fromRGBO(255, 255, 255, 0.8)
                    : Color.fromRGBO(10, 12, 13, 0.8),
                colorButton: controller.physicalRes != "newb"
                    ? Color.fromRGBO(10, 12, 13, 0.8)
                    : Color.fromRGBO(255, 255, 255, 0.8),),
          ),
          SizedBox(
            height: 26,
          ),
          Obx(
            () => CustomRadioButton(
                onPressed: () {
                  controller.DropButFunction(2, "pro");
                },
                title: "3-4 Workouts",
                fontSize: 21,
                subText: Text(
                  'a week',
                  textScaleFactor: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'RubikRegular',
                      fontSize: 16,
                      color: controller.physicalRes == "pro"
                          ? Color.fromRGBO(10, 12, 13, 0.8)
                          : Color.fromRGBO(255, 255, 255, 0.8)),
                ),
                colorText: controller.physicalRes != "pro"
                    ? Color.fromRGBO(255, 255, 255, 0.8)
                    : Color.fromRGBO(10, 12, 13, 0.8),
                colorButton: controller.physicalRes != "pro"
                    ? Color.fromRGBO(10, 12, 13, 0.8)
                    : Color.fromRGBO(255, 255, 255, 0.8),),
          ),
          SizedBox(
            height: 26,
          ),
          Obx(
            () => CustomRadioButton(
                onPressed: () {
                  controller.DropButFunction(2, "master");
                },
                title: "5+ Workout",
                fontSize: 21,
                subText: Text(
                  'a week',
                  textScaleFactor: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'RubikRegular',
                      fontSize: 16,
                      color: controller.physicalRes == "master"
                          ? Color.fromRGBO(10, 12, 13, 0.8)
                          : Color.fromRGBO(255, 255, 255, 0.8)),
                ),
                colorText: controller.physicalRes != "master"
                    ? Color.fromRGBO(255, 255, 255, 0.8)
                    : Color.fromRGBO(10, 12, 13, 0.8),
                colorButton: controller.physicalRes != "master"
                    ? Color.fromRGBO(10, 12, 13, 0.8)
                    : Color.fromRGBO(255, 255, 255, 0.8),),
          ),
          SizedBox(
            height: 26,
          ),
        ],
      ),
    );
  }
}
