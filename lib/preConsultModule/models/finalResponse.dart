import 'dart:convert';

import 'package:medongosupport/preConsultModule/controllers/attachmentsController.dart';
import 'package:medongosupport/preConsultModule/controllers/consultationDtoController.dart';
import 'package:medongosupport/preConsultModule/controllers/locationController.dart';
import 'package:medongosupport/preConsultModule/controllers/preConsultationController.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/controllers/userController.dart';
import 'package:medongosupport/preConsultModule/controllers/vitalsController.dart';
import 'package:intl/intl.dart';

//
var finalResponse = {
  "ActualConsult": false,
  "accountBillingInfo": [],
  "admitStatus": false,
  "allergy": "YES".toUpperCase(),

  "allergyList": consultation.allergy,

  "ancDataList": {
    "abdomenExamDone": "NO",
    "ancCounselingType": ancDataList.ancCounselingType.toString(),
    "ancCounselling": ancDataList.ancCounselingType,
    "ancPlaceOrBy": ancDataList.placeOfDelivery,
    "ancRegisteredDate": consultation.pregnancy == true
        ? DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now())
        : null,
    "ancRegisteredPlace": ancDataList.ancRegisteredPlace.toString(),
    "ancRegistration": ancDataList.ancRegistration.toString().toUpperCase(),
    "ancVisible": false,
    "availedFamilyPlanningServices": "YES",
    "awreOfDangerSigns": ancDataList.dangersignDetails.toString(),
    // "birthPrepardnessPlan": "YES",
    // "breastfedAnHour": "YES",
    // "calciumConsumed": "YES",
    "calciumGiven": ancDataList.calciumGiven.toString(),
    "calciumVisible": false,
    "childComplicationType": "",
    "childComplications": "",
    "childGender": "",
    "childName": "",
    "childWeight": 0,
    "childuniqueID": "",
    "congenitalAnomaly": "NO",
    "cryAfterBirth": "NO",
    "dangerSigns": ancDataList.dangerSigns.toString(),
    "dangersignDetails": "",
    "deliveryDate": ancDataList.deliveryDate == ""
        ? null
        : ancDataList.deliveryDate.toString(),
    "deliveryPncVisible": true,
    "deliverybagPrepared": "NO",
    "deworming": chronicalDisease.deworming,
    "fConsumedVisble": false,
    "familyPlanningServiceTypes": "",
    "fhr": ancDataList.fhr.toString(),
    "folicAcidConsumed": "NO",
    "folicAcidGiven": ancDataList.folicAcidGiven.toString(),
    "followUpPatientCount": 1,
    "fundalHeight": "0.0",
    "haveEssentialContactNo": "YES",
    "highRisk": ancDataList.highRisk.toString(),
    "highRiskType": ancDataList.highRiskType.toString(),
    "homeDelivery": "Subcentre",
    "identifiedBloodDonar": "NO",
    "identifiedTransportation": "NO",
    "ifaConsumed": "NO",
    "ifaConsumedVisible": false,
    "ifaGiven": ancDataList.ifaGiven.toString(),
    "maternalDeath": "NO",
    "multiplePregnancy": "NO",
    "neonatalDeath": "NO",
    "outcomeMandatoryVisible": true,
    "outcomeOfPregnancy": "Live Birth",
    "placeOfDelivery": ancDataList.placeOfDelivery,
    "pregnancy": consultation.pregnancy,
    "prematureBaby": "NO",
    "sourceOfAdditionalFunds": "NO",
    "speculumexamDone": "NO",
    "term": "Preterm",
    "trimester": consultation.trimester,
    "tt1Date":
        ancDataList.tt1Date == "" ? null : ancDataList.tt1Date.toString(),
    "tt2Date":
        ancDataList.tt2Date == "" ? null : ancDataList.tt2Date.toString(),
    "ttBoosterDate": ancDataList.ttBoosterDate == ""
        ? null
        : ancDataList.ttBoosterDate.toString(),
    "typeOfDelivery": "Assisted",
    "urineProteins": ancDataList.urineProteins.toString(),
    "vaginumExamDone": "YES",
    "visitStatusCount": 1,
    "vitaminKGiven": "YES",
    "weeks": ancDataList.weeks
  },

  "anemiaData": {
    "age": double.parse(userController.personalQuestionsModel.age!).toInt(),
    "anemiaFollowup": anemiaData.anemiaFollowup.toString(),
    "anemiaScore": "Mild",
    "anemiaVisitNo": anemiaData.anemiaVisitNo.toString(),
    "bmiValue": 0,
    "followUpPatientCount": 0,
    "gender": userController.personalQuestionsModel.gender
            ?.toString()
            .toUpperCase() ??
        "",
    "ifaProvided": anemiaData.ifaProvided.toString().toUpperCase(),
    "ifaProvidedQty": anemiaData.ifaProvidedQty.toString().toUpperCase(),
    "ironSucroseProvidedQty": "",
    "ironSucroseProvidedVisible": false,
    "ironSucroseReqVisible": false,
    "ironSucroseRequired": 0,
    "ironSucroseVisible": false,
    "layoutIIVisible": false,
    "nutritionalCounselling":
        anemiaData.nutritionalCounselling.toString().toUpperCase(),
    "visitStatusCount": 1,
  },

  "anemiaLevel": 1,
  "anemiavisitForFollowp": true,
  "anemicOrPregnant":
      consultation.pregnancy == true ? consultation.pregnancy : false,
  "appDateTime": DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now()),
  "apptId": questionsController.appointmentId,
  "bedAssigned": false,
  "billCollected": false,

  "captureType": "0",

  "chronicalDisease": {
    "allergy": true,
    "allergyField": chronicalDisease.allergy.toString(),
    "ancVisible": false,
    "anemiaLevel": 0,
    "conceptId": "91138005",
    "currentIllnessSize": 0,

    "cvd": chronicalDisease.cvd.toString().toUpperCase(),

    "cvdDuration": chronicalDisease.cvdDuration.toString(),

    "cvdFamilyList": chronicalDisease.cvdFamilyList.toString(),

    "cvdInFamily": chronicalDisease.cvdInFamily.toString().toUpperCase(),

    "deworming": chronicalDisease.deworming == "yes" ? true : false,

    "dewormingDate": chronicalDisease.deworming == "yes"
        ? chronicalDisease.dewormingDate == ""
            ? DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now())
            : chronicalDisease.dewormingDate.toString()
        : null,

    "diabetic": chronicalDisease.diabetic.toString().toUpperCase(),

    "diabeticDuration": chronicalDisease.diabeticDuration.toString(),

    "diabeticFamilyList": chronicalDisease.diabeticFamilyList.toString(),

    "diabeticInFamily":
        chronicalDisease.diabeticInFamily.toString().toUpperCase(),

    "havingOtherCliHisInFamily":
        chronicalDisease.havingOtherCliHisInFamily == "true" ? true : false,

    "hypertenseDuration": chronicalDisease.hypertenseDuration.toString(),

    "hypertensive": chronicalDisease.hypertensive.toString().toUpperCase(),

    "hypertensiveFamilyList":
        chronicalDisease.hypertensiveFamilyList.toString(),

    "hypertensiveInFamilty":
        chronicalDisease.hypertensiveInFamilty.toString().toUpperCase(),

    "illnessVisible": false,

    "miscarriages": consultation.miscarriages.toString(),
    "numOfPregnancy": consultation.numOfPregnancy.toString(),
    "numOfStillBirths": consultation.numOfStillbirths.toString(),
    "otherCliHisFamilyList":
        chronicalDisease.havingOtherCliHisInFamily.toString(),

    "otherClinicalHistory": chronicalDisease.otherClinicalHistory.toString(),
    "pastIllnessSize": 0,
    "pncVisible": false,
    "pregnancy": consultation.pregnancy,

    ///BOOL
    "termination": consultation.termination.toString(),
    "visitNumber": 1,
    "currentIllness": "YES",
    //"lmpDate": "9 Sep 2022",
    "pastIllness": "YES",
    "surgical": "YES",
  },

  "clinicId": preConsultationController.androidNativeDataTransferModel.clinicId
      .toString(),
  "consultType": 0,
  "consultationStatus": 1,
  "createdByUserPartyId": preConsultationController
      .androidNativeDataTransferModel.partyId
      .toString(),
  "currentIllness": "", //TODO - NEXT RELEASE
  "currentIllnessList": "",

  "datametrices": [], //TODO - NEXT RELEASE

  "depressionProblem": "", //TODO - NEXT RELEASE
  "depressionProblem1": "", //TODO - NEXT RELEASE
  "dewomingGiven": chronicalDisease.deworming.toString().toUpperCase(),

  "diagnosisList": [],

  ///POST CONSULT
  "doctorAdvice": "",

  ///POST CONSULT
  "doctorCreated": false,

  ///POST CONSULT
  "doctorNote": "",

  ///POST CONSULT
  "documentsList": attachmentsController.documentsListMain
      .map((document) => document.toJson())
      .toList(),

  "dressingDone": false,
  "dressingRequired": false,
  "eprescriptionList": [],

  "expectedDeliveryDate": consultation.pregnancy == true
      ? DateFormat('MMMM d, yyyy h:mm:ss a')
          .format(DateTime.now().add(const Duration(days: 270)))
      : null,

  "familyData": {
    "completed": 0,
    "employeeGroup": false,
    "familyCatogory": "Z",
    "familyCount": 0,
    "familyId": "${questionsController.patientId}F",
    "familyMembersData": [
      {
        "BSCstatus": 0,
        "DOB": userController.personalQuestionsModel.dob,
        "aadharId":
            userController.personalQuestionsModel.aadharNumber.toString(),
        "age": double.parse(userController.personalQuestionsModel.age!).toInt(),
        "ageInDays":
            ((double.parse(userController.personalQuestionsModel.age!) -
                        double.parse(userController.personalQuestionsModel.age!)
                            .toInt()) *
                    365)
                .round(),
        "ageInMonths":
            ((double.parse(userController.personalQuestionsModel.age!) -
                        double.parse(userController.personalQuestionsModel.age!)
                            .toInt()) *
                    12)
                .round(),
        "ageInYears":
            double.parse(userController.personalQuestionsModel.age!).toInt(),
        "appStatus": "0001",
        "captureType": "0", //TODO - NEXT RELEASE
        "bplCardNo": "",
        "catagory": "Z",
        "colourCode": 4,
        "consentList": [],
        "createdByClinicId": preConsultationController
            .androidNativeDataTransferModel.clinicId
            .toString(),
        "createdByUserPartyId": preConsultationController
            .androidNativeDataTransferModel.partyId
            .toString(),
        "dispenseTime":
            DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now()),
        "familyId": "${questionsController.patientId}F",
        "firstName": userController.personalQuestionsModel.firstName.toString(),
        "followUpApptId": questionsController.appointmentId,
        "functionalFlag": "P2",
        "gender": userController.personalQuestionsModel.gender.toString(),
        "imageTakenNew": true,
        "imageUrl": userController.personalQuestionsModel.imageAwsPath.toString(),
        "income": "",
        "isEdited": false,
        "isNew": false,
        "lastName": userController.personalQuestionsModel.lastName.toString(),
        "localId": questionsController.patientId.toString(),
        "locationLat": locationController.latitude ?? 0.00,
        "locationLong": locationController.longitude ?? 0.00,
        "maritalStatus": patientData.maritalStatus.toString(),
        "medongoId": questionsController.patientId.toString(),
        "mobileNumber":
            userController.personalQuestionsModel.mobileNumber.toString(),
        "modifiedByUserPartyId": preConsultationController
            .androidNativeDataTransferModel.partyId
            .toString(),
        "modifiedDate":
            DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now()),
        "motherName": userController.personalQuestionsModel.motherName,
        //"patientVaccineList": consultation.immunizationList,
        "pending": false,
        "pushFlag": 0,
        "registeredDate":
            DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now()),
        "religion": "",
        "serverPushflag": true,
        "shift": 0,
        "tabFlag": 90,
        "todayLabStatus": -1,
        "uid": "",
        "updatedByClinicId": preConsultationController
            .androidNativeDataTransferModel.clinicId
            .toString(),

        "datametrices": [],

        "siteName": "",
      }
    ],
    "familyName": userController.personalQuestionsModel.firstName.toString(),
    "income": 0,
    "isEdited": false,
    "locationLat": locationController.latitude ?? 0.00,
    "locationLong": locationController.longitude ?? 0.00,
    "serverPushflag": false,
    "tabPushFlag": 0,
    "totalFamilyMembers": "1",
  },

  "familyId": "${questionsController.patientId}F",
  "familyPlanningServiceAvailed": false,
  "firstTime": true,
  "followupDate": DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now()),
  "forLabor": false,
  "functionalFlag": "C11",
  "healthEducationRequired": "NO",
  "immunizationList": {}, //consultation.immunizationList
  "inAnemiaFollwUp": anemiaData.anemiaFollowup,
  "inFollwUp": false,
  "isDeceased": false,
  "isTabBasedTeleConsult": false,
  "lastDeliveryPlace": ancDataList.placeOfDelivery.toString(),

  "lastDeliverydate": consultation.pregnancy == true
      ? consultation.lastDeliverydate != "" &&
              consultation.lastDeliverydate != null
          ? consultation.lastDeliverydate
          : DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now())
      : null,

  "lastBreastScreeningDate": screeningHistory.breastCancerScreening == "yes"
      ? DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now())
      : null,

  "lastCervicalScreenigDate": screeningHistory.cervicalCancerScreening == "yes"
      ? DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now())
      : null,

  "lastDepressionScreenigDate": null, //QUESTION IS NOT THERE

  "lastDewormingHistoryDate": chronicalDisease.deworming == "yes"
      ? chronicalDisease.dewormingDate == ""
          ? DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now())
          : DateFormat('MMMM d, yyyy h:mm:ss a').format(
              DateFormat('dd MMM yyyy')
                  .parse(chronicalDisease.dewormingDate.toString()))
      : null,

  "lastOralScreeningDate": screeningHistory.oralCancerScreening == "yes"
      ? DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now())
      : null,

  "lastVisionScreeningDate": screeningHistory.visionScreening == "yes"
      ? DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now())
      : null,

  "lmp": consultation.pregnancy == true
      ? consultation.lmp == ""
          ? DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now())
          : consultation.lmp.toString()
      : null,

  "localId": questionsController.patientId.toString(),
  "locationLat": locationController.latitude ?? 0.00,
  "locationLong": locationController.latitude ?? 0.00,
  "malnourishedSAMorMAM": false,
  "malnutritionLevel": -1,
  "medicineDispenseData": {},
  "medicineDispenseDataDeleted": {},
  "medicineGiven": false,
  "medongoId": questionsController.patientId.toString(),
  "miscarriages": consultation.miscarriages.toString(),
  "natureOfPhyWork": consultation.natureOfPhyWork.toString(),
  "numOfDeliveries": consultation.numOfDeliveries.toString(),
  "numOfPregnancy": consultation.numOfPregnancy.toString(),
  "numOfStillbirths": consultation.numOfStillbirths.toString(),
  "omronWeightDto": {},
  "partnerPartyId": preConsultationController
      .androidNativeDataTransferModel.partyId
      .toString(),

  "pastIllness": "",
  "pastIllnessList": "", //TODO - NEXT RELEASE
  "patAge": double.parse(userController.personalQuestionsModel.age!).toInt(),

  "patientData": {
    "BSCstatus": 0,
    "DOB": userController.personalQuestionsModel.dob,
    "aadharId": userController.personalQuestionsModel.aadharNumber.toString(),
    "age": double.parse(userController.personalQuestionsModel.age!).toInt(),
    "ageInDays": ((double.parse(userController.personalQuestionsModel.age!) -
                double.parse(userController.personalQuestionsModel.age!)
                    .toInt()) *
            365)
        .round(),
    "ageInMonths": ((double.parse(userController.personalQuestionsModel.age!) -
                double.parse(userController.personalQuestionsModel.age!)
                    .toInt()) *
            12)
        .round(),
    "ageInYears":
        double.parse(userController.personalQuestionsModel.age!).toInt(),
    "appStatus": "0001",
    "bplCardNo": "",
    "captureType": " ", //TODO - NEXT RELEASE
    "catagory": "Z",
    "colourCode": 4,
    "consentList": [],
    "createdByClinicId": preConsultationController
        .androidNativeDataTransferModel.clinicId
        .toString(),
    "createdByUserPartyId": preConsultationController
        .androidNativeDataTransferModel.partyId
        .toString(),
    "dispenseTime": DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now()),
    "familyId": "${questionsController.patientId}F",
    "firstName": userController.personalQuestionsModel.firstName.toString(),
    "followUpApptId": questionsController.appointmentId.toString(),
    "functionalFlag": "P1",
    "gender":
        userController.personalQuestionsModel.gender.toString().toUpperCase(),
    "imageTakenNew": true,
    "imageUrl": userController.personalQuestionsModel.imageAwsPath.toString(),
    "income": "",
    "isEdited": false,
    "isNew": false,
    "lastName": userController.personalQuestionsModel.lastName.toString(),
    "localId": questionsController.patientId.toString(),
    "locationLat": locationController.latitude ?? 0.00,
    "locationLong": locationController.longitude ?? 0.00,
    "maritalStatus": patientData.maritalStatus.toString(),
    "medongoId": questionsController.patientId.toString(),
    "mobileNumber":
        userController.personalQuestionsModel.mobileNumber.toString(),
    "modifiedByUserPartyId":
        preConsultationController.androidNativeDataTransferModel.partyId,
    "modifiedDate": DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now()),
    "motherName": userController.personalQuestionsModel.motherName,
    //"patientVaccineList": consultation.immunizationList,
    "pending": false,
    "pushFlag": 0,
    "registeredDate":
        DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now()),
    "religion": "",
    "serverPushflag": true,
    "shift": 0,
    "siteName": "", //TODO - NEXT RELEASE
    "tabFlag": 90,
    "todayLabStatus": -1,
    "uid": "", //TODO - NEXT RELEASE
    "updatedByClinicId":
        preConsultationController.androidNativeDataTransferModel.clinicId,
    "datametrices": [],
  },

  "pncVisitList": {
    "ageInDays": ((double.parse(userController.personalQuestionsModel.age!) -
                double.parse(userController.personalQuestionsModel.age!)
                    .toInt()) *
            365)
        .round(),
    "calciumConsumedVisible": false,
    "calciumGiven": "NO",
    "dangerSign": "NO",
    "deliveryDays": 0,
    "followUpPatientCount": 0,
    "ifaConsumedVisible": false,
    "ifaGiven": "NO",
    "motherDetailsVisible": true,
    "motherVisitDate": consultation.pregnancy == true
        ? DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now())
        : null,
    "pncCounselling": "NO",
    "pncRegisteredDate": consultation.pregnancy == true
        ? DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now())
        : null,
    "pncVisible": false,
    "reason": "",
    "visitNo": 1,
    "visitStatusCount": 1
  },

  "pregnancy": consultation.pregnancy,
  "prescPdfPath": "",
  "printPending": true,
  "pushFlag": 0,

  "referralList": [],

  "referrals": {
    "apptId": questionsController.appointmentId.toString(),
    "clinicName": "",
    "medongoId": questionsController.patientId.toString(),
    "otherClinicName": "",
    "pastHistory": "",
    "presentHistory": "",
    "referForReason": "",
    "referFromClinicId":
        preConsultationController.androidNativeDataTransferModel.clinicId,
    "referralCompleted": false,
    //"treatmentGivenToDate":   DateFormat('MMMM d, yyyy h:mm:ss a').format(DateTime.now()),
  },

  "scoresData": {
    "anemiascore": "Mild",
    "bmiScore": 0,
    "cvdScore": 0,
    "depressionScore": 0,
    "diabetesScore": 0,
    "prehypertensionScore": 0,
    "malnutritionscore": "NORMAL",
  },

  "screeningHistory": {
    "bloodGroup": "NO", //TODO - NEXT RELEASE
    "breastCancerScreening":
        screeningHistory.breastCancerScreening.toString().toUpperCase(),
    "cervicalCancerScreening":
        screeningHistory.cervicalCancerScreening.toString().toUpperCase(),
    "hiv": "NO", //TODO - NEXT RELEASE
    "hivResult": "", //TODO - NEXT RELEASE
    "rpr": "NO", //TODO - NEXT RELEASE
    "rprResult": "", //TODO - NEXT RELEASE
    "cataract": screeningHistory.cataract.toString().toUpperCase(),
    "colorBilndness": screeningHistory.colorBilndness.toString().toUpperCase(),
    "distanceVision": screeningHistory.distanceVision.toString().toUpperCase(),
    "nearVision": screeningHistory.nearVision.toString().toUpperCase(),
    "oralCancerScreening":
        screeningHistory.oralCancerScreening.toString().toUpperCase(),
    "oralCancerfindings": screeningHistory.oralCancerfindings,
    "testLayoutVisible": false,
    "vad": screeningHistory.vad.toString().toUpperCase(),
    "visionScreening":
        screeningHistory.visionScreening.toString().toUpperCase(),
    "breastCancerFindings":
        screeningHistory.breastCancerFindings.toString().toUpperCase(),
    "cervicalCancerFindings":
        screeningHistory.cervicalCancerFindings.toString().toUpperCase(),
    "leDV": screeningHistory.leftEyeDistancePower.toString(),
    "leNV": screeningHistory.leftEyeNearPower.toString(),
    "reDV": screeningHistory.rightEyeDistancePower.toString(),
    "reNV": screeningHistory.rightEyeNearPower.toString(),
  },

  "serverPushflag": false,
  "shift": 0,
  "siteName": "",

  "snomedCTCodeList": [],

  "socialLife": {
    "age": double.parse(userController.personalQuestionsModel.age!).toInt(),
    "alchoholic": socialLife.alchoholic.toString().toUpperCase(),
    "alchoholic_history_duration": socialLife.alchoholic_history_duration,
    "chewing": socialLife.chewing.toString().toUpperCase(),
    "chewing_historyduration": socialLife.chewing_historyduration,
    "conceptId": "77176002",
    "drugs": socialLife.drugs.toString().toUpperCase(),
    "drugDuration": socialLife.drugDuration.toString(),
    "surgicalHistory": "NO", //TODO - NEXT RELEASE
    "smoking": socialLife.smoking.toString().toUpperCase(),
    "smoking_historyduration": socialLife.smoking_historyduration,
    "tobacco": socialLife.tobacco.toString().toUpperCase(),
  },

  "surgicalHistory": "",
  "symptomsList": [], //TODO - NEXT RELEASE
  "tabFlag": 0,
  "teleConsult": false,
  "termination": consultation.termination,

  "testList": [],
  "trimester": consultation.trimester.toString(),
  "visitForFollowp": false,
  "vitalsData": {
    "age": double.parse(userController.personalQuestionsModel.age!).toInt(),
    "ageInDays": ((double.parse(userController.personalQuestionsModel.age!) -
                double.parse(userController.personalQuestionsModel.age!)
                    .toInt()) *
            365)
        .round(),
    "apptId": questionsController.appointmentId,
    "bglFBS": vitalsController.vitalsQuestionsModel.bglFbs.toString(),
    "bglPPBS": vitalsController.vitalsQuestionsModel.bglPpbs.toString(),
    "bglRBS": vitalsController.vitalsQuestionsModel.bglRbs.toString(),
    "bloodGlucoseFbs":
        double.tryParse(vitalsController.vitalsQuestionsModel.bglFbs) ?? 0.0,
    "bloodGlucosePpbs":
        double.tryParse(vitalsController.vitalsQuestionsModel.bglPpbs) ?? 0.0,
    "bloodGlucoseRbs":
        double.tryParse(vitalsController.vitalsQuestionsModel.bglRbs) ?? 0.0,

    ///HANDLED
    "diabolicBloodPressure":
        vitalsController.vitalsQuestionsModel.diastolic.toString(),
    "gender":
        userController.personalQuestionsModel.gender.toString().toUpperCase(),
    "headCircumference": double.tryParse(vitalsData.headCircumference) ?? 0.0,
    "heightCms":
        double.tryParse(userController.personalQuestionsModel.height) ?? 0.0,
    "heightFt": 0.0,

    ///HANDLED
    "hemoglobin": vitalsController.vitalsQuestionsModel.hemoglobin.toString(),
    "measured": "Recumbent",

    ///TODO - NOT BEING SENT - HANDLE
    "muac": int.tryParse(vitalsData.muac) ?? 0,
    "patId": questionsController.patientId,
    "pregnancy": consultation.pregnancy,
    "pulse":
        double.tryParse(vitalsController.vitalsQuestionsModel.pulse) ?? 0.0,
    "respiration": double.tryParse(
            vitalsController.vitalsQuestionsModel.respiratoryRate) ??
        0.0,

    ///HANDLED
    "spo2": vitalsController.vitalsQuestionsModel.spo2.toString(),

    ///HANDLED
    "systolicBloodPressure":
        vitalsController.vitalsQuestionsModel.systolic.toString(),

    ///HANDLED
    "temperature": vitalsController.vitalsQuestionsModel.temperature.toString(),
    "temperatureCelsius": 0.0,
    "temperatureFahrenheit":
        double.tryParse(vitalsController.vitalsQuestionsModel.temperature) ??
            0.0,
    "urineGlucose": "",
    "vsmDataFlag": false,
    "waistCircumference": 0.0,
    "weightKg":
        double.tryParse(userController.personalQuestionsModel.weight) ?? 0,
  },
  "zscore": 0
};
