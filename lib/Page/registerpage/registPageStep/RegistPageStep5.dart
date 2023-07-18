import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain/controller/AuthetificationController.dart';
import 'package:pain/widget/CustomRadioButton.dart';

class RegistPageStep5 extends GetView<AuthentificationController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: width * 0.075),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/BackgroundImage/bgIntroScreen5.png"),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 125,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Choose your target Zones!",
                textAlign: TextAlign.center,
                textScaleFactor: 1,
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  fontFamily: 'PoppinsBoldSemi',
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Obx(
              () => CustomRadioButton(
                  onPressed: () {
                    controller.DropButFunction(5, "Chest");
                  },
                  title: "Chest",
                  fontSize: 22,
                  subText: null,
                  condition: !controller.targetRes.contains("Chest"),
                   unSelectedText: Color.fromRGBO(255, 255, 255, 0.8),
                selectedText: Color.fromRGBO(10, 12, 13, 0.8),
                unSelectedBut: Color.fromRGBO(10, 12, 13, 0.8),
                selectedBut: Color.fromRGBO(255, 255, 255, 0.8),),
            ),
            SizedBox(
              height: 26,
            ),
            Obx(
              () => CustomRadioButton(
                  onPressed: () {
                    controller.DropButFunction(5, "Arm's");
                  },
                  fontSize: 22,
                  subText: null,
                  title: "Arms",
                  condition: !controller.targetRes.contains("Arm's"),
                   unSelectedText: Color.fromRGBO(255, 255, 255, 0.8),
                selectedText: Color.fromRGBO(10, 12, 13, 0.8),
                unSelectedBut: Color.fromRGBO(10, 12, 13, 0.8),
                selectedBut: Color.fromRGBO(255, 255, 255, 0.8),),
            ),
            SizedBox(
              height: 26,
            ),
            Obx(
              () => CustomRadioButton(
                  onPressed: () {
                    controller.DropButFunction(5, "Leg's");
                  },
                  fontSize: 22,
                  subText: null,
                  title: "Legs",
                  condition: !controller.targetRes.contains("Leg's"),
                   unSelectedText: Color.fromRGBO(255, 255, 255, 0.8),
                selectedText: Color.fromRGBO(10, 12, 13, 0.8),
                unSelectedBut: Color.fromRGBO(10, 12, 13, 0.8),
                selectedBut: Color.fromRGBO(255, 255, 255, 0.8),),
            ),
            SizedBox(
              height: 26,
            ),
            Obx(
              () => CustomRadioButton(
                  onPressed: () {
                    controller.DropButFunction(5, "Abs");
                  },
                  fontSize: 22,
                  subText: null,
                  title: "Abs",
                  condition: !controller.targetRes.contains("Abs"),
                   unSelectedText: Color.fromRGBO(255, 255, 255, 0.8),
                selectedText: Color.fromRGBO(10, 12, 13, 0.8),
                unSelectedBut: Color.fromRGBO(10, 12, 13, 0.8),
                selectedBut: Color.fromRGBO(255, 255, 255, 0.8),),
            ),
            SizedBox(
              height: 26,
            ),
          ],
        ),
      ),
    );
  }
}
