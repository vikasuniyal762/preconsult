import 'package:auto_size_text/auto_size_text.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:medongosupport/preConsultModule/consts/appColors.dart';
import 'package:medongosupport/preConsultModule/consts/screenSize.dart';
import 'package:medongosupport/preConsultModule/controllers/attachmentsController.dart';
import 'package:medongosupport/preConsultModule/controllers/audioFileController.dart';
import 'package:medongosupport/preConsultModule/controllers/locationController.dart';
import 'package:medongosupport/preConsultModule/controllers/preConsultationController.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/models/questionsModel.dart';
import 'package:medongosupport/preConsultModule/view/faceDetectionModules/detector.dart';
import 'package:medongosupport/preConsultModule/view/preconsultationModuleMain.dart';
import 'package:medongosupport/preConsultModule/view/questionModules/personalInfoWidget.dart';
import 'package:intl/intl.dart';
import 'package:medongosupport/preConsultModule/widgets/alertDialogs.dart';
import 'package:medongosupport/preConsultModule/widgets/appBars.dart';
import 'package:medongosupport/preConsultModule/widgets/bottomSheet.dart';
import 'package:medongosupport/preConsultModule/widgets/titleTextField.dart';
import 'package:medongosupport/preConsultModule/widgets/toastMessage.dart';
import 'package:medongosupport/preConsultModule/widgets/willPopScope.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  ///INITIALIZE DATA
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      ///PORTRAIT ORIENTATION ONLY
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp
      ]);

      ///GETS CURRENT COORDINATES
      locationController.getLocationPermission();

      ///RESETS LOADING PAGE STATUS
      preConsultationController.isLoadingPermissionsPage.value = false;
      preConsultationController.resetLoadingStatusPermissionsPage();
      preConsultationController.isLoadingFaceDetectorPage.value = false;
      preConsultationController.resetLoadingStatusFaceDetectorPage();
      preConsultationController.isReleased.value==false;
      ///STARTS AUDIO FILE RECORDING
       audioFileController.startRecord();
    });
  }

  // late PreConsultationModuleMain myAncestorWidget;
  //
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   myAncestorWidget = context.dependOnInheritedWidgetOfExactType<PreConsultationModuleMain>()!;
  // }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context, "Patient data will be lost. Do you want to go back?"),
      child: SafeArea(
        child: Obx(
          () => LoadingOverlay(
            color: AppColor.white,
            opacity: 1.0,
            progressIndicator: LoadingBouncingGrid.square(
              size: 75.0,
              backgroundColor: AppColor.primaryColor,
              borderColor: AppColor.primaryColor,
              duration: const Duration(milliseconds: 1000),
            ),
            isLoading: questionsController.isLoadingQuestions.value,
            child: Scaffold(
              // appBar: titleAppBar(
              //     context: context,
              //     title: "Pre-Consulting",
              //     actions: [
              //       Padding(
              //         padding: const EdgeInsets.only(right: 15.0),
              //         child: IconButton(
              //           iconSize: 25.0,
              //           onPressed: () {
              //             ///TODO
              //           },
              //           tooltip: "HELP",
              //           icon: const Icon(
              //             Icons.help,
              //             size: 25.0,
              //             color: AppColor.white,
              //           ),
              //         ),
              //       ),
              //     ]),

              backgroundColor: AppColor.white,

              body: Container(
                height: ScreenSize.height(context),
                color: AppColor.primaryColor.withOpacity(0.1),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TopInfoBar(),

                      ///CHECKS QUESTIONS LIST AND LOADS INPUT MODE WIDGETS FOR PERSONAL AND FILTERED QUESTIONS LIST
                      Obx(
                        () => questionsController.questionsFlowMain.value == 3
                            ?

                            ///SUBMIT BUTTON
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: ScreenSize.height(context) * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      ///ALERT DIALOG - TO NAVIGATE TO FINAL SUBMIT ACTION
                                      yesNoDialog(
                                        context: context,
                                        actionButton: "Continue",
                                        cancelButton: "Close",
                                        text:
                                            "By Clicking on Continue, you won't be able to edit any questions. Continue?",
                                        onTapAction: () async {
                                          await questionsController.finalSubmitButtonActionNativeAndroid();
                                          Get.back();
                                        },
                                        onTapCancel: () {
                                          Get.back();
                                        },
                                      );
                                    },
                                    child: Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: Container(
                                        width: ScreenSize.width(context) * 0.5,
                                        height:
                                            ScreenSize.height(context) * 0.1,
                                        decoration: BoxDecoration(
                                          color: AppColor.primaryColor
                                              .withOpacity(0.75),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        padding: EdgeInsets.all(
                                            ScreenSize.width(context) * 0.025),
                                        child: const Center(
                                          child: AutoSizeText(
                                            "SUBMIT",
                                            minFontSize: 20,
                                            maxFontSize: 32,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 32.0,
                                                color: AppColor.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            :

                            ///QUESTION AND INPUT MODE WIDGETS
                            Column(
                                children: [
                                  ///QUESTIONS LIST
                                  questionsController
                                              .allQuestionsList!.length !=
                                          0
                                      ? Container(
                                          color: AppColor.transparent,
                                          height:
                                              ScreenSize.height(context) * 0.15,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                renderQuestionsListUI(),
                                              ],
                                            ),
                                          ))
                                      : SizedBox(
                                          height:
                                              ScreenSize.height(context) * 0.25,
                                          child: const UnableToLoad(),
                                        ),

                                  const SizedBox(
                                    height: 0,
                                  ),

                                  questionsController.questionsFlowMain.value !=
                                          3
                                      ? renderInputModeWidgetUI()
                                      : Container(
                                          height: 1,
                                        ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              resizeToAvoidBottomInset: false,
              bottomSheet: Container(
                padding: const EdgeInsets.all(8.0),
                color: AppColor.primaryColor.withOpacity(0.05),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, bottom: 5.0, top: 5.0),
                  margin: const EdgeInsets.only(
                      left: 5, right: 5, bottom: 5.0, top: 5.0),
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  width: ScreenSize.width(context),
                  height: ScreenSize.height(context) * 0.1,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Obx(() => audioFileController.isRecording.value
                              ? const Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0, bottom: 5.0),
                                    child: Icon(
                                        Icons.fiber_manual_record_rounded,
                                        color: AppColor.red,
                                        semanticLabel: "AUDIO RECORDING ON"),
                                  ),
                                )
                              : Container(
                                  height: 0.001,
                                )),
                        ],
                      ),
                      Obx(() =>
                          questionsController.attachmentsCounter.value != 0
                              ? renderAttachmentsList()
                              : Container(
                                  height: 0.01,
                                )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///RENDERS QUESTIONS LIST
  renderQuestionsListUI() {
    switch (questionsController.questionsFlowMain.value) {
      case 0:
        return buildPersonalQuestionsList();
      case 1:
        return buildVitalsQuestionsList();
      case 2:
        return buildFilteredQuestionsList();
      case 3:
        return Container(height: 1);

      default:
        return Container(height: 1);
    }
  }

  ///RENDERS INPUT MODE WIDGETS - UI MAIN
  renderInputModeWidgetUI() {
    try {
      switch (questionsController.questionsFlowMain.value) {
        case 0:
          return questionsController.personalInfoQuestions?.length != 0
              ? SizedBox(
                  width: ScreenSize.width(context) * 0.95,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                              flex: 8,
                              child: inputModeWidget(
                                  elements: questionsController
                                          .personalInfoQuestions![
                                      questionsController
                                          .currentPersonalQuestionIndex
                                          .value])),

                          ///ATTACH BUTTON
                          Flexible(
                              flex: 1, child: attachButton(context: context)),
                        ],
                      ),
                      // const SizedBox(
                      //     height: 10), // Add spacing between the rows
                      // Flex(
                      //   direction: Axis.horizontal,
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     ///back BUTTON
                      //     Flexible(flex: 1, child: renderBackButtonWidget()),
                      //
                      //     ///SEND BUTTON
                      //     Flexible(
                      //         flex: 1, child: sendButton(context: context)),
                      //   ],
                      // ),
                    ],
                  ),
                )
              : Container(
                  height: 1,
                );

        case 1:
          return questionsController.vitalsQuestionsList?.length != 0
              ? SizedBox(
                  width: ScreenSize.width(context) * 0.95,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                              flex: 7,
                              child: inputModeWidget(
                                  elements:
                                      questionsController.vitalsQuestionsList![
                                          questionsController
                                              .currentVitalsQuestionIndex
                                              .value])),

                          ///ATTACH BUTTON
                          Flexible(
                              flex: 1, child: attachButton(context: context)),
                        ],
                      ),
                      // const SizedBox(
                      //     height: 10), // Add spacing between the rows
                      // Flex(
                      //   direction: Axis.horizontal,
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     ///back BUTTON
                      //     Flexible(flex: 1, child: renderBackButtonWidget()),
                      //
                      //     ///SEND BUTTON
                      //     Flexible(
                      //         flex: 1, child: sendButton(context: context)),
                      //   ],
                      // ),
                    ],
                  ),
                )
              : Container(
                  height: 1,
                );

        case 2:
          return questionsController.filteredQuestionsList?.length != 0
              ? SizedBox(
                  width: ScreenSize.width(context) * 0.95,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                              flex: 7,
                              child: inputModeWidget(
                                  elements: questionsController
                                          .filteredQuestionsList![
                                      questionsController
                                          .currentFilteredQuestionIndex
                                          .value])),

                          ///ATTACH BUTTON
                          Flexible(
                              flex: 1, child: attachButton(context: context)),
                        ],
                      ),
                      // const SizedBox(
                      //     height: 10), // Add spacing between the rows
                      // Flex(
                      //   direction: Axis.horizontal,
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     ///back BUTTON
                      //     Flexible(flex: 1, child: renderBackButtonWidget()),
                      //
                      //     ///SEND BUTTON
                      //     Flexible(
                      //         flex: 1, child: sendButton(context: context)),
                      //   ],
                      // ),
                    ],
                  ),
                )
              : Container(height: 1);

        default:
          return Container(height: 1);
      }
    } catch (error) {
      return Container(height: 1);
    }
  }

  ///PERSONAL QUESTIONS
  Widget buildPersonalQuestionsList() {
    return questionsController.personalInfoQuestions!.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  width: ScreenSize.width(context) * 0.95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Personal Questions",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      /// TEXT OF QUESTION INDEX OF PERSONAL QUESTION LIKE (12/24) AND UPON THE NUMBER OF PERSONAL QUESTION LENGTH

                      Text(
                        questionsController.getPersonalCurrentIndexText(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  renderBackButtonWidget(),
                  Card(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(40.0)),
                    elevation: 4.0,
                    child: Container(
                      width: ScreenSize.width(context) * 0.80,
                      height: ScreenSize.height(context) * 0.06,
                      decoration: BoxDecoration(
                        // color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.only(
                          top: ScreenSize.width(context) * 0.04,
                          bottom: ScreenSize.width(context) * 0.025,
                          left: ScreenSize.width(context) * 0.025),
                      child: AutoSizeText(
                        '${questionsController.personalInfoQuestions![questionsController.currentPersonalQuestionIndex.value].text}${checkAndReturnMandatoryString()}',
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        minFontSize: 12.0,
                        maxFontSize: 32.0,
                        style: const TextStyle(
                            color: AppColor.black, fontSize: 20.0),
                      ),
                    ),
                  ),
                  sendButton(context: context),
                ],
              )
            ]))
        : SizedBox(
            height: ScreenSize.height(context) * 0.25,
            child: const UnableToLoad());
  }

  ///VITALS QUESTIONS
  Widget buildVitalsQuestionsList() {
    return questionsController.vitalsQuestionsList!.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  width: ScreenSize.width(context) * 0.95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Vitals Questions",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      /// TEXT OF QUESTION INDEX OF VITALS QUESTION LIKE (12/24) AND UPON THE NUMBER OF VITALS QUESTION LENGTH

                      Text(
                        questionsController.getVitalsCurrentIndexText(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  renderBackButtonWidget(),
                  Card(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(40.0)),
                    elevation: 4.0,
                    child: Container(
                      width: ScreenSize.width(context) * 0.80,
                      height: ScreenSize.height(context) * 0.06,
                      decoration: BoxDecoration(
                        // color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.only(
                          top: ScreenSize.width(context) * 0.04,
                          bottom: ScreenSize.width(context) * 0.025,
                          left: ScreenSize.width(context) * 0.025),
                      child: AutoSizeText(
                        '${questionsController.vitalsQuestionsList![questionsController.currentVitalsQuestionIndex.value].text}${checkAndReturnMandatoryString()}',
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        minFontSize: 12.0,
                        maxFontSize: 32.0,
                        style: const TextStyle(
                            color: AppColor.black, fontSize: 20.0),
                      ),
                    ),
                  ),
                  sendButton(context: context),
                ],
              )
            ]))
        : SizedBox(
            height: ScreenSize.height(context) * 0.2,
            child: const UnableToLoad());
  }

  ///FILTERED QUESTIONS
  Widget buildFilteredQuestionsList() {
    return questionsController.filteredQuestionsList!.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                  width: ScreenSize.width(context) * 0.95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "All Questions",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      /// TEXT OF QUESTION INDEX OF FILTER QUESTION LIKE (12/24) AND UPON THE NUMBER OF FILTER QUESTION LENGTH
                      Text(
                        questionsController.getFilterCurrentIndexText(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  renderBackButtonWidget(),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 4.0,
                    child: Container(
                      width: ScreenSize.width(context) * 0.80,
                      height: ScreenSize.height(context) * 0.06,
                      decoration: BoxDecoration(
                        // color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.only(
                          top: ScreenSize.width(context) * 0.04,
                          bottom: ScreenSize.width(context) * 0.025,
                          left: ScreenSize.width(context) * 0.025),
                      child: AutoSizeText(
                        '${questionsController.filteredQuestionsList![questionsController.currentFilteredQuestionIndex.value].text}${checkAndReturnMandatoryString()}',
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        minFontSize: 12.0,
                        maxFontSize: 32.0,
                        style: const TextStyle(
                            color: AppColor.black, fontSize: 20.0),
                      ),
                    ),
                  ),
                  sendButton(context: context),
                ],
              )
            ]))
        : SizedBox(
            height: ScreenSize.height(context) * 0.25,
            child: const UnableToLoad());
  }

  ///RENDERS INPUT MODE WIDGETS
  Widget inputModeWidget({required Elements elements}) {
    ///RENDERS INPUT WIDGETS
    switch (elements.selectedMode) {
      case "text":
        return TitleTextField(
          title: elements.text,
          keyboardType: TextInputType.text,
          hint: '${elements.text}',
          labelText: '${elements.text}',
          controller: questionsController.answerController,
        );

      case "duration":
        return Row(
          children: [
            /// DURATION QUESTION TEXT FIELD WITH THE DROPDOWN BUTTON
            Expanded(
              //width: ScreenSize.width(context) * 0.5,
              child: TitleTextField(
                title: elements.text,
                keyboardType: TextInputType.phone,
                hint: '${elements.text}',
                labelText: '${elements.text}',
                controller: questionsController.answerController,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: 25,
              ),
              child: SizedBox(
                height: ScreenSize.height(context) * 0.05,
                width: ScreenSize.height(context) * 0.1,
                child: DropdownButton<String>(
                  underline: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColor.primaryColor, width: 0.5)),
                  ),
                  value: questionsController.selectedDateRangeFormat.value,

                  /// OPTION VALUES IN THE DROPDOWN FIELD
                  items: <String>['days', 'weeks', 'months', 'years']
                      .map<DropdownMenuItem<String>>(
                        (String option) => DropdownMenuItem<String>(
                          value: option,
                          child: Text(
                            option,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      questionsController.selectedDateRangeFormat.value =
                          newValue!;
                    });

                    /// TODO SET STATE MUST BE REMOVE FROM HERE
                    /// SELECTED VALUE REFLECT IN THE TEXT FIELD FOR THE DURATION QUESTIONS
                    // setState(() {
                    //   questionsController.answerController.text = '${questionsController.answerController.text} ${finalValue!}';
                    // });
                  },
                ),
              ),
            ),

            const SizedBox(
              width: 10,
            ),
          ],
        );

      case "date":
        return Column(
          children: [
            Row(
              children: [
                /// TEXT FIELD FOR THE YEAR TEXT FIELD
                Expanded(
                  child: TitleTextField(
                    title: "Years",
                    hint: "Years",
                    labelText: "Years",
                    keyboardType: TextInputType.number,
                    len: 4,
                    controller: questionsController.answerYearsController,
                  ),
                ),

                /// TEXT FIELD FOR THE MONTH TEXT FIELD
                Expanded(
                  child: TitleTextField(
                    title: "Months",
                    hint: "Months",
                    labelText: "Months",
                    keyboardType: TextInputType.number,
                    len: 1,
                    controller: questionsController.answerMonthsController,
                  ),
                ),

                /// TEXT FIELD FOR THE DAY TEXT FIELD
                Expanded(
                  child: TitleTextField(
                    title: "Days",
                    hint: "Days",
                    labelText: "Days",
                    keyboardType: TextInputType.number,
                    len: 1,
                    controller: questionsController.answerDaysController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: GestureDetector(
                      onTap: () async {
                        /// SHOW DATE PICKER
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now());

                        if (pickedDate != null) {
                          final now = DateTime.now();

                          /// FIND THE AGE BASED ON THE CURRENT AGE AND THE DATE OF BIRTH
                          // Calculate the difference between the two dates
                          Duration difference = now.difference(pickedDate);

                          // Calculate the years, months, and days
                          int years = difference.inDays ~/ 365;
                          int months = ((difference.inDays % 365) ~/ 30) % 12;
                          int days = (difference.inDays % 365) % 30;

                          // Update years if months reach 12
                          if (months == 12) {
                            years++;
                            months = 0;
                          }

                          /// UPDATE THE VALUES IN THE TEXT FIELD
                          /// YEAR CONTROLLER
                          questionsController.answerYearsController.text =
                              years.toString();

                          /// MONTH CONTROLLER
                          questionsController.answerMonthsController.text =
                              months.toString();

                          /// DAY CONTROLLER
                          questionsController.answerDaysController.text =
                              days.toString();

                          String formattedDate = DateFormat("dd MMM yyyy")
                              .format(pickedDate)
                              .toString();

                          setState(() {
                            questionsController.answerController.text =
                                formattedDate;
                          });
                        } else {}
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColor.primaryColor,
                        radius: 25,
                        child: Icon(
                          Icons.calendar_month,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        );

      case "dateTime":

        ///ASSIGNING BY DEFAULT
        final defaultDateString = DateFormat('MMM dd, yyyy hh:mm:ss a').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0));

        return Column(
          children: [
            Row(
              children: [
                Container(
                  height: ScreenSize.height(context) * 0.075,
                  width: ScreenSize.width(context) * 0.68,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.only(
                      left: ScreenSize.width(context) * 0.01,
                      right: ScreenSize.width(context) * 0.01),
                  padding: EdgeInsets.only(
                      left: ScreenSize.width(context) * 0.01,
                      right: ScreenSize.width(context) * 0.01,
                      top: ScreenSize.height(context) * 0.01,
                      bottom: ScreenSize.height(context) * 0.01),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: AutoSizeText(
                        questionsController.answerController.text == "" ? defaultDateString : questionsController.answerController.text,
                        minFontSize: 14.0,
                        maxFontSize: 32.00,
                        style: const TextStyle(
                            fontSize: 20.00,
                            fontWeight: FontWeight.w500,
                            color: AppColor.tertiaryColor),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: GestureDetector(
                      onTap: () async {
                        ///TOAST MESSAGE FOR ANC VISIT DATE
                        if(elements.text == "ANC Visit Date"){
                          showToast("Visit Date is today's date by default. Can not make changes", ToastGravity.CENTER);
                          return;
                        }else{
                          /// SHOW DATE PICKER
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now());

                          if (pickedDate != null) {
                            String formattedDate = DateFormat('MMM dd, yyyy hh:mm:ss a').format(DateTime(pickedDate.year,pickedDate.month, pickedDate.day, 0, 0, 0));

                            setState(() {
                              questionsController.answerController.text =
                                  formattedDate;
                            });
                          } else {
                            ///ASSIGNING DEFAULT DATE
                            setState(() {
                              questionsController.answerController.text = DateFormat('MMM dd, yyyy hh:mm:ss a').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0));
                            });
                          }

                        }
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColor.primaryColor,
                        radius: 25,
                        child: Icon(
                          Icons.calendar_month,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        );

      case "numeric":
        return elements.text == "Age"
            ? Column(
                children: [
                  Row(
                    children: [
                      /// TEXT FIELD FOR THE YEAR TEXT FIELD
                      Expanded(
                        child: TitleTextField(
                          title: "Years",
                          hint: "Years",
                          labelText: "Years",
                          keyboardType: TextInputType.number,
                          len: 3,
                          controller: questionsController.answerYearsController,
                        ),
                      ),

                      /// TEXT FIELD FOR THE MONTH TEXT FIELD
                      Expanded(
                        child: TitleTextField(
                          title: "Months",
                          hint: "Months",
                          labelText: "Months",
                          keyboardType: TextInputType.number,
                          len: 2,
                          controller:
                              questionsController.answerMonthsController,
                        ),
                      ),

                      /// TEXT FIELD FOR THE DAY TEXT FIELD
                      Expanded(
                        child: TitleTextField(
                          title: "Days",
                          hint: "Days",
                          labelText: "Days",
                          keyboardType: TextInputType.number,
                          len: 2,
                          controller: questionsController.answerDaysController,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: GestureDetector(
                            onTap: () async {
                              /// SHOW DATE PICKER
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now());

                              if (pickedDate != null) {
                                final now = DateTime.now();

                                /// FIND THE AGE BASED ON THE CURRENT AGE AND THE DATE OF BIRTH
                                // Calculate the difference between the two dates
                                Duration difference =
                                    now.difference(pickedDate);

                                // Calculate the years, months, and days
                                int years = difference.inDays ~/ 365;
                                int months =
                                    ((difference.inDays % 365) ~/ 30) % 12;
                                int days = (difference.inDays % 365) % 30;

                                // Update years if months reach 12
                                if (months == 12) {
                                  years++;
                                  months = 0;
                                }

                                /// UPDATE THE VALUES IN THE TEXT FIELD
                                /// YEAR CONTROLLER
                                questionsController.answerYearsController.text =
                                    years.toString();

                                /// MONTH CONTROLLER
                                questionsController.answerMonthsController
                                    .text = months.toString();

                                /// DAY CONTROLLER
                                questionsController.answerDaysController.text =
                                    days.toString();

                                setState(() {
                                  questionsController.selectedDateDob =
                                      pickedDate;
                                });
                              } else {}
                            },
                            child: const CircleAvatar(
                              backgroundColor: AppColor.primaryColor,
                              radius: 25,
                              child: Icon(
                                Icons.calendar_month,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            : TitleTextField(
                title: elements.text,
                hint: '${elements.text}',
                labelText: '${elements.text}',
                keyboardType: TextInputType.phone,
                len: elements.selectedLength,
                controller: questionsController.answerController,
                //onSubmit: (val) => questionsController.answerController.text.length != elements.selectedLength ? showToast("Please enter ${elements.selectedLength} digits", ToastGravity.CENTER) : null,
              );

      case "options":
        List<String> options = elements.options.split("/");

        if (options.length == 2) {
          // Display options in a row without radio buttons
          return SizedBox(
            width: ScreenSize.width(context) * 0.8,
            child: Obx(
              () => ChipsChoice<int>.single(
                choiceStyle: C2ChipStyle.filled(
                  foregroundStyle: TextStyle(
                      color: AppColor.blackMild,
                      fontSize: ScreenSize.width(context) * 0.04,
                      fontWeight: FontWeight.bold),
                  height: ScreenSize.height(context) * 0.05,
                  foregroundColor: AppColor.primaryColor,
                  color: AppColor.greyShimmer,
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.width(context) * 0.04,
                  ),
                  selectedStyle: const C2ChipStyle(
                    backgroundColor: AppColor.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                value: questionsController.optionsChoiceIndex.value,
                onChanged: (val) {
                  print("THIS IS VALUE $val");

                  //showToast("THIS IS VALUE $val", ToastGravity.CENTER);

                  ///UPDATES QUESTIONS CHOICES
                  questionsController.updateOptionsChoice(
                      options: options, index: val);
                },
                choiceItems: C2Choice.listFrom<int, String>(
                  source: options,
                  value: (i, v) => i,
                  label: (i, v) => v.toUpperCase(),
                ),
                wrapped: false,
              ),
            ),
          );
        } else {
          ///DISPLAY OPTIONS OF RADIO BUTTON IN A COLUMN
          return SizedBox(
            width: ScreenSize.width(context) * 0.8,
            height: ScreenSize.height(context) * 0.75,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose one Answer",
                    style: TextStyle(
                      fontSize: ScreenSize.width(context) * 0.04,
                      fontWeight: FontWeight.bold,
                      color: AppColor.blackMild,
                    ),
                  ),

                  const SizedBox(
                      height:
                          10), // Add some spacing between the text and options

                  ...List.generate(
                    options.length,
                    (index) => RadioListTile<int>(
                      value: index,
                      groupValue: questionsController.optionsChoiceIndex.value,
                      onChanged: (val) {
                        debugPrint("Selected value: $val");
                        questionsController.updateOptionsChoice(
                          options: options,
                          index: index,
                        );
                      },
                      title: Text(
                        options[index].toUpperCase(),
                        style: TextStyle(
                          fontSize: ScreenSize.width(context) * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColor.blackMild,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

      case "multiOptions":
        List<String> multiOptions = elements.options.split("/");

        return Obx(() => questionsController.multiOptionsString.value == ""
            ?

            ///SELECT ITEMS
            GestureDetector(
                onTap: () async {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return MultiOptionsBottomSheet(
                          items: multiOptions,
                          selectedItems: questionsController
                              .multiOptionsStringList, // Pass the selected items here
                          onSave: (selectedItems) {
                            setState(() {
                              questionsController
                                  .updateListToStringForMultiOptions(
                                      selectedOptions: selectedItems);
                            });
                          },
                        );
                      });
                },
                child: Container(
                  height: ScreenSize.height(context) * 0.075,
                  width: ScreenSize.width(context) * 0.9,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.only(
                      left: ScreenSize.width(context) * 0.01,
                      right: ScreenSize.width(context) * 0.01),
                  padding: EdgeInsets.only(
                      left: ScreenSize.width(context) * 0.01,
                      right: ScreenSize.width(context) * 0.01,
                      top: ScreenSize.height(context) * 0.01,
                      bottom: ScreenSize.height(context) * 0.01),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "TAP TO CHOOSE OPTIONS",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.tertiaryColor),
                    ),
                  ),
                ),
              )
            :

            ///SELECTED ITEMS
            GestureDetector(
                onTap: () async {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return MultiOptionsBottomSheet(
                          items: multiOptions,
                          selectedItems: questionsController
                              .multiOptionsStringList, // Pass the selected items here
                          onSave: (selectedItems) {
                            setState(() {
                              questionsController
                                  .updateListToStringForMultiOptions(
                                      selectedOptions: selectedItems);
                            });
                          },
                        );
                      });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: ScreenSize.width(context) * 0.01,
                  ),
                  padding: EdgeInsets.all(
                    ScreenSize.width(context) * 0.01,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        questionsController.multiOptionsStringList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${questionsController.multiOptionsStringList[index]}\n",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ));

      default:
        return TitleTextField(
          title: elements.text,
          keyboardType: TextInputType.text,
          hint: '${elements.text}',
          labelText: '${elements.text}',
          controller: questionsController.answerController,
        );
    }
  }

  ///ATTACH BUTTON
  Widget attachButton({required BuildContext context}) {
    return FloatingActionButton(
      heroTag: "attach",
      backgroundColor: AppColor.primaryColor,
      child: const Icon(
        Icons.attach_file,
      ),
      onPressed: () async {
        showMenu(
            surfaceTintColor: AppColor.primaryColor,
            shadowColor: AppColor.primaryColor,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            context: context,

            ///ADJUST POSITION IF THE GRID VIEW IS VISIBLE
            position: questionsController.filteredCategoryList.length == 0
                ? RelativeRect.fromLTRB(ScreenSize.width(context) * 0.1,
                    ScreenSize.height(context) * 0.575, 0, 0)
                : RelativeRect.fromLTRB(ScreenSize.width(context) * 0.1,
                    ScreenSize.height(context) * 0.7, 0, 0),
            items: [
              const PopupMenuItem<int>(
                  value: 0,
                  child: ListTile(
                    title: Text("Camera"),
                    leading: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: AppColor.primaryColor,
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColor.white,
                        )),
                  )),
              const PopupMenuItem<int>(
                  value: 1,
                  child: ListTile(
                    title: Text("Attach Files"),
                    leading: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: AppColor.primaryColor,
                        child: Icon(
                          Icons.file_present_sharp,
                          color: AppColor.white,
                        )),
                  )),
              // const PopupMenuItem<int>(
              //     value: 2,
              //     child: ListTile(
              //       title: Text("Scan"),
              //       leading: CircleAvatar(
              //           radius: 25.0,
              //           backgroundColor: AppColor.primaryColor,
              //           child: Icon(
              //             Icons.document_scanner,
              //             color: AppColor.white,
              //           )),
              //     )),
            ]).then((value) {
          ///HANDLES ALL THE ATTACHMENT BUTTONS
          attachmentsController.handleAttachmentOption(
              value: value ?? -1, context: context);
        });
      },
    );
  }

  ///SEND BUTTON
  Widget sendButton({required BuildContext context}) {
    return GestureDetector(
      onTap: () async {
        switch (questionsController.questionsFlowMain.value) {
          case 0:
            questionsController.submitButtonActionsForPersonalQuestions(
                isNew: true);
            break;
          case 1:
            questionsController.submitButtonActionsForVitalsQuestions(
                isNew: true);
            break;
          case 2:
            questionsController.submitButtonActionsForFilteredQuestions(
                isNew: true);
            break;
          default:
            break;
        }
      },
      child: Card(
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: ScreenSize.width(context) * 0.075,
          height: ScreenSize.height(context) * 0.06,
          decoration: BoxDecoration(
            color: AppColor.primaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 25.0,
            color: AppColor.blackMild,
          ),
        ),
      ),
    );
  }

  ///BACK BUTTON WIDGET - UI
  Widget backButtonWidgetUI({Color? buttonColor}) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        width: ScreenSize.width(context) * 0.075,
        height: ScreenSize.height(context) * 0.06,
        decoration: BoxDecoration(
          color: buttonColor!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 25.0,
          color: AppColor.blackMild,
        ),
      ),
    );
  }

  //RENDER BACK BUTTON MAIN
  Widget renderBackButtonWidget() {
    try {
      switch (questionsController.questionsFlowMain.value) {
        case 0:
          return questionsController.currentPersonalQuestionIndex.value != 0
              ? GestureDetector(
                  onTap: () async {
                    questionsController.goToPreviousPersonalQuestion();
                  },
                  child: backButtonWidgetUI(buttonColor: AppColor.primaryColor),
                )
              : GestureDetector(
                  onTap: () async {
                    showToast("This is first question in this category",
                        ToastGravity.CENTER);
                  },
                  child: backButtonWidgetUI(buttonColor: AppColor.grey),
                );

        case 1:
          return questionsController.currentVitalsQuestionIndex.value != 0
              ? GestureDetector(
                  onTap: () async {
                    questionsController.goToPreviousVitalsQuestion();
                  },
                  child: backButtonWidgetUI(buttonColor: AppColor.primaryColor),
                )
              : GestureDetector(
                  onTap: () async {
                    showToast("This is first question in this category",
                        ToastGravity.CENTER);
                  },
                  child: backButtonWidgetUI(buttonColor: AppColor.grey),
                );

        case 2:
          return questionsController.currentFilteredQuestionIndex.value != 0
              ? GestureDetector(
                  onTap: () async {
                    questionsController.goToPreviousFilteredQuestion();
                  },
                  child: backButtonWidgetUI(buttonColor: AppColor.primaryColor),
                )
              : GestureDetector(
                  onTap: () async {
                    showToast("This is first question in this category",
                        ToastGravity.CENTER);
                  },
                  child: backButtonWidgetUI(buttonColor: AppColor.grey),
                );

        default:
          return Container(height: 1);
      }
    } catch (error) {
      return Container(height: 1);
    }
  }

  ///RENDERS QUESTIONS LIST - TODO UPDATE WHEN IT COMES BACK - NEXT RELEASE
  // renderAttachmentsList() {
  //   switch (questionsController.questionsFlowMain.value) {
  //     case 0:
  //       if(questionsController.personalInfoQuestions?[questionsController.currentPersonalQuestionIndex.value].attachments != []){
  //       return Obx(() =>  attachmentButtonListViewUI(attachments: questionsController.personalInfoQuestions![questionsController.currentPersonalQuestionIndex.value].attachments!));
  //
  //       }else {
  //         return Container(height: 0.01,);
  //       }
  //     case 1:
  //       if(questionsController.vitalsQuestionsList?[questionsController.currentVitalsQuestionIndex.value].attachments != []){
  //         return Obx(() =>  attachmentButtonListViewUI(attachments: questionsController.personalInfoQuestions![questionsController.currentPersonalQuestionIndex.value].attachments!));
  //       }else {
  //         return Container(height: 0.01,);
  //       }
  //     case 2:
  //       if(questionsController.filteredQuestionsList?[questionsController.currentFilteredQuestionIndex.value].attachments != []){
  //         return attachmentButtonListViewUI(
  //             attachments:
  //             questionsController.filteredQuestionsList![questionsController.currentFilteredQuestionIndex.value].attachments!);
  //       }else {
  //         return Container(height: 0.01,);
  //       }
  //     case 3:
  //       return Container(height: 1);
  //
  //     default:
  //       return Container(height: 1);
  //   }
  // }

  ///ATTACHMENT UI
  renderAttachmentsList() {
    return Container(
      width: ScreenSize.width(context) * 0.9,
      height: ScreenSize.height(context) * 0.05,
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 2.5, bottom: 2.5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: questionsController.attachments.length,
        itemBuilder: (context, index) {
          return Container(
            width: ScreenSize.width(context) * 0.125,
            decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0)),
            padding: const EdgeInsets.only(
                left: 5.0, right: 5.0, top: 2.5, bottom: 2.5),
            margin: const EdgeInsets.all(2.5),
            child: Row(
              children: [
                const Icon(
                  Icons.attach_file,
                  color: AppColor.blackMild,
                ),
                Text("${index + 1}"),
              ],
            ),
          );
        },
      ),
    );
  }

  ///RETURNS "*" IF THE QUESTION IS MANDATORY
  checkAndReturnMandatoryString() {
    switch (questionsController.questionsFlowMain.value) {
      case 0:
        Elements currentPersonalQuestion =
            questionsController.personalInfoQuestions![
                questionsController.currentPersonalQuestionIndex.value];
        if (currentPersonalQuestion.isMandatory == "true") {
          return "*";
        } else {
          return "";
        }

      case 1:
        Elements currentVitalsQuestion =
            questionsController.vitalsQuestionsList![
                questionsController.currentVitalsQuestionIndex.value];
        if (currentVitalsQuestion.isMandatory == "true") {
          return "*";
        } else {
          return "";
        }
      case 2:
        Elements currentFilteredQuestion =
            questionsController.filteredQuestionsList![
                questionsController.currentFilteredQuestionIndex.value];
        if (currentFilteredQuestion.isMandatory == "true") {
          return "*";
        } else {
          return "";
        }
      default:
        return "";
    }
  }
}

//ERROR PAGE - SHOWING UNABLE TO LOAD
class UnableToLoad extends StatelessWidget {
  const UnableToLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height(context) * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 50,
            color: AppColor.red,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 10),
            child: Text(
              'UNABLE TO LOAD',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColor.tertiaryColor),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () async {
              preConsultationController.updateLoadingStatusPermissionsPage();
              preConsultationController.updateLoadingStatusFaceDetectorPage();
              questionsController.updateLoadingStatusQuestions();

              await questionsController.resetAllQuestionsAndStatus(totalExit: false);
              await questionsController.getAllQuestions();
              Get.offAll(() => const PreConsultationModuleMain());
            },
            child: Container(
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 15.0, bottom: 15.0),
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(15.0)),
              child: const Text('RETRY'),
            ),
          ),
        ],
      ),
    );
  }
}

///MEDIA ACTION AND VIEW ROW WIDGET - START
/*  ///MEDIA INPUT ICON AND TEXT
  Widget mediaInputImageAndAction(
      {required BuildContext context,
      required IconData iconData,
      required String text,
      void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColor.white,
              child: IconButton(
                  color: AppColor.white,
                  onPressed: onTap,
                  icon: Icon(
                    iconData,
                    size: 25.0,
                    color: AppColor.primaryColor,
                  )),
            ),
            const SizedBox(
              height: 5.0,
            ),
            AutoSizeText(
              text,
              style: const TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            )
          ],
        ),
      ),
    );
  }*/
///MEDIA ACTION AND VIEW ROW WIDGET - END
