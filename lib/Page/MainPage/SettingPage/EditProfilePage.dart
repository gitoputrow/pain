import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pain/controller/DashboardController.dart';

import '../../../controller/SettingController.dart';
import '../../../widget/BottomSheetPicture.dart';
import '../../../widget/ButtonCustomMain.dart';
import '../../../widget/TextFieldSettingCustom.dart';

class EditProfilePage extends GetView<SettingController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Color.fromRGBO(47, 47, 47, 1),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.045,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 40.5),
                        alignment: Alignment.center,
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontSize: 24, fontFamily: 'PoppinsBoldSemi', color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 30),
                        child: IconButton(
                          icon: Image.asset("asset/Image/backsetting.png"),
                          iconSize: 40,
                          onPressed: () {
                            controller.getBackEP();
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 9.3,
                    width: MediaQuery.of(context).size.width / 4.5,
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                            imageUrl: controller.user.photoprofile!,
                            errorWidget: (context, url, error) {
                              return Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    "image_not_found",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              );
                            },
                            progressIndicatorBuilder: (context, url, progress) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Color.fromRGBO(170, 5, 27, 1),
                                  value: progress.progress,
                                ),
                              );
                            },
                            imageBuilder: (context, imageProvider) {
                              return Obx(() => CircleAvatar(
                                radius: 53,
                                backgroundImage: controller.imageSource == null
                                    ? imageProvider
                                    : Image.file(controller.imageSource!).image,
                                backgroundColor: Colors.transparent,
                              ));
                            },
                          ),
                        Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.only(top: 0, right: 1),
                          child: InkWell(
                            onTap: () {
                              Get.bottomSheet(BottomSheetPicture(pickImageCamera: () async {
                                await controller.PickImage(ImageSource.camera);
                              }, pickImageGallery: () {
                                controller.PickImage(ImageSource.gallery);
                              }));
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color.fromRGBO(170, 5, 27, 1),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => TextFieldSettingCustom(
                            title: "Username",
                            keyboardType: TextInputType.text,
                            onTextChanged: (text) {
                              controller.buttonPermissionEP();
                            },
                            SuffixIcon: null,
                            condition: true,
                            hintText: "${controller.user.username}",
                            controller: controller.username)),
                        SizedBox(
                          height: 30,
                        ),
                        Obx(() => TextFieldSettingCustom(
                            title: "Name",
                            keyboardType: TextInputType.name,
                            onTextChanged: (text) {
                              controller.buttonPermissionEP();
                            },
                            SuffixIcon: null,
                            condition: true,
                            hintText: "${controller.user.name}",
                            controller: controller.name)),
                        SizedBox(
                          height: 30,
                        ),
                        Obx(() => TextFieldSettingCustom(
                            title: "Height",
                            keyboardType: TextInputType.number,
                            onTextChanged: (text) {
                              controller.buttonPermissionEP();
                            },
                            SuffixIcon: Container(
                              padding: EdgeInsets.only(right: 0, top: 12),
                              child: Text(
                                "Cm",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.5), fontSize: 21),
                              ),
                            ),
                            condition: true,
                            hintText: "${controller.user.height}",
                            controller: controller.height)),
                        SizedBox(
                          height: 30,
                        ),
                        Obx(() => TextFieldSettingCustom(
                            title: "Weight",
                            keyboardType: TextInputType.number,
                            onTextChanged: (text) {
                              controller.buttonPermissionEP();
                            },
                            SuffixIcon: Container(
                              padding: EdgeInsets.only(left: 6, top: 12),
                              child: Text(
                                "Kg",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.5), fontSize: 21),
                              ),
                            ),
                            condition: true,
                            hintText: "${controller.user.weight}",
                            controller: controller.weight)),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Gender",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'RubikLight', fontSize: 17),
                        ),
                        Obx(() => DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                items: controller.items
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (value) {
                                  controller.selectedValue = value as String;
                                  controller.buttonPermissionEP();
                                },
                                value: controller.selectedValue,
                                selectedItemBuilder: ((context) {
                                  return controller.items
                                      .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          )))
                                      .toList();
                                }),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Obx(
                                      () => ButtonCustomMain(
                                          onPressed: () {
                                            if (controller.buttonPermEP == true) {
                                              controller.discardEP();
                                              controller.imageSource = null;
                                              controller.buttonPermissionEP();
                                            }
                                          },
                                          alignText: Alignment.center,
                                          borderRadius: 15,
                                          title: "Discard",
                                          colorTextFalse: Color.fromRGBO(255, 255, 255, 0.4),
                                          primaryFalse: Color.fromRGBO(255, 255, 255, 0.1),
                                          colorText: Colors.white,
                                          primary: Color.fromRGBO(255, 255, 255, 0.3),
                                          permission: controller.buttonPermEP),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Obx(
                                      () => ButtonCustomMain(
                                          onPressed: () {
                                            if (controller.buttonPermEP == true) {
                                              controller.changeProfile();
                                            }
                                          },
                                          alignText: Alignment.center,
                                          borderRadius: 15,
                                          colorText: Colors.black,
                                          title: "Save",
                                          colorTextFalse: Color.fromRGBO(0, 0, 0, 0.6),
                                          primaryFalse: Color.fromRGBO(255, 255, 255, 0.5),
                                          primary: Color.fromRGBO(255, 255, 255, 1),
                                          permission: controller.buttonPermEP),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height < 800 ? 15 : 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
