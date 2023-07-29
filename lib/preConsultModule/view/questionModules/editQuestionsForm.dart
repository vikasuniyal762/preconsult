import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medongosupport/preConsultModule/consts/appColors.dart';
import 'package:medongosupport/preConsultModule/consts/screenSize.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/models/questionsModel.dart';
import 'package:medongosupport/preConsultModule/view/questionModules/questionsScreen.dart';
import 'package:medongosupport/preConsultModule/widgets/appBars.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medongosupport/preConsultModule/controllers/attachmentsController.dart';
import 'package:intl/intl.dart';
import 'package:medongosupport/preConsultModule/widgets/bottomSheet.dart';
import 'package:medongosupport/preConsultModule/widgets/titleTextField.dart';
import 'package:medongosupport/preConsultModule/widgets/toastMessage.dart';

class EditQuestionsSheet extends StatefulWidget {
  EditQuestionsSheet(
      {Key? key,
      required this.elements,
      this.category,
      this.tag,
      this.categoryStatus})
      : super(key: key);
  List<Elements>? elements;
  String? category;
  String? tag;
  int? categoryStatus;

  @override
  State<EditQuestionsSheet> createState() => _EditQuestionsSheetState();
}

class _EditQuestionsSheetState extends State<EditQuestionsSheet> {

  ///INITIALIZE DATA
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ///PORTRAIT ORIENTATION ONLY
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp
      ]);
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() => questionsController.dummyBool.value
        ? GetBuilder(
          init: PCQuestionsController(),
          builder: (_){
            return SafeArea(
              child: Scaffold(
                appBar: titleAppBar(
                  context: context,
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: ScreenSize.height(context) * 0.025,
                    ),
                  ),
                  title: widget.tag == null
                      ? "Edit Questions"
                      : "Edit ${widget.tag} Questions",
                ),
                body: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.elements?.length ?? 0,
                  itemBuilder: (context, index) {
                    Elements? element = widget.elements?[index];

                    return element?.text == "SUBMIT"
                        ? Container(height: 1)
                        : widget.category == null ? AnswerCard(
                        currentElement: element!,
                        onPressed: () {


                          if (element?.text == "Age") {
                            showToast(
                                "You can not edit Age", ToastGravity.CENTER);
                            return;
                          }

                          if (element?.text == "Gender") {
                            showToast("You can not edit Gender",
                                ToastGravity.CENTER);
                            return;
                          }

                          questionsController.preLoadAnswersForEditing(currentElement: element);

                          ///QUESTION AND INPUT MODE WIDGETS
                          showModalBottomSheet(
                              context: context,
                              enableDrag: true,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  )),
                              builder: (context) {
                                return EditSingleQuestionUI(element: element,categoryStatus: widget.categoryStatus);
                              });
                        }) :
                    element?.selectedGroup == widget.category ?
                    AnswerCard(
                        currentElement: element!,
                        onPressed: () {
                          if (element?.text == "Age") {
                            showToast(
                                "You can not edit Age", ToastGravity.CENTER);
                            return;
                          }

                          if (element?.text == "Gender") {
                            showToast("You can not edit Gender",
                                ToastGravity.CENTER);
                            return;
                          }

                          questionsController.preLoadAnswersForEditing(
                              currentElement: element);

                          ///QUESTION AND INPUT MODE WIDGETS
                          showModalBottomSheet(
                              context: context,
                              enableDrag: true,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  )),
                              builder: (context) {
                                return EditSingleQuestionUI(element: element,categoryStatus: widget.categoryStatus);
                              });
                        }) : Container(height: 1);
                  },
                ),
              ),
            );
          }
        )
        : Container(
            height: 1,
          ));
  }
}




///ANSWER CARD UI
class AnswerCard extends StatefulWidget {
  final Elements currentElement;
  final VoidCallback onPressed;

  const AnswerCard({
    Key? key,
    required this.currentElement,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<AnswerCard> createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => questionsController.dummyBool.value ?  Padding(
      padding: const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 8.0, right: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: AutoSizeText(
              '${widget.currentElement.text}${checkAndReturnMandatoryStringCustom(isMandatory: widget.currentElement.isMandatory)}',
              textAlign: TextAlign.left,
              maxLines: 2,
              minFontSize: 12.0,
              maxFontSize: 32.0,
              style: const TextStyle(
                color: AppColor.blackMild,
                fontSize: 16.0,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child:  loadsReturnTypeWidgetForAnswers(),
            ),

            trailing: IconButton(
              icon: Icon(Icons.edit, color: widget.currentElement.text == "Age" && widget.currentElement.text == "Gender" ? AppColor.grey : AppColor.black),
              onPressed: widget.onPressed,
            ),
          ),
        ),
      ),
    ) : Container(height: 0.01,));
  }

  ///LOAD ANSWER WIDGETS
  loadsReturnTypeWidgetForAnswers() {
    switch (widget.currentElement.selectedMode) {
      case "text":
      case "duration":
      case "options":
      case "multiOptions":
        String finalValue = "";
        ///CHECKS AND UPDATES THE VALUES
        if (widget.currentElement.answer != null && widget.currentElement.answer != "") {
          finalValue = widget.currentElement.answer!;
        }

        return AutoSizeText(
          finalValue,
          minFontSize: 10.0,
          maxFontSize: 24.0,
          textAlign: TextAlign.left,
          maxLines: 2,
          style: const TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: AppColor.black),
        );


      case "numeric":
        String finalValue = "";
        ///CHECKS AND UPDATES THE VALUES
        if (widget.currentElement.answer != null && widget.currentElement.answer != "") {
          if (widget.currentElement.text == "Age") {
            finalValue =
            "${double.parse(widget.currentElement.answer!).toInt() ?? ""} Y ${((double.parse(widget.currentElement.answer!) - double.parse(widget.currentElement.answer!).toInt()) * 12).round()} M ${((double.parse(widget.currentElement.answer!) -
                double.parse(widget.currentElement.answer!).toInt()) * 365).round()} D";
          } else {
            finalValue = widget.currentElement.answer!;
          }
        }

        return AutoSizeText(
          finalValue,
          minFontSize: 10.0,
          maxFontSize: 24.0,
          textAlign: TextAlign.left,
          style: const TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: AppColor.black),
        );


      case "date":
        String finalValue = "";
        ///CHECKS AND UPDATES THE VALUES
        if (widget.currentElement.answer != null && widget.currentElement.answer != "") {
          finalValue = "${double.parse(widget.currentElement.answer!).toInt() ?? ""} Y ${((double.parse(widget.currentElement.answer!) - double.parse(widget.currentElement.answer!).toInt()) * 12).round()} M";
        }

        return AutoSizeText(
          finalValue,
          minFontSize: 10.0,
          maxFontSize: 24.0,
          textAlign: TextAlign.left,
          style: const TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: AppColor.black),
        );


      case "dateTime":

      ///ASSIGNING BY DEFAULT
        final defaultDateString = DateFormat('MMM dd, yyyy hh:mm:ss a').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0));
        return AutoSizeText(
          widget.currentElement.answer ?? defaultDateString,
          minFontSize: 10.0,
          maxFontSize: 24.0,
          textAlign: TextAlign.left,
          style: const TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: AppColor.black),
        );


      default:
        String finalValue = "";
        ///CHECKS AND UPDATES THE VALUES
        if (widget.currentElement.answer != null && widget.currentElement.answer != "") {
          finalValue = widget.currentElement.answer!;
        }

        return AutoSizeText(
          finalValue,
          minFontSize: 10.0,
          maxFontSize: 24.0,
          textAlign: TextAlign.left,
          style: const TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: AppColor.black),
        );
    }
  }

  ///RETURNS "*" IF THE QUESTION IS MANDATORY CUSTOM
  checkAndReturnMandatoryStringCustom({required String isMandatory}) {
    if (isMandatory == "true") {
      return "*";
    } else {
      return "";
    }
  }
}




///EDIT SINGLE QUESTION UI AND FUNCTIONALITY
class EditSingleQuestionUI extends StatefulWidget {
  EditSingleQuestionUI({super.key, required this.element, this.categoryStatus});

  final Elements element;
  int? categoryStatus;

  @override
  State<EditSingleQuestionUI> createState() => _EditSingleQuestionUIState();
}

class _EditSingleQuestionUIState extends State<EditSingleQuestionUI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //height: ScreenSize.height(context) * 0.5,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ///QUESTIONS LIST
              Container(
                color: AppColor.transparent,
                height: ScreenSize.height(context) *
                    0.15,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      renderQuestionsListUI(
                          currentElement: widget.element!),
                    ],
                  ),
                ),
              ),

              renderInputModeWidgetUI(
                  currentElement: widget.element!),

              const SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),

        bottomNavigationBar: submitAndCancelButton(
            context: context, element: widget.element),
      ),
    );
  }



  ///RENDERS QUESTIONS LIST - DONE
  renderQuestionsListUI({required Elements currentElement}) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          right: 10,
          left: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 4.0,
              child: Container(
                width: ScreenSize.width(context) * 0.95,
                height: ScreenSize.height(context) * 0.06,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.only(
                    top: ScreenSize.width(context) * 0.025,
                    bottom: ScreenSize.width(context) * 0.01,
                    left: ScreenSize.width(context) * 0.04,
                    right: ScreenSize.width(context) * 0.04),
                child: AutoSizeText(
                  '${currentElement.text}${checkAndReturnMandatoryStringCustom(isMandatory: currentElement.isMandatory)}',
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  minFontSize: 12.0,
                  maxFontSize: 32.0,
                  style: const TextStyle(color: AppColor.black, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ));
  }

  ///RENDERS INPUT MODE WIDGETS - UI MAIN - DONE
  renderInputModeWidgetUI({required Elements currentElement}) {
    try {
      return SizedBox(
        width: ScreenSize.width(context) * 0.95,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                    flex: 9, child: inputModeWidget(elements: currentElement)),

                ///ATTACH BUTTON
                //Flexible(flex: 1, child: attachButton(context: context)),
              ],
            ),
          ],
        ),
      );
    } catch (error) {
      return Container(height: 1);
    }
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
                            questionsController.selectedDateDob = pickedDate;
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
                        if(widget.element.text == "ANC Visit Date"){
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

                        setState(() {
                          questionsController.optionsChoiceIndex.value = val!;
                        });

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
              physics: const BouncingScrollPhysics(),
              itemCount: questionsController.multiOptionsStringList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "${questionsController.multiOptionsStringList[index]}",
                            style: const TextStyle(fontSize: 16),
                          ),
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

  ///SEND BUTTON
  Widget submitAndCancelButton(
      {required BuildContext context, required Elements element}) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //CANCEL BUTTON
          GestureDetector(
            onTap: () async {
              Get.back();
            },
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                  width: ScreenSize.width(context) * 0.3,
                  height: ScreenSize.height(context) * 0.075,
                  decoration: BoxDecoration(
                    color: AppColor.tertiaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                      child: AutoSizeText("CANCEL",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: AppColor.blackMild)))),
            ),
          ),

          //SUBMIT BUTTON
          GestureDetector(
            onTap: () async {
              switch (widget.categoryStatus) {
                case 0:
                  questionsController.submitButtonActionsForPersonalQuestions(isNew: false, updatedElement: element);
                  break;
                case 1:
                  questionsController.submitButtonActionsForVitalsQuestions(isNew: false, updatedElement: element);
                  break;
                case 2:
                  questionsController.submitButtonActionsForFilteredQuestions(isNew: false, updatedElement: element);
                  break;
                default:
                  break;
              }
            },
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                  width: ScreenSize.width(context) * 0.3,
                  height: ScreenSize.height(context) * 0.075,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                      child: AutoSizeText(
                        "SUBMIT",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: AppColor.blackMild),
                      ))),
            ),
          )
        ],
      ),
    );
  }

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


  ///RETURNS "*" IF THE QUESTION IS MANDATORY CUSTOM
  checkAndReturnMandatoryStringCustom({required String isMandatory}) {
    if (isMandatory == "true") {
      return "*";
    } else {
      return "";
    }
  }

}
