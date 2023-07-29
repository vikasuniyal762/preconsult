// import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui' as ui;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:medongosupport/preConsultModule/controllers/consultationDtoController.dart';
import 'package:medongosupport/preConsultModule/controllers/preConsultationController.dart';
import 'package:medongosupport/preConsultModule/models/consultationDtoModel.dart';
import 'package:medongosupport/preConsultModule/view/preconsultationModuleMain.dart';
import 'package:path/path.dart' as path;
import 'package:medongosupport/preConsultModule/consts/appConst.dart';
import 'package:medongosupport/preConsultModule/controllers/attachmentsController.dart';
import 'package:medongosupport/preConsultModule/controllers/audioFileController.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:medongosupport/preConsultModule/controllers/userController.dart';
import 'package:medongosupport/preConsultModule/controllers/vitalsController.dart';
import 'package:medongosupport/preConsultModule/models/finalResponse.dart';
// import 'package:medongosupport/preConsultModule/globals.dart' as globals;
import 'package:medongosupport/preConsultModule/models/questionsModel.dart';
import 'package:medongosupport/preConsultModule/services/questionsServices.dart';
import 'package:medongosupport/preConsultModule/view/confirmPage.dart';
import 'package:medongosupport/preConsultModule/widgets/toastMessage.dart';
import 'package:restart_app/restart_app.dart';

final PCQuestionsController questionsController =
    Get.find<PCQuestionsController>();

class PCQuestionsController extends GetxController {
  ///IMPORTANT FIELD - CONTROLS ALL THE QUESTION FLOW
  RxInt questionsFlowMain = 0.obs;

  RxBool dummyBool = true.obs;

  RxInt accountOverallPercentage = 0.obs;

  TextEditingController answerController = TextEditingController();

  TextEditingController answerYearsController =
      TextEditingController(text: "0");
  TextEditingController answerMonthsController =
      TextEditingController(text: "0");
  TextEditingController answerDaysController = TextEditingController(text: "0");

  DateTime selectedDateDob = DateTime.now();

  RxBool isLoadingQuestions = true.obs;

  RxString selectedDateRangeFormat = "days".obs;

  ///
  RxBool isFilling = true.obs;

  ///APPOINTMENT ID
  String appointmentId = '';

  String patientId = '';

  /// PERSONAL QUESTIONS INDEX CHECK
  RxInt currentPersonalQuestionIndex = 0.obs;
  RxInt previousPersonalQuestionIndex = 0.obs;

  /// VITALS QUESTIONS INDEX CHECK
  RxInt currentVitalsQuestionIndex = 0.obs;
  RxInt previousVitalsQuestionIndex = 0.obs;

  /// AGE AND GENDER BASED FILTERED QUESTIONS INDEX CHECK
  RxInt currentFilteredQuestionIndex = 0.obs;
  RxInt previousFilteredQuestionIndex = 0.obs;

  ///
  List<String> multiOptionsStringList = [];
  RxString multiOptionsString = "".obs;

  ///
  RxInt optionsChoiceIndex = (-1).obs;
  RxString optionsChoiceTag = "".obs;

  ///
  List<String> filteredCategoryList = [];
  RxInt selectedFilterCategoryListIndex = 0.obs;

  Map<String, int>? filteredCategoryListMap;

  ///
  RxString selectedAge = "0.0".obs;
  RxString selectedGender = "".obs;

  RxInt ageModeListChoiceIndex = (-1).obs;

  List<String> ageModeList = ["Months", "Years"];

  ///INSTANCE OF QUESTIONS SERVICE CLASS
  QuestionsService questionsService = QuestionsService();

  /// GETTING ALL THE QUESTIONS OF THE
  List<QuestionsMain>? allQuestionsList = [];

  ///
  List<Elements>? personalInfoQuestions = [];

  // ///
  // List<Elements>? personalInfoAnswers = [];

  ///
  List<Elements>? filteredQuestionsList = [];

  ///
  List<Elements>? filteredQuestionsAnswerList = [];

  /// VITALS QUESTION IN LIST
  List<Elements>? vitalsQuestionsList = [];

  /// VITALS QUESTION'S ANSWER LIST
  List<Elements>? vitalsQuestionsAnswerList = [];

  ///MAP TO STORE ALL THE ATTACHMENTS WITH RESPECT TO THE QUESTIONS THEY BELONG TO
  List<Map<String, dynamic>> allAttachments = [];

  ///ATTACHMENTS LIST WHICH HOLDS ATTACHMENTS OF PARTICULAR QUESTION
  List attachments = [];

  ///TO UPDATE THE COUNTER VALUE - TO RENDER THE UI
  RxInt attachmentsCounter = 0.obs;

  ///UPDATES LOADING STATUS FOR THE ANIMATION
  updateLoadingStatusQuestions() async {
    isLoadingQuestions.value = true;
    update();
  }

  ///RESETS LOADING STATUS FOR THE ANIMATION
  resetLoadingStatusQuestions() async {
    isLoadingQuestions.value = false;
    update();
  }

  ///GENERATE PATIENT ID
  Future generatePatientId() async {
    Future.delayed(const Duration(seconds: 1));

    /// OUTPUT IS 2706232022471 - 12 DIGITS
    String timeStamp = DateFormat('ddMMyyHHmmss').format(DateTime.now());

    ///TAB CODE + DATE TIME
    patientId = preConsultationController
                .androidNativeDataTransferModel.tabCode !=
            ""
        ? "${preConsultationController.androidNativeDataTransferModel.tabCode}${DateTime.now().millisecondsSinceEpoch.toString()}"
        : "${preConsultationController.androidNativeDataTransferModel.clinicId}${DateTime.now().millisecondsSinceEpoch.toString()}";

    ///CLINIC ID + DATE TIME + TAB CODE ( BY DEFAULT 1 )
    appointmentId =
        "${preConsultationController.androidNativeDataTransferModel.clinicId}${timeStamp.toString()}1";

    update();
    return true;
  }

  ///UPDATES OPTION CHOICE INDEX AND VALUE
  updateOptionsChoice({required List<String> options, required int index}) {
    optionsChoiceIndex.value = index;
    optionsChoiceTag.value = options[optionsChoiceIndex.value];
    update();
  }

  resetAllQuestionsAndStatus({required bool totalExit}) async {
    if (totalExit) {
      patientId = "";
      appointmentId = "";
    }


    audioFileController.isRecording.value = false;
    await audioFileController.audioRecorder.stop();


    currentPersonalQuestionIndex.value = 0;
    currentVitalsQuestionIndex.value = 0;
    currentFilteredQuestionIndex.value = 0;

    personalQuestionIndexForIndication.value = 0;
    vitalsQuestionIndexForIndication.value = 0;
    filteredQuestionIndexForIndication.value = 0;

    previousPersonalQuestionIndex.value = 0;
    previousVitalsQuestionIndex.value = 0;
    previousFilteredQuestionIndex.value = 0;

    allQuestionsList = [];
    personalInfoQuestions = [];
    vitalsQuestionsList = [];
    filteredQuestionsList = [];
    filteredCategoryList = [];
    questionsFlowMain.value = 0;

    attachmentsController.documentsListMain = [];

    userController.personalQuestionsModel = PersonalQuestionsModel(
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

    vitalsController.vitalsQuestionsModel = VitalsQuestionsModel(
      bp: '0/0',
      systolic: '',
      diastolic: '',
      pulse: '0',
      temperature: '0',
      spo2: '',
      respiratoryRate: '0',
      bglRbs: '0',
      bglFbs: '0',
      bglPpbs: '0',
      hemoglobin: '',
    );

    consultation = ConsultationOld(
      actualConsult: false,
      accountBillingInfo: [],
      admitStatus: false,
      allergy: '',
      allergyList: [],
      ancDataList: ancDataList,

      /// TYPE ANCDATALIST
      anemiaData: anemiaData,

      /// TYPE ANEMIADATA
      anemiaLevel: 0,
      anemiavisitForFollowp: false,
      anemicOrPregnant: false,
      appDateTime: '',
      apptId: '',
      bedAssigned: false,
      billCollected: false,
      captureType: '',
      chronicalDisease: chronicalDisease,
      clinicId: '',
      consultType: 0,
      consultationStatus: 0,
      createdByUserPartyId: '',
      currentIllness: '',
      currentIllnessList: '',
      datametrices: [],
      depressionProblem: '',
      depressionProblem1: '',
      dewomingGiven: '',
      diagnosisList: [],
      doctorAdvice: '',
      doctorCreated: false,
      doctorNote: '',
      documentsList: [],
      dressingDone: false,
      dressingRequired: false,
      eprescriptionList: [],
      expectedDeliveryDate: '',
      familyData: familyData,
      familyId: '',
      familyPlanningServiceAvailed: false,
      firstTime: false,
      followupDate: '',
      forLabor: false,
      functionalFlag: '',
      healthEducationRequired: '',
      immunizationList: {},
      inAnemiaFollwUp: false,
      inFollwUp: false,
      isDeceased: false,
      isTabBasedTeleConsult: false,
      lastBreastScreeningDate: '',
      lastCervicalScreenigDate: '',
      lastDeliveryPlace: '',
      lastDeliverydate: '',
      lastDepressionScreenigDate: '',
      lastDewormingHistoryDate: '',
      lastOralScreeningDate: '',
      lastVisionScreeningDate: '',
      lmp: '',
      localId: '',
      locationLat: 0.0,
      locationLong: 0.0,
      malnourishedSAMorMAM: false,
      malnutritionLevel: 0,
      medicineDispenseData: medicineDispenseData,
      medicineDispenseDataDeleted: medicineDispenseDataDeleted,
      medicineGiven: false,
      medongoId: '',
      miscarriages: '',
      natureOfPhyWork: '',
      numOfDeliveries: '',
      numOfPregnancy: '',
      numOfStillbirths: '',
      omronWeightDto: {},
      partnerPartyId: '',
      pastIllness: '',
      pastIllnessList: '',
      patAge: 0,
      patientData: patientData,

      /// type patientData
      pncVisitList: pncVisitList,

      /// type pncVisitList
      pregnancy: false,
      prescPdfPath: '',
      printPending: false,
      pushFlag: 0,
      referrals: referrals,
      scoresData: scoresData,

      /// type scoreData
      screeningHistory: screeningHistory,

      /// type screeninhHistory
      serverPushflag: false,
      shift: 0,
      siteName: '',
      snomedCTCodeList: [],
      socialLife: socialLife,

      /// type sociallife
      surgicalHistory: '',
      symptomsList: [],
      tabFlag: 0,
      teleConsult: false,
      termination: '',
      testList: [],
      trimester: '',
      visitForFollowp: false,
      vitalsData: vitalsData,

      /// type vitals Data
      zscore: 0,
    );

    pncVisitList = PncVisitList(
        ageInDays: 0,
        calciumConsumedVisible: false,
        calciumGiven: '',
        dangerSign: '',
        deliveryDays: 0,
        followUpPatientCount: 0,
        ifaConsumedVisible: false,
        ifaGiven: '',
        motherDetailsVisible: false,
        motherVisitDate: '',
        pncCounselling: '',
        pncRegisteredDate: '',
        pncVisible: false,
        reason: '',
        visitNo: 0,
        visitStatusCount: 0);

    allergyList = AllergyList(
        allergyName: '', conceptId: '', isEnabled: false, position: 0);

    referrals = Referrals(
      apptId: '',
      clinicName: '',
      medongoId: '',
      otherClinicName: '',
      pastHistory: '',
      presentHistory: '',
      referForReason: '',
      referFromClinicId: '',
      referralCompleted: false,
      treatmentGivenToDate: '',
    );

    anemiaData = AnemiaData(
      age: 0,
      anemiaFollowup: '',
      anemiaScore: '',
      anemiaVisitNo: '',
      bmiValue: 0,
      followUpPatientCount: 0,
      gender: '',
      ifaProvided: '',
      ifaProvidedQty: '',
      ironSucroseProvidedQty: '',
      ironSucroseProvidedVisible: false,
      ironSucroseReqVisible: false,
      ironSucroseRequired: 0,
      ironSucroseVisible: false,
      layoutIIVisible: false,
      nutritionalCounselling: '',
      visitStatusCount: 0,
    );

    ancDataList = AncDataList(
      abdomenExamDone: 'NO',
      ancCounselingType: '',
      ancCounselling: '',
      ancPlaceOrBy: '',
      ancRegisteredDate: '',
      ancRegisteredPlace: '',
      ancRegistration: '',
      ancVisible: false,
      availedFamilyPlanningServices: '',
      awreOfDangerSigns: '',
      birthPrepardnessPlan: '',
      breastfedAnHour: '',
      calciumConsumed: '',
      calciumGiven: '',
      calciumVisible: false,
      childComplicationType: '',
      childComplications: '',
      childGender: '',
      childName: '',
      childWeight: 0,
      childuniqueID: '',
      congenitalAnomaly: '',
      cryAfterBirth: '',
      dangerSigns: '',
      dangersignDetails: '',
      deliveryDate: '',
      deliveryPncVisible: false,
      deliverybagPrepared: '',
      deworming: false,
      fConsumedVisble: false,
      familyPlanningServiceTypes: '',
      fhr: '',
      folicAcidConsumed: '',
      folicAcidGiven: '',
      followUpPatientCount: 0,
      fundalHeight: '',
      haveEssentialContactNo: '',
      highRisk: '',
      highRiskType: '',
      homeDelivery: '',
      identifiedBloodDonar: '',
      identifiedTransportation: '',
      ifaConsumed: '',
      ifaConsumedVisible: false,
      ifaGiven: '',
      maternalDeath: '',
      multiplePregnancy: '',
      neonatalDeath: '',
      outcomeMandatoryVisible: false,
      outcomeOfPregnancy: '',
      placeOfDelivery: '',
      pregnancy: false,
      prematureBaby: '',
      sourceOfAdditionalFunds: '',
      speculumexamDone: '',
      term: '',
      trimester: '',
      tt1Date: '',
      tt2Date: '',
      ttBoosterDate: '',
      typeOfDelivery: '',
      urineProteins: '',
      vaginumExamDone: '',
      visitStatusCount: 0,
      vitaminKGiven: '',
      weeks: 0,
    );

    screeningHistory = ScreeningHistory(
      cataract: '',
      colorBilndness: '',
      distanceVision: '',
      nearVision: '',
      oralCancerScreening: '',
      oralCancerfindings: '',
      testLayoutVisible: false,
      vad: '',
      visionScreening: '',
      bloodGroup: '',
      breastCancerFindings: '',
      breastCancerScreening: '',
      cervicalCancerFindings: '',
      cervicalCancerScreening: '',
      hiv: '',
      hivResult: '',
      leDV: '',
      leNV: '',
      reDV: '',
      reNV: '',
      rpr: '',
      rprResult: '',
    );

    chronicalDisease = ChronicalDisease(
      allergy: false,
      allergyField: '',
      ancVisible: false,
      anemiaLevel: 0,
      conceptId: '',
      currentIllness: '',
      currentIllnessSize: '',
      cvd: '',
      cvdDuration: '0',
      cvdFamilyList: '',
      cvdInFamily: '',
      deworming: false,
      dewormingDate: '',
      diabetic: '',
      diabeticDuration: '',
      diabeticFamilyList: '',
      diabeticInFamily: '',
      havingOtherCliHisInFamily: false,
      hypertenseDuration: '',
      hypertensive: '',
      hypertensiveFamilyList: '',
      hypertensiveInFamilty: '',
      illnessVisible: false,
      lmpDate: '',
      miscarriages: '',
      numOfPregnancy: '',
      numOfStillBirths: '',
      otherCliHisFamilyList: '',
      otherClinicalHistory: '',
      pastIllness: '',
      pastIllnessSize: 0,
      pncVisible: false,
      pregnancy: false,
      surgical: '',
      termination: '',
      visitNumber: 0,
    );

    socialLife = SocialLife(
        age: 0,
        alchoholic: '',
        alchoholic_history_duration: '',
        chewing: '',
        chewing_historyduration: '',
        conceptId: '',
        drugDuration: '',
        drugs: 'NO',
        smoking: '',
        smoking_historyduration: '',
        tobacco: '');

    documentsList = DocumentsList(
        apptId: '',
        captureDateTime: '',
        description: '',
        ftpPath: '',
        latitude: '',
        longitude: '',
        path: '',
        pid: '',
        subcategory: '',
        type: '');

    patientData = PatientData(
        BSCstatus: 0,
        DOB: '',
        aadharId: '',
        age: 0,
        ageInDays: 0,
        ageInMonths: 0,
        ageInYears: 0,
        appStatus: '',
        bplCardNo: '',
        captureType: '',
        catagory: '',
        colourCode: 0,
        consentList: '',
        createdByClinicId: '',
        createdByUserPartyId: '',
        dispenseTime: '',
        familyId: '',
        firstName: '',
        followUpApptId: '',
        functionalFlag: '',
        gender: '',
        imageTakenNew: false,
        imageUrl: '',
        income: '',
        isEdited: '',
        isNew: '',
        lastName: '',
        localId: '',
        locationLat: 0.0,
        locationLong: 0.0,
        maritalStatus: '',
        medongoId: '',
        mobileNumber: '',
        modifiedByUserPartyId: '',
        modifiedDate: '',
        motherName: '',
        patientVaccineList: '',
        pending: false,
        pushFlag: 0,
        registeredDate: '',
        religion: '',
        serverPushflag: false,
        shift: 0,
        siteName: '',
        tabFlag: 0,
        todayLabStatus: 0,
        uid: '',
        updatedByClinicId: '');

    familyData = FamilyData(
      familyData: '',
      completed: 0,
      employeeGroup: false,
      familyCatogory: '',
      familyCount: 0,
      familyId: '',
      familyName: '',
      income: 0,
      isEdited: false,
      locationLat: 0,
      locationLong: 0,
      serverPushflag: false,
      tabPushFlag: 0,
      totalFamilyMembers: '',
    );

    familyMembersData = FamilyMembersData(
        BSCstatus: 0,
        DOB: '',
        aadharId: '',
        age: 0,
        ageInDays: 0,
        ageInMonths: 0,
        ageInYears: '',
        appStatus: '',
        bplCardNo: '',
        captureType: '',
        catagory: '',
        colourCode: 0,
        consentList: '',
        createdByClinicId: '',
        createdByUserPartyId: '',
        dispenseTime: '',
        familyId: '',
        firstName: '',
        followUpApptId: '',
        functionalFlag: '',
        gender: '',
        imageTakenNew: false,
        imageUrl: '',
        income: '',
        isEdited: false,
        isNew: false,
        lastName: '',
        localId: '',
        locationLat: 0.0,
        locationLong: 0.0,
        maritalStatus: '',
        medongoId: '',
        mobileNumber: '',
        modifiedByUserPartyId: '',
        modifiedDate: '',
        motherName: '',
        patientVaccineList: '',
        pending: false,
        pushFlag: 0,
        registeredDate: '',
        religion: '',
        serverPushflag: true,
        shift: 0,
        siteName: '',
        tabFlag: 0,
        todayLabStatus: 0,
        uid: '',
        updatedByClinicId: '');

    scoresData = ScoresData(
        anemiascore: '',
        bmiScore: 0,
        cvdScore: 0,
        depressionScore: 0,
        diabetesScore: 0,
        malnutritionscore: '',
        prehypertensionScore: 0);

    datametrices = Datametrices(
      action: '',
      actionDate: '',
      actionId: '',
      appID: '',
      clinicId: '',
      duration: 0,
      endTime: '',
      operatorId: '',
      operatorRoleId: '',
      shiftId: 0,
      starttime: '',
      localId: '',
    );

    symptomsList = SymptomsList(
        conceptId: '',
        duration: '',
        isChecked: false,
        isEnabled: false,
        name: '',
        position: 0);

    snomedCTCodeList = SnomedCTCodeList(
        added: false, categoryId: 0, frequency: 0, snomedCTCode: '');

    vitalsData = VitalsData(
      age: 0,
      ageInDays: 0,
      apptId: '',
      bglFBS: '',
      bglPPBS: '',
      bglRBS: '',
      bloodGlucoseFbs: '0',
      bloodGlucosePpbs: '0',
      bloodGlucoseRbs: '0',
      diabolicBloodPressure: '0',
      gender: '',
      headCircumference: '0',
      heightCms: '0',
      heightFt: '0',
      hemoglobin: '0',
      measured: '',
      muac: '',
      patId: '',
      pregnancy: false,
      pulse: '0',
      respiration: '0',
      spo2: '0',
      systolicBloodPressure: '0',
      temperature: '0',
      temperatureCelsius: '0',
      temperatureFahrenheit: '0',
      urineGlucose: '',
      vsmDataFlag: false,
      waistCircumference: '0',
      weightKg: '0',
    );

    update();
  }

  ///GETS ALL THE QUESTIONS FROM THE DATABASE
  Future getAllQuestions() async {
    try {
      ///TODO - HANDLE ERROR AND SHOW MESSAGE TO USER SAYING UNABLE TO LOAD QUESTION
      ///GET ALL THE DATA FROM COLLECTION
      allQuestionsList = await questionsService.getAllQuestionsFromDb();
      getPersonalInfoQuestions(allQuestionsList);

      preConsultationController.resetLoadingStatusPermissionsPage();

      preConsultationController.isLoadingPermissionsPage.value = false;

      update();
      return true;
    } catch (error) {
      print("GET PERSONAL QUESTIONS ERROR - $error");
    }
  }

  ///GET PERSONAL INFO DOC USING THE UNIQUE FIELD VALUE WE HAVE ASSIGNED TO startAge
  Future getPersonalInfoQuestions(allQuestions) async {
    for (QuestionsMain questionsMain in allQuestions!) {
      if (questionsMain.startAge == "500") {
        personalInfoQuestions = questionsMain.elements;
        update();
      } else {
        print("NOT FOUND");
      }
    }
  }

  //UPDATES SIDE DOT BAR INDEX - DEPRECATED
  updateSideDotBarIndex({required int index}) {
    questionsController.selectedFilterCategoryListIndex.value = index;
    update();
  }

  ///GETS ALL THE VITALS QUESTIONS
  Future getVitalsQuestions(allQuestions) async {
    for (QuestionsMain questionsMain in allQuestions!) {
      if (questionsMain.startAge == "2000") {
        vitalsQuestionsList = questionsMain.elements;
        update();
      } else {
        print("NOT FOUND");
      }
    }
  }

  ///UPDATE QUESTION NUMBER LOGIC FLOW START

  RxInt personalQuestionIndexForIndication = 1.obs;
  RxInt vitalsQuestionIndexForIndication = 1.obs;
  RxInt filteredQuestionIndexForIndication = 1.obs;

  //FUNCTION FOR REFLECT THE VALUES OF PERSONAL QUESTION INDEX IN THE UI
  String getPersonalCurrentIndexText() {
    return "${personalQuestionIndexForIndication.value}/${personalInfoQuestions!.length - 1}";
  }

  //FUNCTION FOR REFLECT THE VALUES OF VITALS QUESTION INDEX IN THE UI
  String getVitalsCurrentIndexText() {
    return "${vitalsQuestionIndexForIndication.value}/${vitalsQuestionsList!.length - 1}";
  }

  //FUNCTION FOR REFLECT THE VALUES OF FILTERED QUESTION INDEX IN THE UI
  String getFilterCurrentIndexText() {
    return "${filteredQuestionIndexForIndication.value}/${filteredQuestionsList!.length - 1}";
  }

  updateNextPersonalQuestionIndex() {
    personalQuestionIndexForIndication++;
    update();
  }

  downgradePreviousPersonalQuestionIndex() {
    personalQuestionIndexForIndication--;
    update();
  }

  updateNextVitalQuestionIndex() {
    vitalsQuestionIndexForIndication++;
    update();
  }

  downgradePreviousVitalQuestionIndex() {
    vitalsQuestionIndexForIndication--;
    update();
  }

  updateNextFilteredQuestionIndex() {
    filteredQuestionIndexForIndication++;
    update();
  }

  downgradePreviousFilteredQuestionIndex() {
    filteredQuestionIndexForIndication--;
    update();
  }

  ///UPDATE QUESTION NUMBER LOGIC FLOW END

  //

  ///START OF PERSONAL FLOW LOGIC

  //GO TO PREVIOUS PERSONAL QUESTION
  goToPreviousPersonalQuestion() async {
    try {
      Elements currentElement =
          personalInfoQuestions![currentPersonalQuestionIndex.value];
      currentPersonalQuestionIndex.value = currentElement.previousQuestionIndex;

      ///LOADS THE ANSWER FOR PREVIOUS QUESTION
      preLoadAnswersForEditing(
          currentElement:
              personalInfoQuestions![currentElement.previousQuestionIndex]);

      final finalText = filterText(
          questionText:
              personalInfoQuestions![currentElement.previousQuestionIndex]
                  .text);

      ///SAVE THE AUDIO RELATED TO EACH QUESTION
      audioFileController.trimAndSaveAudio(key: finalText);

      downgradePreviousPersonalQuestionIndex();
      update();
    } catch (error) {
      debugPrint("$error");
    }
  }

  //LOADS ALL THE PERSONAL QUESTIONS
  updatePersonalQuestionFlowAndRecordingStatus() async {
    getVitalsQuestions(allQuestionsList);
    questionsFlowMain.value = 1;
    accountOverallPercentage.value = 25;
    currentPersonalQuestionIndex.value = 0;

    update();
  }

  //UPDATES FILTERED QUESTIONS INDEX
  updatePersonalQuestionsIndex(destinationElementId) {
    if (destinationElementId != personalInfoQuestions!.last.id) {
      for (int index = 0; index <= personalInfoQuestions!.length - 2; index++) {
        if (destinationElementId == personalInfoQuestions![index].id) {
          ///UPDATES PREVIOUS QUESTION INDEX VALUE
          personalInfoQuestions![index].previousQuestionIndex =
              previousPersonalQuestionIndex.value;

          ///UPDATES NEXT QUESTION INDEX VALUE
          currentPersonalQuestionIndex.value = index;

          ///LOAD DATA IN THE QUESTION FIELDS
          if (personalInfoQuestions![index].answer != "" &&
              personalInfoQuestions![index].answer != null) {
            ///REGULAR FIELDS
            answerController.clear();
            attachments.clear();

            ///OPTIONS FIELDS
            optionsChoiceTag.value = "";
            optionsChoiceIndex.value = -1;

            preLoadAnswersForEditing(
                currentElement: personalInfoQuestions![index]);
          } else {
            ///REGULAR FIELDS
            answerController.clear();
            attachments.clear();

            ///OPTIONS FIELDS
            optionsChoiceTag.value = "";
            optionsChoiceIndex.value = -1;
          }

          update();
        }
      }
    } else {
      updatePersonalQuestionFlowAndRecordingStatus();

      ///REGULAR FIELDS
      answerController.clear();
      attachments.clear();

      ///OPTIONS FIELDS
      optionsChoiceTag.value = "";
      optionsChoiceIndex.value = -1;
    }
  }

  //FOR PERSONAL QUESTIONS WITH CUSTOM NAVIGATION BASED ON NEXT'S POSITION
  loadPersonalQuestionsFlow() {
    previousPersonalQuestionIndex.value = currentPersonalQuestionIndex.value;

    updatePersonalQuestionsIndex(
        personalInfoQuestions![currentPersonalQuestionIndex.value]
            .next![0]
            .destElementId);
    update();
  }

  //VALIDATES AND CALLS - FINAL SUBMIT FOR PERSONAL QUESTIONS
  submitButtonActionsForPersonalQuestions(
      {required bool isNew, Elements? updatedElement}) async {
    Elements currentElement = isNew
        ? personalInfoQuestions![currentPersonalQuestionIndex.value]
        : updatedElement!;

    switch (currentElement.selectedMode) {
      ///VALIDATIONS
      case "text":

        ///CHECKS IF THE QUESTION IS MANDATORY AND THROWS WARNING
        if (currentElement.isMandatory == "true") {
          ///VALIDATIONS
          if (answerController.text.isEmpty) {
            showToast(
                "Please enter the ${currentElement.text}", ToastGravity.CENTER);
            return;
          }
        }

        ///UPDATES ANSWER AND OTHER FIELDS
        isNew
            ? addDataForPersonalQuestions(
                elementsMain: currentElement, answer: answerController.text)
            : updateDataForPersonalQuestions(
                field: currentElement?.text, answer: answerController.text);
        break;

      case "numeric":

        ///VALIDATIONS
        if (currentElement.text == "Age") {
          if (answerYearsController.text.isEmpty) {
            showToast("Please enter the Years as '0'", ToastGravity.CENTER);
            return;
          }
          if (answerMonthsController.text.isEmpty) {
            showToast("Please enter the Months as '0'", ToastGravity.CENTER);
            return;
          }
          if (currentElement.selectedLength != 50) {
            if (answerController.text.length != currentElement.selectedLength) {
              showToast("Please enter ${currentElement.selectedLength} digits",
                  ToastGravity.CENTER);
              return;
            }
          }

          if (answerYearsController.text == "0" &&
              answerMonthsController.text == "0" &&
              answerDaysController.text == "0") {
            showToast("Age can not be zero. Please enter years or months",
                ToastGravity.CENTER);
            return;
          }

          ///GET THE AGE OF THE PATIENT BY CALCULATING THE AGE IN YEARS AND IN MONTHS
          int years = int.parse(answerYearsController.text);
          int months = int.parse(answerMonthsController.text);
          int days = int.parse(answerDaysController.text);

          double combinedAge = years.toDouble() +
              (months.toDouble() / 12) +
              (days.toDouble() / 365);

          String finalAge = combinedAge.toString();

          ///UPDATES ANSWER AND OTHER FIELDS
          addDataForPersonalQuestions(
              elementsMain: currentElement, answer: finalAge);

          ///ASSIGNING THE AGE OF PATIENT TO THE ANSWER OF "AGE"
          selectedAge.value = finalAge;

          ///AGE FIELDS
          questionsController.answerYearsController.clear();
          questionsController.answerMonthsController.clear();
          questionsController.answerDaysController.clear();
        } else {
          ///CHECKS IF THE QUESTION IS MANDATORY AND THROWS WARNING
          if (currentElement.isMandatory == "true") {
            ///VALIDATIONS
            if (answerController.text.isEmpty) {
              showToast("Please enter the ${currentElement.text}",
                  ToastGravity.CENTER);
              return;
            }
          }

          ///VALIDATIONS - 2
          if (answerController.text.length > 0) {
            if (currentElement.selectedLength != 6) {
              if (currentElement.selectedLength != 50) {
                if (answerController.text.length !=
                    currentElement.selectedLength) {
                  showToast("Please enter ${currentElement.selectedLength} digits", ToastGravity.CENTER);
                  return;
                }
              }
            }
          }


          ///HEIGHT VALIDATIONS
          if (currentElement.text == "Height (in cm)") {
            if (double.parse(answerController.text) < 40) {
              showToast("Invalid Height", ToastGravity.CENTER);
              return;
            }

            if (double.parse(answerController.text) > 230) {
              showToast("Invalid Height", ToastGravity.CENTER);
              return;
            }
          }

          ///WEIGHT VALIDATIONS
          if (currentElement.text == "Weight (in kg)") {
            if (double.parse(answerController.text) < 1) {
              showToast("Invalid Weight", ToastGravity.CENTER);
              return;
            }

            if (double.parse(answerController.text) > 200) {
              showToast("Invalid Weight", ToastGravity.CENTER);
              return;
            }
          }

          ///UPDATES ANSWER AND OTHER FIELDS
          isNew
              ? addDataForPersonalQuestions(
                  elementsMain: currentElement, answer: answerController.text)
              : updateDataForPersonalQuestions(
                  field: currentElement?.text, answer: answerController.text);
          break;
        }

        break;

      case "dateTime":

        ///ASSIGNING BY DEFAULT
        final defaultDateString = DateFormat('MMM dd, yyyy hh:mm:ss a').format(
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 0, 0, 0));

        if (answerController.text.isEmpty) {
          answerController.text = defaultDateString;
        }

        ///UPDATES ANSWER AND OTHER FIELDS
        isNew
            ? addDataForPersonalQuestions(
                elementsMain: currentElement, answer: answerController.text)
            : updateDataForPersonalQuestions(
                field: currentElement.text, answer: answerController.text);
        break;

      case "options":

        ///CHECKS IF THE QUESTION IS MANDATORY AND THROWS WARNING
        if (currentElement.isMandatory == "true") {
          ///VALIDATIONS
          if (optionsChoiceTag.value == "") {
            showToast("Please choose the ${currentElement.text}",
                ToastGravity.CENTER);
            return;
          }
        }

        ///UPDATES GENDER FOR IMMEDIATE USE
        if (currentElement.text == "Gender") {
          selectedGender.value = optionsChoiceTag.value;
        }

        isNew
            ? addDataForPersonalQuestions(
                elementsMain: currentElement, answer: optionsChoiceTag.value)
            : updateDataForPersonalQuestions(
                field: currentElement?.text, answer: optionsChoiceTag.value);
        break;

      default:

        ///UPDATES ANSWER AND OTHER FIELDS
        isNew
            ? addDataForPersonalQuestions(
                elementsMain: currentElement, answer: answerController.text)
            : updateDataForPersonalQuestions(
                field: currentElement?.text, answer: answerController.text);
        break;
    }

    update();
  }

  //ADDS ANSWER AND ATTACHMENTS IN THE EXISTING QUESTIONS LIST
  addDataForPersonalQuestions(
      {required Elements elementsMain, required String answer}) async {
    ///UPDATES ALL THE PERSONAL QUESTIONS DATA
    for (Elements element in personalInfoQuestions!) {
      if (element.text == elementsMain.text) {
        element.answer = answer;
        element.attachments = attachments;
        update();
      }
    }

    final finalText = filterText(questionText: elementsMain.text);

    ///SAVE THE AUDIO RELATED TO EACH QUESTION
    audioFileController.trimAndSaveAudio(key: finalText);

    ///UPDATES INDEX FOR THE UI
    updateNextPersonalQuestionIndex();

    ///UPDATES DATA IN USER PERSONAL INFO
    userController.updateUserPersonalDetails(
        field: elementsMain.text, response: answer);

    ///UPDATE ATTACHMENTS TO THE MAIN DATA COLLECTION POINT IN ATTACHMENT CONTROLLER
    addSingleFilesToTheCollection(
        key: elementsMain.text, attachments: attachments);

    ///LOADS NEXT QUESTION IN THE FLOW
    questionsController.loadPersonalQuestionsFlow();

    update();
  }

  //UPDATES ANSWER AND ATTACHMENTS IN THE EXISTING QUESTIONS LIST
  updateDataForPersonalQuestions(
      {required String field, required String answer}) async {
    ///UPDATES ALL THE PERSONAL QUESTIONS DATA
    for (Elements element in personalInfoQuestions!) {
      if (element.text == field) {
        element.answer = answer;
      }
    }

    ///UPDATES DATA IN USER PERSONAL INFO
    userController.updateUserPersonalDetails(field: field, response: answer);

    ///REGULAR FIELDS
    answerController.clear();
    attachments.clear();

    ///OPTIONS FIELDS
    optionsChoiceTag.value = "";
    optionsChoiceIndex.value = -1;

    update();
    Get.back();
  }

  ///END OF PERSONAL FLOW LOGIC

  //

  ///START OF VITALS FLOW LOGIC

  //GO TO PREVIOUS VITALS QUESTION
  goToPreviousVitalsQuestion() async {
    try {
      Elements currentElement =
          vitalsQuestionsList![currentVitalsQuestionIndex.value];
      currentVitalsQuestionIndex.value = currentElement.previousQuestionIndex;

      ///LOADS THE ANSWER FOR PREVIOUS QUESTION
      preLoadAnswersForEditing(currentElement: vitalsQuestionsList![currentElement.previousQuestionIndex]);

      final finalText = filterText(
          questionText:
              vitalsQuestionsList![currentElement.previousQuestionIndex].text);

      ///SAVE THE AUDIO RELATED TO EACH QUESTION
      audioFileController.trimAndSaveAudio(key: finalText);

      downgradePreviousVitalQuestionIndex();
      update();
    } catch (error) {
      debugPrint("$error");
    }
  }

  //LOADS ALL THE VITAL QUESTIONS
  updateVitalQuestionFlowAndRecordingStatus() async {
    getFilteredQuestionsBasedOnTheAgeAndGenderFilter();

    ///UPDATES QUESTION FLOW MAIN INDEX
    questionsFlowMain.value = 2;
    accountOverallPercentage.value = 50;
    currentVitalsQuestionIndex.value = 0;
    update();
  }

  //UPDATES VITAL QUESTIONS INDEX
  updateVitalsQuestionsIndex(destinationElementId) {
    if (destinationElementId != vitalsQuestionsList!.last.id) {
      for (int index = 0; index <= vitalsQuestionsList!.length - 2; index++) {
        if (destinationElementId == vitalsQuestionsList![index].id) {
          ///UPDATES PREVIOUS QUESTION INDEX VALUE
          vitalsQuestionsList![index].previousQuestionIndex =
              previousVitalsQuestionIndex.value;

          ///UPDATES NEXT QUESTION INDEX VALUE
          currentVitalsQuestionIndex.value = index;

          ///LOAD DATA IN THE QUESTION FIELDS
          if (vitalsQuestionsList![index].answer != "" &&
              vitalsQuestionsList![index].answer != null) {
            ///REGULAR FIELDS
            answerController.clear();
            attachments.clear();

            ///OPTIONS FIELDS
            optionsChoiceTag.value = "";
            optionsChoiceIndex.value = -1;

            ///PRE LOAD ANSWERS IN THE FIELD
            preLoadAnswersForEditing(
                currentElement: vitalsQuestionsList![index]);
          } else {
            ///REGULAR FIELDS
            answerController.clear();
            attachments.clear();

            ///OPTIONS FIELDS
            optionsChoiceTag.value = "";
            optionsChoiceIndex.value = -1;
          }

          update();
        }
      }
    } else {
      updateVitalQuestionFlowAndRecordingStatus();

      ///REGULAR FIELDS
      answerController.clear();
      attachments.clear();

      ///OPTIONS FIELDS
      optionsChoiceTag.value = "";
      optionsChoiceIndex.value = -1;
    }
  }

  //FOR VITAL QUESTIONS WITH CUSTOM NAVIGATION BASED ON NEXT'S POSITION
  loadVitalsQuestionsFlow({required bool isNew}) {
    previousVitalsQuestionIndex.value = currentVitalsQuestionIndex.value;

    updateVitalsQuestionsIndex(
        vitalsQuestionsList![currentVitalsQuestionIndex.value]
            .next![0]
            .destElementId);
  }

  //SUBMIT BUTTON ACTION FOR VITALS QUESTIONS
  submitButtonActionsForVitalsQuestions(
      {required bool isNew, Elements? updatedElement}) async {
    Elements currentElement = isNew
        ? vitalsQuestionsList![currentVitalsQuestionIndex.value]
        : updatedElement!;

    ///CHECKS IF THE QUESTION IS MANDATORY AND THROWS WARNING
    if (currentElement.isMandatory == "true") {
      ///VALIDATIONS
      if (answerController.text.isEmpty) {
        showToast(
            "Please enter the ${currentElement.text}", ToastGravity.CENTER);
        return;
      }
    }

    ///ADDS DATA FOR VITALS QUESTION

    isNew
        ? addDataForVitalsQuestions(
            field: currentElement.text,
            answer: answerController.text,
            length: answerController.text.length)
        : updateDataForVitalsQuestions(
            field: updatedElement?.text,
            answer: answerController.text,
            length: answerController.text.length);

    update();
  }

  //ADDS ANSWER AND ATTACHMENTS IN THE EXISTING QUESTIONS LIST
  addDataForVitalsQuestions(
      {required String field,
      required String answer,
      required int length}) async {
    if (length > 0) {
      switch (field) {
        case "BP Systolic/Diastolic (mmhg)":
          if (answer.split('/').length != 2) {
            showToast("Please enter BP in xxx/xxx Format", ToastGravity.CENTER);
            return;
          }

          if (answer.split('/')[0].length != 2 &&
              answer.split('/')[0].length != 3) {
            showToast("Invalid Systolic value", ToastGravity.CENTER);
            return;
          }

          if (int.parse(answer.split('/')[0]) < 50) {
            showToast("Systolic value - Out of range", ToastGravity.CENTER);
            return;
          }

          if (int.parse(answer.split('/')[0]) > 180) {
            showToast("Systolic value - Out of range", ToastGravity.CENTER);
            return;
          }

          if (answer.split('/')[0].length != 2 &&
              answer.split('/')[0].length != 3) {
            showToast("Invalid Diastolic value", ToastGravity.CENTER);
            return;
          }

          if (int.parse(answer.split('/')[1]) < 50) {
            showToast("Diastolic value - Out of range", ToastGravity.CENTER);
            return;
          }

          if (int.parse(answer.split('/')[1]) > 120) {
            showToast("Diastolic value - Out of range", ToastGravity.CENTER);
            return;
          }

          break;
        case "Pulse (bpm)":
          // if (answer.length != 2 && answer.length != 3) {
          //   showToast("Invalid Pulse value.", ToastGravity.CENTER);
          //   return;
          // }

          if (int.parse(answer) < 50) {
            showToast("Pulse is too low.", ToastGravity.CENTER);
            return;
          }

          if (int.parse(answer) > 125) {
            showToast("Pulse is very high.", ToastGravity.CENTER);
            return;
          }

          break;
        case "Temperature (F)":
          // if (answer.length != 2 && answer.length != 3 && answer.length != 4 && answer.length != 5) {
          //   showToast("Invalid temperature value.", ToastGravity.CENTER);
          //   return;
          // }

          if (double.parse(answer) < 89) {
            showToast("Invalid temperature value.", ToastGravity.CENTER);
            return;
          }

          if (double.parse(answer) > 110) {
            showToast("Invalid temperature value.", ToastGravity.CENTER);
            return;
          }

          break;

        case "SPO2 %":
          if (double.parse(answer) < 89) {
            showToast("Invalid SPO2 % value.", ToastGravity.CENTER);
            return;
          }

          if (double.parse(answer) > 110) {
            showToast("Invalid SPO2 % value.", ToastGravity.CENTER);
            return;
          }

          // if (answer.length != 2 && answer.length != 3) {
          //   showToast("Invalid SPO2 % value.", ToastGravity.CENTER);
          //   return;
          // }

          break;
        case "Respiratory Rate":
          if (double.parse(answer) < 10) {
            showToast("Invalid Respiratory Rate value.", ToastGravity.CENTER);
            return;
          }

          if (double.parse(answer) > 26) {
            showToast("Invalid Respiratory Rate value.", ToastGravity.CENTER);
            return;
          }

          break;
        case "BGL(RBS) mg/dl":
          break;
        case "BGL(FBS) mg/dl":
          break;
        case "BGL(PPBS) mg/dl":
          break;
        case "Hemoglobin g/dl":
          if (double.parse(answer) < 1) {
            showToast("Invalid Hemoglobin value.", ToastGravity.CENTER);
            return;
          }

          if (double.parse(answer) > 30) {
            showToast("Invalid Hemoglobin value.", ToastGravity.CENTER);
            return;
          }
          break;
        default:
          break;
      }
    }

    final finalText = filterText(questionText: field);

    ///SAVE THE AUDIO RELATED TO EACH QUESTION
    audioFileController.trimAndSaveAudio(key: finalText);

    ///UPDATES ALL THE PERSONAL QUESTIONS DATA
    for (Elements element in vitalsQuestionsList!) {
      if (element.text == field) {
        element.answer = answer;
        element.attachments = attachments;
      }
    }

    ///UPDATES INDEX FOR THE UI
    updateNextVitalQuestionIndex();

    ///UPDATES DATA IN USER VITALS INFO
    vitalsController.updateVitalsDetails(field: field, response: answer);

    ///UPDATE ATTACHMENTS TO THE MAIN DATA COLLECTION POINT IN ATTACHMENT CONTROLLER
    addSingleFilesToTheCollection(key: field, attachments: attachments);

    ///LOAD VITALS QUESTIONS
    questionsController.loadVitalsQuestionsFlow(isNew: true);

    ///CHECKS VITALS SCORE AND UPDATE COLORS
    checkVitalsScore();

    update();
  }

  //UPDATES ANSWER AND ATTACHMENTS IN THE EXISTING QUESTIONS LIST
  updateDataForVitalsQuestions(
      {required String field,
      required String answer,
      required int length}) async {
    if (length > 0) {
      switch (field) {
        case "BP Systolic/Diastolic (mmhg)":
          if (answer.split('/').length != 2) {
            showToast("Please enter BP in xxx/xxx Format", ToastGravity.CENTER);
            return;
          }

          if (answer.split('/')[0].length != 2 &&
              answer.split('/')[0].length != 3) {
            showToast("Invalid Systolic value", ToastGravity.CENTER);
            return;
          }

          if (int.parse(answer.split('/')[0]) < 50) {
            showToast("Systolic value - Out of range", ToastGravity.CENTER);
            return;
          }

          if (int.parse(answer.split('/')[0]) > 180) {
            showToast("Systolic value - Out of range", ToastGravity.CENTER);
            return;
          }

          if (answer.split('/')[0].length != 2 &&
              answer.split('/')[0].length != 3) {
            showToast("Invalid Diastolic value", ToastGravity.CENTER);
            return;
          }

          if (int.parse(answer.split('/')[1]) < 50) {
            showToast("Diastolic value - Out of range", ToastGravity.CENTER);
            return;
          }

          if (int.parse(answer.split('/')[1]) > 120) {
            showToast("Diastolic value - Out of range", ToastGravity.CENTER);
            return;
          }

          break;
        case "Pulse (bpm)":
          // if (answer.length != 2 && answer.length != 3) {
          //   showToast("Invalid Pulse value.", ToastGravity.CENTER);
          //   return;
          // }

          if (int.parse(answer) < 50) {
            showToast("Pulse is too low.", ToastGravity.CENTER);
            return;
          }

          if (int.parse(answer) > 125) {
            showToast("Pulse is very high.", ToastGravity.CENTER);
            return;
          }

          break;
        case "Temperature (F)":
          // if (answer.length != 2 && answer.length != 3 && answer.length != 4 && answer.length != 5) {
          //   showToast("Invalid temperature value.", ToastGravity.CENTER);
          //   return;
          // }

          if (double.parse(answer) < 89) {
            showToast("Invalid temperature value.", ToastGravity.CENTER);
            return;
          }

          if (double.parse(answer) > 110) {
            showToast("Invalid temperature value.", ToastGravity.CENTER);
            return;
          }

          break;

        case "SPO2 %":
          if (double.parse(answer) < 89) {
            showToast("Invalid SPO2 % value.", ToastGravity.CENTER);
            return;
          }

          if (double.parse(answer) > 110) {
            showToast("Invalid SPO2 % value.", ToastGravity.CENTER);
            return;
          }

          // if (answer.length != 2 && answer.length != 3) {
          //   showToast("Invalid SPO2 % value.", ToastGravity.CENTER);
          //   return;
          // }

          break;
        case "Respiratory Rate":
          if (double.parse(answer) < 10) {
            showToast("Invalid Respiratory Rate value.", ToastGravity.CENTER);
            return;
          }

          if (double.parse(answer) > 26) {
            showToast("Invalid Respiratory Rate value.", ToastGravity.CENTER);
            return;
          }

          break;
        case "BGL(RBS) mg/dl":
          break;
        case "BGL(FBS) mg/dl":
          break;
        case "BGL(PPBS) mg/dl":
          break;
        case "Hemoglobin g/dl":
          if (double.parse(answer) < 1) {
            showToast("Invalid Hemoglobin value.", ToastGravity.CENTER);
            return;
          }

          if (double.parse(answer) > 30) {
            showToast("Invalid Hemoglobin value.", ToastGravity.CENTER);
            return;
          }
          break;
        default:
          break;
      }
    }

    ///UPDATES ALL THE PERSONAL QUESTIONS DATA
    for (Elements element in vitalsQuestionsList!) {
      if (element.text == field) {
        element.answer = answer;
      }
    }

    ///UPDATES DATA IN USER VITALS INFO
    vitalsController.updateVitalsDetails(field: field, response: answer);

    ///CHECKS VITALS SCORE AND UPDATE COLORS
    checkVitalsScore();

    ///REGULAR FIELDS
    answerController.clear();
    attachments.clear();

    ///OPTIONS FIELDS
    optionsChoiceTag.value = "";
    optionsChoiceIndex.value = -1;

    update();
    Get.back();
  }

  ///VITALS VALIDATION VALUES
  //BP
  RxBool bloodPressureSystolicNormal = false.obs;
  RxBool bloodPressureDiastolicNormal = false.obs;
  //PULSE
  RxBool pulseNormal = false.obs;
  //RESPIRATORY
  RxBool respiratoryRateNormal = false.obs;
  //TEMPERATURE
  RxBool temperatureNormal = false.obs;
  //SPO2
  RxBool spo2Normal = false.obs;

  vitalsValidation() {}

  ///TODO
  checkVitalsScore() async {
    List bloodPressure = vitalsController.vitalsQuestionsModel.bp.split("/");

    int pulse = int.tryParse(vitalsController.vitalsQuestionsModel.pulse) ?? 0;
    int respiratoryRate =
        int.tryParse(vitalsController.vitalsQuestionsModel.respiratoryRate) ??
            0;
    int bloodPressureSystolic = int.tryParse(bloodPressure[0]) ?? 0;
    int bloodPressureDiastolic = int.tryParse(bloodPressure[1]) ?? 0;
    double temperature =
        double.tryParse(vitalsController.vitalsQuestionsModel.temperature) ??
            0.0;
    int spo2 = int.tryParse(vitalsController.vitalsQuestionsModel.spo2) ?? 0;

    int choice = 0;

    double ageInt = double.parse(userController.personalQuestionsModel.age!);

    if (36.3 <= temperature && temperature < 37.5) {
      temperatureNormal.value = true;
    }

    if (95 < spo2 && spo2 < 100) {
      spo2Normal.value = true;
    }

    if (0.1 < ageInt && ageInt < 0.7) {
      choice = 1;
    }
    if (0.7 < ageInt && ageInt < 1) {
      choice = 2;
    }
    if (1 < ageInt && ageInt < 7) {
      choice = 3;
    }
    if (6 < ageInt && ageInt < 13) {
      choice = 4;
    }
    if (12 < ageInt && ageInt < 19) {
      choice = 5;
    }
    if (18 < ageInt) {
      choice = 6;
    }

    switch (choice) {
      case 1:
        if (100 <= pulse && pulse <= 160) {
          pulseNormal.value = true;
        }
        if (30 <= respiratoryRate && respiratoryRate <= 60) {
          respiratoryRateNormal.value = true;
        }
        if (65 <= bloodPressureSystolic && bloodPressureSystolic <= 90) {
          bloodPressureSystolicNormal.value = true;
        }
        if (45 <= bloodPressureDiastolic && bloodPressureDiastolic <= 65) {
          bloodPressureDiastolicNormal.value = true;
        }
        break;
      case 2:
        if (100 <= pulse && pulse <= 160) {
          pulseNormal.value = true;
        }
        if (24 <= respiratoryRate && respiratoryRate <= 30) {
          respiratoryRateNormal.value = true;
        }
        if (80 <= bloodPressureSystolic && bloodPressureSystolic <= 100) {
          bloodPressureSystolicNormal.value = true;
        }
        if (55 <= bloodPressureDiastolic && bloodPressureDiastolic <= 65) {
          bloodPressureDiastolicNormal.value = true;
        }
        break;
      case 3:
        if (70 <= pulse && pulse <= 120) {
          pulseNormal.value = true;
        }
        if (20 <= respiratoryRate && respiratoryRate <= 30) {
          respiratoryRateNormal.value = true;
        }
        if (90 <= bloodPressureSystolic && bloodPressureSystolic <= 110) {
          bloodPressureSystolicNormal.value = true;
        }
        if (55 <= bloodPressureDiastolic && bloodPressureDiastolic <= 75) {
          bloodPressureDiastolicNormal.value = true;
        }
        break;
      case 4:
        if (70 <= pulse && pulse <= 120) {
          pulseNormal.value = true;
        }
        if (12 <= respiratoryRate && respiratoryRate <= 20) {
          respiratoryRateNormal.value = true;
        }
        if (90 <= bloodPressureSystolic && bloodPressureSystolic <= 110) {
          bloodPressureSystolicNormal.value = true;
        }
        if (55 <= bloodPressureDiastolic && bloodPressureDiastolic <= 75) {
          bloodPressureDiastolicNormal.value = true;
        }
        break;
      case 5:
        if (60 < pulse && pulse < 100) {
          pulseNormal.value = true;
        }
        if (12 <= respiratoryRate && respiratoryRate <= 18) {
          respiratoryRateNormal.value = true;
        }
        if (109 < bloodPressureSystolic && bloodPressureSystolic < 136) {
          bloodPressureSystolicNormal.value = true;
        }
        if (64 < bloodPressureDiastolic && bloodPressureDiastolic < 86) {
          bloodPressureDiastolicNormal.value = true;
        }
        break;
      case 6:
        if (60 <= pulse && pulse <= 100) {
          pulseNormal.value = true;
        }
        if (12 <= respiratoryRate && respiratoryRate <= 18) {
          respiratoryRateNormal.value = true;
        }
        if (119 < bloodPressureSystolic && bloodPressureSystolic < 121) {
          bloodPressureSystolicNormal.value = true;
        }
        if (79 < bloodPressureDiastolic && bloodPressureDiastolic < 81) {
          bloodPressureDiastolicNormal.value = true;
        }
        break;
    }

    update();
  }

  ///END OF VITALS FLOW LOGIC

  //

  ///START OF FILTERED FLOW LOGIC

  //GO TO PREVIOUS FILTERED QUESTION
  goToPreviousFilteredQuestion() async {
    try {
      Elements currentElement =
          filteredQuestionsList![currentFilteredQuestionIndex.value];
      currentFilteredQuestionIndex.value = currentElement.previousQuestionIndex;

      ///LOADS THE ANSWER FOR PREVIOUS QUESTION
      preLoadAnswersForEditing(
          currentElement:
              filteredQuestionsList![currentElement.previousQuestionIndex]);

      final finalText = filterText(
          questionText:
              filteredQuestionsList![currentElement.previousQuestionIndex]
                  .text);

      ///SAVE THE AUDIO RELATED TO EACH QUESTION
      audioFileController.trimAndSaveAudio(key: finalText);

      downgradePreviousFilteredQuestionIndex();

      update();
    } catch (error) {
      debugPrint("$error");
    }
  }

  ///UPDATE FLOW STATUS MAIN CUSTOM - TO NAVIGATE BETWEEN SET OF QUESTIONS
  updateFlowStatusMainCustom({required int flowStatus}) {
    questionsFlowMain.value = flowStatus;
    update();
  }

  //LOADS ALL THE VITAL QUESTIONS
  updateFilteredQuestionFlowAndRecordingStatus() async {
    ///UPDATES QUESTION FLOW MAIN INDEX
    questionsFlowMain.value = 3;
    accountOverallPercentage.value = 100;
    currentFilteredQuestionIndex.value = 0;

    update();
  }

  //UPDATES FILTERED QUESTIONS INDEX
  updateFilteredQuestionsIndex(destinationElementId) {
    if (destinationElementId != filteredQuestionsList!.last.id) {
      for (int index = 0; index <= filteredQuestionsList!.length - 2; index++) {
        if (destinationElementId == filteredQuestionsList![index].id) {
          ///UPDATES PREVIOUS QUESTION INDEX VALUE
          filteredQuestionsList![index].previousQuestionIndex =
              previousFilteredQuestionIndex.value;

          ///UPDATES NEXT QUESTION INDEX VALUE
          currentFilteredQuestionIndex.value = index;

          ///LOAD DATA IN THE QUESTION FIELDS
          if (filteredQuestionsList![index].answer != "" &&
              filteredQuestionsList![index].answer != null) {
            ///REGULAR FIELDS
            answerController.clear();
            attachments.clear();

            ///OPTIONS FIELDS
            optionsChoiceTag.value = "";
            optionsChoiceIndex.value = -1;

            ///MULTI OPTIONS FIELD
            multiOptionsString.value = "";
            multiOptionsStringList = [];

            ///CLEARS THE FIELDS
            questionsController.answerYearsController.clear();
            questionsController.answerMonthsController.clear();
            questionsController.answerDaysController.clear();

            ///PRE LOAD ANSWERS IN THE FIELD
            preLoadAnswersForEditing(
                currentElement: filteredQuestionsList![index]);
          } else {
            ///REGULAR FIELDS
            answerController.clear();
            attachments.clear();

            ///CLEARS THE FIELDS
            questionsController.answerYearsController.clear();
            questionsController.answerMonthsController.clear();
            questionsController.answerDaysController.clear();

            ///OPTIONS FIELDS
            optionsChoiceTag.value = "";
            optionsChoiceIndex.value = -1;

            ///MULTI OPTIONS FIELD
            multiOptionsString.value = "";
            multiOptionsStringList = [];
          }

          update();
        }
      }
    } else {
      ///UPDATES FLOW STATUS AND STOP RECORDING
      updateFilteredQuestionFlowAndRecordingStatus();

      ///REGULAR FIELDS
      answerController.clear();
      attachments.clear();

      ///CLEARS THE FIELDS
      questionsController.answerYearsController.clear();
      questionsController.answerMonthsController.clear();
      questionsController.answerDaysController.clear();

      ///OPTIONS FIELDS
      optionsChoiceTag.value = "";
      optionsChoiceIndex.value = -1;

      ///MULTI OPTIONS FIELD
      multiOptionsString.value = "";
      multiOptionsStringList = [];
    }

    update();
  }

  //FOR FILTERED QUESTIONS WITH CHOICES
  loadFilteredQuestionsForChoices() {
    previousFilteredQuestionIndex.value = currentFilteredQuestionIndex.value;

    switch (optionsChoiceIndex.value) {
      case 0:
        updateFilteredQuestionsIndex(
            filteredQuestionsList![currentFilteredQuestionIndex.value]
                .next![0]
                .destElementId);
        break;

      case 1:
        updateFilteredQuestionsIndex(
            filteredQuestionsList![currentFilteredQuestionIndex.value]
                .next![1]
                .destElementId);
        break;

      case 2:
        updateFilteredQuestionsIndex(
            filteredQuestionsList![currentFilteredQuestionIndex.value]
                .next![2]
                .destElementId);
        break;
      case 3:
        updateFilteredQuestionsIndex(
            filteredQuestionsList![currentFilteredQuestionIndex.value]
                .next![3]
                .destElementId);
        break;

      default:
        updateFilteredQuestionsIndex(
            filteredQuestionsList![currentFilteredQuestionIndex.value]
                .next![1]
                .destElementId);
        break;
    }
  }

  //FOR FILTERED QUESTIONS WITH CHOICES
  loadFilteredQuestionsForChoicesCustom() {
    previousFilteredQuestionIndex.value = currentFilteredQuestionIndex.value;
    switch (0) {
      case 0:
        updateFilteredQuestionsIndex(
            filteredQuestionsList![currentFilteredQuestionIndex.value]
                .next![0]
                .destElementId);
        break;
    }
  }

  //SUBMIT BUTTON ACTION FOR FILTERED QUESTIONS
  submitButtonActionsForFilteredQuestions(
      {required bool isNew, Elements? updatedElement}) async {
    Elements currentElement = isNew
        ? filteredQuestionsList![
            questionsController.currentFilteredQuestionIndex.value]
        : updatedElement!;

    switch (currentElement.selectedMode) {
      case "text":

        ///CHECKS IF THE QUESTION IS MANDATORY AND THROWS WARNING
        if (currentElement.isMandatory == "true") {
          ///VALIDATIONS
          if (answerController.text.isEmpty) {
            showToast(
                "Please enter the ${currentElement.text}", ToastGravity.CENTER);
            return;
          }
        }

        ///UPDATES ANSWER AND OTHER FIELDS
        isNew
            ? addDataForFilteredQuestions(
                field: currentElement.text, answer: answerController.text)
            : updateDataForFilteredQuestions(
                field: currentElement?.text, answer: answerController.text);

        break;

      case "numeric":

        ///CHECKS IF THE QUESTION IS MANDATORY AND THROWS WARNING
        if (currentElement.isMandatory == "true") {
          ///VALIDATIONS
          if (answerController.text.isEmpty) {
            showToast(
                "Please enter the ${currentElement.text}", ToastGravity.CENTER);
            return;
          }
        }

        ///UPDATES ANSWER AND OTHER FIELDS
        isNew
            ? addDataForFilteredQuestions(
                field: currentElement.text, answer: answerController.text)
            : updateDataForFilteredQuestions(
                field: currentElement?.text, answer: answerController.text);

        break;

      case "date":

        ///CHECKS IF THE QUESTION IS MANDATORY AND THROWS WARNING
        if (currentElement.isMandatory == "true") {
          ///VALIDATIONS
          if (answerController.text.isEmpty) {
            showToast(
                "Please enter the ${currentElement.text}", ToastGravity.CENTER);
            return;
          }
        }

        ///UPDATES ANSWER AND OTHER FIELDS
        isNew
            ? addDataForFilteredQuestions(
                field: currentElement.text, answer: answerController.text)
            : updateDataForFilteredQuestions(
                field: currentElement.text, answer: answerController.text);
        break;

      case "dateTime":

        ///ASSIGNING BY DEFAULT
        final defaultDateString = DateFormat('MMM dd, yyyy hh:mm:ss a').format(
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 0, 0, 0));

        if (answerController.text.isEmpty) {
          answerController.text = defaultDateString;
        }

        ///UPDATES ANSWER AND OTHER FIELDS
        isNew
            ? addDataForFilteredQuestions(
                field: currentElement.text, answer: answerController.text)
            : updateDataForFilteredQuestions(
                field: currentElement.text, answer: answerController.text);

        break;

      case "duration":

        ///CHECKS IF THE QUESTION IS MANDATORY AND THROWS WARNING
        if (currentElement.isMandatory == "true") {
          ///VALIDATIONS
          if (answerController.text.isEmpty) {
            showToast(
                "Please enter the ${currentElement.text}", ToastGravity.CENTER);
            return;
          }
        }

        String finalAnswer =
            '${answerController.text} ${questionsController.selectedDateRangeFormat.value}';

        ///UPDATES ANSWER AND OTHER FIELDS
        isNew
            ? addDataForFilteredQuestions(
                field: currentElement.text, answer: finalAnswer)
            : updateDataForFilteredQuestions(
                field: currentElement.text, answer: finalAnswer);

        break;

      case "options":

        ///CHECKS IF THE QUESTION IS MANDATORY AND THROWS WARNING
        if (currentElement.isMandatory == "true") {
          ///VALIDATIONS
          if (optionsChoiceTag.value == "") {
            showToast("Please choose the ${currentElement.text}",
                ToastGravity.CENTER);
            return;
          }
        }

        ///UPDATES ANSWER AND OTHER FIELDS
        isNew
            ? addDataForFilteredQuestions(
                field: currentElement.text, answer: optionsChoiceTag.value)
            : updateDataForFilteredQuestions(
                field: currentElement?.text, answer: optionsChoiceTag.value);

        break;

      case "multiOptions":
        if (currentElement.isMandatory == "true") {
          ///VALIDATIONS
          if (multiOptionsString.value == "" &&
              multiOptionsString.value == null) {
            showToast("Please select the ${currentElement.text}",
                ToastGravity.CENTER);
            return;
          }

          ///VALIDATIONS
          if (multiOptionsStringList.length == 0 &&
              multiOptionsString.isEmpty) {
            showToast("Please select the ${currentElement.text}",
                ToastGravity.CENTER);
            return;
          }
        }

        ///UPDATES ANSWER AND OTHER FIELDS
        isNew
            ? addDataForFilteredQuestions(
                field: currentElement.text, answer: multiOptionsString.value)
            : updateDataForFilteredQuestions(
                field: currentElement?.text, answer: multiOptionsString.value);

        break;

      default:

        ///CHECKS IF THE QUESTION IS MANDATORY AND THROWS WARNING
        if (currentElement.isMandatory == "true") {
          ///VALIDATIONS
          if (answerController.text.isEmpty) {
            showToast(
                "Please enter the ${currentElement.text}", ToastGravity.CENTER);
            return;
          }
        }

        ///UPDATES ANSWER AND OTHER FIELDS
        isNew
            ? addDataForFilteredQuestions(
                field: currentElement.text, answer: answerController.text)
            : updateDataForFilteredQuestions(
                field: currentElement?.text, answer: answerController.text);
        break;
    }

    update();
  }

  //ADDS ANSWER AND ATTACHMENTS IN THE EXISTING QUESTIONS LIST
  addDataForFilteredQuestions(
      {required String field, required String answer}) async {
    final finalText = filterText(questionText: field);

    ///SAVE THE AUDIO RELATED TO EACH QUESTION
    audioFileController.trimAndSaveAudio(key: finalText);

    ///UPDATES ALL THE FILTERED QUESTIONS DATA
    for (Elements element in filteredQuestionsList!) {
      if (element.text == field) {
        element.answer = answer;
        element.attachments = attachments;
      }
    }

    ///UPDATES QUESTION NUMBER FOR THE UI
    updateNextFilteredQuestionIndex();

    ///UPDATE ATTACHMENTS TO THE MAIN DATA COLLECTION POINT IN ATTACHMENT CONTROLLER
    addSingleFilesToTheCollection(key: field, attachments: attachments);

    ///CHECKS IF THE QUESTION HAS A CONDITIONAL FLOW OR MULTI OPTIONS BASED ON NEXT'S INDEX VALUE
    if (filteredQuestionsList![currentFilteredQuestionIndex.value]
            .next!
            .length ==
        1) {
      questionsController.loadFilteredQuestionsForChoicesCustom();
    } else {
      questionsController.loadFilteredQuestionsForChoices();
    }

    ///UPDATES DATA FOR PASSING IN PREVIOUS APPLICATION
    userController.updateFilteredQuestionsDetails(field: field, answer: answer);

    update();
  }

  //UPDATES ANSWER AND ATTACHMENTS IN THE EXISTING QUESTIONS LIST
  updateDataForFilteredQuestions(
      {required String field, required String answer}) async {
    ///UPDATES ALL THE PERSONAL QUESTIONS DATA
    for (Elements element in filteredQuestionsList!) {
      if (element.text == field) {
        element.answer = answer;
      }
    }

    ///UPDATES DATA FOR PASSING IN PREVIOUS APPLICATION
    userController.updateFilteredQuestionsDetails(field: field, answer: answer);

    ///REGULAR FIELDS
    answerController.clear();
    attachments.clear();

    ///OPTIONS FIELDS
    optionsChoiceTag.value = "";
    optionsChoiceIndex.value = -1;

    ///MULTI OPTIONS FIELD
    multiOptionsString.value = "";
    multiOptionsStringList = [];

    update();
    Get.back();
  }

  //UPDATE OPTIONS SINGLE STRING TO
  updateListToStringForMultiOptions({List<String>? selectedOptions}) {
    String finalSelectedOptions = "";

    for (int i = 0; i < selectedOptions!.length; i++) {
      if (i == selectedOptions!.length - 1) {
        finalSelectedOptions = "$finalSelectedOptions${selectedOptions[i]}";
      } else {
        finalSelectedOptions = "$finalSelectedOptions${selectedOptions[i]}#";
      }
    }

    multiOptionsStringList = selectedOptions!;
    multiOptionsString.value = finalSelectedOptions.replaceAll("\t", "");
    update();
  }

  //ADDITIONAL FUNCTIONS TO FETCH ALL FILTERED QUESTIONS - GET FILTERED QUESTIONS BASED ON THE FILTER
  getFilteredQuestionsBasedOnTheAgeAndGenderFilter() {
    try {
      for (QuestionsMain questionsMain in allQuestionsList!) {
        //"" or "male" or "female" , inputs are always "male" and "female"
        if (questionsMain.gender == selectedGender.value) {
          if (double.parse(selectedAge.value) >=
                  double.parse(questionsMain.startAge) &&
              double.parse(selectedAge.value) <=
                  double.parse(questionsMain.endAge)) {
            filteredQuestionsList = questionsMain.elements;
          }
        }
      }

      ///UPDATES CATEGORIES LIST AND MAP
      getCategoriesLength(filteredQuestionsList);

      update();
    } catch (error) {
      print("UNABLE TO FILTERED QUESTIONS $error");
    }
  }

  //GETS ALL THE CATEGORIES LENGTH IN THE FILTERED QUESTIONS
  getCategoriesLength(listOfElements) {
    List<String> filteredCategoryListLocal = [];

    Map<String, int>? filteredCategoryListMapLocal;

    for (Elements element in listOfElements!) {
      filteredCategoryListLocal.add(element.selectedGroup);
    }

    filteredCategoryListMapLocal = filteredCategoryList.fold<Map<String, int>>(
        {},
        (Map<String, int> counts, String value) =>
            counts..update(value, (count) => count + 1, ifAbsent: () => 1));

    filteredCategoryList = filteredCategoryListLocal.toSet().toList();
    filteredCategoryListMap = filteredCategoryListMapLocal;

    print(filteredCategoryList.toSet().toList());
    print(filteredCategoryListMap);

    update();
  }

  ///END OF FILTERED FLOW LOGIC

  //

  ///ADDS ALL THE DOCUMENTS TO THE LIST WITH THE KEY AND DOCUMENT AS SEPARATE DOCUMENTS
  addSingleFilesToTheCollection({
    required String key,
    required List attachments,
  }) {
    if (attachments.isNotEmpty) {
      for (var attachment in attachments) {
        attachmentsController.addDataToMainAttachments(
            key: key, path: attachment);
      }
    }

    update();
  }

  ///FINAL SUBMIT BUTTON - FOR FLUTTER
  finalSubmitButtonActionFlutter() async {
    ///UPDATES LOADING STATUS
    updateLoadingStatusQuestions();

    ///SAVE THE AUDIO RELATED TO EACH QUESTION
    audioFileController.trimAndSaveAudio(key: "ADDITIONAL_AUDIO");

    ///STOPS RECORDING AND SAVES DATA
    audioFileController.stopRecord();

    ///WITH A DELAY OF 2 SECONDS - UPLOADS DATA TO AWS AND NAVIGATES TO NEXT SCREEN
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        await Future.delayed(const Duration(seconds: 2));

        var jsonObj = json.encode(finalResponse);

        ///YOUR BLOCK OF CODE
        Get.to(() => ConfirmPage(jsonObj: jsonObj));

        await Future.delayed(const Duration(seconds: 5));
        // Kill the Flutter engine and clear data
        //DefaultCacheManager().emptyCache();
      },
    );
  }

  ///FINAL SUBMIT BUTTON - NATIVE ANDROID
  finalSubmitButtonActionNativeAndroid() async {
    ///UPDATES LOADING STATUS
    updateLoadingStatusQuestions();
    preConsultationController.updateLoadingStatusPermissionsPage();

    try {
      ///SAVE THE AUDIO RELATED TO EACH QUESTION
      audioFileController.trimAndSaveAudio(key: "ADDITIONAL_AUDIO");

      ///STOPS RECORDING AND SAVES DATA
      audioFileController.stopRecord();

      ///WITH A DELAY OF 2 SECONDS - UPLOADS DATA TO AWS AND NAVIGATES TO NEXT SCREEN
      Future.delayed(
        const Duration(seconds: 1),
        () async {
          const platform =
              MethodChannel('com.axiphyl.preconsult/preconsultData');

          ///METHOD CALL TO CALL NATIVE JAVA METHOD
          var obj = json.encode(finalResponse);

          platform.invokeMethod("preConsultationData", obj);

          Get.offAll(() => const PreConsultationModuleMain());

          ///POPS FROM FLUTTER MODULE AND NAVIGATES TO NATIVE ANDROID SUMMARY PAGE
          SystemNavigator.pop();
        },
      );
    } catch (error) {
      ///WITH A DELAY OF 2 SECONDS - UPLOADS DATA TO AWS AND NAVIGATES TO NEXT SCREEN
      Future.delayed(
        const Duration(seconds: 1),
        () async {
          const platform =
              MethodChannel('com.axiphyl.preconsult/preconsultData');

          ///METHOD CALL TO CALL NATIVE JAVA METHOD
          var obj = json.encode(finalResponse);

          platform.invokeMethod("preConsultationData", obj);

          Get.offAll(() => const PreConsultationModuleMain());

          ///POPS FROM FLUTTER MODULE AND NAVIGATES TO NATIVE ANDROID SUMMARY PAGE
          SystemNavigator.pop();
        },
      );

      debugPrint("AUDIO NOT SAVED AND NAVIGATING TO SUMMARY PAGE");
    }
  }

  ///HIDES OR CLOSES KEYBOARD
  closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  ///PRE-LOAD ANSWER FOR EDITING
  preLoadAnswersForEditing({required Elements currentElement}) {
    switch (currentElement.selectedMode) {
      case "text":
        if (currentElement.answer != null && currentElement.answer != "") {
          answerController.text = currentElement.answer!;
        }

        break;

      case "numeric":
        if (currentElement.answer != null && currentElement.answer != "") {
          if (currentElement.text == "Age") {
            double combinedDate = double.parse(currentElement.answer!);

            int years =
                combinedDate.toInt(); //Extract the integer part as years
            double remainingMonthsAndDays =
                combinedDate - years; //Get the fractional part

            int months = (remainingMonthsAndDays * 12)
                .toInt(); //Convert months to an integer
            double remainingDays = (remainingMonthsAndDays * 12 - months) *
                30; //Convert remaining months to days

            int days = remainingDays.toInt(); //Convert days to an integer

            answerDaysController.text = days.toString();
            answerMonthsController.text = months.toString();
            answerYearsController.text = years.toString();
          } else {
            answerController.text = currentElement.answer!;
          }
        }

        break;

      case "date":
        if (currentElement.answer != null && currentElement.answer != "") {
          DateTime date =
              DateFormat("dd MMM yyyy").parse(currentElement.answer!);

          int days = date.day;
          int months = date.month;
          int years = date.year;

          answerDaysController.text = days.toString();
          answerMonthsController.text = months.toString();
          answerYearsController.text = years.toString();
        } else {
          answerDaysController.text = "0";
          answerMonthsController.text = "0";
          answerYearsController.text = "0";
        }

        break;

      case "duration":
        if (currentElement.answer != null && currentElement.answer != "") {
          if (currentElement.answer!.split(" ").length != 0) {
            answerController.text = currentElement.answer!.split(" ")[0];
            questionsController.selectedDateRangeFormat.value =
                currentElement.answer!.split(" ")[1].toLowerCase();
          }
        }
        break;

      case "options":
        if (currentElement.answer != null && currentElement.answer != "") {
          List optionsList = currentElement.options!.split("/");

          for (int index = 0; index < optionsList.length; index++) {
            if (optionsList[index] == currentElement.answer) {
              optionsChoiceTag.value = optionsList[index];
              optionsChoiceIndex.value = index;
            }
          }
        }

        break;

      case "multiOptions":
        if (currentElement.answer != null && currentElement.answer != "") {
          multiOptionsString.value = currentElement.answer!;
          multiOptionsStringList = currentElement.answer!.split("#");
        }

        break;

      default:
        if (currentElement.answer != null && currentElement.answer != "") {
          answerController.text = currentElement.answer!;
        }
        break;
    }

    update();
  }

  ///FILTER TEXT
  filterText({required String questionText}) {
    final filteredText = questionText
        .replaceAll("/", "_")
        .replaceAll(" ", "_")
        .replaceAll("'", "_")
        .replaceAll("?", "_")
        .replaceAll("(", "_")
        .replaceAll(")", "_");
    return filteredText;
  }
}

//.....................................................................................................

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:medongosupport/preConsultModule/globals.dart' as globals;
// import 'package:medongosupport/preConsultModule/models/questionsModel.dart';
// import 'package:medongosupport/preConsultModule/services/questionsServices.dart';
//
//
// final QuestionsController questionsController = Get.find<QuestionsController>();
//
// class QuestionsController extends GetxController{
//
//   ///INSTANCE OF QUESTIONS SERVICE CLASS
//   QuestionsService questionsService = QuestionsService();
//
//   ///
//   List<QuestionsMain>? personalQuestionsList;
//
//
//
//
//   ///
//   Future getPersonalQuestions() async {
//
//     try{
//       ///
//       personalQuestionsList = await questionsService.getPersonalQuestionsFromDb();
//       update();
//     }catch(error){
//      print("GET PERSONAL QUESTIONS ERROR - $error");
//     }
//   }
//
// }
