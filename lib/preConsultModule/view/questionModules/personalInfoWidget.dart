import 'dart:io';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:medongosupport/itachyonSupportModule/views/splashPage.dart';
import 'package:medongosupport/preConsultModule/consts/appColors.dart';
import 'package:medongosupport/preConsultModule/consts/appIcons.dart';
import 'package:medongosupport/preConsultModule/consts/appImages.dart';
import 'package:medongosupport/preConsultModule/consts/screenSize.dart';
import 'package:medongosupport/preConsultModule/widgets/alertDialogs.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:im_stepper/stepper.dart';
import 'package:medongosupport/preConsultModule/controllers/preConsultationController.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/controllers/userController.dart';
import 'package:medongosupport/preConsultModule/controllers/vitalsController.dart';
import 'package:medongosupport/preConsultModule/globals.dart' as globals;
import 'package:get/get.dart';
import 'package:medongosupport/preConsultModule/view/questionModules/editQuestionsForm.dart';
import 'package:restart_app/restart_app.dart';

class TopInfoBar extends StatelessWidget {
  const TopInfoBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => questionsController.dummyBool.value
        ? SizedBox(
            height: questionsController.filteredCategoryList.length == 0
                ? ScreenSize.height(context) * 0.33
                : ScreenSize.height(context) * 0.45,
            //color: AppColor.primaryColor.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Card(
                color: AppColor.primaryColor.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 0.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /// APP BAR CONTENT IS NOW IN THE CONTAINER
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, left: 4.0, right: 4.0),
                      child: Card(
                        elevation: 2,
                        child: Container(
                          height: ScreenSize.height(context) * 0.04,
                          width: ScreenSize.width(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Aligns text and IconButton at start and end of Row
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Text(
                                  "Pre-Consulting",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                              ),

                              SizedBox(
                                width: ScreenSize.width(context) * 0.4,
                              ),

                              ///RESTART BUTTON
                              IconButton(
                                icon: const Icon(
                                  Icons.restart_alt,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  yesNoDialog(
                                      context: context,
                                      text: "Do you want to re-start the application?",
                                      onTapAction: () async {
                                        await Restart.restartApp();
                                      });
                                },
                              ),

                              ///HELP BUTTON
                              IconButton(
                                icon: const Icon(
                                  Icons.help,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  ///TODO - UNCOMMENT IN NATIVE ANDROID
                                  Get.to(() => const ITSupportMain());
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ///PHOTO, INDICATOR, PERSONAL AND VITALS INFO
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        child: Card(
                          elevation: 2,
                          child: Container(
                            //padding:const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0)),
                            width: ScreenSize.width(context),

                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                ///PERSONAL INFO
                                Flexible(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      ///USER PHOTO AND PERCENTAGE
                                      Container(
                                        height:
                                            ScreenSize.height(context) * 0.25,
                                        padding: const EdgeInsets.only(
                                          top: 5.0,
                                          left: 5.5,
                                          right: 2.5,
                                          bottom: 5.0,
                                        ),
                                        alignment: Alignment.topCenter,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ///USER PHOTO
                                            GestureDetector(
                                              onTap: ()async{
                                                await preConsultationController.showFullScreenImagePage(context);
                                              },
                                              child: CircularPercentIndicator(
                                                radius:
                                                ScreenSize.width(context) *
                                                    0.12,
                                                lineWidth: 6.0,
                                                percent: questionsController
                                                    .accountOverallPercentage
                                                    .value /
                                                    100,
                                                center:  preConsultationController.imageForDisplayInTheDevice.value !=
                                                    ""
                                                    ? Padding(
                                                  padding:
                                                  const EdgeInsets.all(
                                                      10.0),
                                                  child: CircleAvatar(
                                                    radius:
                                                    ScreenSize.width(
                                                        context) *
                                                        0.2,
                                                    backgroundImage:
                                                    FileImage(
                                                      File( preConsultationController.imageForDisplayInTheDevice.value!),
                                                    ),
                                                  ),
                                                )
                                                    : Padding(
                                                  padding:
                                                  const EdgeInsets.all(
                                                      10.0),
                                                  child: GestureDetector(
                                                    onLongPress: () {},
                                                    child: CircleAvatar(
                                                      backgroundColor: AppColor
                                                          .secondaryColorAlt,
                                                      radius:
                                                      ScreenSize.width(
                                                          context) *
                                                          0.13,
                                                      child: Icon(
                                                        Icons.person,
                                                        color:
                                                        AppColor.white,
                                                        size: ScreenSize
                                                            .height(
                                                            context) *
                                                            0.08,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                progressColor:
                                                AppColor.primaryColor,
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 15,
                                            ),

                                            ///OVERALL ACCOUNT PERCENTAGE
                                            Card(
                                              elevation: 5.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Container(
                                                height:
                                                    ScreenSize.height(context) *
                                                        0.03,
                                                width:
                                                    ScreenSize.width(context) *
                                                        0.15,
                                                decoration: BoxDecoration(
                                                  color: AppColor.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                transform: Matrix4.rotationZ(
                                                    0 * pi / 180),
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Center(
                                                  child: Text(
                                                    '${questionsController.accountOverallPercentage.value} %',
                                                    style: TextStyle(
                                                      fontSize:
                                                          ScreenSize.width(
                                                                  context) *
                                                              0.03,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            /// DOT STEPPER PROFILE PROGRESS
                                            // DotStepper(
                                            //   direction: Axis.horizontal,
                                            //   dotCount: 6,
                                            //   dotRadius: 10,
                                            //   activeStep: 0,
                                            //   shape: Shape.pipe2,
                                            //   spacing: 0.25,
                                            //   indicator: Indicator.worm,
                                            //   fixedDotDecoration:
                                            //       FixedDotDecoration(
                                            //     color: AppColor.primaryColor,
                                            //   ),
                                            //   indicatorDecoration:
                                            //       IndicatorDecoration(
                                            //     color: AppColor.primaryColor,
                                            //   ),
                                            //   lineConnectorDecoration:
                                            //       const LineConnectorDecoration(
                                            //     strokeWidth: 0,
                                            //     color: Colors.white,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),

                                      ///PERSONAL INFO
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ///EDIT BUTTON FOR EDITING PERSONAL QUESTIONS
                                            GestureDetector(
                                              onTap: () {
                                                ///NAVIGATES TO EDIT QUESTIONS PAGE TO EDIT IT. BEFORE SUBMITTING
                                                Get.to(
                                                    () => EditQuestionsSheet(
                                                          elements:
                                                              questionsController
                                                                  .personalInfoQuestions,
                                                          tag: "Personal",
                                                          categoryStatus: 0,
                                                        ),
                                                    transition:
                                                        Transition.downToUp);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      height: ScreenSize.height(
                                                              context) *
                                                          0.02,
                                                      width: ScreenSize.width(
                                                              context) *
                                                          0.2,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 10.0,
                                                              left: 8.0,
                                                              right: 8.0,
                                                              bottom: 0.0),
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: const Icon(
                                                        Icons.edit_note_rounded,
                                                      )),
                                                ],
                                              ),
                                            ),

                                            ///BASIC INFO
                                            GestureDetector(
                                              onTap: () {

                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 0,
                                                  ),

                                                  ///NAME & AGE
                                                  SizedBox(
                                                    width: ScreenSize.width(
                                                        context),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //
                                                          //   ///NAME
                                                          // AutoSizeText(
                                                          //   userController
                                                          //           .personalQuestionsModel
                                                          //           .fullName
                                                          //           ?.toUpperCase() ??
                                                          //       "",
                                                          //   minFontSize: 12.0,
                                                          //   maxFontSize: 24.0,
                                                          //   textAlign:
                                                          //       TextAlign.left,
                                                          //   style:
                                                          //       const TextStyle(
                                                          //     fontSize: 11.0,
                                                          //     fontWeight:
                                                          //         FontWeight.w500,
                                                          //     color:
                                                          //         AppColor.black,
                                                          //   ),
                                                          // ),

                                                          ///NAME
                                                          infoTopTiles(
                                                              context: context,
                                                              text:
                                                                  "${userController.personalQuestionsModel.firstName!.toUpperCase()} ${userController.personalQuestionsModel.lastName!.toUpperCase()}"),

                                                          ///AGE
                                                          infoTopTiles(
                                                              context: context,
                                                              text:
                                                                  //"${userController.personalQuestionsModel.age!.split(".")[0] ?? ""} Y"),
                                                                  "${double.parse(userController.personalQuestionsModel.age!).toInt() ?? ""} Y ${((double.parse(userController.personalQuestionsModel.age!) - double.parse(userController.personalQuestionsModel.age!).toInt()) * 12).round()} M ${((double.parse(userController.personalQuestionsModel.age!) - double.parse(userController.personalQuestionsModel.age!).toInt()) * 365).round()} D"),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                  ///GENDER HEIGHT AND WEIGHT
                                                  SizedBox(
                                                    width: ScreenSize.width(
                                                        context),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          ///GENDER
                                                          infoTopTiles(
                                                              context: context,
                                                              title: "Gender",
                                                              text:
                                                                  "${userController.personalQuestionsModel.gender?.toUpperCase() ?? ""}"),

                                                          ///HEIGHT
                                                          infoTopTiles(
                                                              context: context,
                                                              title: "Height",
                                                              text:
                                                                  "${userController.personalQuestionsModel.height ?? ""} CM"),

                                                          ///WEIGHT
                                                          infoTopTiles(
                                                              context: context,
                                                              title: "Weight",
                                                              text:
                                                                  "${userController.personalQuestionsModel.weight ?? ""} KG"),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                  ///PHONE AND AADHAR NUMBER
                                                  SizedBox(
                                                    width: ScreenSize.width(
                                                            context) *
                                                        0.75,
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          ///PHONE
                                                          infoTopTiles(
                                                              context: context,
                                                              title: "Phone",
                                                              text: userController
                                                                      .personalQuestionsModel
                                                                      .mobileNumber ??
                                                                  ""),

                                                          ///AADHAR NUMBER
                                                          infoTopTiles(
                                                              context: context,
                                                              title:
                                                                  "Aadhar Number",
                                                              text: userController
                                                                      .personalQuestionsModel
                                                                      .aadharNumber ??
                                                                  ""),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                  ///MOTHER'S NAME
                                                  SizedBox(
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: [
                                                          ///MOTHER
                                                          infoTopTiles(
                                                              context: context,
                                                              title: "Mother",
                                                              text:
                                                                  "${userController.personalQuestionsModel.motherName ?? ""}"),

                                                          ///UHID
                                                          infoTopTiles(
                                                              context: context,
                                                              title: "UHID",
                                                              text:
                                                                  "${questionsController.patientId ?? ""}"),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 8.0, bottom: 8.0),
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                    thickness: 0.3,
                                  ),
                                ),

                                /// VITALS INFO
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ///VITALS QUESTIONS EDIT FORM
                                            SizedBox(
                                              height:
                                                  ScreenSize.height(context) *
                                                      0.025,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0,
                                                    right: 8.0,
                                                    bottom: 0.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "Vitals",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          ///NAVIGATES TO EDIT QUESTIONS PAGE TO EDIT IT. BEFORE SUBMITTING
                                                          Get.to(
                                                              () =>
                                                                  EditQuestionsSheet(
                                                                    elements:
                                                                        questionsController
                                                                            .vitalsQuestionsList,
                                                                    tag:
                                                                        "Vital",
                                                                    categoryStatus: 1,
                                                                  ),
                                                              transition:
                                                                  Transition
                                                                      .downToUp);
                                                        },
                                                        child: const Icon(
                                                          Icons
                                                              .edit_note_rounded,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 5.0,
                                            ),

                                            ///VITALS - INFO
                                            SizedBox(
                                              width: ScreenSize.width(context) *
                                                  0.75,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    infoVitalTiles(
                                                        context: context,
                                                        iconData: AppIcons
                                                            .bloodPressure,
                                                        title: "Blood Pressure",
                                                        text:
                                                            "${vitalsController.vitalsQuestionsModel.systolic}/${vitalsController.vitalsQuestionsModel.diastolic}"),
                                                    infoVitalTiles(
                                                        context: context,
                                                        iconData: AppIcons.spo2,
                                                        title: "Spo2",
                                                        text:
                                                            "${vitalsController.vitalsQuestionsModel.spo2}"),
                                                    infoVitalTiles(
                                                        context: context,
                                                        iconData:
                                                            AppIcons.pulse,
                                                        title: "Pulse",
                                                        text:
                                                            "${vitalsController.vitalsQuestionsModel.pulse}"),
                                                    infoVitalTiles(
                                                        context: context,
                                                        iconData: AppIcons
                                                            .thermometer,
                                                        title: "Temperature",
                                                        text:
                                                            "${vitalsController.vitalsQuestionsModel.temperature}"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),


                    ///GRID VIEW
                    questionsController.filteredCategoryList.length == 0
                        ? Container(height: 0.001)
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 7.0, right: 7.0, bottom: 8.0),
                            child: DynamicHeightGridView(
                              crossAxisCount: 3,
                              shrinkWrap: true,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1,
                              itemCount: questionsController
                                      .filteredCategoryList.length -
                                  1,
                              builder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    ///NAVIGATES TO EDIT QUESTIONS PAGE TO EDIT IT. BEFORE SUBMITTING
                                    Get.to(
                                        () => EditQuestionsSheet(
                                            elements: questionsController
                                                .filteredQuestionsList,
                                            categoryStatus: 2,
                                            category: questionsController
                                                .filteredCategoryList[index]),
                                        transition: Transition.downToUp);
                                  },
                                  child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: const BorderSide(
                                            width: 1.5,
                                            color: AppColor.primaryColor)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 8.0,
                                              bottom: 5.0,
                                              top: 5.0),
                                          child: Text(
                                            questionsController
                                                .filteredCategoryList[index],
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenSize.width(context) *
                                                        0.025,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ),
          )
        : Container());
  }

  ///INFO TOP TILE FOR PERSONAL INFORMATION
  Widget infoTopTiles({BuildContext? context, String? title, String? text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      //verticalDirection: VerticalDirection.up, // Add this line to reverse the vertical direction
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 10.0,
            top: 5.0,
            bottom: 0.0,
          ),
          child: AutoSizeText(
            title ?? "",
            minFontSize: 10.0,
            maxFontSize: 24.0,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColor.grey,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 10.0,
            top: 5.0,
            bottom: 5.0,
          ),
          child: AutoSizeText(
            text ?? "",
            maxLines: 1,
            minFontSize: 10.0,
            maxFontSize: 24.0,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColor.black,
            ),
          ),
        ),
      ],
    );
  }

  ///INFO VITALS
  Widget infoVitalTiles({
    BuildContext? context,
    String? text,
    String? title,
    required IconData iconData,
  }) {
    return Container(
      width: ScreenSize.width(context) * 0.2,
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5.0, top: 5.0),
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 2.5, top: 1.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: AppColor.grey.withOpacity(0.2)),
        color: AppColor.primaryColor.withOpacity(0.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            size: 24,
            color: AppColor.primaryColor,
            // You can add additional properties as needed, such as semanticLabel, etc.
          ),
          const SizedBox(
            width: 3,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "",
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w100,
                  color: AppColor.black,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 0.0, top: 1.0, bottom: 2.0),
                child: AutoSizeText(
                  text ?? "",
                  maxLines: 1,
                  maxFontSize: 12.0,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColor.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



///TODO - UNCOMMENT STEPPER AND IMPLEMENT NEXT RELEASE
/* ///GRID VIEW
                    questionsController.filteredCategoryList.length == 0
                        ? Container(height: 0.001)
                        : Padding(
                      padding: const EdgeInsets.only(
                          left: 7.0, right: 7.0, bottom: 8.0),
                      child: DynamicHeightGridView(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        itemCount: questionsController
                            .filteredCategoryList.length -
                            1,
                        builder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              ///UPDATES INDEX VALUE
                              questionsController.updateSideDotBarIndex(
                                  index: index);
                            },
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                  side: const BorderSide(
                                      width: 1.5,
                                      color: AppColor.primaryColor)),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 8.0,
                                        bottom: 3.0,
                                        top: 3.0
                                    ),
                                    child: Text(
                                      questionsController
                                          .filteredCategoryList[index],
                                      style: TextStyle(
                                          fontSize:
                                          ScreenSize.width(context) *
                                              0.028,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                  // const SizedBox(
                                  //   height: 10,
                                  // ),


                                  ///STEPPED - TODO - IMPLEMENT
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 10.0,
                                  //       right: 8.0,
                                  //       bottom: 10.0,
                                  //       top: 1.0),
                                  //   child: ProgressStepper(
                                  //     width: 100,
                                  //     currentStep: _chevronCounter,
                                  //     stepCount: 10,
                                  //     onClick: (int index) {
                                  //       // setState(() {
                                  //       //   _chevronCounter = index;
                                  //       // });
                                  //     },
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),*/

///TAKES TWO KEYS AND TWO VALUES TO RETURN A ROW
// Widget infoWidgets(
//     {String? title1,
//       String? value1,
//       String? title2,
//       String? value2,
//       BuildContext? context}) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       ///title 1 and value 1
//       Flexible(
//         child: Container(
//           padding: EdgeInsets.only(left: 5, right: 5, bottom: 5.0, top: 5.0),
//           margin: EdgeInsets.only(left: 5, right: 5, bottom: 2.0, top: 2.0),
//           decoration: BoxDecoration(
//               color: AppColor.primaryColor.withOpacity(0.5),
//               borderRadius: BorderRadius.circular(10.0)),
//           width: ScreenSize.width(context) * 0.3,
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                     padding: const EdgeInsets.only(
//                         left: 5.0, top: 2.0, bottom: 2.0),
//                     child: AutoSizeText(
//                       title1 ?? "",
//                       maxLines: 1,
//                       maxFontSize: 12.0,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w500, color: AppColor.black),
//                     )),
//                 Padding(
//                     padding: const EdgeInsets.only(
//                         left: 5.0, top: 2.0, bottom: 2.0),
//                     child: AutoSizeText(
//                       value1 ?? "",
//                       maxLines: 1,
//                       maxFontSize: 12.0,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w400, color: AppColor.black),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),
//
//       ///title 2 and value 2
//       Flexible(
//         child: Container(
//           padding: EdgeInsets.only(left: 5, right: 5, bottom: 5.0, top: 5.0),
//           margin: EdgeInsets.only(left: 5, right: 5, bottom: 2.0, top: 2.0),
//           decoration: BoxDecoration(
//               color: AppColor.primaryColor.withOpacity(0.5),
//               borderRadius: BorderRadius.circular(10.0)),
//           width: ScreenSize.width(context) * 0.3,
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                     padding: const EdgeInsets.only(
//                         left: 0.0, top: 2.0, bottom: 2.0),
//                     child: AutoSizeText(
//                       title2 ?? "",
//                       maxLines: 1,
//                       maxFontSize: 12.0,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w500, color: AppColor.black),
//                     )),
//                 Padding(
//                     padding: const EdgeInsets.only(
//                         left: 0.0, top: 2.0, bottom: 2.0),
//                     child: AutoSizeText(
//                       value2 ?? "",
//                       maxLines: 1,
//                       maxFontSize: 12.0,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w400, color: AppColor.black),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       )
//     ],
//   );
// }

///30-MAY-2023 - TOP CARD
// class TopInfoBarOld extends StatelessWidget {
//   const TopInfoBarOld({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => questionsController.dummyBool.value
//         ? Container(
//             height: questionsController.filteredCategoryList.length == 0
//                 ? ScreenSize.height(context) * 0.3
//                 : ScreenSize.height(context) * 0.45,
//             decoration: BoxDecoration(
//                 color: AppColor.primaryColor.withOpacity(0.08),
//                 borderRadius: BorderRadius.circular(10.0)),
//             margin: const EdgeInsets.all(0.0),
//             //color: AppColor.primaryColor.withOpacity(0.1),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ///PHOTO, INDICATOR, PERSONAL AND VITALS INFO
//                 Expanded(
//                   child: Container(
//                     margin: const EdgeInsets.all(5.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       elevation: 5.0,
//                       child: Container(
//                         //padding:const EdgeInsets.all(10.0),
//                         decoration: BoxDecoration(
//                             color: AppColor.primaryColor.withOpacity(0.08),
//                             borderRadius: BorderRadius.circular(10.0)),
//                         width: ScreenSize.width(context),
//
//                         margin: const EdgeInsets.all(0.0),
//
//                         child: Flex(
//                           direction: Axis.horizontal,
//                           children: [
//                             ///PERSONAL INFO AND VITALS
//                             Flexible(
//                               flex: 5,
//                               child: Card(
//                                 color: Colors.white,
//                                 child: Row(
//                                   children: [
//                                     ///USER PHOTO AND PERCENTAGE
//                                     Container(
//                                       height: ScreenSize.height(context) * 0.25,
//                                       padding: const EdgeInsets.only(
//                                         top: 5.0,
//                                         left: 2.5,
//                                         right: 2.5,
//                                         bottom: 5.0,
//                                       ),
//                                       alignment: Alignment.topCenter,
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           ///USER PHOTO
//                                           CircularPercentIndicator(
//                                             radius: ScreenSize.width(context) *
//                                                 0.11,
//                                             lineWidth: 6.0,
//                                             percent: questionsController
//                                                     .accountOverallPercentage
//                                                     .value /
//                                                 100,
//                                             center: userController
//                                                         .personalQuestionsModel
//                                                         .image !=
//                                                     ""
//                                                 ? CircleAvatar(
//                                                     radius: ScreenSize.width(
//                                                             context) *
//                                                         0.1,
//                                                     backgroundImage: FileImage(
//                                                       File(userController
//                                                           .personalQuestionsModel
//                                                           .image!),
//                                                     ),
//                                                   )
//                                                 : Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             10.0),
//                                                     child: GestureDetector(
//                                                       onLongPress: () {},
//                                                       child: CircleAvatar(
//                                                         backgroundColor: AppColor
//                                                             .secondaryColorAlt,
//                                                         radius:
//                                                             ScreenSize.width(
//                                                                     context) *
//                                                                 0.135,
//                                                         child: Icon(
//                                                           Icons.person,
//                                                           color: AppColor.white,
//                                                           size:
//                                                               ScreenSize.height(
//                                                                       context) *
//                                                                   0.08,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                             progressColor:
//                                                 AppColor.primaryColor,
//                                           ),
//
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//
//                                           ///OVERALL ACCOUNT PERCENTAGE
//                                           Card(
//                                             elevation: 5.0,
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(10.0),
//                                             ),
//                                             child: Container(
//                                               height:
//                                                   ScreenSize.height(context) *
//                                                       0.03,
//                                               width: ScreenSize.width(context) *
//                                                   0.15,
//                                               decoration: BoxDecoration(
//                                                 color: AppColor.white,
//                                                 borderRadius:
//                                                     BorderRadius.circular(10.0),
//                                               ),
//                                               transform: Matrix4.rotationZ(
//                                                   0 * pi / 180),
//                                               alignment: Alignment.bottomCenter,
//                                               child: Center(
//                                                 child: Text(
//                                                   '${questionsController.accountOverallPercentage.value} %',
//                                                   style: TextStyle(
//                                                     fontSize: ScreenSize.width(
//                                                             context) *
//                                                         0.03,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//
//                                           const SizedBox(
//                                             height: 30,
//                                           ),
//
//                                           /// DOT STEPPER
//                                           DotStepper(
//                                             direction: Axis.horizontal,
//                                             dotCount: 6,
//                                             dotRadius: 6,
//                                             activeStep: questionsController
//                                                 .selectedFilterCategoryListIndex
//                                                 .value,
//                                             shape: Shape.rectangle,
//                                             spacing: 2,
//                                             indicator: Indicator.magnify,
//                                             onDotTapped: (tappedDotIndex) {
//                                               ///UPDATES INDEX VALUE
//                                               questionsController
//                                                   .updateSideDotBarIndex(
//                                                       index: tappedDotIndex);
//                                             },
//                                             fixedDotDecoration:
//                                                 FixedDotDecoration(
//                                               color: AppColor.primaryColor
//                                                   .withOpacity(0.3),
//                                             ),
//                                             indicatorDecoration:
//                                                 const IndicatorDecoration(
//                                               color: AppColor.primaryColor,
//                                             ),
//                                             lineConnectorDecoration:
//                                                 const LineConnectorDecoration(
//                                               strokeWidth: 0,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//
//                                     ///BASIC INFO
//                                     ///
//                                     Expanded(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           ///BASIC INFO
//                                           GestureDetector(
//                                             onTap: () {
//                                               questionsController
//                                                           .personalInfoQuestions
//                                                           ?.length !=
//                                                       0
//                                                   ? showModalBottomSheet(
//                                                       context: context,
//                                                       isScrollControlled: true,
//                                                       backgroundColor:
//                                                           Colors.transparent,
//                                                       builder: (context) =>
//                                                           Container(
//                                                         height:
//                                                             ScreenSize.height(
//                                                                     context) *
//                                                                 0.90,
//                                                         decoration:
//                                                             const BoxDecoration(
//                                                           color: Colors.white,
//                                                           borderRadius:
//                                                               BorderRadius.only(
//                                                             topLeft:
//                                                                 Radius.circular(
//                                                                     25.0),
//                                                             topRight:
//                                                                 Radius.circular(
//                                                                     25.0),
//                                                           ),
//                                                         ),
//                                                         child: Center(
//                                                           child: EditQuestionsBottomSheet(
//                                                               elements:
//                                                                   questionsController
//                                                                       .personalInfoQuestions),
//                                                         ),
//                                                       ),
//                                                     )
//                                                   : null;
//                                             },
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 const SizedBox(
//                                                   height: 10,
//                                                 ),
//
//                                                 ///NAME
//                                                 SizedBox(
//                                                   width:
//                                                       ScreenSize.width(context),
//                                                   child: SingleChildScrollView(
//                                                     scrollDirection:
//                                                         Axis.horizontal,
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         ///NAME
//                                                         AutoSizeText(
//                                                           userController
//                                                                   .personalQuestionsModel
//                                                                   .fullName
//                                                                   ?.toUpperCase() ??
//                                                               "",
//                                                           minFontSize: 12.0,
//                                                           maxFontSize: 24.0,
//                                                           textAlign:
//                                                               TextAlign.left,
//                                                           style:
//                                                               const TextStyle(
//                                                             fontSize: 11.0,
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                             color:
//                                                                 AppColor.black,
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//
//                                                 const SizedBox(
//                                                   height: 10,
//                                                 ),
//
//                                                 ///GENDER HEIGHT AND WEIGHT
//                                                 SizedBox(
//                                                   width:
//                                                       ScreenSize.width(context),
//                                                   child: SingleChildScrollView(
//                                                     scrollDirection:
//                                                         Axis.horizontal,
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .start,
//                                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                                       children: [
//                                                         infoTopTiles(
//                                                             context: context,
//                                                             title: "Age",
//                                                             text: "${userController.personalQuestionsModel.age!.split(".")[0] ?? ""} Y"),
//                                                         infoTopTiles(
//                                                             context: context,
//                                                             title: "Gender",
//                                                             text: userController
//                                                                     .personalQuestionsModel
//                                                                     .gender ??
//                                                                 ""),
//                                                         infoTopTiles(
//                                                             context: context,
//                                                             title: "Height",
//                                                             text:
//                                                                 "${userController.personalQuestionsModel.height ?? ""} CM"),
//                                                         infoTopTiles(
//                                                             context: context,
//                                                             title: "Weight",
//                                                             text:
//                                                                 "${userController.personalQuestionsModel.weight ?? ""} KG"),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//
//                                                 ///PHONE AND AADHAR NUMBER
//                                                 SizedBox(
//                                                   width: ScreenSize.width(
//                                                           context) *
//                                                       0.75,
//                                                   child: SingleChildScrollView(
//                                                     scrollDirection:
//                                                         Axis.horizontal,
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceEvenly,
//                                                       children: [
//                                                         infoTopTiles(
//                                                             context: context,
//                                                             title: "Phone",
//                                                             text: userController
//                                                                     .personalQuestionsModel
//                                                                     .mobileNumber ??
//                                                                 ""),
//                                                         infoTopTiles(
//                                                             context: context,
//                                                             title:
//                                                                 "Aadhar Number",
//                                                             text: userController
//                                                                     .personalQuestionsModel
//                                                                     .aadharNumber ??
//                                                                 ""),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//
//                                                 ///MOTHER'S NAME
//                                                 SizedBox(
//                                                   child: Row(
//                                                     children: [
//                                                       infoTopTiles(
//                                                           context: context,
//                                                           title: "Mother",
//                                                           text:
//                                                               "${userController.personalQuestionsModel.motherName ?? ""}"),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//
//                                           const SizedBox(
//                                             height: 10.0,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//
//                             /// Vitals
//                             Flexible(
//                               flex: 2,
//                               child: Card(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     const SizedBox(
//                                       height: 10.0,
//                                     ),
//
//                                     ///BASIC INFO
//                                     GestureDetector(
//                                       onTap: () {
//                                         questionsController
//                                                     .personalInfoQuestions
//                                                     ?.length !=
//                                                 0
//                                             ? showModalBottomSheet(
//                                                 context: context,
//                                                 isScrollControlled: true,
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 builder: (context) => Container(
//                                                   height: ScreenSize.height(
//                                                           context) *
//                                                       0.90,
//                                                   decoration:
//                                                       const BoxDecoration(
//                                                     color: Colors.white,
//                                                     borderRadius:
//                                                         BorderRadius.only(
//                                                       topLeft:
//                                                           Radius.circular(25.0),
//                                                       topRight:
//                                                           Radius.circular(25.0),
//                                                     ),
//                                                   ),
//                                                   child: Center(
//                                                     child: EditQuestionsBottomSheet(
//                                                         elements:
//                                                             questionsController
//                                                                 .vitalsQuestionsList),
//                                                   ),
//                                                 ),
//                                               )
//                                             : null;
//                                       },
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           const Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 8.0,
//                                                 right: 8.0,
//                                                 bottom: 8.0),
//                                             child: SizedBox(
//                                               child: Text(
//                                                 "VITALS",
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     color: AppColor.blackMild),
//                                               ),
//                                             ),
//                                           ),
//
//                                           ///BASIC INFO - NAME, AGE, GENDER, PHONE AND MOTHER'S NAME
//                                           SizedBox(
//                                             width: ScreenSize.width(context) *
//                                                 0.75,
//                                             child: SingleChildScrollView(
//                                               scrollDirection: Axis.horizontal,
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceEvenly,
//                                                 children: [
//                                                   infoVitalTiles(
//                                                       context: context,
//                                                       image: AppImages
//                                                           .bloodPressure,
//                                                       text:
//                                                           "${vitalsController.vitalsQuestionsModel.systolic}/${vitalsController.vitalsQuestionsModel.diastolic}"),
//                                                   infoVitalTiles(
//                                                       context: context,
//                                                       image: AppImages.spo2,
//                                                       text:
//                                                           "${vitalsController.vitalsQuestionsModel.spo2}"),
//                                                   infoVitalTiles(
//                                                       context: context,
//                                                       image: AppImages.pulse,
//                                                       text:
//                                                           "${vitalsController.vitalsQuestionsModel.pulse}"),
//                                                   infoVitalTiles(
//                                                       context: context,
//                                                       image:
//                                                           AppImages.thermometer,
//                                                       text:
//                                                           "${vitalsController.vitalsQuestionsModel.temperature}"),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           // Padding(
//                                           //   padding: EdgeInsets.only(
//                                           //       left: 8.0,
//                                           //       right: 8.0,
//                                           //       bottom: 8.0,
//                                           //       top: 25.0),
//                                           //   child: SizedBox(
//                                           //     child: Text(
//                                           //       "Connect",
//                                           //       style: TextStyle(
//                                           //           color: Colors.blue,
//                                           //           fontWeight:
//                                           //           FontWeight.bold),
//                                           //     ),
//                                           //   ),
//                                           // ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         : SizedBox(
//             height: questionsController.filteredCategoryList.length == 0
//                 ? ScreenSize.height(context) * 0.28
//                 : ScreenSize.height(context) * 0.42,
//
//             //color: AppColor.primaryColor.withOpacity(0.1),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ///PHOTO, INDICATOR, PERSONAL AND VITALS INFO
//                 Expanded(
//                   child: Container(
//                     margin: const EdgeInsets.all(5.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       elevation: 5.0,
//                       child: Container(
//                         //padding:const EdgeInsets.all(10.0),
//                         decoration: BoxDecoration(
//                             color: AppColor.primaryColor.withOpacity(0.08),
//                             borderRadius: BorderRadius.circular(10.0)),
//                         width: ScreenSize.width(context),
//
//                         child: Flex(
//                           direction: Axis.horizontal,
//                           children: [
//                             ///PERSONAL INFO AND VITALS
//                             Flexible(
//                               flex: 5,
//                               child: Card(
//                                 color: Colors.white,
//                                 child: Row(
//                                   children: [
//                                     ///USER PHOTO AND PERCENTAGE
//                                     Container(
//                                       height: ScreenSize.height(context) * 0.25,
//                                       padding: const EdgeInsets.only(
//                                         top: 5.0,
//                                         left: 2.5,
//                                         right: 2.5,
//                                         bottom: 5.0,
//                                       ),
//                                       alignment: Alignment.topCenter,
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           ///USER PHOTO
//                                           CircularPercentIndicator(
//                                             radius: ScreenSize.width(context) *
//                                                 0.11,
//                                             lineWidth: 6.0,
//                                             percent: questionsController
//                                                     .accountOverallPercentage
//                                                     .value /
//                                                 100,
//                                             center: userController
//                                                         .personalQuestionsModel
//                                                         .image !=
//                                                     ""
//                                                 ? CircleAvatar(
//                                                     radius: ScreenSize.width(
//                                                             context) *
//                                                         0.1,
//                                                     backgroundImage: FileImage(
//                                                       File(userController
//                                                           .personalQuestionsModel
//                                                           .image!),
//                                                     ),
//                                                   )
//                                                 : Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             10.0),
//                                                     child: GestureDetector(
//                                                       onLongPress: () {},
//                                                       child: CircleAvatar(
//                                                         backgroundColor: AppColor
//                                                             .secondaryColorAlt,
//                                                         radius:
//                                                             ScreenSize.width(
//                                                                     context) *
//                                                                 0.135,
//                                                         child: Icon(
//                                                           Icons.person,
//                                                           color: AppColor.white,
//                                                           size:
//                                                               ScreenSize.height(
//                                                                       context) *
//                                                                   0.08,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                             progressColor:
//                                                 AppColor.primaryColor,
//                                           ),
//
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//
//                                           ///OVERALL ACCOUNT PERCENTAGE
//                                           Card(
//                                             elevation: 5.0,
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(10.0),
//                                             ),
//                                             child: Container(
//                                               height:
//                                                   ScreenSize.height(context) *
//                                                       0.03,
//                                               width: ScreenSize.width(context) *
//                                                   0.15,
//                                               decoration: BoxDecoration(
//                                                 color: AppColor.white,
//                                                 borderRadius:
//                                                     BorderRadius.circular(10.0),
//                                               ),
//                                               transform: Matrix4.rotationZ(
//                                                   0 * pi / 180),
//                                               alignment: Alignment.bottomCenter,
//                                               child: Center(
//                                                 child: Text(
//                                                   '${questionsController.accountOverallPercentage.value} %',
//                                                   style: TextStyle(
//                                                     fontSize: ScreenSize.width(
//                                                             context) *
//                                                         0.03,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//
//                                           const SizedBox(
//                                             height: 30,
//                                           ),
//
//                                           /// DOT STEPPER
//                                           DotStepper(
//                                             direction: Axis.horizontal,
//                                             dotCount: 6,
//                                             dotRadius: 6,
//                                             activeStep: questionsController
//                                                 .selectedFilterCategoryListIndex
//                                                 .value,
//                                             shape: Shape.rectangle,
//                                             spacing: 2,
//                                             indicator: Indicator.magnify,
//                                             onDotTapped: (tappedDotIndex) {
//                                               ///UPDATES INDEX VALUE
//                                               questionsController
//                                                   .updateSideDotBarIndex(
//                                                       index: tappedDotIndex);
//                                             },
//                                             fixedDotDecoration:
//                                                 FixedDotDecoration(
//                                               color: AppColor.primaryColor
//                                                   .withOpacity(0.3),
//                                             ),
//                                             indicatorDecoration:
//                                                 const IndicatorDecoration(
//                                               color: AppColor.primaryColor,
//                                             ),
//                                             lineConnectorDecoration:
//                                                 const LineConnectorDecoration(
//                                               strokeWidth: 0,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//
//                                     Expanded(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           ///BASIC INFO
//                                           GestureDetector(
//                                             onTap: () {
//                                               questionsController
//                                                           .personalInfoQuestions
//                                                           ?.length !=
//                                                       0
//                                                   ? showModalBottomSheet(
//                                                       context: context,
//                                                       isScrollControlled: true,
//                                                       backgroundColor:
//                                                           Colors.transparent,
//                                                       builder: (context) =>
//                                                           Container(
//                                                         height:
//                                                             ScreenSize.height(
//                                                                     context) *
//                                                                 0.90,
//                                                         decoration:
//                                                             const BoxDecoration(
//                                                           color: Colors.white,
//                                                           borderRadius:
//                                                               BorderRadius.only(
//                                                             topLeft:
//                                                                 Radius.circular(
//                                                                     25.0),
//                                                             topRight:
//                                                                 Radius.circular(
//                                                                     25.0),
//                                                           ),
//                                                         ),
//                                                         child: Center(
//                                                           child: EditQuestionsBottomSheet(
//                                                               elements:
//                                                                   questionsController
//                                                                       .personalInfoQuestions),
//                                                         ),
//                                                       ),
//                                                     )
//                                                   : null;
//                                             },
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 const SizedBox(
//                                                   height: 0,
//                                                 ),
//
//                                                 ///NAME
//                                                 SizedBox(
//                                                   width:
//                                                       ScreenSize.width(context),
//                                                   child: SingleChildScrollView(
//                                                     scrollDirection:
//                                                         Axis.horizontal,
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         ///BASIC INFO - NAME, AGE, GENDER, PHONE AND MOTHER'S NAME
//                                                         infoTopTiles(
//                                                             context: context,
//                                                             text: userController
//                                                                     .personalQuestionsModel
//                                                                     .fullName
//                                                                     ?.toUpperCase() ??
//                                                                 ""),
//
//                                                         // infoTopTiles(
//                                                         //     context: context,
//                                                         //     title: "Age",
//                                                         //     text:
//                                                         //     "${userController.personalQuestionsModel.age!.split(".")[0] ?? ""} Y ${userController.personalQuestionsModel.age!.split(".")[1] ?? ""} M"),
//                                                         //
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//
//                                                 ///GENDER HEIGHT AND WEIGHT
//                                                 SizedBox(
//                                                   width:
//                                                       ScreenSize.width(context),
//                                                   child: SingleChildScrollView(
//                                                     scrollDirection:
//                                                         Axis.horizontal,
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         infoTopTiles(
//                                                             context: context,
//                                                             title: "Age",
//                                                             text:
//                                                                 "${userController.personalQuestionsModel.age!.split(".")[0] ?? ""} Y"),
//                                                         infoTopTiles(
//                                                             context: context,
//                                                             title: "Gender",
//                                                             text: userController
//                                                                     .personalQuestionsModel
//                                                                     .gender ??
//                                                                 ""),
//                                                         infoTopTiles(
//                                                             context: context,
//                                                             title: "Height",
//                                                             text:
//                                                                 "${userController.personalQuestionsModel.height ?? ""} CM"),
//                                                         infoTopTiles(
//                                                             context: context,
//                                                             title: "Weight",
//                                                             text:
//                                                                 "${userController.personalQuestionsModel.weight ?? ""} KG"),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//
//                                                 ///PHONE AND AADHAR NUMBER
//                                                 SizedBox(
//                                                   width: ScreenSize.width(
//                                                           context) *
//                                                       0.75,
//                                                   child: SingleChildScrollView(
//                                                     scrollDirection:
//                                                         Axis.horizontal,
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceEvenly,
//                                                       children: [
//                                                         infoTopTiles(
//                                                             context: context,
//                                                             title: "Phone",
//                                                             text: userController
//                                                                     .personalQuestionsModel
//                                                                     .mobileNumber ??
//                                                                 ""),
//                                                         infoTopTiles(
//                                                             context: context,
//                                                             title:
//                                                                 "Aadhar Number",
//                                                             text: userController
//                                                                     .personalQuestionsModel
//                                                                     .aadharNumber ??
//                                                                 ""),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//
//                                                 ///MOTHER'S NAME
//                                                 SizedBox(
//                                                   child: Row(
//                                                     children: [
//                                                       infoTopTiles(
//                                                           context: context,
//                                                           title: "Mother",
//                                                           text:
//                                                               "${userController.personalQuestionsModel.motherName ?? ""}"),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//
//                                           const SizedBox(
//                                             height: 10.0,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//
//                             /// Vitals
//                             Flexible(
//                               flex: 2,
//                               child: Card(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     const SizedBox(
//                                       height: 10.0,
//                                     ),
//
//                                     ///BASIC INFO
//                                     GestureDetector(
//                                       onTap: () {
//                                         questionsController
//                                                     .personalInfoQuestions
//                                                     ?.length !=
//                                                 0
//                                             ? showModalBottomSheet(
//                                                 context: context,
//                                                 isScrollControlled: true,
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 builder: (context) => Container(
//                                                   height: ScreenSize.height(
//                                                           context) *
//                                                       0.90,
//                                                   decoration:
//                                                       const BoxDecoration(
//                                                     color: Colors.white,
//                                                     borderRadius:
//                                                         BorderRadius.only(
//                                                       topLeft:
//                                                           Radius.circular(25.0),
//                                                       topRight:
//                                                           Radius.circular(25.0),
//                                                     ),
//                                                   ),
//                                                   child: Center(
//                                                     child: EditQuestionsBottomSheet(
//                                                         elements:
//                                                             questionsController
//                                                                 .vitalsQuestionsList),
//                                                   ),
//                                                 ),
//                                               )
//                                             : null;
//                                       },
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           const Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 8.0,
//                                                 right: 8.0,
//                                                 bottom: 8.0),
//                                             child: SizedBox(
//                                               child: Text(
//                                                 "VITALS",
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     color: AppColor.blackMild),
//                                               ),
//                                             ),
//                                           ),
//
//                                           ///BASIC INFO - NAME, AGE, GENDER, PHONE AND MOTHER'S NAME
//                                           SizedBox(
//                                             width: ScreenSize.width(context) *
//                                                 0.75,
//                                             child: SingleChildScrollView(
//                                               scrollDirection: Axis.horizontal,
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceEvenly,
//                                                 children: [
//                                                   infoVitalTiles(
//                                                       context: context,
//                                                       image: AppImages
//                                                           .bloodPressure,
//                                                       text:
//                                                           "${vitalsController.vitalsQuestionsModel.systolic}/${vitalsController.vitalsQuestionsModel.diastolic}"),
//                                                   infoVitalTiles(
//                                                       context: context,
//                                                       image: AppImages.spo2,
//                                                       text:
//                                                           "${vitalsController.vitalsQuestionsModel.spo2}"),
//                                                   infoVitalTiles(
//                                                       context: context,
//                                                       image: AppImages.pulse,
//                                                       text:
//                                                           "${vitalsController.vitalsQuestionsModel.pulse}"),
//                                                   infoVitalTiles(
//                                                       context: context,
//                                                       image:
//                                                           AppImages.thermometer,
//                                                       text:
//                                                           "${vitalsController.vitalsQuestionsModel.temperature}"),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           // Padding(
//                                           //   padding: EdgeInsets.only(
//                                           //       left: 8.0,
//                                           //       right: 8.0,
//                                           //       bottom: 8.0,
//                                           //       top: 25.0),
//                                           //   child: SizedBox(
//                                           //     child: Text(
//                                           //       "Connect",
//                                           //       style: TextStyle(
//                                           //           color: Colors.blue,
//                                           //           fontWeight:
//                                           //           FontWeight.bold),
//                                           //     ),
//                                           //   ),
//                                           // ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ));
//   }
//
//   ///INFO TOP TILES
//   Widget infoTopTiles({BuildContext? context, String? title, String? text}) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         AutoSizeText(
//           title ?? "",
//           minFontSize: 10.0,
//           maxFontSize: 24.0,
//           textAlign: TextAlign.left,
//           style: const TextStyle(
//               fontSize: 12.0,
//               fontWeight: FontWeight.w400,
//               color: AppColor.grey),
//         ),
//         Container(
//             padding: const EdgeInsets.only(
//                 left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
//             child: AutoSizeText(
//               text ?? "",
//               maxLines: 1,
//               minFontSize: 10.0,
//               maxFontSize: 24.0,
//               textAlign: TextAlign.left,
//               style: const TextStyle(
//                 fontSize: 12.0,
//                 fontWeight: FontWeight.w500,
//                 color: AppColor.black,
//               ),
//             )),
//       ],
//     );
//   }
//
//   ///INFO VITALS
//   Widget infoVitalTiles(
//       {BuildContext? context, String? text, required String image}) {
//     return Container(
//       padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5.0, top: 5.0),
//       margin: const EdgeInsets.only(left: 5, right: 5, bottom: 2.0, top: 2.0),
//       decoration: BoxDecoration(
//           color: AppColor.primaryColor.withOpacity(0.0),
//           borderRadius: BorderRadius.circular(10.0)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Image.asset(
//             image,
//             width: 24,
//             height: 24,
//             // You can add additional properties as needed, such as color, alignment, etc.
//           ),
//           SizedBox(
//             width: 5,
//           ),
//           Padding(
//               padding: const EdgeInsets.only(left: 5.0, top: 2.0, bottom: 2.0),
//               child: AutoSizeText(
//                 text ?? "",
//                 maxLines: 1,
//                 maxFontSize: 12.0,
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w400, color: AppColor.black),
//               )),
//         ],
//       ),
//     );
//   }
//
//   ///TAKES TWO KEYS AND TWO VALUES TO RETURN A ROW
//   Widget infoWidgets(
//       {String? title1,
//       String? value1,
//       String? title2,
//       String? value2,
//       BuildContext? context}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         ///title 1 and value 1
//         Flexible(
//           child: Container(
//             padding: EdgeInsets.only(left: 5, right: 5, bottom: 5.0, top: 5.0),
//             margin: EdgeInsets.only(left: 5, right: 5, bottom: 2.0, top: 2.0),
//             decoration: BoxDecoration(
//                 color: AppColor.primaryColor.withOpacity(0.5),
//                 borderRadius: BorderRadius.circular(10.0)),
//             width: ScreenSize.width(context) * 0.3,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                       padding: const EdgeInsets.only(
//                           left: 5.0, top: 2.0, bottom: 2.0),
//                       child: AutoSizeText(
//                         title1 ?? "",
//                         maxLines: 1,
//                         maxFontSize: 12.0,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.w500, color: AppColor.black),
//                       )),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                           left: 5.0, top: 2.0, bottom: 2.0),
//                       child: AutoSizeText(
//                         value1 ?? "",
//                         maxLines: 1,
//                         maxFontSize: 12.0,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.w400, color: AppColor.black),
//                       )),
//                 ],
//               ),
//             ),
//           ),
//         ),
//
//         ///title 2 and value 2
//         Flexible(
//           child: Container(
//             padding: EdgeInsets.only(left: 5, right: 5, bottom: 5.0, top: 5.0),
//             margin: EdgeInsets.only(left: 5, right: 5, bottom: 2.0, top: 2.0),
//             decoration: BoxDecoration(
//                 color: AppColor.primaryColor.withOpacity(0.5),
//                 borderRadius: BorderRadius.circular(10.0)),
//             width: ScreenSize.width(context) * 0.3,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                       padding: const EdgeInsets.only(
//                           left: 0.0, top: 2.0, bottom: 2.0),
//                       child: AutoSizeText(
//                         title2 ?? "",
//                         maxLines: 1,
//                         maxFontSize: 12.0,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.w500, color: AppColor.black),
//                       )),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                           left: 0.0, top: 2.0, bottom: 2.0),
//                       child: AutoSizeText(
//                         value2 ?? "",
//                         maxLines: 1,
//                         maxFontSize: 12.0,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.w400, color: AppColor.black),
//                       )),
//                 ],
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

///OLD TOP CARD - UI
// ///PHOTO, INDICATOR, PERSONAL AND VITALS INFO
//                 Expanded(
//                   child: Container(
//                     margin:const EdgeInsets.all(5.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       elevation: 5.0,
//                       child: Container(
//                         //padding:const EdgeInsets.all(10.0),
//                         decoration: BoxDecoration(
//                             color: AppColor.primaryColor.withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(10.0)),
//                         width: ScreenSize.width(context),
//
//                         child: Flex(
//                           direction: Axis.horizontal,
//                           children: [
//                             ///SIDE BUTTON BAR
//                             Flexible(
//                               flex: 1,
//                               child: questionsController
//                                           .filteredCategoryList.length ==
//                                       0
//                                   ? Container(
//                                       padding: const EdgeInsets.only(left: 10),
//                                       height: 0.001,
//                                     )
//                                   : Container(
//                                       padding: const EdgeInsets.all(10.0),
//                                       height: ScreenSize.height(context) * 0.25,
//                                       width: ScreenSize.width(context) * 0.1,
//                                       child: Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Padding(
//                                           padding: const EdgeInsets.only(top: 5),
//                                           child: DotStepper(
//                                             direction: Axis.vertical,
//                                             dotCount: (questionsController
//                                                         .filteredCategoryList!
//                                                         .length -
//                                                     1) ??
//                                                 6,
//                                             dotRadius:
//                                                 ScreenSize.width(context) * 0.016,
//                                             activeStep: questionsController
//                                                 .selectedFilterCategoryListIndex
//                                                 .value,
//
//                                             /// Update the activeStep value here.
//                                             shape: Shape.circle,
//                                             spacing: 10,
//                                             indicator: Indicator.magnify,
//                                             onDotTapped: (tappedDotIndex) {
//                                               ///UPDATES INDEX VALUE
//                                               questionsController
//                                                   .updateSideDotBarIndex(
//                                                       index: tappedDotIndex);
//                                             },
//                                             fixedDotDecoration: FixedDotDecoration(
//                                               color: AppColor.primaryColor
//                                                   .withOpacity(0.3),
//                                             ),
//                                             indicatorDecoration:
//                                                 const IndicatorDecoration(
//                                               color: AppColor.primaryColor,
//                                             ),
//                                             lineConnectorDecoration:
//                                                 const LineConnectorDecoration(
//                                                     strokeWidth: 0,
//                                                     color: Colors.white),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                             ),
//
//                             ///USER PHOTO AND PERCENTAGE
//                             Flexible(
//                               flex: 3,
//                               child: Container(
//                                 height: ScreenSize.height(context) * 0.25,
//                                 padding: const EdgeInsets.only(
//                                     top: 5.0, left: 2.5, right: 2.5, bottom: 5.0),
//                                 alignment: Alignment.topCenter,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     ///USER PHOTO
//                                     CircularPercentIndicator(
//                                         radius: ScreenSize.width(context) * 0.11,
//                                         lineWidth: 6.0,
//                                         percent: questionsController.accountOverallPercentage.value / 100,
//                                         center: userController
//                                                     .personalQuestionsModel.image !=
//                                                 ""
//                                             ? CircleAvatar(
//                                                 radius:
//                                                     ScreenSize.width(context) * 0.1,
//                                                 backgroundImage: FileImage(File(
//                                                     userController
//                                                         .personalQuestionsModel
//                                                         .image!)),
//                                               )
//                                             : Padding(
//                                                 padding: const EdgeInsets.all(10.0),
//                                                 child: GestureDetector(
//                                                   onLongPress: () {},
//                                                   child: CircleAvatar(
//                                                       backgroundColor: AppColor.secondaryColorAlt,
//                                                       radius: ScreenSize.width(
//                                                               context) *
//                                                           0.135,
//                                                       child: Icon(
//                                                         Icons.person,
//                                                         color: AppColor.white,
//                                                         size: ScreenSize.height(
//                                                                 context) *
//                                                             0.1,
//                                                       )),
//                                                 ),
//                                               ),
//                                         // Set the progress value here
//                                         progressColor: AppColor.primaryColor),
//
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//
//                                     ///OVERALL ACCOUNT PERCENTAGE
//                                     Card(
//                                       elevation: 5.0,
//                                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//                                       child: Container(
//                                         height: ScreenSize.height(context) * 0.03,
//                                         width: ScreenSize.width(context) * 0.15,
//                                         decoration: BoxDecoration(
//                                           color:
//                                               AppColor.primaryColor.withOpacity(0.4),
//                                           borderRadius: BorderRadius.circular(10.0),
//                                         ),
//                                         transform: Matrix4.rotationZ(0 * pi / 180),
//                                         alignment: Alignment.bottomCenter,
//                                         child: Center(
//                                           child: Text(
//                                             '${questionsController.accountOverallPercentage.value} %',
//                                             // '${(questionsController.answeredQuestions.length / questionsController.getAllQuestions() * 100).toStringAsFixed(0)} %',
//                                             style: TextStyle(
//                                                 fontSize:
//                                                     ScreenSize.width(context) * 0.03,
//                                                 fontWeight: FontWeight.w500),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//
//                             ///PERSONAL INFO AND VITALS
//                             Flexible(
//                               flex: 8,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(
//                                     height: 10.0,
//                                   ),
//
//                                   ///BASIC INFO
//                                   GestureDetector(
//                                     onTap: (){
//                                       questionsController.personalInfoQuestions?.length != 0 ?
//
//                                       showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         backgroundColor: Colors.transparent,
//                                         builder: (context) => Container(
//                                           height: ScreenSize.height(context) * 0.90,
//                                           decoration: const BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:  BorderRadius.only(
//                                               topLeft:  Radius.circular(25.0),
//                                               topRight:  Radius.circular(25.0),
//                                             ),
//                                           ),
//                                           child: Center(
//                                             child: EditQuestionsBottomSheet(elements: questionsController.personalInfoQuestions),
//                                           ),
//                                         ),
//                                       ) : null;
//                                     },
//                                     child: Column(
//                                       children: [
//                                         ///BASIC INFO - NAME, AGE, GENDER, PHONE AND MOTHER'S NAME
//                                         SizedBox(
//                                           width: ScreenSize.width(context) * 0.75,
//                                           child: SingleChildScrollView(
//                                             scrollDirection: Axis.horizontal,
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               children: [
//                                                 infoTopTiles(
//                                                     context: context,
//                                                     text:
//                                                         "${userController.personalQuestionsModel.fullName ?? ""}"),
//                                                 infoTopTiles(
//                                                     context: context,
//                                                     text:
//                                                         "${userController.personalQuestionsModel.age ?? ""} ${userController.personalQuestionsModel.gender![0].toUpperCase()}"),
//                                                 infoTopTiles(
//                                                     context: context,
//                                                     text:
//                                                         "${userController.personalQuestionsModel.mobileNumber ?? ""}"),
//                                                 infoTopTiles(
//                                                     context: context,
//                                                     text:
//                                                         "${userController.personalQuestionsModel.motherName ?? ""}"),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//
//                                         const SizedBox(
//                                           height: 10.0,
//                                         ),
//
//                                         ///BASIC INFO - HEIGHT, WEIGHT AND
//                                         SizedBox(
//                                           width: ScreenSize.width(context) * 0.75,
//                                           child: SingleChildScrollView(
//                                             scrollDirection: Axis.horizontal,
//                                             child: Row(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment.spaceEvenly,
//                                               children: [
//                                                 infoTopTiles(
//                                                     context: context,
//                                                     text:
//                                                     "${userController.personalQuestionsModel.height ?? ""} CM"),
//                                                 infoTopTiles(
//                                                     context: context,
//                                                     text:
//                                                     "${userController.personalQuestionsModel.weight ?? ""} KG"),
//                                                 infoTopTiles(
//                                                     context: context,
//                                                     text:
//                                                     "${userController.personalQuestionsModel.aadharNumber ?? ""}"),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//
//
//                                   const SizedBox(
//                                     height: 10.0,
//                                   ),
//
//                                   ///VITALS DATA
//                                   GestureDetector(
//                                     onTap: (){
//                                       questionsController.vitalsQuestionsAnswerList?.length != 0 ?
//
//                                       showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         backgroundColor: Colors.transparent,
//                                         builder: (context) => Container(
//                                           height: ScreenSize.height(context) * 0.90,
//                                           decoration: const BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:  BorderRadius.only(
//                                               topLeft:  Radius.circular(25.0),
//                                               topRight:  Radius.circular(25.0),
//                                             ),
//                                           ),
//                                           child: Center(
//                                             child: EditQuestionsBottomSheet(elements: questionsController.vitalsQuestionsAnswerList),
//                                           ),
//                                         ),
//                                       ) : null;
//                                     },
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(right: 5.0),
//                                       child: Card(
//                                         elevation: 5.0,
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(10.0)),
//
//                                         child: Container(
//
//                                           padding: const EdgeInsets.only(
//                                               left: 0, right: 5, bottom: 5.0, top: 5.0),
//                                           decoration: BoxDecoration(
//                                               color: AppColor.primaryColor.withOpacity(0.4),
//                                               borderRadius: BorderRadius.circular(10.0)),
//                                           width: ScreenSize.width(context) * 0.75,
//                                           height: ScreenSize.height(context) * 0.08,
//                                           child: Column(
//                                             children: [
//                                               ///VITALS HEADER
//                                               const Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.start,
//                                                 children: [
//                                                   Padding(
//                                                       padding: EdgeInsets.only(
//                                                           left: 10.0,
//                                                           top: 2.0,
//                                                           bottom: 2.0),
//                                                       child: AutoSizeText(
//                                                         "VITALS : ",
//                                                         maxLines: 1,
//                                                         maxFontSize: 15.0,
//                                                         style: TextStyle(
//                                                             fontWeight: FontWeight.bold,
//                                                             color: AppColor.black),
//                                                       ),
//                                                   ),
//                                                 ],
//                                               ),
//
//                                               const SizedBox(
//                                                 height: 5.0,
//                                               ),
//
//                                               ///VITALS DATA
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.spaceEvenly,
//                                                 children: [
//                                                   infoVitalTiles(
//                                                       context: context,
//                                                       image: AppImages.bloodPressure,
//                                                       text: "${vitalsController.vitalsQuestionsModel.systolic}/${vitalsController.vitalsQuestionsModel.diastolic}"),
//
//                                                   infoVitalTiles(
//                                                       context: context,
//                                                       image: AppImages.spo2,
//                                                       text:
//                                                           "${vitalsController.vitalsQuestionsModel.spo2}"),
//                                                   infoVitalTiles(
//                                                       context: context,
//                                                       image: AppImages.pulse,
//                                                       text:
//                                                           "${vitalsController.vitalsQuestionsModel.pulse}"),
//                                                   infoVitalTiles(
//                                                       context: context,
//                                                       image: AppImages.thermometer,
//                                                       text:
//                                                           "${vitalsController.vitalsQuestionsModel.temperature}"),
//                                                 ],
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//
//
//                                   const SizedBox(
//                                     height: 5.0,
//                                   ),
//
//
//                                   ///GRID VIEW
//                                   questionsController.filteredCategoryList.length == 0
//                                       ? Container(height: 0.001)
//                                       : Container(
//                                     decoration: BoxDecoration(
//                                       // color: AppColor.primaryColor.withOpacity(0.5),
//                                         borderRadius: BorderRadius.circular(15.0)),
//                                     height: ScreenSize.height(context) * 0.12,
//                                     width: ScreenSize.width(context),
//                                     margin: const EdgeInsets.only(
//                                         top: 10.0, bottom: 5.0, left: 10.0, right: 10.0),
//                                     child: DynamicHeightGridView(
//                                       crossAxisCount: 3,
//                                       shrinkWrap: false,
//                                       crossAxisSpacing: 3,
//                                       mainAxisSpacing: 6,
//                                       itemCount:
//                                       questionsController.filteredCategoryList.length -
//                                           1,
//                                       builder: (context, index) {
//                                         return GestureDetector(
//                                           onTap: () {
//                                             ///UPDATES INDEX VALUE
//                                             questionsController.updateSideDotBarIndex(
//                                                 index: index);
//                                           },
//                                           child: Container(
//                                             width: ScreenSize.width(context) * 0.18,
//                                             margin: EdgeInsets.all(5.0),
//                                             decoration: BoxDecoration(
//                                               border: Border.all(color: Colors.grey),
//                                               borderRadius: BorderRadius.circular(20),
//
//                                               ///UPDATES COLOR BASED ON SELECTED INDEX
//                                               color: questionsController
//                                                   .selectedFilterCategoryListIndex
//                                                   .value ==
//                                                   index
//                                                   ? AppColor.primaryColor.withOpacity(0.9)
//                                                   : AppColor.primaryColor.withOpacity(0.25),
//                                             ),
//                                             child: Column(
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               mainAxisAlignment:
//                                               MainAxisAlignment.spaceAround,
//                                               children: [
//                                                 Padding(
//                                                   padding: const EdgeInsets.only(
//                                                       top: 8.0, left: 8.0),
//                                                   child: Text(
//                                                     questionsController
//                                                         .filteredCategoryList[index],
//                                                     style: TextStyle(
//                                                         fontSize:
//                                                         ScreenSize.width(context) *
//                                                             0.025,
//                                                         fontWeight: FontWeight.w500),
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   height:
//                                                   ScreenSize.height(context) * 0.015,
//                                                 ),
//
//                                                 // LinearProgressIndicator(
//                                                 //   value: questionsController
//                                                 //       .filteredCategoryListMap![""]
//                                                 //       ?.toDouble(),
//                                                 //   backgroundColor: Colors.grey,
//                                                 //   valueColor:
//                                                 //       AlwaysStoppedAnimation<Color>(AppColor.white),
//                                                 // ),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
