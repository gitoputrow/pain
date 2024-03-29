import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain/controller/AuthetificationController.dart';
import 'package:pain/widget/CustomRadioButton.dart';

class RegistPageStep4 extends GetView<AuthentificationController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: width * 0.075),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/BackgroundImage/bgIntroScreen4.png"), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             SizedBox(
            height: MediaQuery.of(context).size.height < 800 ? 115 : 125,
          ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "What motivates you to\nExercises?",
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
            height: MediaQuery.of(context).size.height < 800 ? 40 : 50,
          ),
            Obx(
              () => CustomRadioButton(
                onPressed: () {
                  controller.DropButFunction(4, "1");
                },
                title: "Being healthier",
                fontSize: 22,
                subText: null,
                colorText: !controller.motivRes.contains("1")
                    ? Color.fromRGBO(255, 255, 255, 0.8)
                    : Color.fromRGBO(10, 12, 13, 0.8),
                colorButton: !controller.motivRes.contains("1")
                    ? Color.fromRGBO(10, 12, 13, 0.8)
                    : Color.fromRGBO(255, 255, 255, 0.8),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Obx(
              () => CustomRadioButton(
                onPressed: () {
                  controller.DropButFunction(4, "2");
                },
                fontSize: 22,
                subText: null,
                title: "Looking better",
                colorText: !controller.motivRes.contains("2")
                    ? Color.fromRGBO(255, 255, 255, 0.8)
                    : Color.fromRGBO(10, 12, 13, 0.8),
                colorButton: !controller.motivRes.contains("2")
                    ? Color.fromRGBO(10, 12, 13, 0.8)
                    : Color.fromRGBO(255, 255, 255, 0.8),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Obx(
              () => CustomRadioButton(
                onPressed: () {
                  controller.DropButFunction(4, "3");
                },
                fontSize: 22,
                subText: null,
                title: "For strength & endurance",
                colorText: !controller.motivRes.contains("3")
                    ? Color.fromRGBO(255, 255, 255, 0.8)
                    : Color.fromRGBO(10, 12, 13, 0.8),
                colorButton: !controller.motivRes.contains("3")
                    ? Color.fromRGBO(10, 12, 13, 0.8)
                    : Color.fromRGBO(255, 255, 255, 0.8),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Obx(
              () => CustomRadioButton(
                onPressed: () {
                  controller.DropButFunction(4, "4");
                },
                fontSize: 22,
                subText: null,
                title: "Reducing stress or tension",
                colorText: !controller.motivRes.contains("4")
                    ? Color.fromRGBO(255, 255, 255, 0.8)
                    : Color.fromRGBO(10, 12, 13, 0.8),
                colorButton: !controller.motivRes.contains("4")
                    ? Color.fromRGBO(10, 12, 13, 0.8)
                    : Color.fromRGBO(255, 255, 255, 0.8),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Obx(
              () => CustomRadioButton(
                onPressed: () {
                  controller.DropButFunction(4, "5");
                },
                fontSize: 22,
                subText: null,
                title: "Boosting confidence",
                colorText: !controller.motivRes.contains("5")
                    ? Color.fromRGBO(255, 255, 255, 0.8)
                    : Color.fromRGBO(10, 12, 13, 0.8),
                colorButton: !controller.motivRes.contains("5")
                    ? Color.fromRGBO(10, 12, 13, 0.8)
                    : Color.fromRGBO(255, 255, 255, 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
