// To parse this JSON data, do
//
//     final consultation = consultationFromJson(jsonString);

import 'dart:convert';

Consultation consultationFromJson(String str) =>
    Consultation.fromJson(json.decode(str));

//String consultationToJson(Consultation data) => json.encode(data.toJson());

class Consultation {
  bool? actualConsult;
  bool? admitStatus;
  String? allergy;
  String? captureType;
  List<AllergyList>? allergyList;
  AncDataList? ancDataList;
  AnemiaData? anemiaData;
  int? anemiaLevel;
  bool? anemiavisitForFollowp;
  bool? anemicOrPregnant;
  String? appDateTime;
  String? apptId;
  bool? bedAssigned;
  bool? billCollected;
  ChronicalDisease? chronicalDisease;
  String? clinicId;
  int? consultType;
  int? consultationStatus;
  String? createdByUserPartyId;
  String? currentIllness;
  String? currentIllnessList;
  List<Datametrics>? datametrices;
  String? depressionProblem;
  String? depressionProblem1;
  String? dewomingGiven;
  List<DiagnosisList>? diagnosisList;
  String? doctorAdvice;
  bool? doctorCreated;
  String? doctorNote;
  List<DocumentsList>? documentsList;
  bool? dressingDone;
  bool? dressingRequired;
  List<EprescriptionList>? eprescriptionList;
  String? expectedDeliveryDate;
  FamilyData? familyData;
  bool? familyPlanningServiceAvailed;
  bool? firstTime;
  String? followupDate;
  bool? forLabor;
  String? functionalFlag;
  String? healthEducationRequired;
  ImmunizationList? immunizationList;
  bool? inAnemiaFollwUp;
  bool? inFollwUp;
  bool? isDeceased;
  bool? isTabBasedTeleConsult;
  String? lastBreastScreeningDate;
  String? lastCervicalScreenigDate;
  String? lastDeliveryPlace;
  String? lastDeliverydate;
  String? lastDepressionScreenigDate;
  String? lastDewormingHistoryDate;
  String? lastOralScreeningDate;
  String? lastVisionScreeningDate;
  String? lmp;
  String? localId;
  var locationLat;
  var locationLong;
  bool? malnourishedSaMorMam;
  int? malnutritionLevel;
  MedicineDispenseData? medicineDispenseData;
  ImmunizationList? medicineDispenseDataDeleted;
  bool? medicineGiven;
  String? medongoId;
  String? familyId;
  String? miscarriages;
  String? natureOfPhyWork;
  String? numOfDeliveries;
  String? numOfPregnancy;
  String? numOfStillbirths;
  ImmunizationList? omronWeightDto;
  String? partnerPartyId;
  String? pastIllness;
  String? pastIllnessList;
  int? patAge;
  PatientData? patientData;
  PncVisitList? pncVisitList;
  bool? pregnancy;
  String? prescPdfPath;
  bool? printPending;
  int? pushFlag;
  Referrals? referrals;
  ScoresData? scoresData;
  ScreeningHistory? screeningHistory;
  bool? serverPushflag;
  int? shift;
  String? siteName;
  List<SnomedCtCodeList>? snomedCtCodeList;
  SocialLife? socialLife;
  String? surgicalHistory;
  List<SymptomsList>? symptomsList;
  int? tabFlag;
  bool? teleConsult;
  String? termination;
  List<dynamic>? testList;
  String? trimester;
  bool? visitForFollowp;
  VitalsData? vitalsData;
  int? zscore;

  Consultation({
    this.actualConsult,
    this.admitStatus,
    this.allergy,
    this.captureType,
    this.allergyList,
    this.ancDataList,
    this.anemiaData,
    this.anemiaLevel,
    this.anemiavisitForFollowp,
    this.anemicOrPregnant,
    this.appDateTime,
    this.apptId,
    this.bedAssigned,
    this.billCollected,
    this.chronicalDisease,
    this.clinicId,
    this.consultType,
    this.consultationStatus,
    this.createdByUserPartyId,
    this.currentIllness,
    this.currentIllnessList,
    this.datametrices,
    this.depressionProblem,
    this.depressionProblem1,
    this.dewomingGiven,
    this.diagnosisList,
    this.doctorAdvice,
    this.doctorCreated,
    this.doctorNote,
    this.documentsList,
    this.dressingDone,
    this.dressingRequired,
    this.eprescriptionList,
    this.expectedDeliveryDate,
    this.familyData,
    this.familyPlanningServiceAvailed,
    this.firstTime,
    this.followupDate,
    this.forLabor,
    this.functionalFlag,
    this.healthEducationRequired,
    this.immunizationList,
    this.inAnemiaFollwUp,
    this.inFollwUp,
    this.isDeceased,
    this.isTabBasedTeleConsult,
    this.lastBreastScreeningDate,
    this.lastCervicalScreenigDate,
    this.lastDeliveryPlace,
    this.lastDeliverydate,
    this.lastDepressionScreenigDate,
    this.lastDewormingHistoryDate,
    this.lastOralScreeningDate,
    this.lastVisionScreeningDate,
    this.lmp,
    this.localId,
    this.locationLat,
    this.locationLong,
    this.malnourishedSaMorMam,
    this.malnutritionLevel,
    this.medicineDispenseData,
    this.medicineDispenseDataDeleted,
    this.medicineGiven,
    this.medongoId,
    this.familyId,
    this.miscarriages,
    this.natureOfPhyWork,
    this.numOfDeliveries,
    this.numOfPregnancy,
    this.numOfStillbirths,
    this.omronWeightDto,
    this.partnerPartyId,
    this.pastIllness,
    this.pastIllnessList,
    this.patAge,
    this.patientData,
    this.pncVisitList,
    this.pregnancy,
    this.prescPdfPath,
    this.printPending,
    this.pushFlag,
    this.referrals,
    this.scoresData,
    this.screeningHistory,
    this.serverPushflag,
    this.shift,
    this.siteName,
    this.snomedCtCodeList,
    this.socialLife,
    this.surgicalHistory,
    this.symptomsList,
    this.tabFlag,
    this.teleConsult,
    this.termination,
    this.testList,
    this.trimester,
    this.visitForFollowp,
    this.vitalsData,
    this.zscore,
  });

  factory Consultation.fromJson(Map<String, dynamic> json) => Consultation(
    actualConsult: json["ActualConsult"],
    admitStatus: json["admitStatus"],
    allergy: json["allergy"],
    captureType: json["captureType"],
    allergyList: List<AllergyList>.from(
        json["allergyList"].map((x) => AllergyList.fromJson(x))),
    ancDataList: AncDataList.fromJson(json["ancDataList"]),
    anemiaData: AnemiaData.fromJson(json["anemiaData"]),
    anemiaLevel: json["anemiaLevel"],
    anemiavisitForFollowp: json["anemiavisitForFollowp"],
    anemicOrPregnant: json["anemicOrPregnant"],
    appDateTime: json["appDateTime"],
    apptId: json["apptId"],
    bedAssigned: json["bedAssigned"],
    billCollected: json["billCollected"],
    chronicalDisease: ChronicalDisease.fromJson(json["chronicalDisease"]),
    clinicId: json["clinicId"],
    consultType: json["consultType"],
    consultationStatus: json["consultationStatus"],
    createdByUserPartyId: json["createdByUserPartyId"],
    currentIllness: json["currentIllness"],
    currentIllnessList: json["currentIllnessList"],
    datametrices: List<Datametrics>.from(
        json["datametrices"].map((x) => Datametrics.fromJson(x))),
    depressionProblem: json["depressionProblem"],
    depressionProblem1: json["depressionProblem1"],
    dewomingGiven: json["dewomingGiven"],
    diagnosisList: List<DiagnosisList>.from(
        json["diagnosisList"].map((x) => DiagnosisList.fromJson(x))),
    doctorAdvice: json["doctorAdvice"],
    doctorCreated: json["doctorCreated"],
    doctorNote: json["doctorNote"],
    documentsList: List<DocumentsList>.from(
        json["documentsList"].map((x) => DocumentsList.fromJson(x))),
    dressingDone: json["dressingDone"],
    dressingRequired: json["dressingRequired"],
    eprescriptionList: List<EprescriptionList>.from(
        json["eprescriptionList"]
            .map((x) => EprescriptionList.fromJson(x))),
    expectedDeliveryDate: json["expectedDeliveryDate"],
    familyData: FamilyData.fromJson(json["familyData"]),
    familyPlanningServiceAvailed: json["familyPlanningServiceAvailed"],
    firstTime: json["firstTime"],
    followupDate: json["followupDate"],
    forLabor: json["forLabor"],
    functionalFlag: json["functionalFlag"],
    healthEducationRequired: json["healthEducationRequired"],
    immunizationList: ImmunizationList.fromJson(json["immunizationList"]),
    inAnemiaFollwUp: json["inAnemiaFollwUp"],
    inFollwUp: json["inFollwUp"],
    isDeceased: json["isDeceased"],
    isTabBasedTeleConsult: json["isTabBasedTeleConsult"],
    lastBreastScreeningDate: json["lastBreastScreeningDate"],
    lastCervicalScreenigDate: json["lastCervicalScreenigDate"],
    lastDeliveryPlace: json["lastDeliveryPlace"],
    lastDeliverydate: json["lastDeliverydate"],
    lastDepressionScreenigDate: json["lastDepressionScreenigDate"],
    lastDewormingHistoryDate: json["lastDewormingHistoryDate"],
    lastOralScreeningDate: json["lastOralScreeningDate"],
    lastVisionScreeningDate: json["lastVisionScreeningDate"],
    lmp: json["lmp"],
    localId: json["localId"],
    locationLat: json["locationLat"],
    locationLong: json["locationLong"],
    malnourishedSaMorMam: json["malnourishedSAMorMAM"],
    malnutritionLevel: json["malnutritionLevel"],
    medicineDispenseData:
    MedicineDispenseData.fromJson(json["medicineDispenseData"]),
    medicineDispenseDataDeleted:
    ImmunizationList.fromJson(json["medicineDispenseDataDeleted"]),
    medicineGiven: json["medicineGiven"],
    medongoId: json["medongoId"],
    familyId: json["familyId"],
    miscarriages: json["miscarriages"],
    natureOfPhyWork: json["natureOfPhyWork"],
    numOfDeliveries: json["numOfDeliveries"],
    numOfPregnancy: json["numOfPregnancy"],
    numOfStillbirths: json["numOfStillbirths"],
    omronWeightDto: ImmunizationList.fromJson(json["omronWeightDto"]),
    partnerPartyId: json["partnerPartyId"],
    pastIllness: json["pastIllness"],
    pastIllnessList: json["pastIllnessList"],
    patAge: json["patAge"],
    patientData: PatientData.fromJson(json["patientData"]),
    pncVisitList: PncVisitList.fromJson(json["pncVisitList"]),
    pregnancy: json["pregnancy"],
    prescPdfPath: json["prescPdfPath"],
    printPending: json["printPending"],
    pushFlag: json["pushFlag"],
    referrals: Referrals.fromJson(json["referrals"]),
    scoresData: ScoresData.fromJson(json["scoresData"]),
    screeningHistory: ScreeningHistory.fromJson(json["screeningHistory"]),
    serverPushflag: json["serverPushflag"],
    shift: json["shift"],
    siteName: json["siteName"],
    snomedCtCodeList: List<SnomedCtCodeList>.from(
        json["snomedCTCodeList"].map((x) => SnomedCtCodeList.fromJson(x))),
    socialLife: SocialLife.fromJson(json["socialLife"]),
    surgicalHistory: json["surgicalHistory"],
    symptomsList: List<SymptomsList>.from(
        json["symptomsList"].map((x) => SymptomsList.fromJson(x))),
    tabFlag: json["tabFlag"],
    teleConsult: json["teleConsult"],
    termination: json["termination"],
    testList: List<dynamic>.from(json["testList"].map((x) => x)),
    trimester: json["trimester"],
    visitForFollowp: json["visitForFollowp"],
    vitalsData: VitalsData.fromJson(json["vitalsData"]),
    zscore: json["zscore"],
  );

  Map<String, dynamic> toJson() => {
    "ActualConsult": actualConsult,
    "admitStatus": admitStatus,
    "allergy": allergy,
    "allergyList": allergyList != null
        ? List<dynamic>.from(allergyList!.map((x) => x.toJson()))
        : [],
    "ancDataList": ancDataList?.toJson(),
    "anemiaData": anemiaData?.toJson(),
    "anemiaLevel": anemiaLevel,
    "anemiavisitForFollowp": anemiavisitForFollowp,
    "anemicOrPregnant": anemicOrPregnant,
    "appDateTime": appDateTime,
    "apptId": apptId,
    "bedAssigned": bedAssigned,
    "billCollected": billCollected,
    "chronicalDisease": chronicalDisease?.toJson(),
    "clinicId": clinicId,
    "consultType": consultType,
    "consultationStatus": consultationStatus,
    "createdByUserPartyId": createdByUserPartyId,
    "currentIllness": currentIllness,
    "currentIllnessList": currentIllnessList,
    "datametrices":
    List<dynamic>.from(datametrices!.map((x) => x.toJson())),
    "depressionProblem": depressionProblem,
    "depressionProblem1": depressionProblem1,
    "dewomingGiven": dewomingGiven,
    "diagnosisList":
    List<dynamic>.from(diagnosisList!.map((x) => x.toJson())),
    "doctorAdvice": doctorAdvice,
    "doctorCreated": doctorCreated,
    "doctorNote": doctorNote,
    "documentsList":
    List<dynamic>.from(documentsList!.map((x) => x.toJson())),
    "dressingDone": dressingDone,
    "dressingRequired": dressingRequired,
    "eprescriptionList": eprescriptionList != null
        ? List<dynamic>.from(eprescriptionList!.map((x) => x.toJson()))
        : [],
    "expectedDeliveryDate": expectedDeliveryDate,
    "familyData": familyData != null ? familyData?.toJson() : FamilyData(),
    "familyPlanningServiceAvailed": familyPlanningServiceAvailed,
    "firstTime": firstTime,
    "followupDate": followupDate,
    "forLabor": forLabor,
    "functionalFlag": functionalFlag,
    "healthEducationRequired": healthEducationRequired,
    "immunizationList": immunizationList != null
        ? immunizationList?.toJson()
        : ImmunizationList(),
    "inAnemiaFollwUp": inAnemiaFollwUp,
    "inFollwUp": inFollwUp,
    "isDeceased": isDeceased,
    "isTabBasedTeleConsult": isTabBasedTeleConsult,
    "lastBreastScreeningDate": lastBreastScreeningDate,
    "lastCervicalScreenigDate": lastCervicalScreenigDate,
    "lastDeliveryPlace": lastDeliveryPlace,
    "lastDeliverydate": lastDeliverydate,
    "lastDepressionScreenigDate": lastDepressionScreenigDate,
    "lastDewormingHistoryDate": lastDewormingHistoryDate,
    "lastOralScreeningDate": lastOralScreeningDate,
    "lastVisionScreeningDate": lastVisionScreeningDate,
    "lmp": lmp,
    "localId": localId,
    "locationLat": locationLat,
    "locationLong": locationLong,
    "malnourishedSAMorMAM": malnourishedSaMorMam,
    "malnutritionLevel": malnutritionLevel,
    "medicineDispenseData": medicineDispenseData?.toJson(),
    "medicineDispenseDataDeleted": medicineDispenseDataDeleted?.toJson(),
    "medicineGiven": medicineGiven,
    "medongoId": medongoId,
    "miscarriages": miscarriages,
    "natureOfPhyWork": natureOfPhyWork,
    "numOfDeliveries": numOfDeliveries,
    "numOfPregnancy": numOfPregnancy,
    "numOfStillbirths": numOfStillbirths,
    "omronWeightDto": omronWeightDto?.toJson(),
    "partnerPartyId": partnerPartyId,
    "pastIllness": pastIllness,
    "pastIllnessList": pastIllnessList,
    "patAge": patAge,
    "patientData": patientData?.toJson(),
    "pncVisitList": pncVisitList?.toJson(),
    "pregnancy": pregnancy,
    "prescPdfPath": prescPdfPath,
    "printPending": printPending,
    "pushFlag": pushFlag,
    "referrals": referrals?.toJson(),
    "scoresData": scoresData?.toJson(),
    "screeningHistory": screeningHistory?.toJson(),
    "serverPushflag": serverPushflag,
    "shift": shift,
    "siteName": siteName,
    "snomedCTCodeList": symptomsList != null
        ? List<dynamic>.from(snomedCtCodeList!.map((x) => x.toJson()))
        : [],
    "socialLife": socialLife?.toJson(),
    "surgicalHistory": surgicalHistory,
    "symptomsList": symptomsList != null
        ? List<dynamic>.from(symptomsList!.map((x) => x.toJson()))
        : [],
    "tabFlag": tabFlag,
    "teleConsult": teleConsult,
    "termination": termination,
    "testList":
    testList != null ? List<dynamic>.from(testList!.map((x) => x)) : [],
    "trimester": trimester,
    "visitForFollowp": visitForFollowp,
    "vitalsData": vitalsData?.toJson(),
    "zscore": zscore,
  };
}

class AllergyList {
  String? allergyName;
  String? conceptId;
  bool? isEnabled;
  int? position;

  AllergyList({
    this.allergyName,
    this.conceptId,
    this.isEnabled,
    this.position,
  });

  factory AllergyList.fromJson(Map<String, dynamic> json) => AllergyList(
    allergyName: json["allergyName"],
    conceptId: json["conceptId"],
    isEnabled: json["isEnabled"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "allergyName": allergyName,
    "conceptId": conceptId,
    "isEnabled": isEnabled,
    "position": position,
  };
}

class AncDataList {
  String? abdomenExamDone;
  String? ancCounselingType;
  String? ancCounselling;
  String? ancPlaceOrBy;
  String? ancRegisteredDate;
  String? ancRegisteredPlace;
  String? ancRegistration;
  bool? ancVisible;
  String? availedFamilyPlanningServices;
  String? awreOfDangerSigns;
  String? birthPrepardnessPlan;
  String? breastfedAnHour;
  String? calciumConsumed;
  String? calciumGiven;
  bool? calciumVisible;
  String? childComplicationType;
  String? childComplications;
  String? childGender;
  String? childName;
  int? childWeight;
  String? childuniqueId;
  String? congenitalAnomaly;
  String? cryAfterBirth;
  String? dangerSigns;
  String? dangersignDetails;
  String? deliveryDate;
  bool? deliveryPncVisible;
  String? deliverybagPrepared;
  bool? deworming;
  bool? fConsumedVisble;
  String? familyPlanningServiceTypes;
  String? fhr;
  String? folicAcidConsumed;
  String? folicAcidGiven;
  int? followUpPatientCount;
  String? fundalHeight;
  String? haveEssentialContactNo;
  String? highRisk;
  String? highRiskType;
  String? homeDelivery;
  String? identifiedBloodDonar;
  String? identifiedTransportation;
  String? ifaConsumed;
  bool? ifaConsumedVisible;
  String? ifaGiven;
  String? maternalDeath;
  String? multiplePregnancy;
  String? neonatalDeath;
  bool? outcomeMandatoryVisible;
  String? outcomeOfPregnancy;
  String? placeOfDelivery;
  bool? pregnancy;
  String? prematureBaby;
  String? sourceOfAdditionalFunds;
  String? speculumexamDone;
  String? term;
  String? trimester;
  String? tt1Date;
  String? tt2Date;
  String? ttBoosterDate;
  String? typeOfDelivery;
  String? urineProteins;
  String? vaginumExamDone;
  int? visitStatusCount;
  String? vitaminKGiven;
  int? weeks;

  AncDataList({
    this.abdomenExamDone,
    this.ancCounselingType,
    this.ancCounselling,
    this.ancPlaceOrBy,
    this.ancRegisteredDate,
    this.ancRegisteredPlace,
    this.ancRegistration,
    this.ancVisible,
    this.availedFamilyPlanningServices,
    this.awreOfDangerSigns,
    this.birthPrepardnessPlan,
    this.breastfedAnHour,
    this.calciumConsumed,
    this.calciumGiven,
    this.calciumVisible,
    this.childComplicationType,
    this.childComplications,
    this.childGender,
    this.childName,
    this.childWeight,
    this.childuniqueId,
    this.congenitalAnomaly,
    this.cryAfterBirth,
    this.dangerSigns,
    this.dangersignDetails,
    this.deliveryDate,
    this.deliveryPncVisible,
    this.deliverybagPrepared,
    this.deworming,
    this.fConsumedVisble,
    this.familyPlanningServiceTypes,
    this.fhr,
    this.folicAcidConsumed,
    this.folicAcidGiven,
    this.followUpPatientCount,
    this.fundalHeight,
    this.haveEssentialContactNo,
    this.highRisk,
    this.highRiskType,
    this.homeDelivery,
    this.identifiedBloodDonar,
    this.identifiedTransportation,
    this.ifaConsumed,
    this.ifaConsumedVisible,
    this.ifaGiven,
    this.maternalDeath,
    this.multiplePregnancy,
    this.neonatalDeath,
    this.outcomeMandatoryVisible,
    this.outcomeOfPregnancy,
    this.placeOfDelivery,
    this.pregnancy,
    this.prematureBaby,
    this.sourceOfAdditionalFunds,
    this.speculumexamDone,
    this.term,
    this.trimester,
    this.tt1Date,
    this.tt2Date,
    this.ttBoosterDate,
    this.typeOfDelivery,
    this.urineProteins,
    this.vaginumExamDone,
    this.visitStatusCount,
    this.vitaminKGiven,
    this.weeks,
  });

  factory AncDataList.fromJson(Map<String, dynamic> json) => AncDataList(
    abdomenExamDone: json["abdomenExamDone"],
    ancCounselingType: json["ancCounselingType"],
    ancCounselling: json["ancCounselling"],
    ancPlaceOrBy: json["ancPlaceOrBy"],
    ancRegisteredDate: json["ancRegisteredDate"],
    ancRegisteredPlace: json["ancRegisteredPlace"],
    ancRegistration: json["ancRegistration"],
    ancVisible: json["ancVisible"],
    availedFamilyPlanningServices: json["availedFamilyPlanningServices"],
    awreOfDangerSigns: json["awreOfDangerSigns"],
    birthPrepardnessPlan: json["birthPrepardnessPlan"],
    breastfedAnHour: json["breastfedAnHour"],
    calciumConsumed: json["calciumConsumed"],
    calciumGiven: json["calciumGiven"],
    calciumVisible: json["calciumVisible"],
    childComplicationType: json["childComplicationType"],
    childComplications: json["childComplications"],
    childGender: json["childGender"],
    childName: json["childName"],
    childWeight: json["childWeight"],
    childuniqueId: json["childuniqueID"],
    congenitalAnomaly: json["congenitalAnomaly"],
    cryAfterBirth: json["cryAfterBirth"],
    dangerSigns: json["dangerSigns"],
    dangersignDetails: json["dangersignDetails"],
    deliveryDate: json["deliveryDate"],
    deliveryPncVisible: json["deliveryPncVisible"],
    deliverybagPrepared: json["deliverybagPrepared"],
    deworming: json["deworming"],
    fConsumedVisble: json["fConsumedVisble"],
    familyPlanningServiceTypes: json["familyPlanningServiceTypes"],
    fhr: json["fhr"],
    folicAcidConsumed: json["folicAcidConsumed"],
    folicAcidGiven: json["folicAcidGiven"],
    followUpPatientCount: json["followUpPatientCount"],
    fundalHeight: json["fundalHeight"],
    haveEssentialContactNo: json["haveEssentialContactNo"],
    highRisk: json["highRisk"],
    highRiskType: json["highRiskType"],
    homeDelivery: json["homeDelivery"],
    identifiedBloodDonar: json["identifiedBloodDonar"],
    identifiedTransportation: json["identifiedTransportation"],
    ifaConsumed: json["ifaConsumed"],
    ifaConsumedVisible: json["ifaConsumedVisible"],
    ifaGiven: json["ifaGiven"],
    maternalDeath: json["maternalDeath"],
    multiplePregnancy: json["multiplePregnancy"],
    neonatalDeath: json["neonatalDeath"],
    outcomeMandatoryVisible: json["outcomeMandatoryVisible"],
    outcomeOfPregnancy: json["outcomeOfPregnancy"],
    placeOfDelivery: json["placeOfDelivery"],
    pregnancy: json["pregnancy"],
    prematureBaby: json["prematureBaby"],
    sourceOfAdditionalFunds: json["sourceOfAdditionalFunds"],
    speculumexamDone: json["speculumexamDone"],
    term: json["term"],
    trimester: json["trimester"],
    tt1Date: json["tt1Date"],
    tt2Date: json["tt2Date"],
    ttBoosterDate: json["ttBoosterDate"],
    typeOfDelivery: json["typeOfDelivery"],
    urineProteins: json["urineProteins"],
    vaginumExamDone: json["vaginumExamDone"],
    visitStatusCount: json["visitStatusCount"],
    vitaminKGiven: json["vitaminKGiven"],
    weeks: json["weeks"],
  );

  Map<String, dynamic> toJson() => {
    "abdomenExamDone": abdomenExamDone,
    "ancCounselingType": ancCounselingType,
    "ancCounselling": ancCounselling,
    "ancPlaceOrBy": ancPlaceOrBy,
    "ancRegisteredDate": ancRegisteredDate,
    "ancRegisteredPlace": ancRegisteredPlace,
    "ancRegistration": ancRegistration,
    "ancVisible": ancVisible,
    "availedFamilyPlanningServices": availedFamilyPlanningServices,
    "awreOfDangerSigns": awreOfDangerSigns,
    "birthPrepardnessPlan": birthPrepardnessPlan,
    "breastfedAnHour": breastfedAnHour,
    "calciumConsumed": calciumConsumed,
    "calciumGiven": calciumGiven,
    "calciumVisible": calciumVisible,
    "childComplicationType": childComplicationType,
    "childComplications": childComplications,
    "childGender": childGender,
    "childName": childName,
    "childWeight": childWeight,
    "childuniqueID": childuniqueId,
    "congenitalAnomaly": congenitalAnomaly,
    "cryAfterBirth": cryAfterBirth,
    "dangerSigns": dangerSigns,
    "dangersignDetails": dangersignDetails,
    "deliveryDate": deliveryDate,
    "deliveryPncVisible": deliveryPncVisible,
    "deliverybagPrepared": deliverybagPrepared,
    "deworming": deworming,
    "fConsumedVisble": fConsumedVisble,
    "familyPlanningServiceTypes": familyPlanningServiceTypes,
    "fhr": fhr,
    "folicAcidConsumed": folicAcidConsumed,
    "folicAcidGiven": folicAcidGiven,
    "followUpPatientCount": followUpPatientCount,
    "fundalHeight": fundalHeight,
    "haveEssentialContactNo": haveEssentialContactNo,
    "highRisk": highRisk,
    "highRiskType": highRiskType,
    "homeDelivery": homeDelivery,
    "identifiedBloodDonar": identifiedBloodDonar,
    "identifiedTransportation": identifiedTransportation,
    "ifaConsumed": ifaConsumed,
    "ifaConsumedVisible": ifaConsumedVisible,
    "ifaGiven": ifaGiven,
    "maternalDeath": maternalDeath,
    "multiplePregnancy": multiplePregnancy,
    "neonatalDeath": neonatalDeath,
    "outcomeMandatoryVisible": outcomeMandatoryVisible,
    "outcomeOfPregnancy": outcomeOfPregnancy,
    "placeOfDelivery": placeOfDelivery,
    "pregnancy": pregnancy,
    "prematureBaby": prematureBaby,
    "sourceOfAdditionalFunds": sourceOfAdditionalFunds,
    "speculumexamDone": speculumexamDone,
    "term": term,
    "trimester": trimester,
    "tt1Date": tt1Date,
    "tt2Date": tt2Date,
    "ttBoosterDate": ttBoosterDate,
    "typeOfDelivery": typeOfDelivery,
    "urineProteins": urineProteins,
    "vaginumExamDone": vaginumExamDone,
    "visitStatusCount": visitStatusCount,
    "vitaminKGiven": vitaminKGiven,
    "weeks": weeks,
  };
}

class AnemiaData {
  int? age;
  String? anemiaFollowup;
  String? anemiaScore;
  String? anemiaVisitNo;
  int? bmiValue;
  int? followUpPatientCount;
  String? gender;
  String? ifaProvided;
  String? ifaProvidedQty;
  String? ironSucroseProvidedQty;
  bool? ironSucroseProvidedVisible;
  bool? ironSucroseReqVisible;
  int? ironSucroseRequired;
  bool? ironSucroseVisible;
  bool? layoutIiVisible;
  String? nutritionalCounselling;
  int? visitStatusCount;

  AnemiaData({
    this.age,
    this.anemiaFollowup,
    this.anemiaScore,
    this.anemiaVisitNo,
    this.bmiValue,
    this.followUpPatientCount,
    this.gender,
    this.ifaProvided,
    this.ifaProvidedQty,
    this.ironSucroseProvidedQty,
    this.ironSucroseProvidedVisible,
    this.ironSucroseReqVisible,
    this.ironSucroseRequired,
    this.ironSucroseVisible,
    this.layoutIiVisible,
    this.nutritionalCounselling,
    this.visitStatusCount,
  });

  factory AnemiaData.fromJson(Map<String, dynamic> json) => AnemiaData(
    age: json["age"],
    anemiaFollowup: json["anemiaFollowup"],
    anemiaScore: json["anemiaScore"],
    anemiaVisitNo: json["anemiaVisitNo"],
    bmiValue: json["bmiValue"],
    followUpPatientCount: json["followUpPatientCount"],
    gender: json["gender"],
    ifaProvided: json["ifaProvided"],
    ifaProvidedQty: json["ifaProvidedQty"],
    ironSucroseProvidedQty: json["ironSucroseProvidedQty"],
    ironSucroseProvidedVisible: json["ironSucroseProvidedVisible"],
    ironSucroseReqVisible: json["ironSucroseReqVisible"],
    ironSucroseRequired: json["ironSucroseRequired"],
    ironSucroseVisible: json["ironSucroseVisible"],
    layoutIiVisible: json["layoutIIVisible"],
    nutritionalCounselling: json["nutritionalCounselling"],
    visitStatusCount: json["visitStatusCount"],
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "anemiaFollowup": anemiaFollowup,
    "anemiaScore": anemiaScore,
    "anemiaVisitNo": anemiaVisitNo,
    "bmiValue": bmiValue,
    "followUpPatientCount": followUpPatientCount,
    "gender": gender,
    "ifaProvided": ifaProvided,
    "ifaProvidedQty": ifaProvidedQty,
    "ironSucroseProvidedQty": ironSucroseProvidedQty,
    "ironSucroseProvidedVisible": ironSucroseProvidedVisible,
    "ironSucroseReqVisible": ironSucroseReqVisible,
    "ironSucroseRequired": ironSucroseRequired,
    "ironSucroseVisible": ironSucroseVisible,
    "layoutIIVisible": layoutIiVisible,
    "nutritionalCounselling": nutritionalCounselling,
    "visitStatusCount": visitStatusCount,
  };
}

class ChronicalDisease {
  bool? allergy;
  String? allergyField;
  bool? ancVisible;
  int? anemiaLevel;
  String? conceptId;
  String? currentIllness;
  int? currentIllnessSize;
  String? cvd;
  String? cvdDuration;
  String? cvdFamilyList;
  String? cvdInFamily;
  bool? deworming;
  String? dewormingDate;
  String? diabetic;
  String? diabeticDuration;
  String? diabeticFamilyList;
  String? diabeticInFamily;
  bool? havingOtherCliHisInFamily;
  String? hypertenseDuration;
  String? hypertensive;
  String? hypertensiveFamilyList;
  String? hypertensiveInFamilty;
  bool? illnessVisible;
  String? lmpDate;
  String? miscarriages;
  String? numOfPregnancy;
  String? numOfStillBirths;
  String? otherCliHisFamilyList;
  String? otherClinicalHistory;
  String? pastIllness;
  int? pastIllnessSize;
  bool? pncVisible;
  bool? pregnancy;
  String? surgical;
  String? termination;
  int? visitNumber;

  ChronicalDisease({
    this.allergy,
    this.allergyField,
    this.ancVisible,
    this.anemiaLevel,
    this.conceptId,
    this.currentIllness,
    this.currentIllnessSize,
    this.cvd,
    this.cvdDuration,
    this.cvdFamilyList,
    this.cvdInFamily,
    this.deworming,
    this.dewormingDate,
    this.diabetic,
    this.diabeticDuration,
    this.diabeticFamilyList,
    this.diabeticInFamily,
    this.havingOtherCliHisInFamily,
    this.hypertenseDuration,
    this.hypertensive,
    this.hypertensiveFamilyList,
    this.hypertensiveInFamilty,
    this.illnessVisible,
    this.lmpDate,
    this.miscarriages,
    this.numOfPregnancy,
    this.numOfStillBirths,
    this.otherCliHisFamilyList,
    this.otherClinicalHistory,
    this.pastIllness,
    this.pastIllnessSize,
    this.pncVisible,
    this.pregnancy,
    this.surgical,
    this.termination,
    this.visitNumber,
  });

  factory ChronicalDisease.fromJson(Map<String, dynamic> json) =>
      ChronicalDisease(
        allergy: json["allergy"],
        allergyField: json["allergyField"],
        ancVisible: json["ancVisible"],
        anemiaLevel: json["anemiaLevel"],
        conceptId: json["conceptId"],
        currentIllness: json["currentIllness"],
        currentIllnessSize: json["currentIllnessSize"],
        cvd: json["cvd"],
        cvdDuration: json["cvdDuration"],
        cvdFamilyList: json["cvdFamilyList"],
        cvdInFamily: json["cvdInFamily"],
        deworming: json["deworming"],
        dewormingDate: json["dewormingDate"],
        diabetic: json["diabetic"],
        diabeticDuration: json["diabeticDuration"],
        diabeticFamilyList: json["diabeticFamilyList"],
        diabeticInFamily: json["diabeticInFamily"],
        havingOtherCliHisInFamily: json["havingOtherCliHisInFamily"],
        hypertenseDuration: json["hypertenseDuration"],
        hypertensive: json["hypertensive"],
        hypertensiveFamilyList: json["hypertensiveFamilyList"],
        hypertensiveInFamilty: json["hypertensiveInFamilty"],
        illnessVisible: json["illnessVisible"],
        lmpDate: json["lmpDate"],
        miscarriages: json["miscarriages"],
        numOfPregnancy: json["numOfPregnancy"],
        numOfStillBirths: json["numOfStillBirths"],
        otherCliHisFamilyList: json["otherCliHisFamilyList"],
        otherClinicalHistory: json["otherClinicalHistory"],
        pastIllness: json["pastIllness"],
        pastIllnessSize: json["pastIllnessSize"],
        pncVisible: json["pncVisible"],
        pregnancy: json["pregnancy"],
        surgical: json["surgical"],
        termination: json["termination"],
        visitNumber: json["visitNumber"],
      );

  Map<String, dynamic> toJson() => {
    "allergy": allergy,
    "allergyField": allergyField,
    "ancVisible": ancVisible,
    "anemiaLevel": anemiaLevel,
    "conceptId": conceptId,
    "currentIllness": currentIllness,
    "currentIllnessSize": currentIllnessSize,
    "cvd": cvd,
    "cvdDuration": cvdDuration,
    "cvdFamilyList": cvdFamilyList,
    "cvdInFamily": cvdInFamily,
    "deworming": deworming,
    "dewormingDate": dewormingDate,
    "diabetic": diabetic,
    "diabeticDuration": diabeticDuration,
    "diabeticFamilyList": diabeticFamilyList,
    "diabeticInFamily": diabeticInFamily,
    "havingOtherCliHisInFamily": havingOtherCliHisInFamily,
    "hypertenseDuration": hypertenseDuration,
    "hypertensive": hypertensive,
    "hypertensiveFamilyList": hypertensiveFamilyList,
    "hypertensiveInFamilty": hypertensiveInFamilty,
    "illnessVisible": illnessVisible,
    "lmpDate": lmpDate,
    "miscarriages": miscarriages,
    "numOfPregnancy": numOfPregnancy,
    "numOfStillBirths": numOfStillBirths,
    "otherCliHisFamilyList": otherCliHisFamilyList,
    "otherClinicalHistory": otherClinicalHistory,
    "pastIllness": pastIllness,
    "pastIllnessSize": pastIllnessSize,
    "pncVisible": pncVisible,
    "pregnancy": pregnancy,
    "surgical": surgical,
    "termination": termination,
    "visitNumber": visitNumber,
  };
}

class Datametrics {
  String? action;
  String? actionDate;
  String? actionId;
  String? appId;
  String? clinicId;
  int? duration;
  String? endTime;
  String? operatorId;
  String? operatorRoleId;
  int? shiftId;
  String? starttime;
  String? localId;

  Datametrics({
    this.action,
    this.actionDate,
    this.actionId,
    this.appId,
    this.clinicId,
    this.duration,
    this.endTime,
    this.operatorId,
    this.operatorRoleId,
    this.shiftId,
    this.starttime,
    this.localId,
  });

  factory Datametrics.fromJson(Map<String, dynamic> json) => Datametrics(
    action: json["action"],
    actionDate: json["actionDate"],
    actionId: json["actionId"],
    appId: json["appID"],
    clinicId: json["clinicId"],
    duration: json["duration"],
    endTime: json["endTime"],
    operatorId: json["operatorId"],
    operatorRoleId: json["operatorRoleId"],
    shiftId: json["shiftId"],
    starttime: json["starttime"],
    localId: json["localId"],
  );

  Map<String, dynamic> toJson() => {
    "action": action,
    "actionDate": actionDate,
    "actionId": actionId,
    "appID": appId,
    "clinicId": clinicId,
    "duration": duration,
    "endTime": endTime,
    "operatorId": operatorId,
    "operatorRoleId": operatorRoleId,
    "shiftId": shiftId,
    "starttime": starttime,
    "localId": localId,
  };
}

class DiagnosisList {
  String? conceptId;
  int? diagnoseId;
  String? diagnosisName;
  String? diagnosisType;
  String? diagnosisTypeText;
  bool? isChecked;
  bool? isEnabled;

  DiagnosisList({
    this.conceptId,
    this.diagnoseId,
    this.diagnosisName,
    this.diagnosisType,
    this.diagnosisTypeText,
    this.isChecked,
    this.isEnabled,
  });

  factory DiagnosisList.fromJson(Map<String, dynamic> json) => DiagnosisList(
    conceptId: json["conceptId"],
    diagnoseId: json["diagnoseId"],
    diagnosisName: json["diagnosisName"],
    diagnosisType: json["diagnosisType"],
    diagnosisTypeText: json["diagnosisTypeText"],
    isChecked: json["isChecked"],
    isEnabled: json["isEnabled"],
  );

  Map<String, dynamic> toJson() => {
    "conceptId": conceptId,
    "diagnoseId": diagnoseId,
    "diagnosisName": diagnosisName,
    "diagnosisType": diagnosisType,
    "diagnosisTypeText": diagnosisTypeText,
    "isChecked": isChecked,
    "isEnabled": isEnabled,
  };
}

class DocumentsList {
  String? apptId;
  String? description;
  String? ftpPath;
  double? latitude;
  double? longitude;
  String? path;
  String? pid;
  String? subcategory;
  String? type;
  String? captureDateTime;

  DocumentsList({
    this.apptId,
    this.description,
    this.ftpPath,
    this.latitude,
    this.longitude,
    this.path,
    this.pid,
    this.subcategory,
    this.type,
    this.captureDateTime,
  });

  factory DocumentsList.fromJson(Map<String, dynamic> json) => DocumentsList(
    apptId: json["apptId"],
    description: json["description"],
    ftpPath: json["ftpPath"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    path: json["path"],
    pid: json["pid"],
    subcategory: json["subcategory"],
    type: json["type"],
    captureDateTime: json["captureDateTime"],
  );

  Map<String, dynamic> toJson() => {
    "apptId": apptId,
    "description": description,
    "ftpPath": ftpPath,
    "latitude": latitude,
    "longitude": longitude,
    "path": path,
    "pid": pid,
    "subcategory": subcategory,
    "type": type,
    "captureDateTime": captureDateTime,
  };
}

class EprescriptionList {
  bool? listEnable;
  int? addedTimeStamp;
  int? cost;
  int? count;
  String? days;
  String? dispenceMode;
  int? dispencedcount;
  bool? dispenseCompleted;
  int? dispensedCount;
  String? dose;
  int? doseType;
  bool? enable;
  String? howOftenTaken;
  bool? isChecked;
  List<LotDatum>? lotData;
  String? medicationName;
  String? medicineCategory;
  String? medicineType;
  int? noOfUnits;
  String? packSize;
  String? patietnId;
  int? prescriptionQuantity;
  String? productId;
  int? removeCount;
  bool? removeFlagForsyringe;
  int? totalCount;

  EprescriptionList({
    this.listEnable,
    this.addedTimeStamp,
    this.cost,
    this.count,
    this.days,
    this.dispenceMode,
    this.dispencedcount,
    this.dispenseCompleted,
    this.dispensedCount,
    this.dose,
    this.doseType,
    this.enable,
    this.howOftenTaken,
    this.isChecked,
    this.lotData,
    this.medicationName,
    this.medicineCategory,
    this.medicineType,
    this.noOfUnits,
    this.packSize,
    this.patietnId,
    this.prescriptionQuantity,
    this.productId,
    this.removeCount,
    this.removeFlagForsyringe,
    this.totalCount,
  });

  factory EprescriptionList.fromJson(Map<String, dynamic> json) =>
      EprescriptionList(
        listEnable: json["ListEnable"],
        addedTimeStamp: json["addedTimeStamp"],
        cost: json["cost"],
        count: json["count"],
        days: json["days"],
        dispenceMode: json["dispenceMode"],
        dispencedcount: json["dispencedcount"],
        dispenseCompleted: json["dispenseCompleted"],
        dispensedCount: json["dispensedCount"],
        dose: json["dose"],
        doseType: json["doseType"],
        enable: json["enable"],
        howOftenTaken: json["howOftenTaken"],
        isChecked: json["isChecked"],
        lotData: List<LotDatum>.from(
            json["lotData"].map((x) => LotDatum.fromJson(x))),
        medicationName: json["medicationName"],
        medicineCategory: json["medicineCategory"],
        medicineType: json["medicineType"],
        noOfUnits: json["noOfUnits"],
        packSize: json["packSize"],
        patietnId: json["patietnId"],
        prescriptionQuantity: json["prescription_quantity"],
        productId: json["productId"],
        removeCount: json["removeCount"],
        removeFlagForsyringe: json["removeFlagForsyringe"],
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
    "ListEnable": listEnable,
    "addedTimeStamp": addedTimeStamp,
    "cost": cost,
    "count": count,
    "days": days,
    "dispenceMode": dispenceMode,
    "dispencedcount": dispencedcount,
    "dispenseCompleted": dispenseCompleted,
    "dispensedCount": dispensedCount,
    "dose": dose,
    "doseType": doseType,
    "enable": enable,
    "howOftenTaken": howOftenTaken,
    "isChecked": isChecked,
    "lotData": lotData != null
        ? List<dynamic>.from(lotData!.map((x) => x.toJson()))
        : [],
    "medicationName": medicationName,
    "medicineCategory": medicineCategory,
    "medicineType": medicineType,
    "noOfUnits": noOfUnits,
    "packSize": packSize,
    "patietnId": patietnId,
    "prescription_quantity": prescriptionQuantity,
    "productId": productId,
    "removeCount": removeCount,
    "removeFlagForsyringe": removeFlagForsyringe,
    "totalCount": totalCount,
  };
}

class LotDatum {
  int? addedCount;
  int? dispensedCount;
  String? lotNumber;
  String? productId;
  int? totalCost;

  LotDatum({
    this.addedCount,
    this.dispensedCount,
    this.lotNumber,
    this.productId,
    this.totalCost,
  });

  factory LotDatum.fromJson(Map<String, dynamic> json) => LotDatum(
    addedCount: json["added_count"],
    dispensedCount: json["dispensed_count"],
    lotNumber: json["lotNumber"],
    productId: json["productId"],
    totalCost: json["totalCost"],
  );

  Map<String, dynamic> toJson() => {
    "added_count": addedCount,
    "dispensed_count": dispensedCount,
    "lotNumber": lotNumber,
    "productId": productId,
    "totalCost": totalCost,
  };
}

class FamilyData {
  int? completed;
  bool? employeeGroup;
  String? familyCatogory;
  int? familyCount;
  String? familyId;
  List<PatientData>? familyMembersData;
  String? familyName;
  int? income;
  bool? isEdited;
  int? locationLat;
  int? locationLong;
  bool? serverPushflag;
  int? tabPushFlag;
  String? totalFamilyMembers;

  FamilyData({
    this.completed,
    this.employeeGroup,
    this.familyCatogory,
    this.familyCount,
    this.familyId,
    this.familyMembersData,
    this.familyName,
    this.income,
    this.isEdited,
    this.locationLat,
    this.locationLong,
    this.serverPushflag,
    this.tabPushFlag,
    this.totalFamilyMembers,
  });

  factory FamilyData.fromJson(Map<String, dynamic> json) => FamilyData(
    completed: json["completed"],
    employeeGroup: json["employeeGroup"],
    familyCatogory: json["familyCatogory"],
    familyCount: json["familyCount"],
    familyId: json["familyId"],
    familyMembersData: List<PatientData>.from(
        json["familyMembersData"].map((x) => PatientData.fromJson(x))),
    familyName: json["familyName"],
    income: json["income"],
    isEdited: json["isEdited"],
    locationLat: json["locationLat"],
    locationLong: json["locationLong"],
    serverPushflag: json["serverPushflag"],
    tabPushFlag: json["tabPushFlag"],
    totalFamilyMembers: json["totalFamilyMembers"],
  );

  Map<String, dynamic> toJson() => {
    "completed": completed,
    "employeeGroup": employeeGroup,
    "familyCatogory": familyCatogory,
    "familyCount": familyCount,
    "familyId": familyId,
    "familyMembersData":
    List<dynamic>.from(familyMembersData!.map((x) => x.toJson())),
    "familyName": familyName,
    "income": income,
    "isEdited": isEdited,
    "locationLat": locationLat,
    "locationLong": locationLong,
    "serverPushflag": serverPushflag,
    "tabPushFlag": tabPushFlag,
    "totalFamilyMembers": totalFamilyMembers,
  };
}

class PatientData {
  int? bsCstatus;
  String? dob;
  String? aadharId;
  int? age;
  int? ageInDays;
  int? ageInMonths;
  int? ageInYears;
  String? appStatus;
  String? bplCardNo;
  String? captureType;
  String? catagory;
  int? colourCode;
  List<String>? consentList;
  String? createdByClinicId;
  String? createdByUserPartyId;
  String? dispenseTime;
  String? familyId;
  String? firstName;
  String? followUpApptId;
  String? functionalFlag;
  String? gender;
  bool? imageTakenNew;
  String? imageUrl;
  int? income;
  bool? isEdited;
  bool? isNew;
  String? lastName;
  String? localId;
  double? locationLat;
  double? locationLong;
  String? maritalStatus;
  String? medongoId;
  String? mobileNumber;
  String? modifiedByUserPartyId;
  String? modifiedDate;
  String? motherName;
  List<String>? patientVaccineList;
  bool? pending;
  int? pushFlag;
  String? registeredDate;
  String? religion;
  bool? serverPushflag;
  int? shift;
  String? siteName;
  int? tabFlag;
  int? todayLabStatus;
  String? uid;
  String? updatedByClinicId;

  PatientData({
    this.bsCstatus,
    this.dob,
    this.aadharId,
    this.age,
    this.ageInDays,
    this.ageInMonths,
    this.ageInYears,
    this.appStatus,
    this.bplCardNo,
    this.captureType,
    this.catagory,
    this.colourCode,
    this.consentList,
    this.createdByClinicId,
    this.createdByUserPartyId,
    this.dispenseTime,
    this.familyId,
    this.firstName,
    this.followUpApptId,
    this.functionalFlag,
    this.gender,
    this.imageTakenNew,
    this.imageUrl,
    this.income,
    this.isEdited,
    this.isNew,
    this.lastName,
    this.localId,
    this.locationLat,
    this.locationLong,
    this.maritalStatus,
    this.medongoId,
    this.mobileNumber,
    this.modifiedByUserPartyId,
    this.modifiedDate,
    this.motherName,
    this.patientVaccineList,
    this.pending,
    this.pushFlag,
    this.registeredDate,
    this.religion,
    this.serverPushflag,
    this.shift,
    this.siteName,
    this.tabFlag,
    this.todayLabStatus,
    this.uid,
    this.updatedByClinicId,
  });

  factory PatientData.fromJson(Map<String, dynamic> json) => PatientData(
    bsCstatus: json["BSCstatus"],
    dob: json["DOB"],
    aadharId: json["aadharId"],
    age: json["age"],
    ageInDays: json["ageInDays"],
    ageInMonths: json["ageInMonths"],
    ageInYears: json["ageInYears"],
    appStatus: json["appStatus"],
    bplCardNo: json["bplCardNo"],
    captureType: json["captureType"],
    catagory: json["catagory"],
    colourCode: json["colourCode"],
    consentList: List<String>.from(json["consentList"].map((x) => x)),
    createdByClinicId: json["createdByClinicId"],
    createdByUserPartyId: json["createdByUserPartyId"],
    dispenseTime: json["dispenseTime"],
    familyId: json["familyId"],
    firstName: json["firstName"],
    followUpApptId: json["followUpApptId"],
    functionalFlag: json["functionalFlag"],
    gender: json["gender"],
    imageTakenNew: json["imageTakenNew"],
    imageUrl: json["imageUrl"],
    income: json["income"],
    isEdited: json["isEdited"],
    isNew: json["isNew"],
    lastName: json["lastName"],
    localId: json["localId"],
    locationLat: json["locationLat"].toDouble(),
    locationLong: json["locationLong"].toDouble(),
    maritalStatus: json["maritalStatus"],
    medongoId: json["medongoId"],
    mobileNumber: json["mobileNumber"],
    modifiedByUserPartyId: json["modifiedByUserPartyId"],
    modifiedDate: json["modifiedDate"],
    motherName: json["motherName"],
    patientVaccineList:
    List<String>.from(json["patientVaccineList"].map((x) => x)),
    pending: json["pending"],
    pushFlag: json["pushFlag"],
    registeredDate: json["registeredDate"],
    religion: json["religion"],
    serverPushflag: json["serverPushflag"],
    shift: json["shift"],
    siteName: json["siteName"],
    tabFlag: json["tabFlag"],
    todayLabStatus: json["todayLabStatus"],
    uid: json["uid"],
    updatedByClinicId: json["updatedByClinicId"],
  );

  Map<String, dynamic> toJson() => {
    "BSCstatus": bsCstatus,
    "DOB": dob,
    "aadharId": aadharId,
    "age": age,
    "ageInDays": ageInDays,
    "ageInMonths": ageInMonths,
    "ageInYears": ageInYears,
    "appStatus": appStatus,
    "bplCardNo": bplCardNo,
    "captureType": captureType,
    "catagory": catagory,
    "colourCode": colourCode,
    "consentList": List<dynamic>.from(consentList!.map((x) => x)),
    "createdByClinicId": createdByClinicId,
    "createdByUserPartyId": createdByUserPartyId,
    "dispenseTime": dispenseTime,
    "familyId": familyId,
    "firstName": firstName,
    "followUpApptId": followUpApptId,
    "functionalFlag": functionalFlag,
    "gender": gender,
    "imageTakenNew": imageTakenNew,
    "imageUrl": imageUrl,
    "income": income,
    "isEdited": isEdited,
    "isNew": isNew,
    "lastName": lastName,
    "localId": localId,
    "locationLat": locationLat,
    "locationLong": locationLong,
    "maritalStatus": maritalStatus,
    "medongoId": medongoId,
    "mobileNumber": mobileNumber,
    "modifiedByUserPartyId": modifiedByUserPartyId,
    "modifiedDate": modifiedDate,
    "motherName": motherName,
    "patientVaccineList":
    List<dynamic>.from(patientVaccineList!.map((x) => x)),
    "pending": pending,
    "pushFlag": pushFlag,
    "registeredDate": registeredDate,
    "religion": religion,
    "serverPushflag": serverPushflag,
    "shift": shift,
    "siteName": siteName,
    "tabFlag": tabFlag,
    "todayLabStatus": todayLabStatus,
    "uid": uid,
    "updatedByClinicId": updatedByClinicId,
  };
}

class ImmunizationList {
  ImmunizationList();

  factory ImmunizationList.fromJson(Map<String, dynamic> json) =>
      ImmunizationList();

  Map<String, dynamic> toJson() => {};
}

class MedicineDispenseData {
  int? kidPrd1001140;

  MedicineDispenseData({
    this.kidPrd1001140,
  });

  factory MedicineDispenseData.fromJson(Map<String, dynamic> json) =>
      MedicineDispenseData(
        kidPrd1001140: json["KID_PRD_1001140"],
      );

  Map<String, dynamic> toJson() => {
    "KID_PRD_1001140": kidPrd1001140,
  };
}

class PncVisitList {
  int? ageInDays;
  bool? calciumConsumedVisible;
  String? calciumGiven;
  String? dangerSign;
  int? deliveryDays;
  int? followUpPatientCount;
  bool? ifaConsumedVisible;
  String? ifaGiven;
  bool? motherDetailsVisible;
  String? motherVisitDate;
  String? pncCounselling;
  String? pncRegisteredDate;
  bool? pncVisible;
  String? reason;
  int? visitNo;
  int? visitStatusCount;

  PncVisitList({
    this.ageInDays,
    this.calciumConsumedVisible,
    this.calciumGiven,
    this.dangerSign,
    this.deliveryDays,
    this.followUpPatientCount,
    this.ifaConsumedVisible,
    this.ifaGiven,
    this.motherDetailsVisible,
    this.motherVisitDate,
    this.pncCounselling,
    this.pncRegisteredDate,
    this.pncVisible,
    this.reason,
    this.visitNo,
    this.visitStatusCount,
  });

  factory PncVisitList.fromJson(Map<String, dynamic> json) => PncVisitList(
    ageInDays: json["ageInDays"],
    calciumConsumedVisible: json["calciumConsumedVisible"],
    calciumGiven: json["calciumGiven"],
    dangerSign: json["dangerSign"],
    deliveryDays: json["deliveryDays"],
    followUpPatientCount: json["followUpPatientCount"],
    ifaConsumedVisible: json["ifaConsumedVisible"],
    ifaGiven: json["ifaGiven"],
    motherDetailsVisible: json["motherDetailsVisible"],
    motherVisitDate: json["motherVisitDate"],
    pncCounselling: json["pncCounselling"],
    pncRegisteredDate: json["pncRegisteredDate"],
    pncVisible: json["pncVisible"],
    reason: json["reason"],
    visitNo: json["visitNo"],
    visitStatusCount: json["visitStatusCount"],
  );

  Map<String, dynamic> toJson() => {
    "ageInDays": ageInDays,
    "calciumConsumedVisible": calciumConsumedVisible,
    "calciumGiven": calciumGiven,
    "dangerSign": dangerSign,
    "deliveryDays": deliveryDays,
    "followUpPatientCount": followUpPatientCount,
    "ifaConsumedVisible": ifaConsumedVisible,
    "ifaGiven": ifaGiven,
    "motherDetailsVisible": motherDetailsVisible,
    "motherVisitDate": motherVisitDate,
    "pncCounselling": pncCounselling,
    "pncRegisteredDate": pncRegisteredDate,
    "pncVisible": pncVisible,
    "reason": reason,
    "visitNo": visitNo,
    "visitStatusCount": visitStatusCount,
  };
}

class Referrals {
  String? apptId;
  String? clinicName;
  String? medongoId;
  String? otherClinicName;
  String? pastHistory;
  String? presentHistory;
  String? referForReason;
  String? referFromClinicId;
  bool? referralCompleted;
  String? treatmentGivenToDate;

  Referrals({
    this.apptId,
    this.clinicName,
    this.medongoId,
    this.otherClinicName,
    this.pastHistory,
    this.presentHistory,
    this.referForReason,
    this.referFromClinicId,
    this.referralCompleted,
    this.treatmentGivenToDate,
  });

  factory Referrals.fromJson(Map<String, dynamic> json) => Referrals(
    apptId: json["apptId"],
    clinicName: json["clinicName"],
    medongoId: json["medongoId"],
    otherClinicName: json["otherClinicName"],
    pastHistory: json["pastHistory"],
    presentHistory: json["presentHistory"],
    referForReason: json["referForReason"],
    referFromClinicId: json["referFromClinicId"],
    referralCompleted: json["referralCompleted"],
    treatmentGivenToDate: json["treatmentGivenToDate"],
  );

  Map<String, dynamic> toJson() => {
    "apptId": apptId,
    "clinicName": clinicName,
    "medongoId": medongoId,
    "otherClinicName": otherClinicName,
    "pastHistory": pastHistory,
    "presentHistory": presentHistory,
    "referForReason": referForReason,
    "referFromClinicId": referFromClinicId,
    "referralCompleted": referralCompleted,
    "treatmentGivenToDate": treatmentGivenToDate,
  };
}

class ScoresData {
  String? anemiascore;
  String? malnutritionscore;
  int? bmiScore;
  int? cvdScore;
  int? depressionScore;
  int? diabetesScore;
  int? prehypertensionScore;

  ScoresData({
    this.anemiascore,
    this.malnutritionscore,
    this.bmiScore,
    this.cvdScore,
    this.depressionScore,
    this.diabetesScore,
    this.prehypertensionScore,
  });

  factory ScoresData.fromJson(Map<String, dynamic> json) => ScoresData(
    anemiascore: json["anemiascore"],
    malnutritionscore: json["prehypertensionScore"],
    bmiScore: json["bmiScore"],
    cvdScore: json["cvdScore"],
    depressionScore: json["depressionScore"],
    diabetesScore: json["diabetesScore"],
    prehypertensionScore: json["prehypertensionScore"],
  );

  Map<String, dynamic> toJson() => {
    "anemiascore": anemiascore,
    "malnutritionscore": malnutritionscore,
    "bmiScore": bmiScore,
    "cvdScore": cvdScore,
    "depressionScore": depressionScore,
    "diabetesScore": diabetesScore,
    "prehypertensionScore": prehypertensionScore,
  };
}

class ScreeningHistory {
  String? bloodGroup;
  String? breastCancerFindings;
  String? breastCancerScreening;
  String? cataract;
  String? cervicalCancerFindings;
  String? cervicalCancerScreening;
  String? colorBilndness;
  String? distanceVision;
  String? hiv;
  String? hivResult;
  String? leDv;
  String? leNv;
  String? nearVision;
  String? oralCancerScreening;
  String? oralCancerfindings;
  String? reDv;
  String? reNv;
  String? rpr;
  String? rprResult;
  bool? testLayoutVisible;
  String? vad;
  String? visionScreening;

  ScreeningHistory({
    this.bloodGroup,
    this.breastCancerFindings,
    this.breastCancerScreening,
    this.cataract,
    this.cervicalCancerFindings,
    this.cervicalCancerScreening,
    this.colorBilndness,
    this.distanceVision,
    this.hiv,
    this.hivResult,
    this.leDv,
    this.leNv,
    this.nearVision,
    this.oralCancerScreening,
    this.oralCancerfindings,
    this.reDv,
    this.reNv,
    this.rpr,
    this.rprResult,
    this.testLayoutVisible,
    this.vad,
    this.visionScreening,
  });

  factory ScreeningHistory.fromJson(Map<String, dynamic> json) =>
      ScreeningHistory(
        bloodGroup: json["bloodGroup"],
        breastCancerFindings: json["breastCancerFindings"],
        breastCancerScreening: json["breastCancerScreening"],
        cataract: json["cataract"],
        cervicalCancerFindings: json["cervicalCancerFindings"],
        cervicalCancerScreening: json["cervicalCancerScreening"],
        colorBilndness: json["colorBilndness"],
        distanceVision: json["distanceVision"],
        hiv: json["hiv"],
        hivResult: json["hivResult"],
        leDv: json["leDV"],
        leNv: json["leNV"],
        nearVision: json["nearVision"],
        oralCancerScreening: json["oralCancerScreening"],
        oralCancerfindings: json["oralCancerfindings"],
        reDv: json["reDV"],
        reNv: json["reNV"],
        rpr: json["rpr"],
        rprResult: json["rprResult"],
        testLayoutVisible: json["testLayoutVisible"],
        vad: json["vad"],
        visionScreening: json["visionScreening"],
      );

  Map<String, dynamic> toJson() => {
    "bloodGroup": bloodGroup,
    "breastCancerFindings": breastCancerFindings,
    "breastCancerScreening": breastCancerScreening,
    "cataract": cataract,
    "cervicalCancerFindings": cervicalCancerFindings,
    "cervicalCancerScreening": cervicalCancerScreening,
    "colorBilndness": colorBilndness,
    "distanceVision": distanceVision,
    "hiv": hiv,
    "hivResult": hivResult,
    "leDV": leDv,
    "leNV": leNv,
    "nearVision": nearVision,
    "oralCancerScreening": oralCancerScreening,
    "oralCancerfindings": oralCancerfindings,
    "reDV": reDv,
    "reNV": reNv,
    "rpr": rpr,
    "rprResult": rprResult,
    "testLayoutVisible": testLayoutVisible,
    "vad": vad,
    "visionScreening": visionScreening,
  };
}

class SnomedCtCodeList {
  bool? added;
  int? categoryId;
  int? frequency;
  String? snomedCtCode;

  SnomedCtCodeList({
    this.added,
    this.categoryId,
    this.frequency,
    this.snomedCtCode,
  });

  factory SnomedCtCodeList.fromJson(Map<String, dynamic> json) =>
      SnomedCtCodeList(
        added: json["added"],
        categoryId: json["categoryId"],
        frequency: json["frequency"],
        snomedCtCode: json["snomedCTCode"],
      );

  Map<String, dynamic> toJson() => {
    "added": added,
    "categoryId": categoryId,
    "frequency": frequency,
    "snomedCTCode": snomedCtCode,
  };
}

class SocialLife {
  int? age;
  String? alchoholic;
  String? alchoholicHistoryDuration;
  String? chewing;
  String? chewingHistoryduration;
  String? conceptId;
  String? drugDuration;
  String? drugs;
  String? smoking;
  String? smokingHistoryduration;
  String? tobacco;

  SocialLife({
    this.age,
    this.alchoholic,
    this.alchoholicHistoryDuration,
    this.chewing,
    this.chewingHistoryduration,
    this.conceptId,
    this.drugDuration,
    this.drugs,
    this.smoking,
    this.smokingHistoryduration,
    this.tobacco,
  });

  factory SocialLife.fromJson(Map<String, dynamic> json) => SocialLife(
    age: json["age"],
    alchoholic: json["alchoholic"],
    alchoholicHistoryDuration: json["alchoholic_history_duration"],
    chewing: json["chewing"],
    chewingHistoryduration: json["chewing_historyduration"],
    conceptId: json["conceptId"],
    drugDuration: json["drugDuration"],
    drugs: json["drugs"],
    smoking: json["smoking"],
    smokingHistoryduration: json["smoking_historyduration"],
    tobacco: json["tobacco"],
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "alchoholic": alchoholic,
    "alchoholic_history_duration": alchoholicHistoryDuration,
    "chewing": chewing,
    "chewing_historyduration": chewingHistoryduration,
    "conceptId": conceptId,
    "drugDuration": drugDuration,
    "drugs": drugs,
    "smoking": smoking,
    "smoking_historyduration": smokingHistoryduration,
    "tobacco": tobacco,
  };
}

class SymptomsList {
  String? conceptId;
  String? duration;
  bool? isChecked;
  bool? isEnabled;
  String? name;
  int? position;

  SymptomsList({
    this.conceptId,
    this.duration,
    this.isChecked,
    this.isEnabled,
    this.name,
    this.position,
  });

  factory SymptomsList.fromJson(Map<String, dynamic> json) => SymptomsList(
    conceptId: json["conceptId"],
    duration: json["duration"],
    isChecked: json["isChecked"],
    isEnabled: json["isEnabled"],
    name: json["name"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "conceptId": conceptId,
    "duration": duration,
    "isChecked": isChecked,
    "isEnabled": isEnabled,
    "name": name,
    "position": position,
  };
}

class VitalsData {
  int? age;
  int? ageInDays;
  String? apptId;
  String? bglFbs;
  String? bglPpbs;
  String? bglRbs;
  int? bloodGlucoseFbs;
  int? bloodGlucosePpbs;
  int? bloodGlucoseRbs;
  String? diabolicBloodPressure;
  String? gender;
  double? headCircumference;
  int? heightCms;
  int? heightFt;
  String? hemoglobin;
  String? measured;
  int? muac;
  String? patId;
  bool? pregnancy;
  int? pulse;
  int? respiration;
  String? spo2;
  String? systolicBloodPressure;
  String? temperature;
  int? temperatureCelsius;
  double? temperatureFahrenheit;
  String? urineGlucose;
  bool? vsmDataFlag;
  int? waistCircumference;
  int? weightKg;

  VitalsData({
    this.age,
    this.ageInDays,
    this.apptId,
    this.bglFbs,
    this.bglPpbs,
    this.bglRbs,
    this.bloodGlucoseFbs,
    this.bloodGlucosePpbs,
    this.bloodGlucoseRbs,
    this.diabolicBloodPressure,
    this.gender,
    this.headCircumference,
    this.heightCms,
    this.heightFt,
    this.hemoglobin,
    this.measured,
    this.muac,
    this.patId,
    this.pregnancy,
    this.pulse,
    this.respiration,
    this.spo2,
    this.systolicBloodPressure,
    this.temperature,
    this.temperatureCelsius,
    this.temperatureFahrenheit,
    this.urineGlucose,
    this.vsmDataFlag,
    this.waistCircumference,
    this.weightKg,
  });

  factory VitalsData.fromJson(Map<String, dynamic> json) => VitalsData(
    age: json["age"],
    ageInDays: json["ageInDays"],
    apptId: json["apptId"],
    bglFbs: json["bglFBS"],
    bglPpbs: json["bglPPBS"],
    bglRbs: json["bglRBS"],
    bloodGlucoseFbs: json["bloodGlucoseFbs"],
    bloodGlucosePpbs: json["bloodGlucosePpbs"],
    bloodGlucoseRbs: json["bloodGlucoseRbs"],
    diabolicBloodPressure: json["diabolicBloodPressure"],
    gender: json["gender"],
    headCircumference: json["headCircumference"],
    heightCms: json["heightCms"],
    heightFt: json["heightFt"],
    hemoglobin: json["hemoglobin"],
    measured: json["measured"],
    muac: json["muac"],
    patId: json["patId"],
    pregnancy: json["pregnancy"],
    pulse: json["pulse"],
    respiration: json["respiration"],
    spo2: json["spo2"],
    systolicBloodPressure: json["systolicBloodPressure"],
    temperature: json["temperature"],
    temperatureCelsius: json["temperatureCelsius"],
    temperatureFahrenheit: json["temperatureFahrenheit"].toDouble(),
    urineGlucose: json["urineGlucose"],
    vsmDataFlag: json["vsmDataFlag"],
    waistCircumference: json["waistCircumference"],
    weightKg: json["weightKg"],
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "ageInDays": ageInDays,
    "apptId": apptId,
    "bglFBS": bglFbs,
    "bglPPBS": bglPpbs,
    "bglRBS": bglRbs,
    "bloodGlucoseFbs": bloodGlucoseFbs,
    "bloodGlucosePpbs": bloodGlucosePpbs,
    "bloodGlucoseRbs": bloodGlucoseRbs,
    "diabolicBloodPressure": diabolicBloodPressure,
    "gender": gender,
    "headCircumference": headCircumference,
    "heightCms": heightCms,
    "heightFt": heightFt,
    "hemoglobin": hemoglobin,
    "measured": measured,
    "muac": muac,
    "patId": patId,
    "pregnancy": pregnancy,
    "pulse": pulse,
    "respiration": respiration,
    "spo2": spo2,
    "systolicBloodPressure": systolicBloodPressure,
    "temperature": temperature,
    "temperatureCelsius": temperatureCelsius,
    "temperatureFahrenheit": temperatureFahrenheit,
    "urineGlucose": urineGlucose,
    "vsmDataFlag": vsmDataFlag,
    "waistCircumference": waistCircumference,
    "weightKg": weightKg,
  };
}
