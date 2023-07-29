import 'dart:convert';

class ConsultationOld {
  bool? actualConsult;
  List<dynamic>? accountBillingInfo;
  bool? admitStatus;
  var allergy;
  List? allergyList;
  AncDataList? ancDataList; ////////
  AnemiaData? anemiaData;
  int? anemiaLevel;
  bool? anemiavisitForFollowp;
  bool? anemicOrPregnant;
  String? appDateTime;
  String? apptId;
  bool? bedAssigned;
  bool? billCollected;
  String? captureType;
  ChronicalDisease? chronicalDisease;
  String? clinicId;
  int? consultType;
  int? consultationStatus;
  String? createdByUserPartyId;
  String? currentIllness;

  /// TODO CHECK FOR THE CURRENTILLNESSLIST
  ///
  String? currentIllnessList; //////
  List<Datametrices>? datametrices;
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
  String? expectedDeliveryDate; ///////
  FamilyData? familyData;
  String? familyId;
  bool? familyPlanningServiceAvailed;
  bool? firstTime;
  String? followupDate;
  bool? forLabor;
  String? functionalFlag;
  String? healthEducationRequired;
  Map<String, dynamic>? immunizationList;
  bool? inAnemiaFollwUp;
  bool? inFollwUp;
  bool? isDeceased;
  bool? isTabBasedTeleConsult;
  String? lastBreastScreeningDate;
  String? lastCervicalScreenigDate;
  String? lastDeliveryPlace;
  String? lastDeliverydate;
  String? lastDepressionScreenigDate;
  String? lmp;
  String? lastDewormingHistoryDate;
  String? lastOralScreeningDate;
  String? lastVisionScreeningDate;
  String? localId;
  double? locationLat;
  double? locationLong;
  bool? malnourishedSAMorMAM;
  int? malnutritionLevel;
  MedicineDispenseData? medicineDispenseData;
  var medicineDispenseDataDeleted;

  ///POST CONSULT
  bool? medicineGiven;
  String? medongoId;
  String? miscarriages;
  String? natureOfPhyWork;
  String? numOfDeliveries;
  String? numOfPregnancy;
  String? numOfStillbirths;
  dynamic? omronWeightDto;
  String? partnerPartyId;
  String? pastIllness;
  String? pastIllnessList; //////////
  int? patAge;
  PatientData? patientData;

  /// TODO CREATE CLASS FOR THE LISITLIST
  PncVisitList? pncVisitList; ////
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
  List<SnomedCTCodeList>? snomedCTCodeList;
  SocialLife? socialLife;
  String? surgicalHistory;
  List<SymptomsList>? symptomsList;
  int? tabFlag;
  bool? teleConsult;
  String? termination;
  List<dynamic>? testList;
  String? trimester; ////////
  bool? visitForFollowp;
  VitalsData? vitalsData;
  int? zscore;

  ConsultationOld(
      {this.actualConsult,
      this.accountBillingInfo,
      this.admitStatus,
      this.allergy,
      this.ancDataList, ////
      this.allergyList,
      this.anemiaData,
      this.anemiaLevel,
      this.anemiavisitForFollowp,
      this.anemicOrPregnant,
      this.appDateTime,
      this.apptId,
      this.bedAssigned,
      this.billCollected,
      this.captureType,
      this.chronicalDisease,
      this.clinicId,
      this.consultType,
      this.consultationStatus,
      this.createdByUserPartyId,
      this.currentIllness,
      this.currentIllnessList, //////
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
      this.expectedDeliveryDate, ////
      this.familyData,
      this.familyId,
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
      this.lastDeliveryPlace, /////
      this.lastDeliverydate, /////
      this.lastDepressionScreenigDate,
      this.lmp, //////
      this.lastDewormingHistoryDate,
      this.lastOralScreeningDate,
      this.lastVisionScreeningDate,
      this.localId,
      this.locationLat,
      this.locationLong,
      this.malnourishedSAMorMAM,
      this.malnutritionLevel,
      this.medicineDispenseData,
      this.medicineDispenseDataDeleted,
      this.medicineGiven,
      this.medongoId,
      this.miscarriages,
      this.natureOfPhyWork,
      this.numOfDeliveries,
      this.numOfPregnancy,
      this.numOfStillbirths,
      this.omronWeightDto,
      this.partnerPartyId,
      this.pastIllness,
      this.pastIllnessList, /////
      this.patAge,
      this.patientData,

      /// TODO CHECK FOR THE LIST
      this.pncVisitList, /////
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
      this.snomedCTCodeList,
      this.socialLife,
      this.surgicalHistory,
      this.symptomsList,
      this.tabFlag,
      this.teleConsult,
      this.termination,
      this.testList,
      this.trimester, /////
      this.visitForFollowp,
      this.vitalsData,
      this.zscore});





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

  Referrals(
      {this.apptId,
      this.clinicName,
      this.medongoId,
      this.otherClinicName,
      this.pastHistory,
      this.presentHistory,
      this.referForReason,
      this.referFromClinicId,
      this.referralCompleted,
      this.treatmentGivenToDate});
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
  String? calciumGiven;
  String? calciumConsumed;
  bool? calciumVisible;
  String? childComplicationType;
  String? childComplications;
  String? childGender;
  String? childName;
  double? childWeight;
  String? childuniqueID;
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
    this.childuniqueID,
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
    this.typeOfDelivery,
    this.urineProteins,
    this.vaginumExamDone,
    this.visitStatusCount,
    this.vitaminKGiven,
    this.weeks,
    this.tt1Date,
    this.tt2Date,
    this.ttBoosterDate,
  });
}

class AllergyList {
  AllergyList({
    this.allergyName,
    this.conceptId,
    this.isEnabled,
    this.position,
  });

  var allergyName;
  var conceptId;
  var isEnabled;
  var position;
}

class AnemiaData {
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
    this.layoutIIVisible,
    this.nutritionalCounselling,
    this.visitStatusCount,
  });

  var age;
  var anemiaFollowup;
  var anemiaScore;
  var anemiaVisitNo;
  var bmiValue;
  var followUpPatientCount;
  var gender;
  var ifaProvided;
  var ifaProvidedQty;
  var ironSucroseProvidedQty;
  var ironSucroseProvidedVisible;
  var ironSucroseReqVisible;
  var ironSucroseRequired;
  var ironSucroseVisible;
  var layoutIIVisible;
  var nutritionalCounselling;
  var visitStatusCount;
}

class ScreeningHistory {
  ScreeningHistory({
    this.cataract,
    this.colorBilndness,
    this.distanceVision,
    this.nearVision,
    this.oralCancerScreening,
    this.oralCancerfindings,
    this.testLayoutVisible,
    this.vad,
    this.visionScreening,
    this.bloodGroup,
    this.breastCancerScreening,
    this.cervicalCancerScreening,
    this.hiv,
    this.hivResult,
    this.rpr,
    this.rprResult,
    this.breastCancerFindings,
    this.leDV,
    this.leNV,
    this.reDV,
    this.reNV,
    this.cervicalCancerFindings,
  });

  String? cataract;
  String? colorBilndness;
  String? distanceVision;
  String? rightEyeDistancePower;
  String? leftEyeDistancePower;
  String? nearVision;
  String? rightEyeNearPower;
  String? leftEyeNearPower;
  String? oralCancerScreening;
  String? oralCancerfindings;
  bool? testLayoutVisible;
  String? vad;
  String? visionScreening;

  //// TODO
  String? bloodGroup;
  String? breastCancerScreening;
  String? cervicalCancerScreening;
  String? cervicalCancerFindings;
  String? hiv;
  String? hivResult;
  String? rpr;
  String? rprResult;
  String? breastCancerFindings;
  String? leDV;
  String? leNV;
  String? reDV;
  String? reNV;
}

///CHRONICAL DISEASE - CLINICAL HISTORY
class ChronicalDisease {
  ChronicalDisease({
    this.allergy,
    this.allergyField,

    /// TODO
    this.ancVisible,
    this.anemiaLevel,
    this.conceptId,
    this.currentIllness, ////
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
    this.lmpDate, /////
    this.miscarriages,
    this.numOfPregnancy,
    this.numOfStillBirths,
    this.otherCliHisFamilyList,
    this.otherClinicalHistory,
    this.pastIllness, //////
    this.pastIllnessSize,
    this.pncVisible,
    this.pregnancy,
    this.surgical, ////
    this.termination,
    this.visitNumber,
  });

  var allergy;
  var allergyField;
  var ancVisible;
  var anemiaLevel;
  var conceptId;
  var currentIllness;
  var currentIllnessSize;
  var cvd;
  var cvdDuration;
  var cvdFamilyList;
  var cvdInFamily;
  var deworming;
  var dewormingDate;
  var diabetic;
  var diabeticDuration;
  var diabeticFamilyList;
  var diabeticInFamily;
  var havingOtherCliHisInFamily;
  var hypertenseDuration;
  var hypertensive;
  var hypertensiveFamilyList;
  var hypertensiveInFamilty;
  var illnessVisible;
  var lmpDate; //////
  var miscarriages;
  var numOfPregnancy;
  var numOfStillBirths;
  var otherCliHisFamilyList;
  var otherClinicalHistory;
  var pastIllness; /////
  var pastIllnessSize;
  var pncVisible;
  var pregnancy;
  var surgical; ////
  var termination;
  var visitNumber;
}

///todo add in vitals
class VitalsData {
  // DocumentReference<Object?>? reference;

  VitalsData({
    this.age,
    this.ageInDays,
    this.apptId,
    this.bglFBS,
    this.bglPPBS,
    this.bglRBS,
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

  var age;
  var ageInDays;
  var apptId;
  var bglFBS;
  var bglPPBS;
  var bglRBS;
  var bloodGlucoseFbs;
  var bloodGlucosePpbs;
  var bloodGlucoseRbs;
  var diabolicBloodPressure;
  var gender;
  var headCircumference;
  var heightCms;
  var heightFt;
  var hemoglobin;
  var measured;
  var muac;
  var patId;
  var pregnancy;
  var pulse;
  var respiration;
  var spo2;
  var systolicBloodPressure;
  var temperature;
  var temperatureCelsius;
  var temperatureFahrenheit;
  var urineGlucose;
  var vsmDataFlag;
  var waistCircumference;
  var weightKg;
}

class SocialLife {
  // DocumentReference<Object?>? reference;

  SocialLife({
    this.age,
    this.alchoholic,
    this.alchoholic_history_duration,
    this.chewing,
    this.chewing_historyduration,
    this.conceptId,
    this.smoking,
    this.smoking_historyduration,
    this.tobacco,
    this.drugs,

    ///
    this.drugDuration,

    ///
  });

  var age;
  var alchoholic;
  var alchoholic_history_duration;
  var chewing;
  var chewing_historyduration;
  var conceptId;
  var smoking;
  var smoking_historyduration;
  var tobacco;
  var drugs;

  ///
  var drugDuration;

  ///
}

class DocumentsList {
  // DocumentReference<Object?>? reference;

  DocumentsList(
      {this.apptId,
      this.description,
      this.ftpPath,
      this.latitude,
      this.longitude,
      this.path,
      this.pid,
      this.subcategory,
      this.type,
      this.captureDateTime, ////
      ///ADD-ON
      this.key});

  var apptId;
  var description;
  var ftpPath;
  var latitude;
  var longitude;
  var path;
  var pid;
  var subcategory;
  var type;
  var captureDateTime; ////
  ///ADD-ON
  var key;

  factory DocumentsList.fromJson(Map<String, dynamic> json) {
    return DocumentsList(
      apptId: json['apptId'],
      description: json['description'],
      ftpPath: json['ftpPath'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      path: json['path'],
      pid: json['pid'],
      subcategory: json['subcategory'],
      type: json['type'],
      key: json['key'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apptId': apptId,
      'description': description,
      'ftpPath': ftpPath,
      'latitude': latitude,
      'longitude': longitude,
      'path': path,
      'pid': pid,
      'subcategory': subcategory,
      'type': type,
      'key': key,
    };
  }
}

class PatientData {
  // DocumentReference<Object?>? reference;

  PatientData({
    this.BSCstatus,
    this.DOB,
    this.aadharId,
    this.age,
    this.ageInDays,
    this.ageInMonths,
    this.ageInYears,
    this.appStatus,
    this.bplCardNo,
    this.catagory,
    this.colourCode,
    this.consentList,
    this.createdByClinicId,
    this.createdByUserPartyId,
    this.dispenseTime,
    this.familyId,
    this.firstName,
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
    this.tabFlag,
    this.todayLabStatus,
    this.uid,
    this.updatedByClinicId,
    this.captureType,
    this.followUpApptId,
    this.siteName,
  });

  var BSCstatus;
  var DOB;
  var aadharId;
  var age;
  var ageInDays;
  var ageInMonths;
  var ageInYears;
  var appStatus;
  var bplCardNo;
  var captureType;
  var catagory;
  var colourCode;
  var consentList;
  var createdByClinicId;
  var createdByUserPartyId;
  var dispenseTime;
  var familyId;
  var firstName;
  var followUpApptId;
  var functionalFlag;
  var gender;
  var imageTakenNew;
  var imageUrl;
  var income;
  var isEdited;
  var isNew;
  var lastName;
  var localId;
  var locationLat;
  var locationLong;
  var maritalStatus;
  var medongoId;
  var mobileNumber;
  var modifiedByUserPartyId;
  var modifiedDate;
  var motherName;
  var patientVaccineList;
  var pending;
  var pushFlag;
  var registeredDate;
  var religion;
  var serverPushflag;
  var shift;
  var siteName;
  var tabFlag;
  var todayLabStatus;
  var uid;
  var updatedByClinicId;
}

class FamilyData {
  String? familyData;
  int? completed;
  bool? employeeGroup;
  String? familyCatogory;
  int? familyCount;
  String? familyId;
  String? familyName;
  int? income;
  bool? isEdited;
  int? locationLat;
  int? locationLong;
  bool? serverPushflag;
  int? tabPushFlag;
  String? totalFamilyMembers;

  FamilyData(
      {this.familyData,
      this.completed,
      this.employeeGroup,
      this.familyCatogory,
      this.familyCount,
      this.familyId,
      this.familyName,
      this.income,
      this.isEdited,
      this.locationLat,
      this.locationLong,
      this.serverPushflag,
      this.tabPushFlag,
      this.totalFamilyMembers});
}

class FamilyMembersData {
  // DocumentReference<Object?>? reference;

  FamilyMembersData({
    this.BSCstatus,
    this.DOB,
    this.aadharId,
    this.age,
    this.ageInDays,
    this.ageInMonths,
    this.ageInYears,
    this.appStatus,
    this.captureType,

    ///
    this.bplCardNo,
    this.catagory,
    this.colourCode,
    this.consentList,
    this.createdByClinicId,
    this.createdByUserPartyId,
    this.datametrices,

    ///
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
    this.siteName, ////
    this.tabFlag,
    this.todayLabStatus,
    this.uid,
    this.updatedByClinicId,
  });

  var BSCstatus;
  var DOB;
  var aadharId;
  var age;
  var ageInDays;
  var ageInMonths;
  var ageInYears;
  var appStatus;
  var captureType;

  ///
  var bplCardNo;
  var catagory;
  var colourCode;
  var consentList;
  var createdByClinicId;
  var createdByUserPartyId;
  var datametrices;

  ///
  var dispenseTime;
  var familyId;
  var firstName;
  var followUpApptId;
  var functionalFlag;
  var gender;
  var imageTakenNew;
  var imageUrl;
  var income;
  var isEdited;
  var isNew;
  var lastName;
  var localId;
  var locationLat;
  var locationLong;
  var maritalStatus;
  var medongoId;
  var mobileNumber;
  var modifiedByUserPartyId;
  var modifiedDate;
  var motherName;
  var patientVaccineList;
  var pending;
  var pushFlag;
  var registeredDate;
  var religion;
  var serverPushflag;
  var shift;
  var siteName; ////
  var tabFlag;
  var todayLabStatus;
  var uid;
  var updatedByClinicId;
}

class ScoresData {
  // DocumentReference<Object?>? reference;

  ScoresData({
    this.anemiascore,
    this.bmiScore,
    this.cvdScore,
    this.depressionScore,
    this.diabetesScore,
    this.malnutritionscore,
    this.prehypertensionScore,
  });

  var anemiascore;
  var bmiScore;
  var cvdScore;
  var depressionScore;
  var diabetesScore;
  var malnutritionscore;
  var prehypertensionScore;
}

class Datametrices {
  // DocumentReference<Object?>? reference;

  Datametrices({
    this.action,
    this.actionDate,
    this.actionId,
    this.appID,
    this.clinicId,
    this.duration,
    this.endTime,
    this.operatorId,
    this.operatorRoleId,
    this.shiftId,
    this.starttime,
    this.localId, ////
  });

  var action;
  var actionDate;
  var actionId;
  var appID;
  var clinicId;
  var duration;
  var endTime;
  var operatorId;
  var operatorRoleId;
  var shiftId;
  var starttime;
  var localId; /////
}

class SymptomsList {
  // DocumentReference<Object?>? reference;

  SymptomsList({
    this.conceptId,
    this.duration,
    this.isChecked,
    this.isEnabled,
    this.name,
    this.position,
  });

  var conceptId;
  var duration;
  var isChecked;
  var isEnabled;
  var name;
  var position;
}

class SnomedCTCodeList {
  // DocumentReference<Object?>? reference;

  SnomedCTCodeList({
    this.added,
    this.categoryId,
    this.frequency,
    this.snomedCTCode,
  });

  var added;
  var categoryId;
  var frequency;
  var snomedCTCode;
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

  PncVisitList(
      {this.ageInDays,
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
      this.visitStatusCount});
}

///POST CONSULTATION DATA
class MedicineDispenseData {
  // DocumentReference<Object?>? reference;

  MedicineDispenseData({
    this.KID_PRD_30013,
  });

  var KID_PRD_30013;

  factory MedicineDispenseData.fromJson(Map<String, dynamic> json) =>
      MedicineDispenseData(
        KID_PRD_30013: json["KID_PRD_30013"],
      );

  Map<String, dynamic> toJson() => {
        "allergyName": KID_PRD_30013,
      };

// MedicineDispenseData.fromMap(json, {this.reference}) {
//   KID_PRD_30013 = json["KID_PRD_30013"];
//
// }
//
// MedicineDispenseData.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///  MODEL CLASS  EprescriptionList
// List< EprescriptionList>  EprescriptionListFromJson(str) =>
//     List< EprescriptionList>.from((str).map((x) =>  EprescriptionList?.fromJson(x)));

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
  List<LotData>? lotData;
  List<LotList>? lotList;
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

  EprescriptionList(
      {this.listEnable,
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
      this.lotList,
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
      this.totalCount});
}

///...................
class LotData {
  int? addedCount;
  int? dispensedCount;
  String? lotNumber;
  String? productId;
  int? totalCost;

  LotData(
      {this.addedCount,
      this.dispensedCount,
      this.lotNumber,
      this.productId,
      this.totalCost});

  factory LotData.fromJson(Map<String, dynamic> json) {
    return LotData(
        addedCount: json['added_count'],
        dispensedCount: json['dispensed_count'],
        lotNumber: json['lotNumber'],
        productId: json['productId'],
        totalCost: json['totalCost']);
  }

  Map<String, Object?> toJson() {
    return {
      'added_count': this.addedCount,
      'dispensed_count': this.dispensedCount,
      'lotNumber': this.lotNumber,
      'productId': this.productId,
      'totalCost': this.totalCost,
    };
  }
}

///................

class LotList {
  int? addCount;
  String? creationDate;
  int? discardLot;
  bool? discarded;
  int? dispensedCount;
  String? expDate;
  int? expFlag;
  int? expiredLot;
  String? functionalFlag;
  bool? isModified;
  bool? lotAdded;
  String? lotNumber;
  int? noOfUnits;
  String? productId;
  int? removeCount;
  int? shift;
  int? tabPush;
  int? totalAddCount;
  int? totalCount;
  int? unitPerCost;
  int? unitSize;

  LotList(
      {this.addCount,
      this.creationDate,
      this.discardLot,
      this.discarded,
      this.dispensedCount,
      this.expDate,
      this.expFlag,
      this.expiredLot,
      this.functionalFlag,
      this.isModified,
      this.lotAdded,
      this.lotNumber,
      this.noOfUnits,
      this.productId,
      this.removeCount,
      this.shift,
      this.tabPush,
      this.totalAddCount,
      this.totalCount,
      this.unitPerCost,
      this.unitSize});
}

///TODO CHECK FOR IMMUNIZATION
// class ImmunizationList {

// 	ImmunizationList({});
// }
/// MODEL CLASS FOR DIAGNOSIS LIST

class DiagnosisList {
  DiagnosisList({
    this.conceptId,
    this.diagnoseId,
    this.diagnosisName,
    this.diagnosisType,
    this.diagnosisTypeText,
    this.isChecked,
    this.isEnabled,
  });

  var conceptId;
  var diagnoseId;
  var diagnosisName;
  var diagnosisType;
  var diagnosisTypeText;
  var isChecked;
  var isEnabled;
}

// class TestList {
// 	bool isDeleted;
// 	bool isEnabled;
// 	bool sampleCollected;
// 	bool sampleDispatched;
// 	String sampleType;
// 	int testAmount;
// 	int testCode;
// 	String testDateTime;
// 	String testId;
// 	String testName;
// 	int testStatus;

// 	TestList({this.isDeleted, this.isEnabled, this.sampleCollected, this.sampleDispatched, this.sampleType, this.testAmount, this.testCode, this.testDateTime, this.testId, this.testName, this.testStatus});
// }

///OLD DATA
/*
import 'dart:convert';



class Consultation{

  bool?                actualConsult;
  List<dynamic>?         accountBillingInfo;
  bool?                 admitStatus;
  String?             allergy;
  List<AllergyList>?    allergyList;
  AnemiaData?          anemiaData;
  int?                anemiaLevel;
  bool?               anemiavisitForFollowp;
  bool?               anemicOrPregnant;
  String?               appDateTime;
  String?             apptId;
  bool?               bedAssigned;
  bool?               billCollected;
  String?             captureType;
  ChronicalDisease?   chronicalDisease;
  String?              clinicId;
  int?                  consultType;
  int?                  consultationStatus;
  String?                   createdByUserPartyId;
  String?                 currentIllness;
  List<Datametrices>?     datametrices;
  String?                 depressionProblem;
  String?                 depressionProblem1;
  String?                 dewomingGiven;
  List<DiagnosisList>?    diagnosisList;
  String?                 doctorAdvice;
  bool?                   doctorCreated;
  String?                 doctorNote;
  List<DocumentsList>?      documentsList;
  bool?                    dressingDone;
  bool?                    dressingRequired;
  List<EprescriptionList>? eprescriptionList;
  FamilyData?               familyData;
  String?                   familyId;
  bool?                     familyPlanningServiceAvailed;
  bool?                     firstTime;
  String?                     followupDate;
  bool?                         forLabor;
  String?                 functionalFlag;
  String? healthEducationRequired;
  List<dynamic>? immunizationList;
  bool? inAnemiaFollwUp;
  bool? inFollwUp;
  bool? isDeceased;
  bool? isTabBasedTeleConsult;
  String? lastDepressionScreenigDate;
  String? lastDewormingHistoryDate;
  String? lastOralScreeningDate;
  String? lastVisionScreeningDate;
  String? localId;
  double? locationLat;
  double? locationLong;
  bool? malnourishedSAMorMAM;
  int? malnutritionLevel;
  var medicineDispenseData;
  List<dynamic>?  medicineDispenseDataDeleted;
  bool? medicineGiven;
  String? medongoId;
  String? miscarriages;
  String? natureOfPhyWork;
  String? numOfDeliveries;
  String? numOfPregnancy;
  String? numOfStillbirths;
  List<dynamic>? omronWeightDto;
  String? partnerPartyId;
  String? pastIllness;
  int? patAge;
  PatientData? patientData;
  bool? pregnancy;
  String? prescPdfPath;
  bool? printPending;
  int? pushFlag;
  List<dynamic>? referralList;
  ScoresData? scoresData;
  ScreeningHistory? screeningHistory;
  bool? serverPushflag;
  int? shift;
  String? siteName;
  List<SnomedCTCodeList>? snomedCTCodeList;
  SocialLife? socialLife;
  String? surgicalHistory;
  List<SymptomsList>? symptomsList;
  int? tabFlag;
  bool? teleConsult;
  String? termination;
  List<dynamic>? testList;
  bool? visitForFollowp;
  VitalsData? vitalsData;
  int? zscore;

  Consultation ({this.actualConsult,
    this.accountBillingInfo,
    this.admitStatus,
    this.allergy,
    this.allergyList,
    this.anemiaData,
    this.anemiaLevel,
    this.anemiavisitForFollowp,
    this.anemicOrPregnant,
    this.appDateTime,
    this.apptId,
    this.bedAssigned,
    this.billCollected,
    this.captureType,
    this.chronicalDisease,
    this.clinicId,
    this.consultType,
    this.consultationStatus,
    this.createdByUserPartyId,
    this.currentIllness,
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
    this.familyData,
    this.familyId,
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
    this.lastDepressionScreenigDate,
    this.lastDewormingHistoryDate,
    this.lastOralScreeningDate,
    this.lastVisionScreeningDate,
    this.localId,
    this.locationLat,
    this.locationLong,
    this.malnourishedSAMorMAM,
    this.malnutritionLevel,
    this.medicineDispenseData,
    this.medicineDispenseDataDeleted,
    this.medicineGiven,
    this.medongoId,
    this.miscarriages,
    this.natureOfPhyWork,
    this.numOfDeliveries,
    this.numOfPregnancy,
    this.numOfStillbirths,
    this.omronWeightDto,
    this.partnerPartyId,
    this.pastIllness,
    this.patAge,
    this.patientData,
    this.pregnancy,
    this.prescPdfPath,
    this.printPending,
    this.pushFlag,
    this.referralList,
    this.scoresData,
    this.screeningHistory,
    this.serverPushflag,
    this.shift,
    this.siteName,
    this.snomedCTCodeList,
    this.socialLife,
    this.surgicalHistory,
    this.symptomsList,
    this.tabFlag,
    this.teleConsult,
    this.termination,
    this.testList,
    this.visitForFollowp,
    this.vitalsData,
    this.zscore});

}


class AllergyList {
  AllergyList({
    this.allergyName,
    this.conceptId,
    this.isEnabled,
    this.position,
  });

  var allergyName;
  var conceptId;
  var isEnabled;
  var position;

}


class AnemiaData {

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
  this.layoutIIVisible,
  this.nutritionalCounselling,
  this.visitStatusCount,
  });

  var age;
  var anemiaFollowup;
  var anemiaScore;
  var anemiaVisitNo;
  var bmiValue;
  var followUpPatientCount;
  var gender;
  var ifaProvided;
  var ifaProvidedQty;
  var ironSucroseProvidedQty;
  var ironSucroseProvidedVisible;
  var ironSucroseReqVisible;
  var ironSucroseRequired;
  var ironSucroseVisible;
  var layoutIIVisible;
  var nutritionalCounselling;
  var visitStatusCount;

}



class ScreeningHistory {
  // DocumentReference<Object?>? reference;

  ScreeningHistory({
    this.cataract,
    this.colorBilndness,
    this.distanceVision,
    this.nearVision,
    this.oralCancerScreening,
    this.oralCancerfindings,
    this.testLayoutVisible,
    this.vad,
    this.visionScreening,

  });

   String? cataract;
   String? colorBilndness;
   String? distanceVision;
   String? rightEyeDistancePower;
   String? leftEyeDistancePower;
   String? nearVision;
   String? rightEyeNearPower;
   String? leftEyeNearPower;
   String? oralCancerScreening;
   String? oralCancerfindings;
   String? testLayoutVisible;
   String? vad;
   String? visionScreening;


}

///CHRONICAL DISEASE - CLINICAL HISTORY
class ChronicalDisease {
  // DocumentReference<Object?>? reference;

  ChronicalDisease({
   this.allergy,
   this.allergyField,
   this.ancVisible,
   this.anemiaLevel,
   this.conceptId,
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
   this.miscarriages,
   this.numOfPregnancy,
   this.numOfStillBirths,
   this.otherCliHisFamilyList,
   this.otherClinicalHistory,
   this.pastIllnessSize,
   this.pncVisible,
   this.pregnancy,
   this.termination,
   this.visitNumber,
  });

  var allergy;
  var allergyField;
  var ancVisible;
  var anemiaLevel;
  var conceptId;
  var currentIllnessSize;
  var cvd;
  var cvdDuration;
  var cvdFamilyList;
  var cvdInFamily;
  var deworming;
  var dewormingDate;
  var diabetic;
  var diabeticDuration;
  var diabeticFamilyList;
  var diabeticInFamily;
  var havingOtherCliHisInFamily;
  var hypertenseDuration;
  var hypertensive;
  var hypertensiveFamilyList;
  var hypertensiveInFamilty;
  var illnessVisible;
  var miscarriages;
  var numOfPregnancy;
  var numOfStillBirths;
  var otherCliHisFamilyList;
  var otherClinicalHistory;
  var pastIllnessSize;
  var pncVisible;
  var pregnancy;
  var termination;
  var visitNumber;



}


///todo add in vitals
class VitalsData {
  // DocumentReference<Object?>? reference;

  VitalsData({
   this.age,
   this.ageInDays,
   this.apptId,
   this.bglFBS,
   this.bglPPBS,
   this.bglRBS,
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

  var age;
  var ageInDays;
  var apptId;
  var bglFBS;
  var bglPPBS;
  var bglRBS;
  var bloodGlucoseFbs;
  var bloodGlucosePpbs;
  var bloodGlucoseRbs;
  var diabolicBloodPressure;
  var gender;
  var headCircumference;
  var heightCms;
  var heightFt;
  var hemoglobin;
  var measured;
  var muac;
  var patId;
  var pregnancy;
  var pulse;
  var respiration;
  var spo2;
  var systolicBloodPressure;
  var temperature;
  var temperatureCelsius;
  var temperatureFahrenheit;
  var urineGlucose;
  var vsmDataFlag;
  var waistCircumference;
  var weightKg;

}


class SocialLife {
  // DocumentReference<Object?>? reference;

  SocialLife({
    this.age,
    this.alchoholic,
    this.alchoholic_history_duration,
    this.chewing,
    this.chewing_historyduration,
    this.conceptId,
    this.smoking,
    this.smoking_historyduration,
    this.tobacco,
  });

  var age;
  var alchoholic;
  var alchoholic_history_duration;
  var chewing;
  var chewing_historyduration;
  var conceptId;
  var smoking;
  var smoking_historyduration;
  var tobacco;
}


class PatientData {
  // DocumentReference<Object?>? reference;

  PatientData({
   this.BSCstatus,
   this.DOB,
   this.aadharId,
   this.age,
   this.ageInDays,
   this.ageInMonths,
   this.ageInYears,
   this.appStatus,
   this.bplCardNo,
   this.catagory,
   this.colourCode,
   this.consentList,
   this.createdByClinicId,
   this.createdByUserPartyId,
   this.dispenseTime,
   this.familyId,
   this.firstName,
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
   this.tabFlag,
   this.todayLabStatus,
   this.uid,
   this.updatedByClinicId,
  });

  var BSCstatus;
  var DOB;
  var aadharId;
  var age;
  var ageInDays;
  var ageInMonths;
  var ageInYears;
  var appStatus;
  var bplCardNo;
  var catagory;
  var colourCode;
  var consentList;
  var createdByClinicId;
  var createdByUserPartyId;
  var dispenseTime;
  var familyId;
  var firstName;
  var functionalFlag;
  var gender;
  var imageTakenNew;
  var imageUrl;
  var income;
  var isEdited;
  var isNew;
  var lastName;
  var localId;
  var locationLat;
  var locationLong;
  var maritalStatus;
  var medongoId;
  var mobileNumber;
  var modifiedByUserPartyId;
  var modifiedDate;
  var motherName;
  var patientVaccineList;
  var pending;
  var pushFlag;
  var registeredDate;
  var religion;
  var serverPushflag;
  var shift;
  var tabFlag;
  var todayLabStatus;
  var uid;
  var updatedByClinicId;




  ///

}

class FamilyData {
  String? familyData;
  String? completed;
  String? employeeGroup;
  String? familyCatogory;
  String? familyCount;
  String? familyId;


  FamilyData({
   this.familyData,
   this.completed,
   this.employeeGroup,
   this.familyCatogory,
   this.familyCount,
   this.familyId
  });

}

class FamilyMembersData {
  // DocumentReference<Object?>? reference;

  FamilyMembersData({
   this.BSCstatus,
   this.DOB,
   this.aadharId,
   this.age,
   this.ageInDays,
   this.ageInMonths,
   this.ageInYears,
   this.appStatus,
   this.bplCardNo,
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
   this.tabFlag,
   this.todayLabStatus,
   this.uid,
   this.updatedByClinicId,
  });

  var BSCstatus;
  var DOB;
  var aadharId;
  var age;
  var ageInDays;
  var ageInMonths;
  var ageInYears;
  var appStatus;
  var bplCardNo;
  var catagory;
  var colourCode;
  var consentList;
  var createdByClinicId;
  var createdByUserPartyId;
  var dispenseTime;
  var familyId;
  var firstName;
  var followUpApptId;
  var functionalFlag;
  var gender;
  var imageTakenNew;
  var imageUrl;
  var income;
  var isEdited;
  var isNew;
  var lastName;
  var localId;
  var locationLat;
  var locationLong;
  var maritalStatus;
  var medongoId;
  var mobileNumber;
  var modifiedByUserPartyId;
  var modifiedDate;
  var motherName;
  var patientVaccineList;
  var pending;
  var pushFlag;
  var registeredDate;
  var religion;
  var serverPushflag;
  var shift;
  var tabFlag;
  var todayLabStatus;
  var uid;
  var updatedByClinicId;
}


class ScoresData {
  // DocumentReference<Object?>? reference;

  ScoresData({
   this.anemiascore,
   this.bmiScore,
   this.cvdScore,
   this.depressionScore,
   this.diabetesScore,
   this.malnutritionscore,
   this.prehypertensionScore,

  });

  var anemiascore;
  var bmiScore;
  var cvdScore;
  var depressionScore;
  var diabetesScore;
  var malnutritionscore;
  var prehypertensionScore;

}

class Datametrices {
  // DocumentReference<Object?>? reference;

  Datametrices({
   this.action,
   this.actionDate,
   this.actionId,
   this.appID,
   this.clinicId,
   this.duration,
   this.endTime,
   this.operatorId,
   this.operatorRoleId,
   this.shiftId,
   this.starttime,


  });

  var action;
  var actionDate;
  var actionId;
  var appID;
  var clinicId;
  var duration;
  var endTime;
  var operatorId;
  var operatorRoleId;
  var shiftId;
  var starttime;

}

class SymptomsList {
  // DocumentReference<Object?>? reference;

  SymptomsList({
   this.conceptId,
   this.duration,
   this.isChecked,
   this.isEnabled,
   this.name,
   this.position,

  });

  var conceptId;
  var duration;
  var isChecked;
  var isEnabled;
  var name;
  var position;
}

class SnomedCTCodeList {
  // DocumentReference<Object?>? reference;

  SnomedCTCodeList({
   this.added,
   this.categoryId,
   this.frequency,
   this.snomedCTCode,
  });

  var added;
  var categoryId;
  var frequency;
  var snomedCTCode;

}









///TODO - DO NOT CHANGE
class DocumentsList {
  // DocumentReference<Object?>? reference;

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
    ///ADD-ON
    this.key

  });

  var apptId;
  var description;
  var ftpPath;
  var latitude;
  var longitude;
  var path;
  var pid;
  var subcategory;
  var type;
  ///ADD-ON
  var key;


  factory DocumentsList.fromJson(Map<String, dynamic> json) {
    return DocumentsList(
      apptId: json['apptId'],
      description: json['description'],
      ftpPath: json['ftpPath'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      path: json['path'],
      pid: json['pid'],
      subcategory: json['subcategory'],
      type: json['type'],
      key: json['key'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apptId': apptId,
      'description': description,
      'ftpPath': ftpPath,
      'latitude': latitude,
      'longitude': longitude,
      'path': path,
      'pid': pid,
      'subcategory': subcategory,
      'type': type,
      'key': key,
    };
  }



}





///POST CONSULTATION DATA
class MedicineDispenseData {
  // DocumentReference<Object?>? reference;

  MedicineDispenseData({
     this.KID_PRD_30013,
  });

  var KID_PRD_30013;

  factory MedicineDispenseData.fromJson(Map<String, dynamic> json) => MedicineDispenseData(
    KID_PRD_30013: json["KID_PRD_30013"],

  );

  Map<String, dynamic> toJson() => {
    "allergyName": KID_PRD_30013,

  };

// MedicineDispenseData.fromMap(json, {this.reference}) {
//   KID_PRD_30013 = json["KID_PRD_30013"];
//
// }
//
// MedicineDispenseData.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///  MODEL CLASS  EprescriptionList
// List< EprescriptionList>  EprescriptionListFromJson(str) =>
//     List< EprescriptionList>.from((str).map((x) =>  EprescriptionList?.fromJson(x)));

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
  List<LotData>? lotData;
  List<LotList>? lotList;
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

  EprescriptionList({this.listEnable,
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
    this.lotList,
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
    this.totalCount});
}


///...................
class LotData {
  int? addedCount;
  int? dispensedCount;
  String? lotNumber;
  String? productId;
  int? totalCost;

  LotData(
      {this.addedCount,
        this.dispensedCount,
        this.lotNumber,
        this.productId,
        this.totalCost});

  factory LotData.fromJson(Map<String, dynamic> json) {
    return LotData(
        addedCount : json['added_count'],
        dispensedCount : json['dispensed_count'],
        lotNumber : json['lotNumber'],
        productId : json['productId'],
        totalCost : json['totalCost']);
  }

  Map<String, Object?> toJson() {
    return {
      'added_count': this.addedCount,
      'dispensed_count' : this.dispensedCount,
      'lotNumber' : this.lotNumber,
      'productId' : this.productId,
      'totalCost' : this.totalCost,
    };
  }
}
///................

class LotList {
  int? addCount;
  String? creationDate;
  int? discardLot;
  bool? discarded;
  int? dispensedCount;
  String? expDate;
  int? expFlag;
  int? expiredLot;
  String? functionalFlag;
  bool? isModified;
  bool? lotAdded;
  String? lotNumber;
  int? noOfUnits;
  String? productId;
  int? removeCount;
  int? shift;
  int? tabPush;
  int? totalAddCount;
  int? totalCount;
  int? unitPerCost;
  int? unitSize;

  LotList(
      {this.addCount,
        this.creationDate,
        this.discardLot,
        this.discarded,
        this.dispensedCount,
        this.expDate,
        this.expFlag,
        this.expiredLot,
        this.functionalFlag,
        this.isModified,
        this.lotAdded,
        this.lotNumber,
        this.noOfUnits,
        this.productId,
        this.removeCount,
        this.shift,
        this.tabPush,
        this.totalAddCount,
        this.totalCount,
        this.unitPerCost,
        this.unitSize});
}

/// MODEL CLASS FOR DIAGNOSIS LIST


class DiagnosisList {
  DiagnosisList({
    this.conceptId,
    this.diagnoseId,
    this.diagnosisName,
    this.diagnosisType,
    this.diagnosisTypeText,
    this.isChecked,
    this.isEnabled,

  });

  var conceptId;
  var diagnoseId;
  var diagnosisName;
  var diagnosisType;
  var diagnosisTypeText;
  var isChecked;
  var isEnabled;

}




// DiagnosisList.fromMap(json, {this.reference}) {
//   conceptId = json["conceptId"];
//   diagnoseId = json["diagnoseId"];
//   diagnosisName = json["diagnosisName"];
//   diagnosisType = json["diagnosisType"];
//   diagnosisTypeText = json["diagnosisTypeText"];
//   isChecked = json["isChecked"];
//   isEnabled = json["isEnabled"];
// }
//
// DiagnosisList.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);









///COPY FROM YUGAL
*/
/*
import 'package:cloud_firestore/cloud_firestore.dart';

class AllergyList {
  DocumentReference<Object?>? reference;

  AllergyList({
    this.allergyName,
    this.conceptId,
    this.isEnabled,
    this.position,
  });

  var allergyName;
  var conceptId;
  var isEnabled;
  var position;

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

  AllergyList.fromMap(json, {this.reference}) {
    allergyName = json["allergyName"];
    conceptId = json["conceptId"];
    isEnabled = json["isEnabled"];
    position = json["position"];
  }

  AllergyList.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///......................................................................


class AnemiaData {
  DocumentReference<Object?>? reference;

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
    this.layoutIIVisible,
    this.nutritionalCounselling,
    this.visitStatusCount,
  });

  var age;
  var anemiaFollowup;
  var anemiaScore;
  var anemiaVisitNo;
  var bmiValue;
  var followUpPatientCount;
  var gender;
  var ifaProvided;
  var ifaProvidedQty;
  var ironSucroseProvidedQty;
  var ironSucroseProvidedVisible;
  var ironSucroseReqVisible;
  var ironSucroseRequired;
  var ironSucroseVisible;
  var layoutIIVisible;
  var nutritionalCounselling;
  var visitStatusCount;

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
    layoutIIVisible: json["layoutIIVisible"],
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
    "layoutIIVisible": layoutIIVisible,
    "nutritionalCounselling": nutritionalCounselling,
    "visitStatusCount": visitStatusCount,
  };

  AnemiaData.fromMap(json, {this.reference}) {
    age = json["age"];
    anemiaFollowup = json["anemiaFollowup"];
    anemiaScore = json["anemiaScore"];
    anemiaVisitNo = json["anemiaVisitNo"];
    bmiValue = json["bmiValue"];
    followUpPatientCount = json["followUpPatientCount"];
    gender = json["gender"];
    ifaProvided = json["ifaProvided"];
    ifaProvidedQty = json["ifaProvidedQty"];
    ironSucroseProvidedQty = json["ironSucroseProvidedQty"];
    ironSucroseProvidedVisible = json["ironSucroseProvidedVisible"];
    ironSucroseReqVisible = json["ironSucroseReqVisible"];
    ironSucroseRequired = json["ironSucroseRequired"];
    ironSucroseVisible = json["ironSucroseVisible"];
    layoutIIVisible = json["layoutIIVisible"];
    nutritionalCounselling = json["nutritionalCounselling"];
    visitStatusCount = json["visitStatusCount"];

  }

  AnemiaData.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///...............................................................................

class Datametrices {
  DocumentReference<Object?>? reference;

  Datametrices({
    this.action,
    this.actionDate,
    this.actionId,
    this.appID,
    this.clinicId,
    this.duration,
    this.endTime,
    this.operatorId,
    this.operatorRoleId,
    this.shiftId,
    this.starttime,


  });

  var action;
  var actionDate;
  var actionId;
  var appID;
  var clinicId;
  var duration;
  var endTime;
  var operatorId;
  var operatorRoleId;
  var shiftId;
  var starttime;



  factory Datametrices.fromJson(Map<String, dynamic> json) => Datametrices(
    action: json["action"],
    actionDate: json["actionDate"],
    actionId: json["actionId"],
    appID: json["appID"],
    clinicId: json["clinicId"],
    duration: json["duration"],
    endTime: json["endTime"],
    operatorId: json["operatorId"],
    operatorRoleId: json["operatorRoleId"],
    shiftId: json["shiftId"],
    starttime: json["starttime"],

  );

  Map<String, dynamic> toJson() => {
    "action": action,
    "actionDate": actionDate,
    "actionId": actionId,
    "appID": appID,
    "clinicId": clinicId,
    "duration": duration,
    "endTime": endTime,
    "operatorId": operatorId,
    "operatorRoleId": operatorRoleId,
    "shiftId": shiftId,
    "starttime": starttime,

  };

  Datametrices.fromMap(json, {this.reference}) {
    action = json["action"];
    actionDate = json["actionDate"];
    actionId = json["actionId"];
    appID = json["appID"];
    clinicId = json["clinicId"];
    duration = json["duration"];
    endTime = json["endTime"];
    operatorId = json["operatorId"];
    operatorRoleId = json["operatorRoleId"];
    shiftId = json["shiftId"];
    starttime = json["starttime"];


  }

  Datametrices.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///..........................................................................




class ChronicalDisease {
  DocumentReference<Object?>? reference;

  ChronicalDisease({
    this.allergy,
    this.allergyField,
    this.ancVisible,
    this.anemiaLevel,
    this.conceptId,
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
    this.miscarriages,
    this.numOfPregnancy,
    this.numOfStillBirths,
    this.otherCliHisFamilyList,
    this.otherClinicalHistory,
    this.pastIllnessSize,
    this.pncVisible,
    this.pregnancy,
    this.termination,
    this.visitNumber,
  });

  var allergy;
  var allergyField;
  var ancVisible;
  var anemiaLevel;
  var conceptId;
  var currentIllnessSize;
  var cvd;
  var cvdDuration;
  var cvdFamilyList;
  var cvdInFamily;
  var deworming;
  var dewormingDate;
  var diabetic;
  var diabeticDuration;
  var diabeticFamilyList;
  var diabeticInFamily;
  var havingOtherCliHisInFamily;
  var hypertenseDuration;
  var hypertensive;
  var hypertensiveFamilyList;
  var hypertensiveInFamilty;
  var illnessVisible;
  var miscarriages;
  var numOfPregnancy;
  var numOfStillBirths;
  var otherCliHisFamilyList;
  var otherClinicalHistory;
  var pastIllnessSize;
  var pncVisible;
  var pregnancy;
  var termination;
  var visitNumber;


  factory ChronicalDisease.fromJson(Map<String, dynamic> json) => ChronicalDisease(
    allergy: json["allergy"],
    allergyField: json["allergyField"],
    ancVisible: json["ancVisible"],
    anemiaLevel: json["anemiaLevel"],
    conceptId: json["conceptId"],
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
    miscarriages: json["miscarriages"],
    numOfPregnancy: json["numOfPregnancy"],
    numOfStillBirths: json["numOfStillBirths"],
    otherCliHisFamilyList: json["otherCliHisFamilyList"],
    otherClinicalHistory: json["otherClinicalHistory"],
    pastIllnessSize: json["pastIllnessSize"],
    pncVisible: json["pncVisible"],
    pregnancy: json["pregnancy"],
    termination: json["termination"],
    visitNumber: json["visitNumber"],

  );

  Map<String, dynamic> toJson() => {
    "allergy": allergy,
    "allergyField": allergyField,
    "ancVisible": ancVisible,
    "anemiaLevel": anemiaLevel,
    "conceptId": conceptId,
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
    "miscarriages": miscarriages,
    "numOfPregnancy": numOfPregnancy,
    "numOfStillBirths": numOfStillBirths,
    "otherCliHisFamilyList": otherCliHisFamilyList,
    "otherClinicalHistory": otherClinicalHistory,
    "pastIllnessSize": pastIllnessSize,
    "pncVisible": pncVisible,
    "pregnancy": pregnancy,
    "termination": termination,
    "visitNumber": visitNumber,


  };

  ChronicalDisease.fromMap(json, {this.reference}) {
    allergy = json["allergy"];
    allergyField = json["allergyField"];
    ancVisible = json["ancVisible"];
    anemiaLevel = json["anemiaLevel"];
    conceptId = json["conceptId"];
    currentIllnessSize = json["currentIllnessSize"];
    cvd = json["cvd"];
    cvdDuration = json["cvdDuration"];
    cvdFamilyList = json["cvdFamilyList"];
    cvdInFamily = json["cvdInFamily"];
    deworming = json["deworming"];
    dewormingDate = json["dewormingDate"];
    diabetic = json["diabetic"];
    diabeticDuration = json["diabeticDuration"];
    diabeticFamilyList = json["diabeticFamilyList"];
    diabeticInFamily = json["diabeticInFamily"];
    havingOtherCliHisInFamily = json["havingOtherCliHisInFamily"];
    hypertenseDuration = json["hypertenseDuration"];
    hypertensive = json["hypertensive"];
    hypertensiveFamilyList = json["hypertensiveFamilyList"];
    hypertensiveInFamilty = json["hypertensiveInFamilty"];
    illnessVisible = json["illnessVisible"];
    miscarriages = json["miscarriages"];
    numOfPregnancy = json["numOfPregnancy"];
    numOfStillBirths = json["numOfStillBirths"];
    otherCliHisFamilyList = json["otherCliHisFamilyList"];
    otherClinicalHistory = json["otherClinicalHistory"];
    pastIllnessSize = json["pastIllnessSize"];
    pncVisible = json["pncVisible"];
    pregnancy = json["pregnancy"];
    termination = json["termination"];
    visitNumber = json["visitNumber"];




  }

  ChronicalDisease.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///.....................................................................
class DiagnosisList {
  DocumentReference<Object?>? reference;

  DiagnosisList({
    this.conceptId,
    this.diagnoseId,
    this.diagnosisName,
    this.diagnosisType,
    this.diagnosisTypeText,
    this.isChecked,
    this.isEnabled,

  });

  var conceptId;
  var diagnoseId;
  var diagnosisName;
  var diagnosisType;
  var diagnosisTypeText;
  var isChecked;
  var isEnabled;


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

  DiagnosisList.fromMap(json, {this.reference}) {
    conceptId = json["conceptId"];
    diagnoseId = json["diagnoseId"];
    diagnosisName = json["diagnosisName"];
    diagnosisType = json["diagnosisType"];
    diagnosisTypeText = json["diagnosisTypeText"];
    isChecked = json["isChecked"];
    isEnabled = json["isEnabled"];
  }

  DiagnosisList.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
///......................................................................
class DocumentsList {
  DocumentReference<Object?>? reference;

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

  });

  var apptId;
  var description;
  var ftpPath;
  var latitude;
  var longitude;
  var path;
  var pid;
  var subcategory;
  var type;


  factory DocumentsList.fromJson(Map<String, dynamic> json) => DocumentsList(
    apptId: json["apptId"],
    description: json["description"],
    ftpPath: json["ftpPath"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    path: json["path"],
    pid: json["pid"],
    subcategory: json["subcategory"],
    type: json["type"],

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
  };

  DocumentsList.fromMap(json, {this.reference}) {
    apptId = json["apptId"];
    description = json["description"];
    ftpPath = json["ftpPath"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    path = json["path"];
    pid = json["pid"];
    subcategory = json["subcategory"];
    type = json["type"];
  }

  DocumentsList.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
///.........................................................................











///.........................................................................




class FamilyMembersData {
  DocumentReference<Object?>? reference;

  FamilyMembersData({
    this.BSCstatus,
    this.DOB,
    this.aadharId,
    this.age,
    this.ageInDays,
    this.ageInMonths,
    this.ageInYears,
    this.appStatus,
    this.bplCardNo,
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
    this.tabFlag,
    this.todayLabStatus,
    this.uid,
    this.updatedByClinicId,
  });

  var BSCstatus;
  var DOB;
  var aadharId;
  var age;
  var ageInDays;
  var ageInMonths;
  var ageInYears;
  var appStatus;
  var bplCardNo;
  var catagory;
  var colourCode;
  var consentList;
  var createdByClinicId;
  var createdByUserPartyId;
  var dispenseTime;
  var familyId;
  var firstName;
  var followUpApptId;
  var functionalFlag;
  var gender;
  var imageTakenNew;
  var imageUrl;
  var income;
  var isEdited;
  var isNew;
  var lastName;
  var localId;
  var locationLat;
  var locationLong;
  var maritalStatus;
  var medongoId;
  var mobileNumber;
  var modifiedByUserPartyId;
  var modifiedDate;
  var motherName;
  var patientVaccineList;
  var pending;
  var pushFlag;
  var registeredDate;
  var religion;
  var serverPushflag;
  var shift;
  var tabFlag;
  var todayLabStatus;
  var uid;
  var updatedByClinicId;



  factory FamilyMembersData.fromJson(Map<String, dynamic> json) => FamilyMembersData(
    BSCstatus: json["BSCstatus"],
    DOB: json["DOB"],
    aadharId: json["aadharId"],
    age: json["age"],
    ageInDays: json["ageInDays"],
    ageInMonths: json["ageInMonths"],
    ageInYears: json["ageInYears"],
    appStatus: json["appStatus"],
    bplCardNo: json["bplCardNo"],
    catagory: json["catagory"],
    colourCode: json["colourCode"],
    consentList: json["consentList"],
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
    locationLat: json["locationLat"],
    locationLong: json["locationLong"],
    maritalStatus: json["maritalStatus"],
    medongoId: json["medongoId"],
    mobileNumber: json["mobileNumber"],
    modifiedByUserPartyId: json["modifiedByUserPartyId"],
    modifiedDate: json["modifiedDate"],
    motherName: json["motherName"],
    patientVaccineList: json["patientVaccineList"],
    pending: json["pending"],
    pushFlag: json["pushFlag"],
    registeredDate: json["registeredDate"],
    religion: json["religion"],
    serverPushflag: json["serverPushflag"],
    shift: json["shift"],
    tabFlag: json["tabFlag"],
    todayLabStatus: json["todayLabStatus"],
    uid: json["uid"],
    updatedByClinicId: json["updatedByClinicId"],

  );

  Map<String, dynamic> toJson() => {
    "BSCstatus": BSCstatus,
    "DOB": DOB,
    "aadharId": aadharId,
    "age": age,
    "ageInDays": ageInDays,
    "ageInMonths": ageInMonths,
    "ageInYears": ageInYears,
    "appStatus": appStatus,
    "bplCardNo": bplCardNo,
    "catagory": catagory,
    "colourCode": colourCode,
    "consentList": consentList,
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
    "patientVaccineList": patientVaccineList,
    "pending": pending,
    "pushFlag": pushFlag,
    "registeredDate": registeredDate,
    "religion": religion,
    "serverPushflag": serverPushflag,
    "shift": shift,
    "tabFlag": tabFlag,
    "todayLabStatus": todayLabStatus,
    "uid": uid,
    "updatedByClinicId": updatedByClinicId,



  };

  FamilyMembersData.fromMap(json, {this.reference}) {
    BSCstatus = json["BSCstatus"];
    DOB = json["DOB"];
    aadharId = json["aadharId"];
    age = json["age"];
    ageInDays = json["ageInDays"];
    ageInMonths = json["ageInMonths"];
    ageInYears = json["ageInYears"];
    appStatus = json["appStatus"];
    bplCardNo = json["bplCardNo"];
    catagory = json["catagory"];
    colourCode = json["colourCode"];
    consentList = json["consentList"];
    createdByClinicId = json["createdByClinicId"];
    createdByUserPartyId = json["createdByUserPartyId"];
    dispenseTime = json["dispenseTime"];
    familyId = json["familyId"];
    firstName = json["firstName"];
    followUpApptId = json["followUpApptId"];
    functionalFlag = json["functionalFlag"];
    gender = json["gender"];
    imageTakenNew = json["imageTakenNew"];
    imageUrl = json["imageUrl"];
    income = json["income"];
    isEdited = json["isEdited"];
    isNew = json["isNew"];
    lastName = json["lastName"];
    localId = json["localId"];
    locationLat = json["locationLat"];
    locationLong = json["locationLong"];
    maritalStatus = json["maritalStatus"];
    medongoId = json["medongoId"];
    mobileNumber = json["mobileNumber"];
    modifiedByUserPartyId = json["modifiedByUserPartyId"];
    modifiedDate = json["modifiedDate"];
    motherName = json["motherName"];
    patientVaccineList = json["patientVaccineList"];
    pending = json["pending"];
    pushFlag = json["pushFlag"];
    registeredDate = json["registeredDate"];
    religion = json["religion"];
    serverPushflag = json["serverPushflag"];
    shift = json["shift"];
    tabFlag = json["tabFlag"];
    todayLabStatus = json["todayLabStatus"];
    uid = json["uid"];
    updatedByClinicId = json["updatedByClinicId"];





  }

  FamilyMembersData.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}




///.........................................................................
///TODO CHECK THIS OUT
class MedicineDispenseData {
  DocumentReference<Object?>? reference;

  MedicineDispenseData({
    this.KID_PRD_30013,
  });

  var KID_PRD_30013;

  factory MedicineDispenseData.fromJson(Map<String, dynamic> json) => MedicineDispenseData(
    KID_PRD_30013: json["KID_PRD_30013"],

  );

  Map<String, dynamic> toJson() => {
    "allergyName": KID_PRD_30013,

  };

  MedicineDispenseData.fromMap(json, {this.reference}) {
    KID_PRD_30013 = json["KID_PRD_30013"];

  }

  MedicineDispenseData.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///.........................................................................




class PatientData {
  DocumentReference<Object?>? reference;

  PatientData({
    this.BSCstatus,
    this.DOB,
    this.aadharId,
    this.age,
    this.ageInDays,
    this.ageInMonths,
    this.ageInYears,
    this.appStatus,
    this.bplCardNo,
    this.catagory,
    this.colourCode,
    this.consentList,
    this.createdByClinicId,
    this.createdByUserPartyId,
    this.dispenseTime,
    this.familyId,
    this.firstName,
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
    this.tabFlag,
    this.todayLabStatus,
    this.uid,
    this.updatedByClinicId,
  });

  var BSCstatus;
  var DOB;
  var aadharId;
  var age;
  var ageInDays;
  var ageInMonths;
  var ageInYears;
  var appStatus;
  var bplCardNo;
  var catagory;
  var colourCode;
  var consentList;
  var createdByClinicId;
  var createdByUserPartyId;
  var dispenseTime;
  var familyId;
  var firstName;
  var functionalFlag;
  var gender;
  var imageTakenNew;
  var imageUrl;
  var income;
  var isEdited;
  var isNew;
  var lastName;
  var localId;
  var locationLat;
  var locationLong;
  var maritalStatus;
  var medongoId;
  var mobileNumber;
  var modifiedByUserPartyId;
  var modifiedDate;
  var motherName;
  var patientVaccineList;
  var pending;
  var pushFlag;
  var registeredDate;
  var religion;
  var serverPushflag;
  var shift;
  var tabFlag;
  var todayLabStatus;
  var uid;
  var updatedByClinicId;




  factory PatientData.fromJson(Map<String, dynamic> json) => PatientData(
    BSCstatus: json["BSCstatus"],
    DOB: json["DOB"],
    aadharId: json["aadharId"],
    age: json["age"],
    ageInDays: json["ageInDays"],
    ageInMonths: json["ageInMonths"],
    ageInYears: json["ageInYears"],
    appStatus: json["appStatus"],
    bplCardNo: json["bplCardNo"],
    catagory: json["catagory"],
    colourCode: json["colourCode"],
    consentList: json["consentList"],
    createdByClinicId: json["createdByClinicId"],
    createdByUserPartyId: json["createdByUserPartyId"],
    dispenseTime: json["dispenseTime"],
    familyId: json["familyId"],
    firstName: json["firstName"],
    functionalFlag: json["functionalFlag"],
    gender: json["gender"],
    imageTakenNew: json["imageTakenNew"],
    imageUrl: json["imageUrl"],
    income: json["income"],
    isEdited: json["isEdited"],
    isNew: json["isNew"],
    lastName: json["lastName"],
    localId: json["localId"],
    locationLat: json["locationLat"],
    locationLong: json["locationLong"],
    maritalStatus: json["maritalStatus"],
    medongoId: json["medongoId"],
    mobileNumber: json["mobileNumber"],
    modifiedByUserPartyId: json["modifiedByUserPartyId"],
    modifiedDate: json["modifiedDate"],
    motherName: json["motherName"],
    patientVaccineList: json["patientVaccineList"],
    pending: json["pending"],
    pushFlag: json["pushFlag"],
    registeredDate: json["registeredDate"],
    religion: json["religion"],
    serverPushflag: json["serverPushflag"],
    shift: json["shift"],
    tabFlag: json["tabFlag"],
    todayLabStatus: json["todayLabStatus"],
    uid: json["uid"],
    updatedByClinicId: json["updatedByClinicId"],

  );

  Map<String, dynamic> toJson() => {
    "BSCstatus": BSCstatus,
    "DOB": DOB,
    "aadharId": aadharId,
    "age": age,
    "ageInDays": ageInDays,
    "ageInMonths": ageInMonths,
    "ageInYears": ageInYears,
    "appStatus": appStatus,
    "bplCardNo": bplCardNo,
    "catagory": catagory,
    "colourCode": colourCode,
    "consentList": consentList,
    "createdByClinicId": createdByClinicId,
    "createdByUserPartyId": createdByUserPartyId,
    "dispenseTime": dispenseTime,
    "familyId": familyId,
    "firstName": firstName,
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
    "patientVaccineList": patientVaccineList,
    "pending": pending,
    "pushFlag": pushFlag,
    "registeredDate": registeredDate,
    "religion": religion,
    "serverPushflag": serverPushflag,
    "shift": shift,
    "tabFlag": tabFlag,
    "todayLabStatus": todayLabStatus,
    "uid": uid,
    "updatedByClinicId": updatedByClinicId,



  };

  PatientData.fromMap(json, {this.reference}) {
    BSCstatus = json["BSCstatus"];
    DOB = json["DOB"];
    aadharId = json["aadharId"];
    age = json["age"];
    ageInDays = json["ageInDays"];
    ageInMonths = json["ageInMonths"];
    ageInYears = json["ageInYears"];
    appStatus = json["appStatus"];
    bplCardNo = json["bplCardNo"];
    catagory = json["catagory"];
    colourCode = json["colourCode"];
    consentList = json["consentList"];
    createdByClinicId = json["createdByClinicId"];
    createdByUserPartyId = json["createdByUserPartyId"];
    dispenseTime = json["dispenseTime"];
    familyId = json["familyId"];
    firstName = json["firstName"];
    functionalFlag = json["functionalFlag"];
    gender = json["gender"];
    imageTakenNew = json["imageTakenNew"];
    imageUrl = json["imageUrl"];
    income = json["income"];
    isEdited = json["isEdited"];
    isNew = json["isNew"];
    lastName = json["lastName"];
    localId = json["localId"];
    locationLat = json["locationLat"];
    locationLong = json["locationLong"];
    maritalStatus = json["maritalStatus"];
    medongoId = json["medongoId"];
    mobileNumber = json["mobileNumber"];
    modifiedByUserPartyId = json["modifiedByUserPartyId"];
    modifiedDate = json["modifiedDate"];
    motherName = json["motherName"];
    patientVaccineList = json["patientVaccineList"];
    pending = json["pending"];
    pushFlag = json["pushFlag"];
    registeredDate = json["registeredDate"];
    religion = json["religion"];
    serverPushflag = json["serverPushflag"];
    shift = json["shift"];
    tabFlag = json["tabFlag"];
    todayLabStatus = json["todayLabStatus"];
    uid = json["uid"];
    updatedByClinicId = json["updatedByClinicId"];





  }

  PatientData.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}




///.........................................................................


class ScoresData {
  DocumentReference<Object?>? reference;

  ScoresData({
    this.anemiascore,
    this.bmiScore,
    this.cvdScore,
    this.depressionScore,
    this.diabetesScore,
    this.malnutritionscore,
    this.prehypertensionScore,

  });

  var anemiascore;
  var bmiScore;
  var cvdScore;
  var depressionScore;
  var diabetesScore;
  var malnutritionscore;
  var prehypertensionScore;


  factory ScoresData.fromJson(Map<String, dynamic> json) => ScoresData(
    anemiascore: json["anemiascore"],
    bmiScore: json["bmiScore"],
    cvdScore: json["cvdScore"],
    depressionScore: json["depressionScore"],
    diabetesScore: json["diabetesScore"],
    malnutritionscore: json["malnutritionscore"],
    prehypertensionScore: json["prehypertensionScore"],

  );

  Map<String, dynamic> toJson() => {
    "anemiascore": anemiascore,
    "bmiScore": bmiScore,
    "cvdScore": cvdScore,
    "depressionScore": depressionScore,
    "diabetesScore": diabetesScore,
    "malnutritionscore": malnutritionscore,
    "prehypertensionScore": prehypertensionScore,
  };

  ScoresData.fromMap(json, {this.reference}) {
    anemiascore = json["anemiascore"];
    bmiScore = json["bmiScore"];
    cvdScore = json["cvdScore"];
    depressionScore = json["depressionScore"];
    diabetesScore = json["diabetesScore"];
    malnutritionscore = json["malnutritionscore"];
    prehypertensionScore = json["prehypertensionScore"];
  }

  ScoresData.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}


///.........................................................................


class ScreeningHistory {
  DocumentReference<Object?>? reference;

  ScreeningHistory({
    this.cataract,
    this.colorBilndness,
    this.distanceVision,
    this.nearVision,
    this.oralCancerScreening,
    this.oralCancerfindings,
    this.testLayoutVisible,
    this.vad,
    this.visionScreening,

  });

  var cataract;
  var colorBilndness;
  var distanceVision;
  var nearVision;
  var oralCancerScreening;
  var oralCancerfindings;
  var testLayoutVisible;
  var vad;
  var visionScreening;


  factory ScreeningHistory.fromJson(Map<String, dynamic> json) => ScreeningHistory(
    cataract: json["cataract"],
    colorBilndness: json["colorBilndness"],
    distanceVision: json["distanceVision"],
    nearVision: json["nearVision"],
    oralCancerScreening: json["oralCancerScreening"],
    oralCancerfindings: json["oralCancerfindings"],
    testLayoutVisible: json["testLayoutVisible"],
    vad: json["vad"],
    visionScreening: json["visionScreening"],

  );

  Map<String, dynamic> toJson() => {
    "cataract": cataract,
    "colorBilndness": colorBilndness,
    "distanceVision": distanceVision,
    "nearVision": nearVision,
    "oralCancerScreening": oralCancerScreening,
    "oralCancerfindings": oralCancerfindings,
    "testLayoutVisible": testLayoutVisible,
    "vad": vad,
    "visionScreening": visionScreening,
  };

  ScreeningHistory.fromMap(json, {this.reference}) {
    cataract = json["cataract"];
    colorBilndness = json["colorBilndness"];
    distanceVision = json["distanceVision"];
    nearVision = json["nearVision"];
    oralCancerScreening = json["oralCancerScreening"];
    oralCancerfindings = json["oralCancerfindings"];
    testLayoutVisible = json["testLayoutVisible"];
    vad = json["vad"];
    visionScreening = json["visionScreening"];
  }

  ScreeningHistory.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///....................................................................
class SnomedCTCodeList {
  DocumentReference<Object?>? reference;

  SnomedCTCodeList({
    this.added,
    this.categoryId,
    this.frequency,
    this.snomedCTCode,
  });

  var added;
  var categoryId;
  var frequency;
  var snomedCTCode;

  factory SnomedCTCodeList.fromJson(Map<String, dynamic> json) => SnomedCTCodeList(
    added: json["added"],
    categoryId: json["categoryId"],
    frequency: json["frequency"],
    snomedCTCode: json["snomedCTCode"],
  );

  Map<String, dynamic> toJson() => {
    "added": added,
    "categoryId": categoryId,
    "frequency": frequency,
    "snomedCTCode": snomedCTCode,
  };

  SnomedCTCodeList.fromMap(json, {this.reference}) {
    added = json["added"];
    categoryId = json["categoryId"];
    frequency = json["frequency"];
    snomedCTCode = json["snomedCTCode"];
  }

  SnomedCTCodeList.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
/// .....................................................................



class SocialLife {
  DocumentReference<Object?>? reference;

  SocialLife({
    this.age,
    this.alchoholic,
    this.alchoholic_history_duration,
    this.chewing,
    this.chewing_historyduration,
    this.conceptId,
    this.smoking,
    this.smoking_historyduration,
    this.tobacco,

  });

  var age;
  var alchoholic;
  var alchoholic_history_duration;
  var chewing;
  var chewing_historyduration;
  var conceptId;
  var smoking;
  var smoking_historyduration;
  var tobacco;


  factory SocialLife.fromJson(Map<String, dynamic> json) => SocialLife(
    age: json["age"],
    alchoholic: json["alchoholic"],
    alchoholic_history_duration: json["alchoholic_history_duration"],
    chewing: json["chewing"],
    chewing_historyduration: json["chewing_historyduration"],
    conceptId: json["conceptId"],
    smoking: json["smoking"],
    smoking_historyduration: json["smoking_historyduration"],
    tobacco: json["tobacco"],

  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "alchoholic": alchoholic,
    "alchoholic_history_duration": alchoholic_history_duration,
    "chewing": chewing,
    "chewing_historyduration": chewing_historyduration,
    "conceptId": conceptId,
    "smoking": smoking,
    "smoking_historyduration": smoking_historyduration,
    "tobacco": tobacco,
  };

  SocialLife.fromMap(json, {this.reference}) {
    age = json["age"];
    alchoholic = json["alchoholic"];
    alchoholic_history_duration = json["alchoholic_history_duration"];
    chewing = json["chewing"];
    chewing_historyduration = json["chewing_historyduration"];
    conceptId = json["conceptId"];
    smoking = json["smoking"];
    smoking_historyduration = json["smoking_historyduration"];
    tobacco = json["tobacco"];
  }

  SocialLife.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///....................................................................

class SymptomsList {
  DocumentReference<Object?>? reference;

  SymptomsList({
    this.conceptId,
    this.duration,
    this.isChecked,
    this.isEnabled,
    this.name,
    this.position,

  });

  var conceptId;
  var duration;
  var isChecked;
  var isEnabled;
  var name;
  var position;



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

  SymptomsList.fromMap(json, {this.reference}) {
    conceptId = json["conceptId"];
    duration = json["duration"];
    isChecked = json["isChecked"];
    isEnabled = json["isEnabled"];
    name = json["name"];
    position = json["position"];

  }

  SymptomsList.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}


///....................................................................


class VitalsData {
  DocumentReference<Object?>? reference;

  VitalsData({
    this.age,
    this.ageInDays,
    this.apptId,
    this.bglFBS,
    this.bglPPBS,
    this.bglRBS,
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

  var age;
  var ageInDays;
  var apptId;
  var bglFBS;
  var bglPPBS;
  var bglRBS;
  var bloodGlucoseFbs;
  var bloodGlucosePpbs;
  var bloodGlucoseRbs;
  var diabolicBloodPressure;
  var gender;
  var headCircumference;
  var heightCms;
  var heightFt;
  var hemoglobin;
  var measured;
  var muac;
  var patId;
  var pregnancy;
  var pulse;
  var respiration;
  var spo2;
  var systolicBloodPressure;
  var temperature;
  var temperatureCelsius;
  var temperatureFahrenheit;
  var urineGlucose;
  var vsmDataFlag;
  var waistCircumference;
  var weightKg;




  factory VitalsData.fromJson(Map<String, dynamic> json) => VitalsData(
    age: json["age"],
    ageInDays: json["ageInDays"],
    apptId: json["apptId"],
    bglFBS: json["bglFBS"],
    bglPPBS: json["bglPPBS"],
    bglRBS: json["bglRBS"],
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
    temperatureFahrenheit: json["temperatureFahrenheit"],
    urineGlucose: json["urineGlucose"],
    vsmDataFlag: json["vsmDataFlag"],
    waistCircumference: json["waistCircumference"],
    weightKg: json["weightKg"],


  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "ageInDays": ageInDays,
    "apptId": apptId,
    "bglFBS": bglFBS,
    "bglPPBS": bglPPBS,
    "bglRBS": bglRBS,
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

  VitalsData.fromMap(json, {this.reference}) {
    age = json["age"];
    ageInDays = json["ageInDays"];
    apptId = json["apptId"];
    bglFBS = json["bglFBS"];
    bglPPBS = json["bglPPBS"];
    bglRBS = json["bglRBS"];
    bloodGlucoseFbs = json["bloodGlucoseFbs"];
    bloodGlucosePpbs = json["bloodGlucosePpbs"];
    bloodGlucoseRbs = json["bloodGlucoseRbs"];
    diabolicBloodPressure = json["diabolicBloodPressure"];
    gender = json["gender"];
    headCircumference = json["headCircumference"];
    heightCms = json["heightCms"];
    heightFt = json["heightFt"];
    hemoglobin = json["hemoglobin"];
    measured = json["measured"];
    muac = json["muac"];
    patId = json["patId"];
    pregnancy = json["pregnancy"];
    pulse = json["pulse"];
    respiration = json["respiration"];
    spo2 = json["spo2"];
    systolicBloodPressure = json["systolicBloodPressure"];
    temperature = json["temperature"];
    temperatureCelsius = json["temperatureCelsius"];
    temperatureFahrenheit = json["temperatureFahrenheit"];
    urineGlucose = json["urineGlucose"];
    vsmDataFlag = json["vsmDataFlag"];
    waistCircumference = json["waistCircumference"];
    weightKg = json["weightKg"];






  }

  VitalsData.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}



///....................................................................*/
///COPY OF ENTIRE FILE WITH FROM JSON AND TO JSON METHODS - PAVAN
/*

List<Consultation> ConsultationFromJson(str) =>
    List<Consultation>.from((str).map((x) => Consultation.fromJson(x)));
class Consultation{

  bool? actualConsult;
  List<Null>? accountBillingInfo;
  bool? admitStatus;
  String? allergy;
  List<AllergyList>? allergyList;
  AnemiaData? anemiaData;
  int? anemiaLevel;
  bool? anemiavisitForFollowp;
  bool? anemicOrPregnant;
  String? appDateTime;
  String? apptId;
  bool? bedAssigned;
  bool? billCollected;
  String? captureType;
  ChronicalDisease? chronicalDisease;
  String? clinicId;
  int? consultType;
  int? consultationStatus;
  String? createdByUserPartyId;
  String? currentIllness;
  List<Datametrices>? datametrices;
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
  FamilyData? familyData;
  String? familyId;
  bool? familyPlanningServiceAvailed;
  bool? firstTime;
  String? followupDate;
  bool? forLabor;
  String? functionalFlag;
  String? healthEducationRequired;
  List<Null>? immunizationList;
  bool? inAnemiaFollwUp;
  bool? inFollwUp;
  bool? isDeceased;
  bool? isTabBasedTeleConsult;
  String? lastDepressionScreenigDate;
  String? lastDewormingHistoryDate;
  String? lastOralScreeningDate;
  String? lastVisionScreeningDate;
  String? localId;
  double? locationLat;
  double? locationLong;
  bool? malnourishedSAMorMAM;
  int? malnutritionLevel;
  MedicineDispenseData? medicineDispenseData;
  List<Null>?  medicineDispenseDataDeleted;
  bool? medicineGiven;
  String? medongoId;
  String? miscarriages;
  String? natureOfPhyWork;
  String? numOfDeliveries;
  String? numOfPregnancy;
  String? numOfStillbirths;
  List<Null>? omronWeightDto;
  String? partnerPartyId;
  String? pastIllness;
  int? patAge;
  PatientData? patientData;
  bool? pregnancy;
  String? prescPdfPath;
  bool? printPending;
  int? pushFlag;
  List<Null>? referralList;
  ScoresData? scoresData;
  ScreeningHistory? screeningHistory;
  bool? serverPushflag;
  int? shift;
  String? siteName;
  List<SnomedCTCodeList>? snomedCTCodeList;
  SocialLife? socialLife;
  String? surgicalHistory;
  List<SymptomsList>? symptomsList;
  int? tabFlag;
  bool? teleConsult;
  String? termination;
  List<Null>? testList;
  bool? visitForFollowp;
  VitalsData? vitalsData;
  int? zscore;

  Consultation ({this.actualConsult,
    this.accountBillingInfo,
    this.admitStatus,
    this.allergy,
    this.allergyList,
    this.anemiaData,
    this.anemiaLevel,
    this.anemiavisitForFollowp,
    this.anemicOrPregnant,
    this.appDateTime,
    this.apptId,
    this.bedAssigned,
    this.billCollected,
    this.captureType,
    this.chronicalDisease,
    this.clinicId,
    this.consultType,
    this.consultationStatus,
    this.createdByUserPartyId,
    this.currentIllness,
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
    this.familyData,
    this.familyId,
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
    this.lastDepressionScreenigDate,
    this.lastDewormingHistoryDate,
    this.lastOralScreeningDate,
    this.lastVisionScreeningDate,
    this.localId,
    this.locationLat,
    this.locationLong,
    this.malnourishedSAMorMAM,
    this.malnutritionLevel,
    this.medicineDispenseData,
    this.medicineDispenseDataDeleted,
    this.medicineGiven,
    this.medongoId,
    this.miscarriages,
    this.natureOfPhyWork,
    this.numOfDeliveries,
    this.numOfPregnancy,
    this.numOfStillbirths,
    this.omronWeightDto,
    this.partnerPartyId,
    this.pastIllness,
    this.patAge,
    this.patientData,
    this.pregnancy,
    this.prescPdfPath,
    this.printPending,
    this.pushFlag,
    this.referralList,
    this.scoresData,
    this.screeningHistory,
    this.serverPushflag,
    this.shift,
    this.siteName,
    this.snomedCTCodeList,
    this.socialLife,
    this.surgicalHistory,
    this.symptomsList,
    this.tabFlag,
    this.teleConsult,
    this.termination,
    this.testList,
    this.visitForFollowp,
    this.vitalsData,
    this.zscore});

  factory  Consultation .fromJson(Map<String, dynamic> json) {
    return Consultation(
        actualConsult:json['ActualConsult'],
        accountBillingInfo: json['accountBillingInfo'],

        admitStatus: json['admitStatus'],
        allergy:json['allergy'],
        allergyList: json['allergyList'],
        anemiaData : json['anemiaData'] != null ? new AnemiaData.fromJson(json['anemiaData']) : null,
        anemiaLevel : json['anemiaLevel'],
        anemiavisitForFollowp : json['anemiavisitForFollowp'],
        anemicOrPregnant : json['anemicOrPregnant'],
        appDateTime : json['appDateTime'],
        apptId : json['apptId'],
        bedAssigned : json['bedAssigned'],
        billCollected : json['billCollected'],
        captureType : json['captureType'],
        chronicalDisease : json['chronicalDisease'] != null ? new ChronicalDisease.fromJson(json['chronicalDisease']) : null,
        clinicId : json['clinicId'],
        consultType : json['consultType'],
        consultationStatus : json['consultationStatus'],
        createdByUserPartyId : json['createdByUserPartyId'],
        currentIllness : json['currentIllness'],
        datametrices: json['datametrices'],
        depressionProblem : json['depressionProblem'],
        depressionProblem1 : json['depressionProblem1'],
        dewomingGiven : json['dewomingGiven'],
        diagnosisList: json['diagnosisList'],
        doctorAdvice : json['doctorAdvice'],
        doctorCreated : json['doctorCreated'],
        doctorNote : json['doctorNote'],
        documentsList: json['documentsList'],


        dressingDone : json['dressingDone'],
        dressingRequired : json['dressingRequired'],
        eprescriptionList :json['eprescriptionList'],

        familyData : json['familyData'] != null ? new FamilyData.fromJson(json['familyData']) : null;
        familyId : json['familyId'],
        familyPlanningServiceAvailed : json['familyPlanningServiceAvailed'],
        firstTime : json['firstTime'],
        followupDate : json['followupDate'],
        forLabor : json['forLabor'],
        functionalFlag : json['functionalFlag'],
        healthEducationRequired : json['healthEducationRequired'],
        immunizationList : json['immunizationList'] != null ? new ImmunizationList.fromJson(json['immunizationList']) : null,
        inAnemiaFollwUp : json['inAnemiaFollwUp'],
        inFollwUp : json['inFollwUp'],
        isDeceased : json['isDeceased'],
        isTabBasedTeleConsult : json['isTabBasedTeleConsult'],
        lastDepressionScreenigDate : json['lastDepressionScreenigDate'],
        lastDewormingHistoryDate : json['lastDewormingHistoryDate'],
        lastOralScreeningDate : json['lastOralScreeningDate'],
        lastVisionScreeningDate : json['lastVisionScreeningDate'],
        localId : json['localId'],
        locationLat : json['locationLat'],
        locationLong : json['locationLong'],
        malnourishedSAMorMAM : json['malnourishedSAMorMAM'],
        malnutritionLevel : json['malnutritionLevel'],
        medicineDispenseData : json['medicineDispenseData'] != null ? new MedicineDispenseData.fromJson(json['medicineDispenseData']) : null,
        medicineDispenseDataDeleted : json['medicineDispenseDataDeleted'] != null ? new ImmunizationList.fromJson(json['medicineDispenseDataDeleted']) : null,
        medicineGiven : json['medicineGiven'],
        medongoId : json['medongoId'],
        miscarriages : json['miscarriages'],
        natureOfPhyWork : json['natureOfPhyWork'],
        numOfDeliveries : json['numOfDeliveries'],
        numOfPregnancy : json['numOfPregnancy'],
        numOfStillbirths : json['numOfStillbirths'],
        omronWeightDto : json['omronWeightDto'] != null ? new ImmunizationList.fromJson(json['omronWeightDto']) : null,
        partnerPartyId : json['partnerPartyId'],
        pastIllness : json['pastIllness'],
        patAge : json['patAge'],
        patientData : json['patientData'] != null ? new PatientData.fromJson(json['patientData']) : null,
        pregnancy : json['pregnancy'],
        prescPdfPath : json['prescPdfPath'],
        printPending : json['printPending'],
        pushFlag : json['pushFlag'],
        if (json['referralList'] != null) {
      referralList = <Null>[];
      json['referralList'].forEach((v) { referralList!.add(new Null.fromJson(v)); }),
    }
    scoresData : json['scoresData'] != null ? new ScoresData.fromJson(json['scoresData']) : null,
    screeningHistory : json['screeningHistory'] != null ? new ScreeningHistory.fromJson(json['screeningHistory']) : null,
    serverPushflag : json['serverPushflag'],
    shift : json['shift'],
    siteName : json['siteName'],
    if (json['snomedCTCodeList'] != null) {
    snomedCTCodeList = <SnomedCTCodeList>[];
    json['snomedCTCodeList'].forEach((v) { snomedCTCodeList!.add(new SnomedCTCodeList.fromJson(v)); }),
    }
    socialLife : json['socialLife'] != null ? new SocialLife.fromJson(json['socialLife']) : null,
    surgicalHistory : json['surgicalHistory'],
    if (json['symptomsList'] != null) {
    symptomsList = <SymptomsList>[];
    json['symptomsList'].forEach((v) { symptomsList!.add(new SymptomsList.fromJson(v)); });
    }
    tabFlag : json['tabFlag'],
    teleConsult : json['teleConsult'],
    termination : json['termination'],
    if (json['testList'] != null) {
    testList = <Null>[];
    json['testList'].forEach((v) { testList!.add(new Null.fromJson(v)); }),
    }
    visitForFollowp : json['visitForFollowp'],
    vitalsData : json['vitalsData'] != null ? new VitalsData.fromJson(json['vitalsData']) : null,
    zscore : json['zscore'] );}


}
///  MODEL CLASS  EprescriptionList
List< EprescriptionList>  EprescriptionListFromJson(str) =>
    List< EprescriptionList>.from((str).map((x) =>  EprescriptionList.fromJson(x)));

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
  List<LotData>? lotData;
  List<LotList>? lotList;
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

  EprescriptionList({this.listEnable,
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
    this.lotList,
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
    this.totalCount});

  factory EprescriptionList.fromJson(Map<String, dynamic> json) {
    return EprescriptionList(

      listEnable: json['ListEnable'],
      addedTimeStamp: json['addedTimeStamp'],
      cost: json['cost'],
      count: json['count'],
      days: json['days'],
      dispenceMode: json['dispenceMode'],
      dispencedcount: json['dispencedcount'],
      dispenseCompleted: json['dispenseCompleted'],
      dispensedCount: json['dispensedCount'],
      dose: json['dose'],
      doseType: json['doseType'],
      enable: json['enable'],
      howOftenTaken: json['howOftenTaken'],
      isChecked: json['isChecked'],
      lotData:  json['lotData'] != null ? json['lotData'] : null,

      lotList: json['lotList'] != null ? json['lotList'] : null,




      medicationName : json['medicationName'],
      medicineCategory : json['medicineCategory'],
      medicineType : json['medicineType'],
      noOfUnits : json['noOfUnits'],
      packSize : json['packSize'],
      patietnId : json['patietnId'],
      prescriptionQuantity : json['prescription_quantity'],
      productId : json['productId'],
      removeCount : json['removeCount'],
      removeFlagForsyringe : json['removeFlagForsyringe'],
      totalCount : json['totalCount'],);
  }

  Map<String, dynamic> toJson() {
    return {

      'ListEnable' : this.listEnable,
      'addedTimeStamp': this.addedTimeStamp,
      'cost':this.cost,
      'count':this.count,
      'days':this.days,
      'dispenceMode':this.dispenceMode,
      'dispencedcount':this.dispencedcount,
      'dispenseCompleted':this.dispenseCompleted,
      'dispensedCount': this.dispensedCount,
      'dose':this.dose,
      'doseType':this.doseType,
      'enable': this.enable,
      'howOftenTaken':this.howOftenTaken,
      'isChecked':this.isChecked,
      'lotData':this.lotData != null ? this.lotData!.map((v) => v.toJson()).toList() : null,
      'lotList':this.lotList != null ? this.lotList!.map((v) => v.toJson()).toList() : null,
      'medicationName':this.medicationName,
      'medicineCategory':this.medicineCategory,
      'medicineType':this.medicineType,
      'noOfUnits': this.noOfUnits,
      'packSize':this.packSize,
      'patietnId': this.patietnId,
      'prescription_quantity':this.prescriptionQuantity,
      'productId':this.productId,
      'removeCount':this.removeCount,
      'removeFlagForsyringe': this.removeFlagForsyringe,
      'totalCount': this.totalCount,

    };
  }
}


///...................
class LotData {
  int? addedCount;
  int? dispensedCount;
  String? lotNumber;
  String? productId;
  int? totalCost;

  LotData(
      {this.addedCount,
        this.dispensedCount,
        this.lotNumber,
        this.productId,
        this.totalCost});

  factory LotData.fromJson(Map<String, dynamic> json) {
    return LotData(
        addedCount : json['added_count'],
        dispensedCount : json['dispensed_count'],
        lotNumber : json['lotNumber'],
        productId : json['productId'],
        totalCost : json['totalCost']);
  }

  Map<String, Object?> toJson() {
    return {
      'added_count': this.addedCount,
      'dispensed_count' : this.dispensedCount,
      'lotNumber' : this.lotNumber,
      'productId' : this.productId,
      'totalCost' : this.totalCost,
    };
  }
}
///................

class LotList {
  int? addCount;
  String? creationDate;
  int? discardLot;
  bool? discarded;
  int? dispensedCount;
  String? expDate;
  int? expFlag;
  int? expiredLot;
  String? functionalFlag;
  bool? isModified;
  bool? lotAdded;
  String? lotNumber;
  int? noOfUnits;
  String? productId;
  int? removeCount;
  int? shift;
  int? tabPush;
  int? totalAddCount;
  int? totalCount;
  int? unitPerCost;
  int? unitSize;

  LotList(
      {this.addCount,
        this.creationDate,
        this.discardLot,
        this.discarded,
        this.dispensedCount,
        this.expDate,
        this.expFlag,
        this.expiredLot,
        this.functionalFlag,
        this.isModified,
        this.lotAdded,
        this.lotNumber,
        this.noOfUnits,
        this.productId,
        this.removeCount,
        this.shift,
        this.tabPush,
        this.totalAddCount,
        this.totalCount,
        this.unitPerCost,
        this.unitSize});

  factory LotList.fromJson(Map<String, dynamic> json) {
    return LotList(

        addCount : json['addCount'],
        creationDate : json['creationDate'],
        discardLot : json['discardLot'],
        discarded : json['discarded'],
        dispensedCount : json['dispensedCount'],
        expDate : json['expDate'],
        expFlag : json['expFlag'],
        expiredLot : json['expiredLot'],
        functionalFlag : json['functionalFlag'],
        isModified : json['isModified'],
        lotAdded : json['lotAdded'],
        lotNumber : json['lotNumber'],
        noOfUnits : json['noOfUnits'],
        productId : json['productId'],
        removeCount : json['removeCount'],
        shift : json['shift'],
        tabPush : json['tabPush'],
        totalAddCount : json['totalAddCount'],
        totalCount : json['totalCount'],
        unitPerCost : json['unitPerCost'],
        unitSize : json['unitSize']   )  ;
  }

  Map<String, dynamic> toJson() {
    return {
      'addCount': this.addCount,
      'creationDate': this.creationDate,
      'discardLot': this.discardLot,
      'discarded': this.discarded,
      'dispensedCount': this.dispensedCount,
      'expDate': this.expDate,
      'expFlag': this.expFlag,
      'expiredLot': this.expiredLot,
      'functionalFlag': this.functionalFlag,
      'isModified': this.isModified,
      'lotAdded': this.lotAdded,
      'lotNumber': this.lotNumber,
      'noOfUnits': this.noOfUnits,
      'productId': this.productId,
      'removeCount': this.removeCount,
      'shift': this.shift,
      'tabPush': this.tabPush,
      'totalAddCount': this.totalAddCount,
      'totalCount': this.totalCount,
      'unitPerCost': this.unitPerCost,
      'unitSize': this.unitSize
    };

  }
}

/// MODEL CLASS FOR DIAGNOSIS LIST


class DiagnosisList {
  // DocumentReference<Ob ject?>? reference;

  DiagnosisList({
    this.conceptId,
    this.diagnoseId,
    this.diagnosisName,
    this.diagnosisType,
    this.diagnosisTypeText,
    this.isChecked,
    this.isEnabled,

  });

  var conceptId;
  var diagnoseId;
  var diagnosisName;
  var diagnosisType;
  var diagnosisTypeText;
  var isChecked;
  var isEnabled;


  factory DiagnosisList.fromJson(Map<String, dynamic> json) =>
      DiagnosisList(
        conceptId: json["conceptId"],
        diagnoseId: json["diagnoseId"],
        diagnosisName: json["diagnosisName"],
        diagnosisType: json["diagnosisType"],
        diagnosisTypeText: json["diagnosisTypeText"],
        isChecked: json["isChecked"],
        isEnabled: json["isEnabled"],

      );

  Map<String, dynamic> toJson()
  {
    return{
      "conceptId": conceptId,
      "diagnoseId": diagnoseId,
      "diagnosisName": diagnosisName,
      "diagnosisType": diagnosisType,
      "diagnosisTypeText": diagnosisTypeText,
      "isChecked": isChecked,
      "isEnabled": isEnabled,
    }; }
}
// DiagnosisList.fromMap(json, {this.reference}) {
//   conceptId = json["conceptId"];
//   diagnoseId = json["diagnoseId"];
//   diagnosisName = json["diagnosisName"];
//   diagnosisType = json["diagnosisType"];
//   diagnosisTypeText = json["diagnosisTypeText"];
//   isChecked = json["isChecked"];
//   isEnabled = json["isEnabled"];
// }
//
// DiagnosisList.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);

class AllergyList {
  // DocumentReference<Object?>? reference;

  AllergyList({
    this.allergyName,
    this.conceptId,
    this.isEnabled,
    this.position,
  });

  var allergyName;
  var conceptId;
  var isEnabled;
  var position;

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

// AllergyList.fromMap(json, {this.reference}) {
//   allergyName = json["allergyName"];
//   conceptId = json["conceptId"];
//   isEnabled = json["isEnabled"];
//   position = json["position"];
// }
//
// AllergyList.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///......................................................................


class AnemiaData {
  // DocumentReference<Object?>? reference;

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
    this.layoutIIVisible,
    this.nutritionalCounselling,
    this.visitStatusCount,
  });

  var age;
  var anemiaFollowup;
  var anemiaScore;
  var anemiaVisitNo;
  var bmiValue;
  var followUpPatientCount;
  var gender;
  var ifaProvided;
  var ifaProvidedQty;
  var ironSucroseProvidedQty;
  var ironSucroseProvidedVisible;
  var ironSucroseReqVisible;
  var ironSucroseRequired;
  var ironSucroseVisible;
  var layoutIIVisible;
  var nutritionalCounselling;
  var visitStatusCount;

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
    layoutIIVisible: json["layoutIIVisible"],
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
    "layoutIIVisible": layoutIIVisible,
    "nutritionalCounselling": nutritionalCounselling,
    "visitStatusCount": visitStatusCount,
  };

// AnemiaData.fromMap(json, {this.reference}) {
//   age = json["age"];
//   anemiaFollowup = json["anemiaFollowup"];
//   anemiaScore = json["anemiaScore"];
//   anemiaVisitNo = json["anemiaVisitNo"];
//   bmiValue = json["bmiValue"];
//   followUpPatientCount = json["followUpPatientCount"];
//   gender = json["gender"];
//   ifaProvided = json["ifaProvided"];
//   ifaProvidedQty = json["ifaProvidedQty"];
//   ironSucroseProvidedQty = json["ironSucroseProvidedQty"];
//   ironSucroseProvidedVisible = json["ironSucroseProvidedVisible"];
//   ironSucroseReqVisible = json["ironSucroseReqVisible"];
//   ironSucroseRequired = json["ironSucroseRequired"];
//   ironSucroseVisible = json["ironSucroseVisible"];
//   layoutIIVisible = json["layoutIIVisible"];
//   nutritionalCounselling = json["nutritionalCounselling"];
//   visitStatusCount = json["visitStatusCount"];
//
// }
//
// AnemiaData.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///...............................................................................

class Datametrices {
  // DocumentReference<Object?>? reference;

  Datametrices({
    this.action,
    this.actionDate,
    this.actionId,
    this.appID,
    this.clinicId,
    this.duration,
    this.endTime,
    this.operatorId,
    this.operatorRoleId,
    this.shiftId,
    this.starttime,


  });

  var action;
  var actionDate;
  var actionId;
  var appID;
  var clinicId;
  var duration;
  var endTime;
  var operatorId;
  var operatorRoleId;
  var shiftId;
  var starttime;



  factory Datametrices.fromJson(Map<String, dynamic> json) => Datametrices(
    action: json["action"],
    actionDate: json["actionDate"],
    actionId: json["actionId"],
    appID: json["appID"],
    clinicId: json["clinicId"],
    duration: json["duration"],
    endTime: json["endTime"],
    operatorId: json["operatorId"],
    operatorRoleId: json["operatorRoleId"],
    shiftId: json["shiftId"],
    starttime: json["starttime"],

  );

  Map<String, dynamic> toJson() => {
    "action": action,
    "actionDate": actionDate,
    "actionId": actionId,
    "appID": appID,
    "clinicId": clinicId,
    "duration": duration,
    "endTime": endTime,
    "operatorId": operatorId,
    "operatorRoleId": operatorRoleId,
    "shiftId": shiftId,
    "starttime": starttime,

  };
//
// Datametrices.fromMap(json, {this.reference}) {
//   action = json["action"];
//   actionDate = json["actionDate"];
//   actionId = json["actionId"];
//   appID = json["appID"];
//   clinicId = json["clinicId"];
//   duration = json["duration"];
//   endTime = json["endTime"];
//   operatorId = json["operatorId"];
//   operatorRoleId = json["operatorRoleId"];
//   shiftId = json["shiftId"];
//   starttime = json["starttime"];
//
//
// }
//
// Datametrices.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///..........................................................................




class ChronicalDisease {
  // DocumentReference<Object?>? reference;

  ChronicalDisease({
    this.allergy,
    this.allergyField,
    this.ancVisible,
    this.anemiaLevel,
    this.conceptId,
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
    this.miscarriages,
    this.numOfPregnancy,
    this.numOfStillBirths,
    this.otherCliHisFamilyList,
    this.otherClinicalHistory,
    this.pastIllnessSize,
    this.pncVisible,
    this.pregnancy,
    this.termination,
    this.visitNumber,
  });

  var allergy;
  var allergyField;
  var ancVisible;
  var anemiaLevel;
  var conceptId;
  var currentIllnessSize;
  var cvd;
  var cvdDuration;
  var cvdFamilyList;
  var cvdInFamily;
  var deworming;
  var dewormingDate;
  var diabetic;
  var diabeticDuration;
  var diabeticFamilyList;
  var diabeticInFamily;
  var havingOtherCliHisInFamily;
  var hypertenseDuration;
  var hypertensive;
  var hypertensiveFamilyList;
  var hypertensiveInFamilty;
  var illnessVisible;
  var miscarriages;
  var numOfPregnancy;
  var numOfStillBirths;
  var otherCliHisFamilyList;
  var otherClinicalHistory;
  var pastIllnessSize;
  var pncVisible;
  var pregnancy;
  var termination;
  var visitNumber;


  factory ChronicalDisease.fromJson(Map<String, dynamic> json) => ChronicalDisease(
    allergy: json["allergy"],
    allergyField: json["allergyField"],
    ancVisible: json["ancVisible"],
    anemiaLevel: json["anemiaLevel"],
    conceptId: json["conceptId"],
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
    miscarriages: json["miscarriages"],
    numOfPregnancy: json["numOfPregnancy"],
    numOfStillBirths: json["numOfStillBirths"],
    otherCliHisFamilyList: json["otherCliHisFamilyList"],
    otherClinicalHistory: json["otherClinicalHistory"],
    pastIllnessSize: json["pastIllnessSize"],
    pncVisible: json["pncVisible"],
    pregnancy: json["pregnancy"],
    termination: json["termination"],
    visitNumber: json["visitNumber"],

  );

  Map<String, dynamic> toJson() => {
    "allergy": allergy,
    "allergyField": allergyField,
    "ancVisible": ancVisible,
    "anemiaLevel": anemiaLevel,
    "conceptId": conceptId,
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
    "miscarriages": miscarriages,
    "numOfPregnancy": numOfPregnancy,
    "numOfStillBirths": numOfStillBirths,
    "otherCliHisFamilyList": otherCliHisFamilyList,
    "otherClinicalHistory": otherClinicalHistory,
    "pastIllnessSize": pastIllnessSize,
    "pncVisible": pncVisible,
    "pregnancy": pregnancy,
    "termination": termination,
    "visitNumber": visitNumber,


  };

// ChronicalDisease.fromMap(json, {this.reference}) {
//   allergy = json["allergy"];
//   allergyField = json["allergyField"];
//   ancVisible = json["ancVisible"];
//   anemiaLevel = json["anemiaLevel"];
//   conceptId = json["conceptId"];
//   currentIllnessSize = json["currentIllnessSize"];
//   cvd = json["cvd"];
//   cvdDuration = json["cvdDuration"];
//   cvdFamilyList = json["cvdFamilyList"];
//   cvdInFamily = json["cvdInFamily"];
//   deworming = json["deworming"];
//   dewormingDate = json["dewormingDate"];
//   diabetic = json["diabetic"];
//   diabeticDuration = json["diabeticDuration"];
//   diabeticFamilyList = json["diabeticFamilyList"];
//   diabeticInFamily = json["diabeticInFamily"];
//   havingOtherCliHisInFamily = json["havingOtherCliHisInFamily"];
//   hypertenseDuration = json["hypertenseDuration"];
//   hypertensive = json["hypertensive"];
//   hypertensiveFamilyList = json["hypertensiveFamilyList"];
//   hypertensiveInFamilty = json["hypertensiveInFamilty"];
//   illnessVisible = json["illnessVisible"];
//   miscarriages = json["miscarriages"];
//   numOfPregnancy = json["numOfPregnancy"];
//   numOfStillBirths = json["numOfStillBirths"];
//   otherCliHisFamilyList = json["otherCliHisFamilyList"];
//   otherClinicalHistory = json["otherClinicalHistory"];
//   pastIllnessSize = json["pastIllnessSize"];
//   pncVisible = json["pncVisible"];
//   pregnancy = json["pregnancy"];
//   termination = json["termination"];
//   visitNumber = json["visitNumber"];
//
//
//
//
// }
//
// ChronicalDisease.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);
}


///......................................................................
class DocumentsList {
  // DocumentReference<Object?>? reference;

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

  });

  var apptId;
  var description;
  var ftpPath;
  var latitude;
  var longitude;
  var path;
  var pid;
  var subcategory;
  var type;


  factory DocumentsList.fromJson(Map<String, dynamic> json) => DocumentsList(
    apptId: json["apptId"],
    description: json["description"],
    ftpPath: json["ftpPath"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    path: json["path"],
    pid: json["pid"],
    subcategory: json["subcategory"],
    type: json["type"],

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
  };

//   DocumentsList.fromMap(json, {this.reference}) {
//     apptId = json["apptId"];
//     description = json["description"];
//     ftpPath = json["ftpPath"];
//     latitude = json["latitude"];
//     longitude = json["longitude"];
//     path = json["path"];
//     pid = json["pid"];
//     subcategory = json["subcategory"];
//     type = json["type"];
//   }
//
//   DocumentsList.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
///.........................................................................











///.........................................................................




class FamilyMembersData {
  // DocumentReference<Object?>? reference;

  FamilyMembersData({
    this.BSCstatus,
    this.DOB,
    this.aadharId,
    this.age,
    this.ageInDays,
    this.ageInMonths,
    this.ageInYears,
    this.appStatus,
    this.bplCardNo,
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
    this.tabFlag,
    this.todayLabStatus,
    this.uid,
    this.updatedByClinicId,
  });

  var BSCstatus;
  var DOB;
  var aadharId;
  var age;
  var ageInDays;
  var ageInMonths;
  var ageInYears;
  var appStatus;
  var bplCardNo;
  var catagory;
  var colourCode;
  var consentList;
  var createdByClinicId;
  var createdByUserPartyId;
  var dispenseTime;
  var familyId;
  var firstName;
  var followUpApptId;
  var functionalFlag;
  var gender;
  var imageTakenNew;
  var imageUrl;
  var income;
  var isEdited;
  var isNew;
  var lastName;
  var localId;
  var locationLat;
  var locationLong;
  var maritalStatus;
  var medongoId;
  var mobileNumber;
  var modifiedByUserPartyId;
  var modifiedDate;
  var motherName;
  var patientVaccineList;
  var pending;
  var pushFlag;
  var registeredDate;
  var religion;
  var serverPushflag;
  var shift;
  var tabFlag;
  var todayLabStatus;
  var uid;
  var updatedByClinicId;



  factory FamilyMembersData.fromJson(Map<String, dynamic> json) => FamilyMembersData(
    BSCstatus: json["BSCstatus"],
    DOB: json["DOB"],
    aadharId: json["aadharId"],
    age: json["age"],
    ageInDays: json["ageInDays"],
    ageInMonths: json["ageInMonths"],
    ageInYears: json["ageInYears"],
    appStatus: json["appStatus"],
    bplCardNo: json["bplCardNo"],
    catagory: json["catagory"],
    colourCode: json["colourCode"],
    consentList: json["consentList"],
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
    locationLat: json["locationLat"],
    locationLong: json["locationLong"],
    maritalStatus: json["maritalStatus"],
    medongoId: json["medongoId"],
    mobileNumber: json["mobileNumber"],
    modifiedByUserPartyId: json["modifiedByUserPartyId"],
    modifiedDate: json["modifiedDate"],
    motherName: json["motherName"],
    patientVaccineList: json["patientVaccineList"],
    pending: json["pending"],
    pushFlag: json["pushFlag"],
    registeredDate: json["registeredDate"],
    religion: json["religion"],
    serverPushflag: json["serverPushflag"],
    shift: json["shift"],
    tabFlag: json["tabFlag"],
    todayLabStatus: json["todayLabStatus"],
    uid: json["uid"],
    updatedByClinicId: json["updatedByClinicId"],

  );

  Map<String, dynamic> toJson() => {
    "BSCstatus": BSCstatus,
    "DOB": DOB,
    "aadharId": aadharId,
    "age": age,
    "ageInDays": ageInDays,
    "ageInMonths": ageInMonths,
    "ageInYears": ageInYears,
    "appStatus": appStatus,
    "bplCardNo": bplCardNo,
    "catagory": catagory,
    "colourCode": colourCode,
    "consentList": consentList,
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
    "patientVaccineList": patientVaccineList,
    "pending": pending,
    "pushFlag": pushFlag,
    "registeredDate": registeredDate,
    "religion": religion,
    "serverPushflag": serverPushflag,
    "shift": shift,
    "tabFlag": tabFlag,
    "todayLabStatus": todayLabStatus,
    "uid": uid,
    "updatedByClinicId": updatedByClinicId,



  };

// FamilyMembersData.fromMap(json, {this.reference}) {
//   BSCstatus = json["BSCstatus"];
//   DOB = json["DOB"];
//   aadharId = json["aadharId"];
//   age = json["age"];
//   ageInDays = json["ageInDays"];
//   ageInMonths = json["ageInMonths"];
//   ageInYears = json["ageInYears"];
//   appStatus = json["appStatus"];
//   bplCardNo = json["bplCardNo"];
//   catagory = json["catagory"];
//   colourCode = json["colourCode"];
//   consentList = json["consentList"];
//   createdByClinicId = json["createdByClinicId"];
//   createdByUserPartyId = json["createdByUserPartyId"];
//   dispenseTime = json["dispenseTime"];
//   familyId = json["familyId"];
//   firstName = json["firstName"];
//   followUpApptId = json["followUpApptId"];
//   functionalFlag = json["functionalFlag"];
//   gender = json["gender"];
//   imageTakenNew = json["imageTakenNew"];
//   imageUrl = json["imageUrl"];
//   income = json["income"];
//   isEdited = json["isEdited"];
//   isNew = json["isNew"];
//   lastName = json["lastName"];
//   localId = json["localId"];
//   locationLat = json["locationLat"];
//   locationLong = json["locationLong"];
//   maritalStatus = json["maritalStatus"];
//   medongoId = json["medongoId"];
//   mobileNumber = json["mobileNumber"];
//   modifiedByUserPartyId = json["modifiedByUserPartyId"];
//   modifiedDate = json["modifiedDate"];
//   motherName = json["motherName"];
//   patientVaccineList = json["patientVaccineList"];
//   pending = json["pending"];
//   pushFlag = json["pushFlag"];
//   registeredDate = json["registeredDate"];
//   religion = json["religion"];
//   serverPushflag = json["serverPushflag"];
//   shift = json["shift"];
//   tabFlag = json["tabFlag"];
//   todayLabStatus = json["todayLabStatus"];
//   uid = json["uid"];
//   updatedByClinicId = json["updatedByClinicId"];
//
//
//
//
//
// }
//
// FamilyMembersData.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);
}




///.........................................................................
///TODO CHECK THIS OUT
class MedicineDispenseData {
  // DocumentReference<Object?>? reference;

  MedicineDispenseData({
    this.KID_PRD_30013,
  });

  var KID_PRD_30013;

  factory MedicineDispenseData.fromJson(Map<String, dynamic> json) => MedicineDispenseData(
    KID_PRD_30013: json["KID_PRD_30013"],

  );

  Map<String, dynamic> toJson() => {
    "allergyName": KID_PRD_30013,

  };

// MedicineDispenseData.fromMap(json, {this.reference}) {
//   KID_PRD_30013 = json["KID_PRD_30013"];
//
// }
//
// MedicineDispenseData.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///.........................................................................




class PatientData {
  // DocumentReference<Object?>? reference;

  PatientData({
    this.BSCstatus,
    this.DOB,
    this.aadharId,
    this.age,
    this.ageInDays,
    this.ageInMonths,
    this.ageInYears,
    this.appStatus,
    this.bplCardNo,
    this.catagory,
    this.colourCode,
    this.consentList,
    this.createdByClinicId,
    this.createdByUserPartyId,
    this.dispenseTime,
    this.familyId,
    this.firstName,
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
    this.tabFlag,
    this.todayLabStatus,
    this.uid,
    this.updatedByClinicId,
  });

  var BSCstatus;
  var DOB;
  var aadharId;
  var age;
  var ageInDays;
  var ageInMonths;
  var ageInYears;
  var appStatus;
  var bplCardNo;
  var catagory;
  var colourCode;
  var consentList;
  var createdByClinicId;
  var createdByUserPartyId;
  var dispenseTime;
  var familyId;
  var firstName;
  var functionalFlag;
  var gender;
  var imageTakenNew;
  var imageUrl;
  var income;
  var isEdited;
  var isNew;
  var lastName;
  var localId;
  var locationLat;
  var locationLong;
  var maritalStatus;
  var medongoId;
  var mobileNumber;
  var modifiedByUserPartyId;
  var modifiedDate;
  var motherName;
  var patientVaccineList;
  var pending;
  var pushFlag;
  var registeredDate;
  var religion;
  var serverPushflag;
  var shift;
  var tabFlag;
  var todayLabStatus;
  var uid;
  var updatedByClinicId;




  factory PatientData.fromJson(Map<String, dynamic> json) => PatientData(
    BSCstatus: json["BSCstatus"],
    DOB: json["DOB"],
    aadharId: json["aadharId"],
    age: json["age"],
    ageInDays: json["ageInDays"],
    ageInMonths: json["ageInMonths"],
    ageInYears: json["ageInYears"],
    appStatus: json["appStatus"],
    bplCardNo: json["bplCardNo"],
    catagory: json["catagory"],
    colourCode: json["colourCode"],
    consentList: json["consentList"],
    createdByClinicId: json["createdByClinicId"],
    createdByUserPartyId: json["createdByUserPartyId"],
    dispenseTime: json["dispenseTime"],
    familyId: json["familyId"],
    firstName: json["firstName"],
    functionalFlag: json["functionalFlag"],
    gender: json["gender"],
    imageTakenNew: json["imageTakenNew"],
    imageUrl: json["imageUrl"],
    income: json["income"],
    isEdited: json["isEdited"],
    isNew: json["isNew"],
    lastName: json["lastName"],
    localId: json["localId"],
    locationLat: json["locationLat"],
    locationLong: json["locationLong"],
    maritalStatus: json["maritalStatus"],
    medongoId: json["medongoId"],
    mobileNumber: json["mobileNumber"],
    modifiedByUserPartyId: json["modifiedByUserPartyId"],
    modifiedDate: json["modifiedDate"],
    motherName: json["motherName"],
    patientVaccineList: json["patientVaccineList"],
    pending: json["pending"],
    pushFlag: json["pushFlag"],
    registeredDate: json["registeredDate"],
    religion: json["religion"],
    serverPushflag: json["serverPushflag"],
    shift: json["shift"],
    tabFlag: json["tabFlag"],
    todayLabStatus: json["todayLabStatus"],
    uid: json["uid"],
    updatedByClinicId: json["updatedByClinicId"],

  );

  Map<String, dynamic> toJson() => {
    "BSCstatus": BSCstatus,
    "DOB": DOB,
    "aadharId": aadharId,
    "age": age,
    "ageInDays": ageInDays,
    "ageInMonths": ageInMonths,
    "ageInYears": ageInYears,
    "appStatus": appStatus,
    "bplCardNo": bplCardNo,
    "catagory": catagory,
    "colourCode": colourCode,
    "consentList": consentList,
    "createdByClinicId": createdByClinicId,
    "createdByUserPartyId": createdByUserPartyId,
    "dispenseTime": dispenseTime,
    "familyId": familyId,
    "firstName": firstName,
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
    "patientVaccineList": patientVaccineList,
    "pending": pending,
    "pushFlag": pushFlag,
    "registeredDate": registeredDate,
    "religion": religion,
    "serverPushflag": serverPushflag,
    "shift": shift,
    "tabFlag": tabFlag,
    "todayLabStatus": todayLabStatus,
    "uid": uid,
    "updatedByClinicId": updatedByClinicId,



  };

// PatientData.fromMap(json, {this.reference}) {
//   BSCstatus = json["BSCstatus"];
//   DOB = json["DOB"];
//   aadharId = json["aadharId"];
//   age = json["age"];
//   ageInDays = json["ageInDays"];
//   ageInMonths = json["ageInMonths"];
//   ageInYears = json["ageInYears"];
//   appStatus = json["appStatus"];
//   bplCardNo = json["bplCardNo"];
//   catagory = json["catagory"];
//   colourCode = json["colourCode"];
//   consentList = json["consentList"];
//   createdByClinicId = json["createdByClinicId"];
//   createdByUserPartyId = json["createdByUserPartyId"];
//   dispenseTime = json["dispenseTime"];
//   familyId = json["familyId"];
//   firstName = json["firstName"];
//   functionalFlag = json["functionalFlag"];
//   gender = json["gender"];
//   imageTakenNew = json["imageTakenNew"];
//   imageUrl = json["imageUrl"];
//   income = json["income"];
//   isEdited = json["isEdited"];
//   isNew = json["isNew"];
//   lastName = json["lastName"];
//   localId = json["localId"];
//   locationLat = json["locationLat"];
//   locationLong = json["locationLong"];
//   maritalStatus = json["maritalStatus"];
//   medongoId = json["medongoId"];
//   mobileNumber = json["mobileNumber"];
//   modifiedByUserPartyId = json["modifiedByUserPartyId"];
//   modifiedDate = json["modifiedDate"];
//   motherName = json["motherName"];
//   patientVaccineList = json["patientVaccineList"];
//   pending = json["pending"];
//   pushFlag = json["pushFlag"];
//   registeredDate = json["registeredDate"];
//   religion = json["religion"];
//   serverPushflag = json["serverPushflag"];
//   shift = json["shift"];
//   tabFlag = json["tabFlag"];
//   todayLabStatus = json["todayLabStatus"];
//   uid = json["uid"];
//   updatedByClinicId = json["updatedByClinicId"];
//
//
//
//
//
// }
//
// PatientData.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);
}




///.........................................................................


class ScoresData {
  // DocumentReference<Object?>? reference;

  ScoresData({
    this.anemiascore,
    this.bmiScore,
    this.cvdScore,
    this.depressionScore,
    this.diabetesScore,
    this.malnutritionscore,
    this.prehypertensionScore,

  });

  var anemiascore;
  var bmiScore;
  var cvdScore;
  var depressionScore;
  var diabetesScore;
  var malnutritionscore;
  var prehypertensionScore;


  factory ScoresData.fromJson(Map<String, dynamic> json) => ScoresData(
    anemiascore: json["anemiascore"],
    bmiScore: json["bmiScore"],
    cvdScore: json["cvdScore"],
    depressionScore: json["depressionScore"],
    diabetesScore: json["diabetesScore"],
    malnutritionscore: json["malnutritionscore"],
    prehypertensionScore: json["prehypertensionScore"],

  );

  Map<String, dynamic> toJson() => {
    "anemiascore": anemiascore,
    "bmiScore": bmiScore,
    "cvdScore": cvdScore,
    "depressionScore": depressionScore,
    "diabetesScore": diabetesScore,
    "malnutritionscore": malnutritionscore,
    "prehypertensionScore": prehypertensionScore,
  };

// ScoresData.fromMap(json, {this.reference}) {
//   anemiascore = json["anemiascore"];
//   bmiScore = json["bmiScore"];
//   cvdScore = json["cvdScore"];
//   depressionScore = json["depressionScore"];
//   diabetesScore = json["diabetesScore"];
//   malnutritionscore = json["malnutritionscore"];
//   prehypertensionScore = json["prehypertensionScore"];
// }
//
// ScoresData.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);
}


///.........................................................................


class ScreeningHistory {
  // DocumentReference<Object?>? reference;

  ScreeningHistory({
    this.cataract,
    this.colorBilndness,
    this.distanceVision,
    this.nearVision,
    this.oralCancerScreening,
    this.oralCancerfindings,
    this.testLayoutVisible,
    this.vad,
    this.visionScreening,

  });

  var cataract;
  var colorBilndness;
  var distanceVision;
  var nearVision;
  var oralCancerScreening;
  var oralCancerfindings;
  var testLayoutVisible;
  var vad;
  var visionScreening;


  factory ScreeningHistory.fromJson(Map<String, dynamic> json) => ScreeningHistory(
    cataract: json["cataract"],
    colorBilndness: json["colorBilndness"],
    distanceVision: json["distanceVision"],
    nearVision: json["nearVision"],
    oralCancerScreening: json["oralCancerScreening"],
    oralCancerfindings: json["oralCancerfindings"],
    testLayoutVisible: json["testLayoutVisible"],
    vad: json["vad"],
    visionScreening: json["visionScreening"],

  );

  Map<String, dynamic> toJson() => {
    "cataract": cataract,
    "colorBilndness": colorBilndness,
    "distanceVision": distanceVision,
    "nearVision": nearVision,
    "oralCancerScreening": oralCancerScreening,
    "oralCancerfindings": oralCancerfindings,
    "testLayoutVisible": testLayoutVisible,
    "vad": vad,
    "visionScreening": visionScreening,
  };
//
// ScreeningHistory.fromMap(json, {this.reference}) {
//   cataract = json["cataract"];
//   colorBilndness = json["colorBilndness"];
//   distanceVision = json["distanceVision"];
//   nearVision = json["nearVision"];
//   oralCancerScreening = json["oralCancerScreening"];
//   oralCancerfindings = json["oralCancerfindings"];
//   testLayoutVisible = json["testLayoutVisible"];
//   vad = json["vad"];
//   visionScreening = json["visionScreening"];
// }
//
// ScreeningHistory.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///....................................................................
class SnomedCTCodeList {
  // DocumentReference<Object?>? reference;

  SnomedCTCodeList({
    this.added,
    this.categoryId,
    this.frequency,
    this.snomedCTCode,
  });

  var added;
  var categoryId;
  var frequency;
  var snomedCTCode;

  factory SnomedCTCodeList.fromJson(Map<String, dynamic> json) => SnomedCTCodeList(
    added: json["added"],
    categoryId: json["categoryId"],
    frequency: json["frequency"],
    snomedCTCode: json["snomedCTCode"],
  );

  Map<String, dynamic> toJson() => {
    "added": added,
    "categoryId": categoryId,
    "frequency": frequency,
    "snomedCTCode": snomedCTCode,
  };
//
// SnomedCTCodeList.fromMap(json, {this.reference}) {
//   added = json["added"];
//   categoryId = json["categoryId"];
//   frequency = json["frequency"];
//   snomedCTCode = json["snomedCTCode"];
// }
//
// SnomedCTCodeList.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
/// .....................................................................



class SocialLife {
  // DocumentReference<Object?>? reference;

  SocialLife({
    this.age,
    this.alchoholic,
    this.alchoholic_history_duration,
    this.chewing,
    this.chewing_historyduration,
    this.conceptId,
    this.smoking,
    this.smoking_historyduration,
    this.tobacco,
  });

  var age;
  var alchoholic;
  var alchoholic_history_duration;
  var chewing;
  var chewing_historyduration;
  var conceptId;
  var smoking;
  var smoking_historyduration;
  var tobacco;


  factory SocialLife.fromJson(Map<String, dynamic> json) => SocialLife(
    age: json["age"],
    alchoholic: json["alchoholic"],
    alchoholic_history_duration: json["alchoholic_history_duration"],
    chewing: json["chewing"],
    chewing_historyduration: json["chewing_historyduration"],
    conceptId: json["conceptId"],
    smoking: json["smoking"],
    smoking_historyduration: json["smoking_historyduration"],
    tobacco: json["tobacco"],

  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "alchoholic": alchoholic,
    "alchoholic_history_duration": alchoholic_history_duration,
    "chewing": chewing,
    "chewing_historyduration": chewing_historyduration,
    "conceptId": conceptId,
    "smoking": smoking,
    "smoking_historyduration": smoking_historyduration,
    "tobacco": tobacco,
  };

// SocialLife.fromMap(json, {this.reference}) {
//   age = json["age"];
//   alchoholic = json["alchoholic"];
//   alchoholic_history_duration = json["alchoholic_history_duration"];
//   chewing = json["chewing"];
//   chewing_historyduration = json["chewing_historyduration"];
//   conceptId = json["conceptId"];
//   smoking = json["smoking"];
//   smoking_historyduration = json["smoking_historyduration"];
//   tobacco = json["tobacco"];
// }
//
// SocialLife.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

///....................................................................

class SymptomsList {
  // DocumentReference<Object?>? reference;

  SymptomsList({
    this.conceptId,
    this.duration,
    this.isChecked,
    this.isEnabled,
    this.name,
    this.position,

  });

  var conceptId;
  var duration;
  var isChecked;
  var isEnabled;
  var name;
  var position;



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

  };}

//   SymptomsList.fromMap(json, {this.reference}) {
//     conceptId = json["conceptId"];
//     duration = json["duration"];
//     isChecked = json["isChecked"];
//     isEnabled = json["isEnabled"];
//     name = json["name"];
//     position = json["position"];
//
//   }
//
//   SymptomsList.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }


///....................................................................


class VitalsData {
  // DocumentReference<Object?>? reference;

  VitalsData({
    this.age,
    this.ageInDays,
    this.apptId,
    this.bglFBS,
    this.bglPPBS,
    this.bglRBS,
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

  var age;
  var ageInDays;
  var apptId;
  var bglFBS;
  var bglPPBS;
  var bglRBS;
  var bloodGlucoseFbs;
  var bloodGlucosePpbs;
  var bloodGlucoseRbs;
  var diabolicBloodPressure;
  var gender;
  var headCircumference;
  var heightCms;
  var heightFt;
  var hemoglobin;
  var measured;
  var muac;
  var patId;
  var pregnancy;
  var pulse;
  var respiration;
  var spo2;
  var systolicBloodPressure;
  var temperature;
  var temperatureCelsius;
  var temperatureFahrenheit;
  var urineGlucose;
  var vsmDataFlag;
  var waistCircumference;
  var weightKg;




  factory VitalsData.fromJson(Map<String, dynamic> json) => VitalsData(
    age: json["age"],
    ageInDays: json["ageInDays"],
    apptId: json["apptId"],
    bglFBS: json["bglFBS"],
    bglPPBS: json["bglPPBS"],
    bglRBS: json["bglRBS"],
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
    temperatureFahrenheit: json["temperatureFahrenheit"],
    urineGlucose: json["urineGlucose"],
    vsmDataFlag: json["vsmDataFlag"],
    waistCircumference: json["waistCircumference"],
    weightKg: json["weightKg"],


  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "ageInDays": ageInDays,
    "apptId": apptId,
    "bglFBS": bglFBS,
    "bglPPBS": bglPPBS,
    "bglRBS": bglRBS,
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
//
// VitalsData.fromMap(json, {this.reference}) {
//   age = json["age"];
//   ageInDays = json["ageInDays"];
//   apptId = json["apptId"];
//   bglFBS = json["bglFBS"];
//   bglPPBS = json["bglPPBS"];
//   bglRBS = json["bglRBS"];
//   bloodGlucoseFbs = json["bloodGlucoseFbs"];
//   bloodGlucosePpbs = json["bloodGlucosePpbs"];
//   bloodGlucoseRbs = json["bloodGlucoseRbs"];
//   diabolicBloodPressure = json["diabolicBloodPressure"];
//   gender = json["gender"];
//   headCircumference = json["headCircumference"];
//   heightCms = json["heightCms"];
//   heightFt = json["heightFt"];
//   hemoglobin = json["hemoglobin"];
//   measured = json["measured"];
//   muac = json["muac"];
//   patId = json["patId"];
//   pregnancy = json["pregnancy"];
//   pulse = json["pulse"];
//   respiration = json["respiration"];
//   spo2 = json["spo2"];
//   systolicBloodPressure = json["systolicBloodPressure"];
//   temperature = json["temperature"];
//   temperatureCelsius = json["temperatureCelsius"];
//   temperatureFahrenheit = json["temperatureFahrenheit"];
//   urineGlucose = json["urineGlucose"];
//   vsmDataFlag = json["vsmDataFlag"];
//   waistCircumference = json["waistCircumference"];
//   weightKg = json["weightKg"];
//
//
//
//
//
//
// }
//
// VitalsData.fromSnapshot(QueryDocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data(), reference: snapshot.reference);
}



///.................
class FamilyData {
  String? familyData;
  String? completed;
  String? employeeGroup;
  String? familyCatogory;
  String? familyCount;
  String? familyId;


  FamilyData({
    this.familyData,
    this.completed,
    this.employeeGroup,
    this.familyCatogory,
    this.familyCount,
    this.familyId
  });

  factory FamilyData.fromJson(Map<String, dynamic> json) =>
      FamilyData(

        completed: json["completed"],
        employeeGroup: json[ "employeeGroup"],
        familyCatogory: json[ "familyCatogory"],
        familyCount: json['familyCount'],
        familyId: json[' familyId'],
      );

}







// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AllergyList {
//   DocumentReference<Object?>? reference;
//
//   AllergyList({
//     this.allergyName,
//     this.conceptId,
//     this.isEnabled,
//     this.position,
//   });
//
//   var allergyName;
//   var conceptId;
//   var isEnabled;
//   var position;
//
//   factory AllergyList.fromJson(Map<String, dynamic> json) => AllergyList(
//     allergyName: json["allergyName"],
//     conceptId: json["conceptId"],
//     isEnabled: json["isEnabled"],
//     position: json["position"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "allergyName": allergyName,
//     "conceptId": conceptId,
//     "isEnabled": isEnabled,
//     "position": position,
//   };
//
//   AllergyList.fromMap(json, {this.reference}) {
//     allergyName = json["allergyName"];
//     conceptId = json["conceptId"];
//     isEnabled = json["isEnabled"];
//     position = json["position"];
//   }
//
//   AllergyList.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
//
// ///......................................................................
//
//
// class AnemiaData {
//   DocumentReference<Object?>? reference;
//
//   AnemiaData({
//     this.age,
//     this.anemiaFollowup,
//     this.anemiaScore,
//     this.anemiaVisitNo,
//     this.bmiValue,
//     this.followUpPatientCount,
//     this.gender,
//     this.ifaProvided,
//     this.ifaProvidedQty,
//     this.ironSucroseProvidedQty,
//     this.ironSucroseProvidedVisible,
//     this.ironSucroseReqVisible,
//     this.ironSucroseRequired,
//     this.ironSucroseVisible,
//     this.layoutIIVisible,
//     this.nutritionalCounselling,
//     this.visitStatusCount,
//   });
//
//   var age;
//   var anemiaFollowup;
//   var anemiaScore;
//   var anemiaVisitNo;
//   var bmiValue;
//   var followUpPatientCount;
//   var gender;
//   var ifaProvided;
//   var ifaProvidedQty;
//   var ironSucroseProvidedQty;
//   var ironSucroseProvidedVisible;
//   var ironSucroseReqVisible;
//   var ironSucroseRequired;
//   var ironSucroseVisible;
//   var layoutIIVisible;
//   var nutritionalCounselling;
//   var visitStatusCount;
//
//   factory AnemiaData.fromJson(Map<String, dynamic> json) => AnemiaData(
//     age: json["age"],
//     anemiaFollowup: json["anemiaFollowup"],
//     anemiaScore: json["anemiaScore"],
//     anemiaVisitNo: json["anemiaVisitNo"],
//     bmiValue: json["bmiValue"],
//     followUpPatientCount: json["followUpPatientCount"],
//     gender: json["gender"],
//     ifaProvided: json["ifaProvided"],
//     ifaProvidedQty: json["ifaProvidedQty"],
//     ironSucroseProvidedQty: json["ironSucroseProvidedQty"],
//     ironSucroseProvidedVisible: json["ironSucroseProvidedVisible"],
//     ironSucroseReqVisible: json["ironSucroseReqVisible"],
//     ironSucroseRequired: json["ironSucroseRequired"],
//     ironSucroseVisible: json["ironSucroseVisible"],
//     layoutIIVisible: json["layoutIIVisible"],
//     nutritionalCounselling: json["nutritionalCounselling"],
//     visitStatusCount: json["visitStatusCount"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "age": age,
//     "anemiaFollowup": anemiaFollowup,
//     "anemiaScore": anemiaScore,
//     "anemiaVisitNo": anemiaVisitNo,
//     "bmiValue": bmiValue,
//     "followUpPatientCount": followUpPatientCount,
//     "gender": gender,
//     "ifaProvided": ifaProvided,
//     "ifaProvidedQty": ifaProvidedQty,
//     "ironSucroseProvidedQty": ironSucroseProvidedQty,
//     "ironSucroseProvidedVisible": ironSucroseProvidedVisible,
//     "ironSucroseReqVisible": ironSucroseReqVisible,
//     "ironSucroseRequired": ironSucroseRequired,
//     "ironSucroseVisible": ironSucroseVisible,
//     "layoutIIVisible": layoutIIVisible,
//     "nutritionalCounselling": nutritionalCounselling,
//     "visitStatusCount": visitStatusCount,
//   };
//
//   AnemiaData.fromMap(json, {this.reference}) {
//     age = json["age"];
//     anemiaFollowup = json["anemiaFollowup"];
//     anemiaScore = json["anemiaScore"];
//     anemiaVisitNo = json["anemiaVisitNo"];
//     bmiValue = json["bmiValue"];
//     followUpPatientCount = json["followUpPatientCount"];
//     gender = json["gender"];
//     ifaProvided = json["ifaProvided"];
//     ifaProvidedQty = json["ifaProvidedQty"];
//     ironSucroseProvidedQty = json["ironSucroseProvidedQty"];
//     ironSucroseProvidedVisible = json["ironSucroseProvidedVisible"];
//     ironSucroseReqVisible = json["ironSucroseReqVisible"];
//     ironSucroseRequired = json["ironSucroseRequired"];
//     ironSucroseVisible = json["ironSucroseVisible"];
//     layoutIIVisible = json["layoutIIVisible"];
//     nutritionalCounselling = json["nutritionalCounselling"];
//     visitStatusCount = json["visitStatusCount"];
//
//   }
//
//   AnemiaData.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
//
// ///...............................................................................
//
// class Datametrices {
//   DocumentReference<Object?>? reference;
//
//   Datametrices({
//     this.action,
//     this.actionDate,
//     this.actionId,
//     this.appID,
//     this.clinicId,
//     this.duration,
//     this.endTime,
//     this.operatorId,
//     this.operatorRoleId,
//     this.shiftId,
//     this.starttime,
//
//
//   });
//
//   var action;
//   var actionDate;
//   var actionId;
//   var appID;
//   var clinicId;
//   var duration;
//   var endTime;
//   var operatorId;
//   var operatorRoleId;
//   var shiftId;
//   var starttime;
//
//
//
//   factory Datametrices.fromJson(Map<String, dynamic> json) => Datametrices(
//     action: json["action"],
//     actionDate: json["actionDate"],
//     actionId: json["actionId"],
//     appID: json["appID"],
//     clinicId: json["clinicId"],
//     duration: json["duration"],
//     endTime: json["endTime"],
//     operatorId: json["operatorId"],
//     operatorRoleId: json["operatorRoleId"],
//     shiftId: json["shiftId"],
//     starttime: json["starttime"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "action": action,
//     "actionDate": actionDate,
//     "actionId": actionId,
//     "appID": appID,
//     "clinicId": clinicId,
//     "duration": duration,
//     "endTime": endTime,
//     "operatorId": operatorId,
//     "operatorRoleId": operatorRoleId,
//     "shiftId": shiftId,
//     "starttime": starttime,
//
//   };
//
//   Datametrices.fromMap(json, {this.reference}) {
//     action = json["action"];
//     actionDate = json["actionDate"];
//     actionId = json["actionId"];
//     appID = json["appID"];
//     clinicId = json["clinicId"];
//     duration = json["duration"];
//     endTime = json["endTime"];
//     operatorId = json["operatorId"];
//     operatorRoleId = json["operatorRoleId"];
//     shiftId = json["shiftId"];
//     starttime = json["starttime"];
//
//
//   }
//
//   Datametrices.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
//
// ///..........................................................................
//
//
//
//
// class ChronicalDisease {
//   DocumentReference<Object?>? reference;
//
//   ChronicalDisease({
//     this.allergy,
//     this.allergyField,
//     this.ancVisible,
//     this.anemiaLevel,
//     this.conceptId,
//     this.currentIllnessSize,
//     this.cvd,
//     this.cvdDuration,
//     this.cvdFamilyList,
//     this.cvdInFamily,
//     this.deworming,
//     this.dewormingDate,
//     this.diabetic,
//     this.diabeticDuration,
//     this.diabeticFamilyList,
//     this.diabeticInFamily,
//     this.havingOtherCliHisInFamily,
//     this.hypertenseDuration,
//     this.hypertensive,
//     this.hypertensiveFamilyList,
//     this.hypertensiveInFamilty,
//     this.illnessVisible,
//     this.miscarriages,
//     this.numOfPregnancy,
//     this.numOfStillBirths,
//     this.otherCliHisFamilyList,
//     this.otherClinicalHistory,
//     this.pastIllnessSize,
//     this.pncVisible,
//     this.pregnancy,
//     this.termination,
//     this.visitNumber,
//   });
//
//   var allergy;
//   var allergyField;
//   var ancVisible;
//   var anemiaLevel;
//   var conceptId;
//   var currentIllnessSize;
//   var cvd;
//   var cvdDuration;
//   var cvdFamilyList;
//   var cvdInFamily;
//   var deworming;
//   var dewormingDate;
//   var diabetic;
//   var diabeticDuration;
//   var diabeticFamilyList;
//   var diabeticInFamily;
//   var havingOtherCliHisInFamily;
//   var hypertenseDuration;
//   var hypertensive;
//   var hypertensiveFamilyList;
//   var hypertensiveInFamilty;
//   var illnessVisible;
//   var miscarriages;
//   var numOfPregnancy;
//   var numOfStillBirths;
//   var otherCliHisFamilyList;
//   var otherClinicalHistory;
//   var pastIllnessSize;
//   var pncVisible;
//   var pregnancy;
//   var termination;
//   var visitNumber;
//
//
//   factory ChronicalDisease.fromJson(Map<String, dynamic> json) => ChronicalDisease(
//     allergy: json["allergy"],
//     allergyField: json["allergyField"],
//     ancVisible: json["ancVisible"],
//     anemiaLevel: json["anemiaLevel"],
//     conceptId: json["conceptId"],
//     currentIllnessSize: json["currentIllnessSize"],
//     cvd: json["cvd"],
//     cvdDuration: json["cvdDuration"],
//     cvdFamilyList: json["cvdFamilyList"],
//     cvdInFamily: json["cvdInFamily"],
//     deworming: json["deworming"],
//     dewormingDate: json["dewormingDate"],
//     diabetic: json["diabetic"],
//     diabeticDuration: json["diabeticDuration"],
//     diabeticFamilyList: json["diabeticFamilyList"],
//     diabeticInFamily: json["diabeticInFamily"],
//     havingOtherCliHisInFamily: json["havingOtherCliHisInFamily"],
//     hypertenseDuration: json["hypertenseDuration"],
//     hypertensive: json["hypertensive"],
//     hypertensiveFamilyList: json["hypertensiveFamilyList"],
//     hypertensiveInFamilty: json["hypertensiveInFamilty"],
//     illnessVisible: json["illnessVisible"],
//     miscarriages: json["miscarriages"],
//     numOfPregnancy: json["numOfPregnancy"],
//     numOfStillBirths: json["numOfStillBirths"],
//     otherCliHisFamilyList: json["otherCliHisFamilyList"],
//     otherClinicalHistory: json["otherClinicalHistory"],
//     pastIllnessSize: json["pastIllnessSize"],
//     pncVisible: json["pncVisible"],
//     pregnancy: json["pregnancy"],
//     termination: json["termination"],
//     visitNumber: json["visitNumber"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "allergy": allergy,
//     "allergyField": allergyField,
//     "ancVisible": ancVisible,
//     "anemiaLevel": anemiaLevel,
//     "conceptId": conceptId,
//     "currentIllnessSize": currentIllnessSize,
//     "cvd": cvd,
//     "cvdDuration": cvdDuration,
//     "cvdFamilyList": cvdFamilyList,
//     "cvdInFamily": cvdInFamily,
//     "deworming": deworming,
//     "dewormingDate": dewormingDate,
//     "diabetic": diabetic,
//     "diabeticDuration": diabeticDuration,
//     "diabeticFamilyList": diabeticFamilyList,
//     "diabeticInFamily": diabeticInFamily,
//     "havingOtherCliHisInFamily": havingOtherCliHisInFamily,
//     "hypertenseDuration": hypertenseDuration,
//     "hypertensive": hypertensive,
//     "hypertensiveFamilyList": hypertensiveFamilyList,
//     "hypertensiveInFamilty": hypertensiveInFamilty,
//     "illnessVisible": illnessVisible,
//     "miscarriages": miscarriages,
//     "numOfPregnancy": numOfPregnancy,
//     "numOfStillBirths": numOfStillBirths,
//     "otherCliHisFamilyList": otherCliHisFamilyList,
//     "otherClinicalHistory": otherClinicalHistory,
//     "pastIllnessSize": pastIllnessSize,
//     "pncVisible": pncVisible,
//     "pregnancy": pregnancy,
//     "termination": termination,
//     "visitNumber": visitNumber,
//
//
//   };
//
//   ChronicalDisease.fromMap(json, {this.reference}) {
//     allergy = json["allergy"];
//     allergyField = json["allergyField"];
//     ancVisible = json["ancVisible"];
//     anemiaLevel = json["anemiaLevel"];
//     conceptId = json["conceptId"];
//     currentIllnessSize = json["currentIllnessSize"];
//     cvd = json["cvd"];
//     cvdDuration = json["cvdDuration"];
//     cvdFamilyList = json["cvdFamilyList"];
//     cvdInFamily = json["cvdInFamily"];
//     deworming = json["deworming"];
//     dewormingDate = json["dewormingDate"];
//     diabetic = json["diabetic"];
//     diabeticDuration = json["diabeticDuration"];
//     diabeticFamilyList = json["diabeticFamilyList"];
//     diabeticInFamily = json["diabeticInFamily"];
//     havingOtherCliHisInFamily = json["havingOtherCliHisInFamily"];
//     hypertenseDuration = json["hypertenseDuration"];
//     hypertensive = json["hypertensive"];
//     hypertensiveFamilyList = json["hypertensiveFamilyList"];
//     hypertensiveInFamilty = json["hypertensiveInFamilty"];
//     illnessVisible = json["illnessVisible"];
//     miscarriages = json["miscarriages"];
//     numOfPregnancy = json["numOfPregnancy"];
//     numOfStillBirths = json["numOfStillBirths"];
//     otherCliHisFamilyList = json["otherCliHisFamilyList"];
//     otherClinicalHistory = json["otherClinicalHistory"];
//     pastIllnessSize = json["pastIllnessSize"];
//     pncVisible = json["pncVisible"];
//     pregnancy = json["pregnancy"];
//     termination = json["termination"];
//     visitNumber = json["visitNumber"];
//
//
//
//
//   }
//
//   ChronicalDisease.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
//
// ///.....................................................................
// class DiagnosisList {
//   DocumentReference<Object?>? reference;
//
//   DiagnosisList({
//     this.conceptId,
//     this.diagnoseId,
//     this.diagnosisName,
//     this.diagnosisType,
//     this.diagnosisTypeText,
//     this.isChecked,
//     this.isEnabled,
//
//   });
//
//   var conceptId;
//   var diagnoseId;
//   var diagnosisName;
//   var diagnosisType;
//   var diagnosisTypeText;
//   var isChecked;
//   var isEnabled;
//
//
//   factory DiagnosisList.fromJson(Map<String, dynamic> json) => DiagnosisList(
//     conceptId: json["conceptId"],
//     diagnoseId: json["diagnoseId"],
//     diagnosisName: json["diagnosisName"],
//     diagnosisType: json["diagnosisType"],
//     diagnosisTypeText: json["diagnosisTypeText"],
//     isChecked: json["isChecked"],
//     isEnabled: json["isEnabled"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "conceptId": conceptId,
//     "diagnoseId": diagnoseId,
//     "diagnosisName": diagnosisName,
//     "diagnosisType": diagnosisType,
//     "diagnosisTypeText": diagnosisTypeText,
//     "isChecked": isChecked,
//     "isEnabled": isEnabled,
//   };
//
//   DiagnosisList.fromMap(json, {this.reference}) {
//     conceptId = json["conceptId"];
//     diagnoseId = json["diagnoseId"];
//     diagnosisName = json["diagnosisName"];
//     diagnosisType = json["diagnosisType"];
//     diagnosisTypeText = json["diagnosisTypeText"];
//     isChecked = json["isChecked"];
//     isEnabled = json["isEnabled"];
//   }
//
//   DiagnosisList.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
// ///......................................................................
// class DocumentsList {
//   DocumentReference<Object?>? reference;
//
//   DocumentsList({
//     this.apptId,
//     this.description,
//     this.ftpPath,
//     this.latitude,
//     this.longitude,
//     this.path,
//     this.pid,
//     this.subcategory,
//     this.type,
//
//   });
//
//   var apptId;
//   var description;
//   var ftpPath;
//   var latitude;
//   var longitude;
//   var path;
//   var pid;
//   var subcategory;
//   var type;
//
//
//   factory DocumentsList.fromJson(Map<String, dynamic> json) => DocumentsList(
//     apptId: json["apptId"],
//     description: json["description"],
//     ftpPath: json["ftpPath"],
//     latitude: json["latitude"],
//     longitude: json["longitude"],
//     path: json["path"],
//     pid: json["pid"],
//     subcategory: json["subcategory"],
//     type: json["type"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "apptId": apptId,
//     "description": description,
//     "ftpPath": ftpPath,
//     "latitude": latitude,
//     "longitude": longitude,
//     "path": path,
//     "pid": pid,
//     "subcategory": subcategory,
//     "type": type,
//   };
//
//   DocumentsList.fromMap(json, {this.reference}) {
//     apptId = json["apptId"];
//     description = json["description"];
//     ftpPath = json["ftpPath"];
//     latitude = json["latitude"];
//     longitude = json["longitude"];
//     path = json["path"];
//     pid = json["pid"];
//     subcategory = json["subcategory"];
//     type = json["type"];
//   }
//
//   DocumentsList.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
// ///.........................................................................
//
//
//
//
//
//
//
//
//
//
//
// ///.........................................................................
//
//
//
//
// class FamilyMembersData {
//   DocumentReference<Object?>? reference;
//
//   FamilyMembersData({
//     this.BSCstatus,
//     this.DOB,
//     this.aadharId,
//     this.age,
//     this.ageInDays,
//     this.ageInMonths,
//     this.ageInYears,
//     this.appStatus,
//     this.bplCardNo,
//     this.catagory,
//     this.colourCode,
//     this.consentList,
//     this.createdByClinicId,
//     this.createdByUserPartyId,
//     this.dispenseTime,
//     this.familyId,
//     this.firstName,
//     this.followUpApptId,
//     this.functionalFlag,
//     this.gender,
//     this.imageTakenNew,
//     this.imageUrl,
//     this.income,
//     this.isEdited,
//     this.isNew,
//     this.lastName,
//     this.localId,
//     this.locationLat,
//     this.locationLong,
//     this.maritalStatus,
//     this.medongoId,
//     this.mobileNumber,
//     this.modifiedByUserPartyId,
//     this.modifiedDate,
//     this.motherName,
//     this.patientVaccineList,
//     this.pending,
//     this.pushFlag,
//     this.registeredDate,
//     this.religion,
//     this.serverPushflag,
//     this.shift,
//     this.tabFlag,
//     this.todayLabStatus,
//     this.uid,
//     this.updatedByClinicId,
//   });
//
//   var BSCstatus;
//   var DOB;
//   var aadharId;
//   var age;
//   var ageInDays;
//   var ageInMonths;
//   var ageInYears;
//   var appStatus;
//   var bplCardNo;
//   var catagory;
//   var colourCode;
//   var consentList;
//   var createdByClinicId;
//   var createdByUserPartyId;
//   var dispenseTime;
//   var familyId;
//   var firstName;
//   var followUpApptId;
//   var functionalFlag;
//   var gender;
//   var imageTakenNew;
//   var imageUrl;
//   var income;
//   var isEdited;
//   var isNew;
//   var lastName;
//   var localId;
//   var locationLat;
//   var locationLong;
//   var maritalStatus;
//   var medongoId;
//   var mobileNumber;
//   var modifiedByUserPartyId;
//   var modifiedDate;
//   var motherName;
//   var patientVaccineList;
//   var pending;
//   var pushFlag;
//   var registeredDate;
//   var religion;
//   var serverPushflag;
//   var shift;
//   var tabFlag;
//   var todayLabStatus;
//   var uid;
//   var updatedByClinicId;
//
//
//
//   factory FamilyMembersData.fromJson(Map<String, dynamic> json) => FamilyMembersData(
//     BSCstatus: json["BSCstatus"],
//     DOB: json["DOB"],
//     aadharId: json["aadharId"],
//     age: json["age"],
//     ageInDays: json["ageInDays"],
//     ageInMonths: json["ageInMonths"],
//     ageInYears: json["ageInYears"],
//     appStatus: json["appStatus"],
//     bplCardNo: json["bplCardNo"],
//     catagory: json["catagory"],
//     colourCode: json["colourCode"],
//     consentList: json["consentList"],
//     createdByClinicId: json["createdByClinicId"],
//     createdByUserPartyId: json["createdByUserPartyId"],
//     dispenseTime: json["dispenseTime"],
//     familyId: json["familyId"],
//     firstName: json["firstName"],
//     followUpApptId: json["followUpApptId"],
//     functionalFlag: json["functionalFlag"],
//     gender: json["gender"],
//     imageTakenNew: json["imageTakenNew"],
//     imageUrl: json["imageUrl"],
//     income: json["income"],
//     isEdited: json["isEdited"],
//     isNew: json["isNew"],
//     lastName: json["lastName"],
//     localId: json["localId"],
//     locationLat: json["locationLat"],
//     locationLong: json["locationLong"],
//     maritalStatus: json["maritalStatus"],
//     medongoId: json["medongoId"],
//     mobileNumber: json["mobileNumber"],
//     modifiedByUserPartyId: json["modifiedByUserPartyId"],
//     modifiedDate: json["modifiedDate"],
//     motherName: json["motherName"],
//     patientVaccineList: json["patientVaccineList"],
//     pending: json["pending"],
//     pushFlag: json["pushFlag"],
//     registeredDate: json["registeredDate"],
//     religion: json["religion"],
//     serverPushflag: json["serverPushflag"],
//     shift: json["shift"],
//     tabFlag: json["tabFlag"],
//     todayLabStatus: json["todayLabStatus"],
//     uid: json["uid"],
//     updatedByClinicId: json["updatedByClinicId"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "BSCstatus": BSCstatus,
//     "DOB": DOB,
//     "aadharId": aadharId,
//     "age": age,
//     "ageInDays": ageInDays,
//     "ageInMonths": ageInMonths,
//     "ageInYears": ageInYears,
//     "appStatus": appStatus,
//     "bplCardNo": bplCardNo,
//     "catagory": catagory,
//     "colourCode": colourCode,
//     "consentList": consentList,
//     "createdByClinicId": createdByClinicId,
//     "createdByUserPartyId": createdByUserPartyId,
//     "dispenseTime": dispenseTime,
//     "familyId": familyId,
//     "firstName": firstName,
//     "followUpApptId": followUpApptId,
//     "functionalFlag": functionalFlag,
//     "gender": gender,
//     "imageTakenNew": imageTakenNew,
//     "imageUrl": imageUrl,
//     "income": income,
//     "isEdited": isEdited,
//     "isNew": isNew,
//     "lastName": lastName,
//     "localId": localId,
//     "locationLat": locationLat,
//     "locationLong": locationLong,
//     "maritalStatus": maritalStatus,
//     "medongoId": medongoId,
//     "mobileNumber": mobileNumber,
//     "modifiedByUserPartyId": modifiedByUserPartyId,
//     "modifiedDate": modifiedDate,
//     "motherName": motherName,
//     "patientVaccineList": patientVaccineList,
//     "pending": pending,
//     "pushFlag": pushFlag,
//     "registeredDate": registeredDate,
//     "religion": religion,
//     "serverPushflag": serverPushflag,
//     "shift": shift,
//     "tabFlag": tabFlag,
//     "todayLabStatus": todayLabStatus,
//     "uid": uid,
//     "updatedByClinicId": updatedByClinicId,
//
//
//
//   };
//
//   FamilyMembersData.fromMap(json, {this.reference}) {
//     BSCstatus = json["BSCstatus"];
//     DOB = json["DOB"];
//     aadharId = json["aadharId"];
//     age = json["age"];
//     ageInDays = json["ageInDays"];
//     ageInMonths = json["ageInMonths"];
//     ageInYears = json["ageInYears"];
//     appStatus = json["appStatus"];
//     bplCardNo = json["bplCardNo"];
//     catagory = json["catagory"];
//     colourCode = json["colourCode"];
//     consentList = json["consentList"];
//     createdByClinicId = json["createdByClinicId"];
//     createdByUserPartyId = json["createdByUserPartyId"];
//     dispenseTime = json["dispenseTime"];
//     familyId = json["familyId"];
//     firstName = json["firstName"];
//     followUpApptId = json["followUpApptId"];
//     functionalFlag = json["functionalFlag"];
//     gender = json["gender"];
//     imageTakenNew = json["imageTakenNew"];
//     imageUrl = json["imageUrl"];
//     income = json["income"];
//     isEdited = json["isEdited"];
//     isNew = json["isNew"];
//     lastName = json["lastName"];
//     localId = json["localId"];
//     locationLat = json["locationLat"];
//     locationLong = json["locationLong"];
//     maritalStatus = json["maritalStatus"];
//     medongoId = json["medongoId"];
//     mobileNumber = json["mobileNumber"];
//     modifiedByUserPartyId = json["modifiedByUserPartyId"];
//     modifiedDate = json["modifiedDate"];
//     motherName = json["motherName"];
//     patientVaccineList = json["patientVaccineList"];
//     pending = json["pending"];
//     pushFlag = json["pushFlag"];
//     registeredDate = json["registeredDate"];
//     religion = json["religion"];
//     serverPushflag = json["serverPushflag"];
//     shift = json["shift"];
//     tabFlag = json["tabFlag"];
//     todayLabStatus = json["todayLabStatus"];
//     uid = json["uid"];
//     updatedByClinicId = json["updatedByClinicId"];
//
//
//
//
//
//   }
//
//   FamilyMembersData.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
//
//
//
//
// ///.........................................................................
// ///TODO CHECK THIS OUT
// class MedicineDispenseData {
//   DocumentReference<Object?>? reference;
//
//   MedicineDispenseData({
//     this.KID_PRD_30013,
//   });
//
//   var KID_PRD_30013;
//
//   factory MedicineDispenseData.fromJson(Map<String, dynamic> json) => MedicineDispenseData(
//     KID_PRD_30013: json["KID_PRD_30013"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "allergyName": KID_PRD_30013,
//
//   };
//
//   MedicineDispenseData.fromMap(json, {this.reference}) {
//     KID_PRD_30013 = json["KID_PRD_30013"];
//
//   }
//
//   MedicineDispenseData.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
//
// ///.........................................................................
//
//
//
//
// class PatientData {
//   DocumentReference<Object?>? reference;
//
//   PatientData({
//     this.BSCstatus,
//     this.DOB,
//     this.aadharId,
//     this.age,
//     this.ageInDays,
//     this.ageInMonths,
//     this.ageInYears,
//     this.appStatus,
//     this.bplCardNo,
//     this.catagory,
//     this.colourCode,
//     this.consentList,
//     this.createdByClinicId,
//     this.createdByUserPartyId,
//     this.dispenseTime,
//     this.familyId,
//     this.firstName,
//     this.functionalFlag,
//     this.gender,
//     this.imageTakenNew,
//     this.imageUrl,
//     this.income,
//     this.isEdited,
//     this.isNew,
//     this.lastName,
//     this.localId,
//     this.locationLat,
//     this.locationLong,
//     this.maritalStatus,
//     this.medongoId,
//     this.mobileNumber,
//     this.modifiedByUserPartyId,
//     this.modifiedDate,
//     this.motherName,
//     this.patientVaccineList,
//     this.pending,
//     this.pushFlag,
//     this.registeredDate,
//     this.religion,
//     this.serverPushflag,
//     this.shift,
//     this.tabFlag,
//     this.todayLabStatus,
//     this.uid,
//     this.updatedByClinicId,
//   });
//
//   var BSCstatus;
//   var DOB;
//   var aadharId;
//   var age;
//   var ageInDays;
//   var ageInMonths;
//   var ageInYears;
//   var appStatus;
//   var bplCardNo;
//   var catagory;
//   var colourCode;
//   var consentList;
//   var createdByClinicId;
//   var createdByUserPartyId;
//   var dispenseTime;
//   var familyId;
//   var firstName;
//   var functionalFlag;
//   var gender;
//   var imageTakenNew;
//   var imageUrl;
//   var income;
//   var isEdited;
//   var isNew;
//   var lastName;
//   var localId;
//   var locationLat;
//   var locationLong;
//   var maritalStatus;
//   var medongoId;
//   var mobileNumber;
//   var modifiedByUserPartyId;
//   var modifiedDate;
//   var motherName;
//   var patientVaccineList;
//   var pending;
//   var pushFlag;
//   var registeredDate;
//   var religion;
//   var serverPushflag;
//   var shift;
//   var tabFlag;
//   var todayLabStatus;
//   var uid;
//   var updatedByClinicId;
//
//
//
//
//   factory PatientData.fromJson(Map<String, dynamic> json) => PatientData(
//     BSCstatus: json["BSCstatus"],
//     DOB: json["DOB"],
//     aadharId: json["aadharId"],
//     age: json["age"],
//     ageInDays: json["ageInDays"],
//     ageInMonths: json["ageInMonths"],
//     ageInYears: json["ageInYears"],
//     appStatus: json["appStatus"],
//     bplCardNo: json["bplCardNo"],
//     catagory: json["catagory"],
//     colourCode: json["colourCode"],
//     consentList: json["consentList"],
//     createdByClinicId: json["createdByClinicId"],
//     createdByUserPartyId: json["createdByUserPartyId"],
//     dispenseTime: json["dispenseTime"],
//     familyId: json["familyId"],
//     firstName: json["firstName"],
//     functionalFlag: json["functionalFlag"],
//     gender: json["gender"],
//     imageTakenNew: json["imageTakenNew"],
//     imageUrl: json["imageUrl"],
//     income: json["income"],
//     isEdited: json["isEdited"],
//     isNew: json["isNew"],
//     lastName: json["lastName"],
//     localId: json["localId"],
//     locationLat: json["locationLat"],
//     locationLong: json["locationLong"],
//     maritalStatus: json["maritalStatus"],
//     medongoId: json["medongoId"],
//     mobileNumber: json["mobileNumber"],
//     modifiedByUserPartyId: json["modifiedByUserPartyId"],
//     modifiedDate: json["modifiedDate"],
//     motherName: json["motherName"],
//     patientVaccineList: json["patientVaccineList"],
//     pending: json["pending"],
//     pushFlag: json["pushFlag"],
//     registeredDate: json["registeredDate"],
//     religion: json["religion"],
//     serverPushflag: json["serverPushflag"],
//     shift: json["shift"],
//     tabFlag: json["tabFlag"],
//     todayLabStatus: json["todayLabStatus"],
//     uid: json["uid"],
//     updatedByClinicId: json["updatedByClinicId"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "BSCstatus": BSCstatus,
//     "DOB": DOB,
//     "aadharId": aadharId,
//     "age": age,
//     "ageInDays": ageInDays,
//     "ageInMonths": ageInMonths,
//     "ageInYears": ageInYears,
//     "appStatus": appStatus,
//     "bplCardNo": bplCardNo,
//     "catagory": catagory,
//     "colourCode": colourCode,
//     "consentList": consentList,
//     "createdByClinicId": createdByClinicId,
//     "createdByUserPartyId": createdByUserPartyId,
//     "dispenseTime": dispenseTime,
//     "familyId": familyId,
//     "firstName": firstName,
//     "functionalFlag": functionalFlag,
//     "gender": gender,
//     "imageTakenNew": imageTakenNew,
//     "imageUrl": imageUrl,
//     "income": income,
//     "isEdited": isEdited,
//     "isNew": isNew,
//     "lastName": lastName,
//     "localId": localId,
//     "locationLat": locationLat,
//     "locationLong": locationLong,
//     "maritalStatus": maritalStatus,
//     "medongoId": medongoId,
//     "mobileNumber": mobileNumber,
//     "modifiedByUserPartyId": modifiedByUserPartyId,
//     "modifiedDate": modifiedDate,
//     "motherName": motherName,
//     "patientVaccineList": patientVaccineList,
//     "pending": pending,
//     "pushFlag": pushFlag,
//     "registeredDate": registeredDate,
//     "religion": religion,
//     "serverPushflag": serverPushflag,
//     "shift": shift,
//     "tabFlag": tabFlag,
//     "todayLabStatus": todayLabStatus,
//     "uid": uid,
//     "updatedByClinicId": updatedByClinicId,
//
//
//
//   };
//
//   PatientData.fromMap(json, {this.reference}) {
//     BSCstatus = json["BSCstatus"];
//     DOB = json["DOB"];
//     aadharId = json["aadharId"];
//     age = json["age"];
//     ageInDays = json["ageInDays"];
//     ageInMonths = json["ageInMonths"];
//     ageInYears = json["ageInYears"];
//     appStatus = json["appStatus"];
//     bplCardNo = json["bplCardNo"];
//     catagory = json["catagory"];
//     colourCode = json["colourCode"];
//     consentList = json["consentList"];
//     createdByClinicId = json["createdByClinicId"];
//     createdByUserPartyId = json["createdByUserPartyId"];
//     dispenseTime = json["dispenseTime"];
//     familyId = json["familyId"];
//     firstName = json["firstName"];
//     functionalFlag = json["functionalFlag"];
//     gender = json["gender"];
//     imageTakenNew = json["imageTakenNew"];
//     imageUrl = json["imageUrl"];
//     income = json["income"];
//     isEdited = json["isEdited"];
//     isNew = json["isNew"];
//     lastName = json["lastName"];
//     localId = json["localId"];
//     locationLat = json["locationLat"];
//     locationLong = json["locationLong"];
//     maritalStatus = json["maritalStatus"];
//     medongoId = json["medongoId"];
//     mobileNumber = json["mobileNumber"];
//     modifiedByUserPartyId = json["modifiedByUserPartyId"];
//     modifiedDate = json["modifiedDate"];
//     motherName = json["motherName"];
//     patientVaccineList = json["patientVaccineList"];
//     pending = json["pending"];
//     pushFlag = json["pushFlag"];
//     registeredDate = json["registeredDate"];
//     religion = json["religion"];
//     serverPushflag = json["serverPushflag"];
//     shift = json["shift"];
//     tabFlag = json["tabFlag"];
//     todayLabStatus = json["todayLabStatus"];
//     uid = json["uid"];
//     updatedByClinicId = json["updatedByClinicId"];
//
//
//
//
//
//   }
//
//   PatientData.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
//
//
//
//
// ///.........................................................................
//
//
// class ScoresData {
//   DocumentReference<Object?>? reference;
//
//   ScoresData({
//     this.anemiascore,
//     this.bmiScore,
//     this.cvdScore,
//     this.depressionScore,
//     this.diabetesScore,
//     this.malnutritionscore,
//     this.prehypertensionScore,
//
//   });
//
//   var anemiascore;
//   var bmiScore;
//   var cvdScore;
//   var depressionScore;
//   var diabetesScore;
//   var malnutritionscore;
//   var prehypertensionScore;
//
//
//   factory ScoresData.fromJson(Map<String, dynamic> json) => ScoresData(
//     anemiascore: json["anemiascore"],
//     bmiScore: json["bmiScore"],
//     cvdScore: json["cvdScore"],
//     depressionScore: json["depressionScore"],
//     diabetesScore: json["diabetesScore"],
//     malnutritionscore: json["malnutritionscore"],
//     prehypertensionScore: json["prehypertensionScore"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "anemiascore": anemiascore,
//     "bmiScore": bmiScore,
//     "cvdScore": cvdScore,
//     "depressionScore": depressionScore,
//     "diabetesScore": diabetesScore,
//     "malnutritionscore": malnutritionscore,
//     "prehypertensionScore": prehypertensionScore,
//   };
//
//   ScoresData.fromMap(json, {this.reference}) {
//     anemiascore = json["anemiascore"];
//     bmiScore = json["bmiScore"];
//     cvdScore = json["cvdScore"];
//     depressionScore = json["depressionScore"];
//     diabetesScore = json["diabetesScore"];
//     malnutritionscore = json["malnutritionscore"];
//     prehypertensionScore = json["prehypertensionScore"];
//   }
//
//   ScoresData.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
//
//
// ///.........................................................................
//
//
// class ScreeningHistory {
//   DocumentReference<Object?>? reference;
//
//   ScreeningHistory({
//     this.cataract,
//     this.colorBilndness,
//     this.distanceVision,
//     this.nearVision,
//     this.oralCancerScreening,
//     this.oralCancerfindings,
//     this.testLayoutVisible,
//     this.vad,
//     this.visionScreening,
//
//   });
//
//   var cataract;
//   var colorBilndness;
//   var distanceVision;
//   var nearVision;
//   var oralCancerScreening;
//   var oralCancerfindings;
//   var testLayoutVisible;
//   var vad;
//   var visionScreening;
//
//
//   factory ScreeningHistory.fromJson(Map<String, dynamic> json) => ScreeningHistory(
//     cataract: json["cataract"],
//     colorBilndness: json["colorBilndness"],
//     distanceVision: json["distanceVision"],
//     nearVision: json["nearVision"],
//     oralCancerScreening: json["oralCancerScreening"],
//     oralCancerfindings: json["oralCancerfindings"],
//     testLayoutVisible: json["testLayoutVisible"],
//     vad: json["vad"],
//     visionScreening: json["visionScreening"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "cataract": cataract,
//     "colorBilndness": colorBilndness,
//     "distanceVision": distanceVision,
//     "nearVision": nearVision,
//     "oralCancerScreening": oralCancerScreening,
//     "oralCancerfindings": oralCancerfindings,
//     "testLayoutVisible": testLayoutVisible,
//     "vad": vad,
//     "visionScreening": visionScreening,
//   };
//
//   ScreeningHistory.fromMap(json, {this.reference}) {
//     cataract = json["cataract"];
//     colorBilndness = json["colorBilndness"];
//     distanceVision = json["distanceVision"];
//     nearVision = json["nearVision"];
//     oralCancerScreening = json["oralCancerScreening"];
//     oralCancerfindings = json["oralCancerfindings"];
//     testLayoutVisible = json["testLayoutVisible"];
//     vad = json["vad"];
//     visionScreening = json["visionScreening"];
//   }
//
//   ScreeningHistory.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
//
// ///....................................................................
// class SnomedCTCodeList {
//   DocumentReference<Object?>? reference;
//
//   SnomedCTCodeList({
//     this.added,
//     this.categoryId,
//     this.frequency,
//     this.snomedCTCode,
//   });
//
//   var added;
//   var categoryId;
//   var frequency;
//   var snomedCTCode;
//
//   factory SnomedCTCodeList.fromJson(Map<String, dynamic> json) => SnomedCTCodeList(
//     added: json["added"],
//     categoryId: json["categoryId"],
//     frequency: json["frequency"],
//     snomedCTCode: json["snomedCTCode"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "added": added,
//     "categoryId": categoryId,
//     "frequency": frequency,
//     "snomedCTCode": snomedCTCode,
//   };
//
//   SnomedCTCodeList.fromMap(json, {this.reference}) {
//     added = json["added"];
//     categoryId = json["categoryId"];
//     frequency = json["frequency"];
//     snomedCTCode = json["snomedCTCode"];
//   }
//
//   SnomedCTCodeList.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
// /// .....................................................................
//
//
//
// class SocialLife {
//   DocumentReference<Object?>? reference;
//
//   SocialLife({
//     this.age,
//     this.alchoholic,
//     this.alchoholic_history_duration,
//     this.chewing,
//     this.chewing_historyduration,
//     this.conceptId,
//     this.smoking,
//     this.smoking_historyduration,
//     this.tobacco,
//
//   });
//
//   var age;
//   var alchoholic;
//   var alchoholic_history_duration;
//   var chewing;
//   var chewing_historyduration;
//   var conceptId;
//   var smoking;
//   var smoking_historyduration;
//   var tobacco;
//
//
//   factory SocialLife.fromJson(Map<String, dynamic> json) => SocialLife(
//     age: json["age"],
//     alchoholic: json["alchoholic"],
//     alchoholic_history_duration: json["alchoholic_history_duration"],
//     chewing: json["chewing"],
//     chewing_historyduration: json["chewing_historyduration"],
//     conceptId: json["conceptId"],
//     smoking: json["smoking"],
//     smoking_historyduration: json["smoking_historyduration"],
//     tobacco: json["tobacco"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "age": age,
//     "alchoholic": alchoholic,
//     "alchoholic_history_duration": alchoholic_history_duration,
//     "chewing": chewing,
//     "chewing_historyduration": chewing_historyduration,
//     "conceptId": conceptId,
//     "smoking": smoking,
//     "smoking_historyduration": smoking_historyduration,
//     "tobacco": tobacco,
//   };
//
//   SocialLife.fromMap(json, {this.reference}) {
//     age = json["age"];
//     alchoholic = json["alchoholic"];
//     alchoholic_history_duration = json["alchoholic_history_duration"];
//     chewing = json["chewing"];
//     chewing_historyduration = json["chewing_historyduration"];
//     conceptId = json["conceptId"];
//     smoking = json["smoking"];
//     smoking_historyduration = json["smoking_historyduration"];
//     tobacco = json["tobacco"];
//   }
//
//   SocialLife.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
//
// ///....................................................................
//
// class SymptomsList {
//   DocumentReference<Object?>? reference;
//
//   SymptomsList({
//     this.conceptId,
//     this.duration,
//     this.isChecked,
//     this.isEnabled,
//     this.name,
//     this.position,
//
//   });
//
//   var conceptId;
//   var duration;
//   var isChecked;
//   var isEnabled;
//   var name;
//   var position;
//
//
//
//   factory SymptomsList.fromJson(Map<String, dynamic> json) => SymptomsList(
//     conceptId: json["conceptId"],
//     duration: json["duration"],
//     isChecked: json["isChecked"],
//     isEnabled: json["isEnabled"],
//     name: json["name"],
//     position: json["position"],
//
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "conceptId": conceptId,
//     "duration": duration,
//     "isChecked": isChecked,
//     "isEnabled": isEnabled,
//     "name": name,
//     "position": position,
//
//   };
//
//   SymptomsList.fromMap(json, {this.reference}) {
//     conceptId = json["conceptId"];
//     duration = json["duration"];
//     isChecked = json["isChecked"];
//     isEnabled = json["isEnabled"];
//     name = json["name"];
//     position = json["position"];
//
//   }
//
//   SymptomsList.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
//
//
// ///....................................................................
//
//
// class VitalsData {
//   DocumentReference<Object?>? reference;
//
//   VitalsData({
//     this.age,
//     this.ageInDays,
//     this.apptId,
//     this.bglFBS,
//     this.bglPPBS,
//     this.bglRBS,
//     this.bloodGlucoseFbs,
//     this.bloodGlucosePpbs,
//     this.bloodGlucoseRbs,
//     this.diabolicBloodPressure,
//     this.gender,
//     this.headCircumference,
//     this.heightCms,
//     this.heightFt,
//     this.hemoglobin,
//     this.measured,
//     this.muac,
//     this.patId,
//     this.pregnancy,
//     this.pulse,
//     this.respiration,
//     this.spo2,
//     this.systolicBloodPressure,
//     this.temperature,
//     this.temperatureCelsius,
//     this.temperatureFahrenheit,
//     this.urineGlucose,
//     this.vsmDataFlag,
//     this.waistCircumference,
//     this.weightKg,
//
//
//   });
//
//   var age;
//   var ageInDays;
//   var apptId;
//   var bglFBS;
//   var bglPPBS;
//   var bglRBS;
//   var bloodGlucoseFbs;
//   var bloodGlucosePpbs;
//   var bloodGlucoseRbs;
//   var diabolicBloodPressure;
//   var gender;
//   var headCircumference;
//   var heightCms;
//   var heightFt;
//   var hemoglobin;
//   var measured;
//   var muac;
//   var patId;
//   var pregnancy;
//   var pulse;
//   var respiration;
//   var spo2;
//   var systolicBloodPressure;
//   var temperature;
//   var temperatureCelsius;
//   var temperatureFahrenheit;
//   var urineGlucose;
//   var vsmDataFlag;
//   var waistCircumference;
//   var weightKg;
//
//
//
//
//   factory VitalsData.fromJson(Map<String, dynamic> json) => VitalsData(
//     age: json["age"],
//     ageInDays: json["ageInDays"],
//     apptId: json["apptId"],
//     bglFBS: json["bglFBS"],
//     bglPPBS: json["bglPPBS"],
//     bglRBS: json["bglRBS"],
//     bloodGlucoseFbs: json["bloodGlucoseFbs"],
//     bloodGlucosePpbs: json["bloodGlucosePpbs"],
//     bloodGlucoseRbs: json["bloodGlucoseRbs"],
//     diabolicBloodPressure: json["diabolicBloodPressure"],
//     gender: json["gender"],
//     headCircumference: json["headCircumference"],
//     heightCms: json["heightCms"],
//     heightFt: json["heightFt"],
//     hemoglobin: json["hemoglobin"],
//     measured: json["measured"],
//     muac: json["muac"],
//     patId: json["patId"],
//     pregnancy: json["pregnancy"],
//     pulse: json["pulse"],
//     respiration: json["respiration"],
//     spo2: json["spo2"],
//     systolicBloodPressure: json["systolicBloodPressure"],
//     temperature: json["temperature"],
//     temperatureCelsius: json["temperatureCelsius"],
//     temperatureFahrenheit: json["temperatureFahrenheit"],
//     urineGlucose: json["urineGlucose"],
//     vsmDataFlag: json["vsmDataFlag"],
//     waistCircumference: json["waistCircumference"],
//     weightKg: json["weightKg"],
//
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "age": age,
//     "ageInDays": ageInDays,
//     "apptId": apptId,
//     "bglFBS": bglFBS,
//     "bglPPBS": bglPPBS,
//     "bglRBS": bglRBS,
//     "bloodGlucoseFbs": bloodGlucoseFbs,
//     "bloodGlucosePpbs": bloodGlucosePpbs,
//     "bloodGlucoseRbs": bloodGlucoseRbs,
//     "diabolicBloodPressure": diabolicBloodPressure,
//     "gender": gender,
//     "headCircumference": headCircumference,
//     "heightCms": heightCms,
//     "heightFt": heightFt,
//     "hemoglobin": hemoglobin,
//     "measured": measured,
//     "muac": muac,
//     "patId": patId,
//     "pregnancy": pregnancy,
//     "pulse": pulse,
//     "respiration": respiration,
//     "spo2": spo2,
//     "systolicBloodPressure": systolicBloodPressure,
//     "temperature": temperature,
//     "temperatureCelsius": temperatureCelsius,
//     "temperatureFahrenheit": temperatureFahrenheit,
//     "urineGlucose": urineGlucose,
//     "vsmDataFlag": vsmDataFlag,
//     "waistCircumference": waistCircumference,
//     "weightKg": weightKg,
//
//
//
//
//   };
//
//   VitalsData.fromMap(json, {this.reference}) {
//     age = json["age"];
//     ageInDays = json["ageInDays"];
//     apptId = json["apptId"];
//     bglFBS = json["bglFBS"];
//     bglPPBS = json["bglPPBS"];
//     bglRBS = json["bglRBS"];
//     bloodGlucoseFbs = json["bloodGlucoseFbs"];
//     bloodGlucosePpbs = json["bloodGlucosePpbs"];
//     bloodGlucoseRbs = json["bloodGlucoseRbs"];
//     diabolicBloodPressure = json["diabolicBloodPressure"];
//     gender = json["gender"];
//     headCircumference = json["headCircumference"];
//     heightCms = json["heightCms"];
//     heightFt = json["heightFt"];
//     hemoglobin = json["hemoglobin"];
//     measured = json["measured"];
//     muac = json["muac"];
//     patId = json["patId"];
//     pregnancy = json["pregnancy"];
//     pulse = json["pulse"];
//     respiration = json["respiration"];
//     spo2 = json["spo2"];
//     systolicBloodPressure = json["systolicBloodPressure"];
//     temperature = json["temperature"];
//     temperatureCelsius = json["temperatureCelsius"];
//     temperatureFahrenheit = json["temperatureFahrenheit"];
//     urineGlucose = json["urineGlucose"];
//     vsmDataFlag = json["vsmDataFlag"];
//     waistCircumference = json["waistCircumference"];
//     weightKg = json["weightKg"];
//
//
//
//
//
//
//   }
//
//   VitalsData.fromSnapshot(QueryDocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);
// }
//
//
//
// ///....................................................................

*/
