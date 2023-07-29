import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medongosupport/preConsultModule/controllers/attachmentsController.dart';
import 'package:medongosupport/preConsultModule/controllers/consultationDtoController.dart';
import 'package:medongosupport/preConsultModule/controllers/preConsultationController.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/models/consultationDtoNew.dart';
import 'package:medongosupport/preConsultModule/models/questionsModel.dart';
import 'package:medongosupport/preConsultModule/widgets/toastMessage.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:math' as math;


final PCUserController userController = Get.find<PCUserController>();

class PCUserController extends GetxController {
  PersonalQuestionsModel personalQuestionsModel = PersonalQuestionsModel(
      userFaceDetection: "",
      image: "",
      imageAwsPath: "",
      video: "",
      completeAudioRecording: "",
      fullName: "xxxxxxxx xxxxxxx",
      firstName: "xxxxxxx",
      lastName: "xxxxxxx",
      age: "00.00",
      dob: "",
      aadharNumber: "0000000000000",
      motherName: "xxxxxxxx",
      mobileNumber: "0000000000",
      gender: "xxxxxx",
      height: "000",
      weight: "00",
      address: "");

  ///UPDATES AUDIO FILES
  updateAudioFiles({String? completeAudioPath}) async {

    ///ADDS FILE TO _Documents folder
    // Get the app's external files directory
    Directory? appDir = await getExternalStorageDirectory();

    if (appDir == null) {
      throw PlatformException(code: 'DIR_ERROR', message: 'Failed to get the app directory.');
    }

    update();
  }

  ///CALCULATES DOB AND UPDATES STRING VALUE
  void calculateDOB(double combinedValue) {
    int years = combinedValue.floor();
    double remainingMonthsAndDays = (combinedValue - years) * 12;
    int months = remainingMonthsAndDays.floor();
    int days = ((remainingMonthsAndDays - months) * 30).round();

    DateTime currentDate = DateTime.now();

    ///Calculate the birth year and month
    int birthYear = currentDate.year - years;
    int birthMonth = currentDate.month - months;
    int birthDay = currentDate.day - days;

    ///Adjust the birth year and month if the current month is less than the birth month
    if (currentDate.month < birthMonth) {
      birthYear--;
      birthMonth = 12 - (birthMonth - currentDate.month).abs();
    }

    ///Create the DOB DateTime object
    DateTime dob = DateTime(birthYear, birthMonth, birthDay);

    ///Format the DOB in the Dec 18, 2009 12:00:00 AM format
    DateFormat dateFormat = DateFormat("MMM d, yyyy hh:mm:ss a");
    String formattedDOB = dateFormat.format(dob);

    personalQuestionsModel.dob = formattedDOB;

    update();
  }

  ///UPDATES USER PERSONAL DETAILS
  updateUserPersonalDetails({required String field, required String response}) {
    try {
     //print("THIS IS FIELD AND RESPONSE $field and $response");

      switch (field) {
        case "image":
          personalQuestionsModel.image = response;
          preConsultationController.imageForDisplayInTheDevice.value = response;
          update();
          break;
        case "video":
          personalQuestionsModel.video = response;
          break;
        case "First Name":
          personalQuestionsModel.firstName = response;
          break;
        case "Last Name":
          personalQuestionsModel.lastName = response;
          break;
        case "Age":
          personalQuestionsModel.age = response;
          calculateDOB(double.parse(response));
          break;
        case "Aadhar Number":
          personalQuestionsModel.aadharNumber = response;
          break;
        case "Mother's Name":
          personalQuestionsModel.motherName = response;
          break;
        case "Mobile Number":
          personalQuestionsModel.mobileNumber = response;
          break;
        case "Gender":
          personalQuestionsModel.gender = response;
          break;
        case "Height (in cm)":
          personalQuestionsModel.height = response;
          break;
        case "Weight (in kg)":
          personalQuestionsModel.weight = response;
          questionsController.closeKeyboard();
          break;
        case "Address":
          personalQuestionsModel.address = response;
          questionsController.closeKeyboard();
          break;
        default:
          break;
      }


    } catch (e) {
      print("THIS IS ERROR TWO $e");
    }

    update();
  }

  ///UPDATES FILTERED QUESTIONS DETAILS TO GET FOR PREVIOUS APPLICATION
  updateFilteredQuestionsDetails(
      {required String field, required String answer}) {
    String response = answer;

    try {
      switch (field) {
        case "Tobacco?":
          socialLife.tobacco = response;
          break;
        case "Smoking?":
          socialLife.smoking = response;
          break;
        case "Smoking Duration?":
          socialLife.smoking_historyduration = response;
          break;
        case "Chewing?":
          socialLife.chewing = response;
          break;
        case "Drugs?":
          socialLife.drugs = response;
          break;
        case "Drug intake duration?":
          socialLife.drugDuration = response;
          break;
        case "Chewing Duration?":
          socialLife.chewing_historyduration = response;
          break;
        case "Drinking?":
          socialLife.alchoholic = response;
          break;
        case "Drinking Duration?":
          socialLife.alchoholic_history_duration = response;
          break;
        case "Diabetes?":
          chronicalDisease.diabetic = response;
          break;
        case "Duration of diabetes?":
          chronicalDisease.diabeticDuration = response;
          break;
        case "History of diabetes in family?":
          chronicalDisease.diabeticInFamily = response;
          break;
        case "Who in family have diabetes?":
          chronicalDisease.diabeticFamilyList = response;
          break;
        case "Hypertension?":
          chronicalDisease.hypertensive = response;
          break;
        case "Duration of hypertension?":
          chronicalDisease.hypertenseDuration = response;
          break;
        case "History of Hypertension in family?":
          chronicalDisease.hypertensiveInFamilty = response;
          break;
        case "Who in family have Hypertension":
          chronicalDisease.hypertensiveFamilyList = response;
          break;
        case "CVD?":
          chronicalDisease.cvd = response;
          break;
        case "Duration of CVD?":
          chronicalDisease.cvdDuration = response;
          break;
        case "History of CVD in family?":
          chronicalDisease.cvdInFamily = response;
          break;
        case "Who in family have CVD?":
          chronicalDisease.cvdFamilyList = response;
          break;
        case "Nature of physical work?":
          consultation.natureOfPhyWork = response;
          break;
        case "Are you married?":
          patientData.maritalStatus = response;
          break;
        case "Any Clinical History?":
          chronicalDisease.otherClinicalHistory = response;
          break;
        case "Any families Medical History?":
          chronicalDisease.havingOtherCliHisInFamily = response;
          break;
        case "Deworming history?":
          chronicalDisease.deworming = response;
          break;
        case "Deworming from number of days?":
          chronicalDisease.dewormingDate = response;
          break;
        case "Any Allergy?":
          if(response!=""){
            List<String> splitValues = response.split("#");
            List<AllergyList> resultList = [];

            math.Random random = math.Random();

            for (String allergy in splitValues) {
             AllergyList entry = AllergyList.fromJson({
               "allergyName": allergy,
               "conceptId": random.nextInt(100000000).toString(), // Generate a random number
               "isEnabled": false,
               "position": 0,
             });

              resultList.add(entry);
            }

            ///LIST OF MAPS OF ALLERGY LIST
            consultation.allergyList = resultList;
            ///LIST OF DATA SEPARATED BY ","
            chronicalDisease.allergy = response.replaceAll("#", ",");
          }else{
            consultation.allergyList = [];
            chronicalDisease.allergy = "";
          }
          break;
        case "Oral Cancer Screening done?":
          screeningHistory.oralCancerScreening = response;
          break;
        case "Oral Cancer Findings?":
          screeningHistory.oralCancerfindings = response;
          break;
        case "Vision Screening done?":
          screeningHistory.visionScreening = response;
          break;
      case "Vision Screening Findings?":

        break;

        case "Cataract":
          screeningHistory.cataract = response;
          break;
        case "Vitamin A Deficiency":
          screeningHistory.vad = response;
          break;


        case "Color Blindness":
          screeningHistory.colorBilndness = response;
          break;
        case "Distance":
          screeningHistory.distanceVision = response;
          break;

        case "Right Eye (Distance)":
          screeningHistory.rightEyeDistancePower = response;
          break;
        case "Left Eye (Distance)":
          screeningHistory.leftEyeDistancePower = response;
          break;
        case "Near":
          screeningHistory.nearVision = response;
          break;

        case "Right Eye (Near)":
          screeningHistory.rightEyeNearPower = response;
          break;

        case "Left Eye (Near)":
          screeningHistory.leftEyeNearPower = response;
          break;

        case "Anemia Assessment done?":
          anemiaData.anemiaFollowup = response == "yes" ? true : false;
          break;
        case "Visit Number?":
          anemiaData.anemiaVisitNo = response;
          break;
        case "IFA Provided?":
          anemiaData.ifaProvided = response;
          break;
        case "Quantity of IFA?":
          anemiaData.ifaProvidedQty = response;
          break;
        case "Nutritional Counselling provided?":
          anemiaData.nutritionalCounselling = response;
          break;
        case "Head Circumference?":
          vitalsData.headCircumference = response;
          break;
        case "Mid Upper Arm Circumference (MUAC)?":
          vitalsData.muac = response;
          break;
        case "Which of the child immunization is/are missed?":
          consultation.immunizationList = ImmunizationList();
          break;
        case "Nutritional Assessment of child":
          anemiaData.nutritionalCounselling = response;
          break;
        case "Pregnancy?":
          consultation.pregnancy = response == "yes" ? true : false;
          break;
        case "Number of Kids?":
          consultation.numOfDeliveries = response;
          break;

        case "LMP":
          consultation.lmp = response;
          break;
        case "Last Delivery Date?":
          consultation.lastDeliverydate = response;
          break;

        case "Miscarriages?":
          consultation.miscarriages = response;
          break;
        case "Termination?":
          consultation.termination = response;
          break;
        case "No. of Pregnancy?":
          consultation.numOfPregnancy = response;
          break;
        case "No. of still Births?":
          consultation.numOfStillbirths = response;
          break;

        /// TODO UPDATE ALL THE LIST
        case "ANC Visit Date":
          break;
        case "Visit Number":
          chronicalDisease.visitNumber = response;
          break;
        case "Number of weeks":
          ancDataList.weeks = int.tryParse(response) ?? 0;
          break;
        case "Trimester":
          consultation.trimester = response;
          break;
        case "ANC Registration":
          ancDataList.ancRegistration = response;
          break;
        case "Select Date":
          ancDataList.ancRegisteredDate = DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now());
          break;
        case "Place of Registration":
          ancDataList.ancRegisteredPlace = response;
          break;
        case "High Risk":
          ancDataList.highRisk = response;
          break;
        case "Type your Risk":
          ancDataList.highRiskType = response;
          break;
        case "Place":
          ancDataList.placeOfDelivery = response;
          break;
        case "Urine Protein":
          ancDataList.urineProteins = response;
          break;
        case "FHR":
          ancDataList.fhr = response;
          break;
        case "Folic Acid":
          ancDataList.folicAcidGiven = response;
          break;
        case "IFA":
          ancDataList.ifaGiven = response;
          break;
        case "Calcium":
          ancDataList.calciumGiven = response;
          break;
        case "Danger Sign":
          ancDataList.dangerSigns = response;
          break;
        case "Details":
          ancDataList.dangersignDetails = response;
          break;
        case "Counselling":
          ancDataList.ancCounselling = response;
          break;

        case "Type of Counselling":
          ancDataList.ancCounselingType = response;
          break;
        case "TT 1(Date)":
          ancDataList.tt1Date = response;
          break;
        case "TT 2(Date)":
          ancDataList.tt2Date = response;
          break;
        case "TT Booster(Date)":
          ancDataList.ttBoosterDate = response;
          break;
        case "Last Delivery Date":
          ancDataList.deliveryDate = response;
          break;
        case "Cervical Cancer Screening done?":
          screeningHistory.cervicalCancerScreening = response;
          break;
        case "Cervical Cancer Screening findings?":
          screeningHistory.cervicalCancerFindings = response;
          break;
        case "Breast Cancer Screening done?":
          screeningHistory.breastCancerScreening = response;
          break;
        case "Breast Cancer Screening findings?":
          screeningHistory.breastCancerFindings = response;
          break;
        case "Oral Cancer Screening done?":
          screeningHistory.oralCancerScreening = response;
          break;
        case "Oral Cancer Findings?":
          screeningHistory.oralCancerfindings = response;
          break;

        case "Referral or not?":
          break;
        case "Referred for Lab tests?":
          break;
        case "Referred for Lab Test from which Clinic?":
          break;
        case "Name of the test you want":
          break;
        case "Referred for Medicines?":
          break;
        case "Referred for medicines from which clinic?":
          break;
        case "Referred for Consultation?":
          break;
        case "Referred for Consultation from which Clinic?":
          break;
        case "Referred for any other reason?":
          break;
        case "Whats the reason for referral":
          break;
        case "Which Clinic referred you here?":
          break;

        case "":
          break;

        default:
          break;
      }
    } catch (error) {
      showToast("$error", ToastGravity.CENTER);
      print("THIS IS ERROR IN ADDING FILTERED QUESTIONS ANSWERS $error");
    }

    update();
  }



  Consultation consultation = Consultation();


  ///UPDATES FILTERED QUESTIONS DETAILS TO GET FOR PREVIOUS APPLICATION
  updateFilteredQuestionsDetailsForFollowUp(
      {required String field, required String answer}) {
    String response = answer;

    try {
      switch (field) {
        case "Tobacco?":
          consultation.socialLife?.tobacco = response;
          break;
        case "Smoking?":
          consultation.socialLife?.smoking = response;
          break;
        case "Smoking Duration?":
          consultation.socialLife?.smokingHistoryduration = response;
          break;
        case "Chewing?":


          consultation.socialLife?.chewing = response;


          break;
        case "Drugs?":

          consultation.socialLife?.drugs = response;


          break;
        case "Drug intake duration?":

          consultation.socialLife?.drugDuration = response;
          break;
        case "Chewing Duration?":
          consultation.socialLife?.chewingHistoryduration = response;
          break;
        case "Drinking?":
          consultation.socialLife?.alchoholic = response;
          break;
        case "Drinking Duration?":
          consultation.socialLife?.alchoholicHistoryDuration= response;
          break;
        case "Diabetes?":
          consultation.chronicalDisease?.diabetic; response;
          break;
        case "Duration of diabetes?":
          consultation.chronicalDisease?.diabeticDuration; response;
          break;
        case "History of diabetes in family?":
          consultation.chronicalDisease?.diabeticInFamily; response;
          break;
        case "Who in family have diabetes?":
          consultation.chronicalDisease?.diabeticFamilyList; response;
          break;
        case "Hypertension?":
          consultation.chronicalDisease?.hypertensive; response;
          break;
        case "Duration of hypertension?":
          consultation.chronicalDisease?.hypertenseDuration; response;
          break;
        case "History of Hypertension in family?":
          consultation.chronicalDisease?.hypertensiveInFamilty; response;
          break;
        case "Who in family have Hypertension":
          consultation.chronicalDisease?.hypertensiveFamilyList; response;
          break;
        case "CVD?":
          consultation.chronicalDisease?.cvd; response;
          break;
        case "Duration of CVD?":
          consultation.chronicalDisease?.cvdDuration; response;
          break;
        case "History of CVD in family?":
          consultation.chronicalDisease?.cvdInFamily; response;
          break;
        case "Who in family have CVD?":
          consultation.chronicalDisease?.cvdFamilyList; response;
          break;
        case "Nature of physical work?":
          consultation.natureOfPhyWork = response;
          break;
        case "Are you married?":
          patientData.maritalStatus = response;
          consultation.patientData?.maritalStatus = response;
          break;
        case "Any Clinical History?":
          consultation.chronicalDisease?.otherClinicalHistory; response;
          break;
        case "Any families Medical History?":
          consultation.chronicalDisease?.havingOtherCliHisInFamily ; response;
          break;
        case "Deworming history?":
          chronicalDisease.deworming = response;
          consultation.chronicalDisease?.deworming  = response == "yes" ? true : false;

          break;
        case "Deworming from number of days?":
          chronicalDisease.dewormingDate = response;
          consultation.chronicalDisease?.dewormingDate; response;
          break;
        case "Any Allergy?":
          if(response!=""){
            List<String> splitValues = response.split("#");
            List<AllergyList> resultList = [];

            math.Random random = math.Random();

            for (String allergy in splitValues) {
              AllergyList entry = AllergyList.fromJson(
                  {
                    "allergyName": allergy,
                    "conceptId": random.nextInt(100000000).toString(), // Generate a random number
                    "isEnabled": false,
                    "position": 0,
                  }
              );




              resultList.add(entry);
            }

            ///LIST OF MAPS OF ALLERGY LIST
            consultation.allergyList = resultList;
            ///LIST OF DATA SEPARATED BY ","
            consultation.chronicalDisease?.allergyField = response.replaceAll("#", ",");
          }else{
            consultation.allergyList = [];
            consultation.chronicalDisease?.allergyField = "";
          }
          break;
        case "Oral Cancer Screening done?":
          consultation.screeningHistory?.oralCancerScreening; response;
          break;
        case "Oral Cancer Findings?":
          consultation.screeningHistory?.oralCancerfindings ; response;
          break;
        case "Vision Screening done?":
          screeningHistory.visionScreening = response;
          consultation.screeningHistory?.visionScreening ; response;
          break;
      case "Vision Screening Findings?":

        break;

        case "Cataract":
          consultation.screeningHistory?.cataract; response;
          break;
        case "Vitamin A Deficiency":
          consultation.screeningHistory?.vad; response;
          break;


        case "Color Blindness":
          consultation.screeningHistory?.colorBilndness; response;
          break;
        case "Distance":
          consultation.screeningHistory?.distanceVision; response;
          break;

        case "Right Eye (Distance)":
          screeningHistory.rightEyeDistancePower = response;
          consultation.screeningHistory?.reDv; response;
          break;
        case "Left Eye (Distance)":
      consultation.screeningHistory?.leDv = response;
          break;
        case "Near":
          consultation.screeningHistory?.nearVision= response;
          break;

        case "Right Eye (Near)":
          consultation.screeningHistory?.reNv = response;
          break;

        case "Left Eye (Near)":
          consultation.screeningHistory?.leNv = response;
          break;

        case "Anemia Assessment done?":
          //anemiaData.anemiaFollowup = response == "yes" ? true : false;
          consultation.anemiaData?.anemiaFollowup= response.toString().toUpperCase();
          break;
        case "Visit Number?":
          anemiaData.anemiaVisitNo = response;
          consultation.anemiaData!.anemiaVisitNo = response;
          break;
        case "IFA Provided?":
          anemiaData.ifaProvided = response;
          break;
        case "Quantity of IFA?":
          anemiaData.ifaProvidedQty = response;
          break;
        case "Nutritional Counselling provided?":
          anemiaData.nutritionalCounselling = response;
          break;
        case "Head Circumference?":
          vitalsData.headCircumference = response;
          break;
        case "Mid Upper Arm Circumference (MUAC)?":
          vitalsData.muac = response;
          break;
        case "Which of the child immunization is/are missed?":
          consultation.immunizationList = ImmunizationList();
          break;
        case "Nutritional Assessment of child":
          anemiaData.nutritionalCounselling = response;
          break;
        case "Pregnancy?":
          consultation.pregnancy = response == "yes" ? true : false;
          break;
        case "Number of Kids?":
          consultation.numOfDeliveries = response;
          break;

        case "LMP":
          consultation.lmp= response;
          break;
        case "Last Delivery Date?":
          consultation.lastDeliverydate = response;
          break;

        case "Miscarriages?":
          consultation.miscarriages = response;
          break;
        case "Termination?":
          consultation.termination = response;
          break;
        case "No. of Pregnancy?":
          consultation.numOfPregnancy = response;
          break;
        case "No. of still Births?":
          consultation.numOfStillbirths = response;
          break;

        /// TODO UPDATE ALL THE LIST
        case "ANC Visit Date":
          break;
        case "Visit Number":
          chronicalDisease.visitNumber = response;
          consultation.chronicalDisease!.visitNumber = int.tryParse(response) ?? 0;
          break;
        case "Number of weeks":
          ancDataList.weeks = int.tryParse(response) ?? 0;
          break;
        case "Trimester":
          consultation.trimester = response;
          break;
        case "ANC Registration":
          consultation.ancDataList!.ancRegistration = response;
          break;
        case "Select Date":
          consultation.ancDataList!.ancRegisteredDate = response;
          break;
        case "Place of Registration":
          consultation.ancDataList!.ancRegisteredDate = response;
          break;
        case "High Risk":
          consultation.ancDataList!.highRisk = response;

          break;
        case "Type your Risk":
          consultation.ancDataList!.highRiskType= response;

          break;
        case "Place":
          consultation.ancDataList!.placeOfDelivery= response;
          break;
        case "Urine Protein":
          consultation.ancDataList!.placeOfDelivery= response;
          break;
        case "FHR":
          consultation.ancDataList!.fhr= response;
          break;
        case "Folic Acid":
          consultation.ancDataList!.folicAcidGiven= response;

          break;
        case "IFA":
          consultation.ancDataList!.ifaGiven= response;
          break;
        case "Calcium":
          consultation.ancDataList!.calciumGiven= response;
          break;
        case "Danger Sign":
          consultation.ancDataList!.dangerSigns= response;
          break;
        case "Details":
          consultation.ancDataList!.dangersignDetails= response;
          break;
        case "Counselling":
          consultation.ancDataList!.ancCounselling= response;

          break;

        case "Type of Counselling":
          consultation.ancDataList!.ancCounselingType= response;
          break;
        case "TT 1(Date)":
          consultation.ancDataList!.tt1Date= response;
          break;
        case "TT 2(Date)":
          consultation.ancDataList!.tt2Date= response;
          break;
        case "TT Booster(Date)":
          consultation.ancDataList!.ttBoosterDate= response;
          break;
        case "Last Delivery Date":
          consultation.ancDataList!.deliveryDate= response;
          break;
        case "Cervical Cancer Screening done?":
          consultation.screeningHistory!.cervicalCancerScreening= response;
          break;
        case "Cervical Cancer Screening findings?":
          consultation.screeningHistory!.cervicalCancerScreening= response;
          break;
        case "Breast Cancer Screening done?":
          consultation.screeningHistory!.cervicalCancerScreening= response;
          break;
        case "Breast Cancer Screening findings?":
          consultation.screeningHistory!.cervicalCancerScreening= response;
          break;
        case "Oral Cancer Screening done?":
          consultation.screeningHistory!.cervicalCancerScreening= response;
          break;
        case "Oral Cancer Findings?":
          consultation.screeningHistory!.cervicalCancerScreening= response;
          break;

        case "Referral or not?":
          break;
        case "Referred for Lab tests?":
          break;
        case "Referred for Lab Test from which Clinic?":
          break;
        case "Name of the test you want":
          break;
        case "Referred for Medicines?":
          break;
        case "Referred for medicines from which clinic?":
          break;
        case "Referred for Consultation?":
          break;
        case "Referred for Consultation from which Clinic?":
          break;
        case "Referred for any other reason?":
          break;
        case "Whats the reason for referral":
          break;
        case "Which Clinic referred you here?":
          break;

        case "":
          break;

        default:
          break;
      }
    } catch (error) {
      showToast("$error", ToastGravity.CENTER);
      print("THIS IS ERROR IN ADDING FILTERED QUESTIONS ANSWERS $error");
    }

    update();
  }


}



/*

///UPDATES FILTERED QUESTIONS DETAILS TO GET FOR PREVIOUS APPLICATION
updateFilteredQuestionsDetails(
    {required String field, required String response}) {
  //showToast("this is tobacco $field $response", ToastGravity.TOP);
  //print("THIS IS TEST $field $response");

  try {
    switch (field) {
      case "Tobacco?":
        socialLife.tobacco = response;
        print("THIS IS TOBACCO $response");
        break;
      case "Smoking?":
        socialLife.smoking = response;
        break;
      case "Smoking Duration?":
        socialLife.smoking_historyduration = response;
        break;
      case "Chewing?":
        socialLife.chewing = response;
        break;
      case "Chewing Duration?":
        socialLife.chewing_historyduration = response;
        break;
      case "Drinking?":
        socialLife.alchoholic = response;
        //showToast("THIS IS UPDATED ${ socialLife.alchoholic}", ToastGravity.CENTER);

        break;
      case "Drinking Duration?":
        socialLife.alchoholic_history_duration = response;
        //showToast("THIS IS UPDATED ${ socialLife.alchoholic_history_duration}", ToastGravity.CENTER);

        break;
      // case "Drugs?":
      // case "Drug intake duration?":
      case "Diabetes?":
        chronicalDisease.diabetic = response;
        break;
      case "Duration of diabetes?":
        chronicalDisease.diabeticDuration = response;
        break;
      case "History of diabetes in family?":
        chronicalDisease.diabeticInFamily = response;
        break;
      case "Who in family have diabetes?":
        chronicalDisease.diabeticFamilyList = response;
        break;
      case "Hypertension?":
        chronicalDisease.hypertensive = response;
        break;
      case "Duration of hypertension?":
        chronicalDisease.hypertenseDuration = response;
        break;
      case "History of Hypertension in family?":
        chronicalDisease.hypertensiveInFamilty = response;
        break;
      case "Who in family have Hypertension":
        chronicalDisease.hypertensiveFamilyList = response;
        break;
      case "CVD?":
        chronicalDisease.cvd = response;
        break;
      case "Duration of CVD?":
        chronicalDisease.cvdDuration = response;
        break;
      case "History of CVD in family?":
        chronicalDisease.cvdInFamily = response;
        break;
      case "Who in family have CVD?":
        chronicalDisease.cvdFamilyList = response;
        break;
      case "Nature of physical work?":
        consultation.natureOfPhyWork = response;
        break;
      case "Are you married?":
        patientData.maritalStatus = response;
        break;
      case "Any Clinical History?":
        chronicalDisease.otherClinicalHistory = response;
        break;
      case "Any families Medical History?":
        chronicalDisease.havingOtherCliHisInFamily = response;
        break;
      case "Deworming history?":
        chronicalDisease.deworming = response;
        break;
      case "Deworming from number of days?":
        chronicalDisease.dewormingDate = response;
        break;
      case "Any Allergy?":
        chronicalDisease.allergy = response;
        break;
      case "Oral Cancer Screening done?":
        screeningHistory.oralCancerScreening = response;
        break;
      case "Oral Cancer Findings?":
        screeningHistory.oralCancerfindings = response;
        break;
      case "Vision Screening done?":
        screeningHistory.visionScreening = response;
        break;
      // case "Vision Screening Findings?":
      //
      //   break;
      case "Anemia Assessment done?":
        anemiaData.anemiaFollowup = response == "Yes" ? true : false;
        break;
      case "Visit Number?":
        anemiaData.anemiaVisitNo = response;
        break;
      case "IFA Provided?":
        anemiaData.ifaProvided = response;
        break;
      case "Quantity of IFA?":
        anemiaData.ifaProvidedQty = response;
        break;

      case "Nutritional Counselling provided?":
        anemiaData.nutritionalCounselling = response;
        break;

      ///Unique ones in neonatal flow
      case "Head Circumference?":
        vitalsData.headCircumference = response;
        break;

      case "Mid Upper Arm Circumference (MUAC)?":
        vitalsData.muac = response;
        break;
      // case "Have your child received all of his recommended immunizations?":
      //
      //   break;
      case "Which of the child immunization is/are missed?":

        ///TODO ADD MULTIPLE CHOICE IN LIST OF IMMUNIZATIONS
        consultation.immunizationList = {};
        break;
      // case "Place of screening?":
      //
      //   break;
      // case "Any Counselling done?":
      //
      //   break;
      // case "Type of Counselling?":
      //
      //   break;
      case "Nutritional Assessment of child":
        anemiaData.nutritionalCounselling = response;
        break;

      ///Referral Questions
      // case "Referral or not?":
      //
      //   break;
      // case "Referred for Lab tests?":
      //
      //   break;
      // case "Referred for Lab Test from which Clinic?":
      //
      //   break;
      // case "Name of the test you want":
      //
      //   break;
      // case "Referred for Medicines?":
      //
      //   break;
      // case "Referred for medicines from which clinic?":
      //
      //   break;
      // case "Referred for Consultation?":
      //
      //   break;
      // case "Referred for Consultation from which Clinic?":
      //
      //   break;
      // case "Referred for any other reason?":
      //
      //   break;
      // case "Whats the reason for referral":
      //
      //   break;
      // case "Which Clinic referred you here?":
      //
      //   break;

      ///Female Screening and unique questions
      case "Pregnancy?":
        consultation.pregnancy = response == "Yes" ? true : false;
        break;
      // case "Last Delivery Date?":
      //
      //   break;
      case "Number of Kids?":
        consultation.numOfDeliveries = response;
        break;
      case "Miscarriages?":
        consultation.miscarriages = response;
        break;
      case "Termination?":
        consultation.termination = response;
        break;
      case "No. of Pregnancy?":
        consultation.numOfPregnancy = response;
        break;
      case "No. of still Births?":
        consultation.numOfStillbirths = response;
        break;

      // case "Breast Cancer Screening done?":
      //
      //   break;
      // case "Breast Cancer Screening findings?":
      //
      //   break;
      // case "Cervical Cancer Screening done?":
      //
      //   break;
      // case "Cervical Cancer Screening findings?":
      //
      //   break;

      default:
        break;
      //showToast("INVALID TYPE", ToastGravity.CENTER);
    }
  } catch (error) {
    showToast("$error", ToastGravity.CENTER);
    print("THIS IS ERROR IN ADDING FILTERED QUESTIONS ANSWERS $error");
  }

  update();
}
*/
