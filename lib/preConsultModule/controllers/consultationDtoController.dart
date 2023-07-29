import 'package:medongosupport/preConsultModule/models/consultationDtoModel.dart';



ConsultationOld consultation = ConsultationOld(
  actualConsult: false,
  accountBillingInfo: [],
  admitStatus: false,
  allergy: '',
  allergyList: [],
  ancDataList : ancDataList,  /// TYPE ANCDATALIST
  anemiaData : anemiaData,  /// TYPE ANEMIADATA
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
  patientData: patientData,    /// type patientData
  pncVisitList: pncVisitList,    /// type pncVisitList
  pregnancy: false,
  prescPdfPath: '',
  printPending: false,
  pushFlag: 0,
  referrals: referrals,
  scoresData : scoresData,  /// type scoreData
  screeningHistory: screeningHistory,  /// type screeninhHistory
  serverPushflag: false,
  shift: 0,
  siteName: '',
  snomedCTCodeList: [],
  socialLife: socialLife,  /// type sociallife
  surgicalHistory: '',
  symptomsList: [],
  tabFlag: 0,
  teleConsult: false,
  termination: '',
  testList: [],
  trimester: '',
  visitForFollowp: false,
  vitalsData : vitalsData,
  /// type vitals Data
  zscore: 0,
);



PncVisitList pncVisitList = PncVisitList(
    ageInDays:0 ,
    calciumConsumedVisible:false ,
    calciumGiven: '',
    dangerSign: '',
    deliveryDays: 0,
    followUpPatientCount:0 ,
    ifaConsumedVisible:false ,
    ifaGiven:'' ,
    motherDetailsVisible:false ,
    motherVisitDate:'' ,
    pncCounselling:'' ,
    pncRegisteredDate: '',
    pncVisible: false,
    reason: '',
    visitNo: 0,
    visitStatusCount:0
);


///ALLERGY QUESTIONS CLASS CONTROLLER

AllergyList allergyList = AllergyList(
    allergyName: '',
    conceptId: '',
    isEnabled: false,
    position: 0
);



MedicineDispenseData  medicineDispenseData = MedicineDispenseData();


var medicineDispenseDataDeleted;

Referrals referrals = Referrals(
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



///ANEMIA DATA QUESTION CLASS CONTROLLER
AnemiaData anemiaData = AnemiaData(
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


AncDataList ancDataList = AncDataList(
  abdomenExamDone:'NO',
  ancCounselingType:'',
  ancCounselling:'',
  ancPlaceOrBy:'',
  ancRegisteredDate:'',
  ancRegisteredPlace:'',
  ancRegistration:'',
  ancVisible:false,
  availedFamilyPlanningServices:'',
  awreOfDangerSigns:'',
  birthPrepardnessPlan:'',
  breastfedAnHour:'',
  calciumConsumed:'',
  calciumGiven:'',
  calciumVisible:false,
  childComplicationType:'',
  childComplications:'',
  childGender:'',
  childName:'',
  childWeight:0,
  childuniqueID:'',
  congenitalAnomaly:'',
  cryAfterBirth:'',
  dangerSigns:'',
  dangersignDetails:'',
  deliveryDate:'',
  deliveryPncVisible:false,
  deliverybagPrepared:'',
  deworming:false,
  fConsumedVisble:false,
  familyPlanningServiceTypes:'',
  fhr:'',
  folicAcidConsumed:'',
  folicAcidGiven:'',
  followUpPatientCount:0,
  fundalHeight:'',
  haveEssentialContactNo:'',
  highRisk:'',
  highRiskType:'',
  homeDelivery:'',
  identifiedBloodDonar:'',
  identifiedTransportation:'',
  ifaConsumed:'',
  ifaConsumedVisible:false,
  ifaGiven:'',
  maternalDeath:'',
  multiplePregnancy:'',
  neonatalDeath:'',
  outcomeMandatoryVisible:false,
  outcomeOfPregnancy:'',
  placeOfDelivery:'',
  pregnancy:false,
  prematureBaby:'',
  sourceOfAdditionalFunds:'',
  speculumexamDone:'',
  term:'',
  trimester:'',
  tt1Date:'',
  tt2Date:'',
  ttBoosterDate:'',
  typeOfDelivery:'',
  urineProteins:'',
  vaginumExamDone:'',
  visitStatusCount:0,
  vitaminKGiven:'',
  weeks:0,


);


///SCREENING HISTORY DATA
ScreeningHistory screeningHistory = ScreeningHistory(
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



///CHRONICAL DISEASE DATA
ChronicalDisease chronicalDisease = ChronicalDisease(
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
  pastIllnessSize:0,
  pncVisible: false,
  pregnancy: false,
  surgical: '',
  termination: '',
  visitNumber: 0,
);



///SOCIAL LIFE DATA
SocialLife socialLife = SocialLife(
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
    tobacco: ''
);



///
DocumentsList documentsList = DocumentsList(
    apptId: '',
    captureDateTime: '',
    description: '',
    ftpPath: '',
    latitude: '',
    longitude: '',
    path: '',
    pid: '',
    subcategory: '',
    type: ''
);



///PATIENT DATA
PatientData patientData = PatientData(
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
    updatedByClinicId: ''
);




/// FAMILY DATA QUESTION CLASS
FamilyData familyData = FamilyData(
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



/// FAMILY MEMBER DATA
FamilyMembersData familyMembersData = FamilyMembersData(
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
    updatedByClinicId: ''
);




///SCORE CARD
ScoresData scoresData = ScoresData(
    anemiascore: '',
    bmiScore: 0,
    cvdScore: 0,
    depressionScore: 0,
    diabetesScore: 0,
    malnutritionscore: '',
    prehypertensionScore: 0
);



///DATAMETRICS
Datametrices datametrices = Datametrices(
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




///  SymptomsList
///
///

SymptomsList symptomsList = SymptomsList(
    conceptId: '',
    duration: '',
    isChecked: false,
    isEnabled: false,
    name: '',
    position: 0
);





/// SnomedCTCodeList
SnomedCTCodeList snomedCTCodeList = SnomedCTCodeList(
    added: false,
    categoryId: 0,
    frequency: 0,
    snomedCTCode: ''
);





///VITALS DATA - ADDITIONAL
VitalsData vitalsData = VitalsData(
  age: 0,
  ageInDays: 0,
  apptId: '',
  bglFBS: '',
  bglPPBS: '',
  bglRBS: '',
  bloodGlucoseFbs: '0',
  bloodGlucosePpbs: '0',
  bloodGlucoseRbs:'0',
  diabolicBloodPressure: '0',
  gender: '',
  headCircumference: '0',
  heightCms: '0',
  heightFt:'0',
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
  temperatureFahrenheit:'0',
  urineGlucose: '',
  vsmDataFlag: false,
  waistCircumference: '0',
  weightKg: '0',
);





/// POST CONSULTATION
///MedicineDispenseData

//
// MedicineDispenseData medicineDispenseData = MedicineDispenseData(
//     KID_PRD_30013: ''
// );
//
// updateMedicineDispenseDataDetails({required String field, required String response}) {
//   switch (field) {
//
//   case "KID_PRD_30013":
//     medicineDispenseData.KID_PRD_30013 = response;
//   break;
//     default:
//       showToast("INVALID TYPE", ToastGravity.CENTER);
//   }
// }
//





/// POST CONSULTATION
///MedicineDispenseData

//
// MedicineDispenseData medicineDispenseData = MedicineDispenseData(
//     KID_PRD_30013: ''
// );
//
// updateMedicineDispenseDataDetails({required String field, required String response}) {
//   switch (field) {
//
//   case "KID_PRD_30013":
//     medicineDispenseData.KID_PRD_30013 = response;
//   break;
//     default:
//       showToast("INVALID TYPE", ToastGravity.CENTER);
//   }
// }
//
