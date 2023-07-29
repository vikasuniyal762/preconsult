import 'dart:convert';
// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

List<QuestionsMain> questionsMainFromJson(str) => List<QuestionsMain>.from(
    (str).map((x) => QuestionsMain.fromJson(x.data())));

String questionsMainToJson(List<QuestionsMain> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionsMain {
  DocumentReference<Object?>? reference;

  QuestionsMain({
    this.elements,
    this.startAge,
    this.endAge,
    this.gender,
  });

  List<Elements>? elements;
  var startAge;
  var endAge;
  var gender;

  factory QuestionsMain.fromJson(Map<String, dynamic> json) => QuestionsMain(
        elements: json["elements"] != null
            ? elementsFromJson(json['elements'])
            : null,
        startAge: json["startAge"],
        endAge: json["endAge"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "elements": elements,
        "startAge": startAge,
        "endAge": endAge,
        "gender": gender,
      };

  QuestionsMain.fromMap(json, {this.reference}) {
    elements = json["elements"];
    startAge = json["startAge"];
    endAge = json["endAge"];
    gender = json["gender"];
  }

  QuestionsMain.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

List<Elements> elementsFromJson(str) =>
    List<Elements>.from((str).map((x) => Elements.fromJson(x)));

String elementsToJson(List<Elements> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Elements {
  DocumentReference<Object?>? reference;

  Elements(
      {this.backgroundColor,
      this.borderColor,
      this.borderThickness,
      this.elevation,
      this.groupIndex,
      this.handlerSize,
      this.id,
      this.kind,
      this.options,
      this.positionDx,
      this.positionDy,
      this.selectedGroup,
      this.selectedLength,
      this.selectedMode,
      //this.(size.height),
      //this.(size.width),
      this.text,
      this.textColor,
      this.textIsBold,
      this.textSize,
      this.handlers,
      this.next,
      this.answer,
      this.attachments,
      this.multiOptions,
      this.previousQuestionIndex,
      this.isMandatory,


      });

  var backgroundColor;
  var borderColor;
  var borderThickness;
  var elevation;
  int? groupIndex;
  var handlerSize;
  var id;
  var kind;
  var options;
  var positionDx;
  var positionDy;
  var selectedGroup;
  var selectedLength;
  var selectedMode;
  //var (size.height);
  //var (size.width);
  var text;
  var textColor;
  var textIsBold;
  var textSize;
  List<dynamic>? handlers;
  List<Next>? next;
  String? answer;
  List? attachments;
  var multiOptions;
  var previousQuestionIndex;
  var isMandatory;

  factory Elements.fromJson(Map<String, dynamic> json) => Elements(
      backgroundColor: json["backgroundColor"],
      borderColor: json["borderColor"],
      borderThickness: json["borderThickness"],
      elevation: json["elevation"],
      groupIndex: json["groupIndex"],
      handlerSize: json["handlerSize"],
      id: json["id"],
      kind: json["kind"],
      options: json["options"],
      positionDx: json["positionDx"],
      positionDy: json["positionDy"],
      selectedGroup: json["selectedGroup"],
      selectedLength: json["selectedLength"],
      selectedMode: json["selectedMode"],
      text: json["text"],
      textColor: json["textColor"],
      textIsBold: json["textIsBold"],
      textSize: json["textSize"],
      handlers: json["handlers"] != null
          ? List<dynamic>.from(json["handlers"])
          : null,
      next: json["next"] != null ? nextFromJson(json['next']) : null,
      multiOptions: json["multiOptions"],
    isMandatory: json["isMandatory"],

  );

  Map<String, dynamic> toJson() => {
        "backgroundColor": backgroundColor,
        "borderColor": borderColor,
        "borderThickness": borderThickness,
        "elevation": elevation,
        "groupIndex": groupIndex,
        "handlerSize": handlerSize,
        "id": id,
        "kind": kind,
        "options": options,
        "positionDx": positionDx,
        "positionDy": positionDy,
        "selectedGroup": selectedGroup,
        "selectedLength": selectedLength,
        "selectedMode": selectedMode,
        "text": text,
        "textColor": textColor,
        "textIsBold": textIsBold,
        "textSize": textSize,
        "handlers": handlers,
        "next": next,
        "multiOptions": multiOptions,
        "isMandatory": isMandatory,
      };

  Elements.fromMap(json, {this.reference}) {
    backgroundColor = json["backgroundColor"];
    borderColor = json["borderColor"];
    borderThickness = json["borderThickness"];
    elevation = json["elevation"];
    groupIndex = json["groupIndex"];
    handlerSize = json["handlerSize"];
    id = json["id"];
    kind = json["kind"];
    options = json["options"];
    positionDx = json["positionDx"];
    positionDy = json["positionDy"];
    selectedGroup = json["selectedGroup"];
    selectedLength = json["selectedLength"];
    selectedMode = json["selectedMode"];
    text = json["text"];
    textColor = json["textColor"];
    textIsBold = json["textIsBold"];
    textSize = json["textSize"];
    handlers = json["handlers"];
    next = json["next"];
    multiOptions = json["multiOptions"];
    isMandatory = json["isMandatory"];
  }

  Elements.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}





List<Next> nextFromJson(str) =>
    List<Next>.from((str).map((x) => Next.fromJson(x)));

String nextToJson(List<Elements> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Next {
  DocumentReference<Object?>? reference;

  Next({
    this.arrowParams,
    this.destElementId,
  });

  ArrowParams? arrowParams;
  String? destElementId;

  factory Next.fromJson(Map<String, dynamic> json) => Next(
        arrowParams: json["arrowParams"] != null
            ? ArrowParams.fromJson(json["arrowParams"])
            : null,
        destElementId: json["destElementId"],
      );

  Next.fromMap(json, {this.reference}) {
    arrowParams = json["arrowParams"];
    destElementId = json["destElementId"];
  }

  Map<String, dynamic> toJson() => {
        "arrowParams": arrowParams,
        "destElementId": destElementId,
      };

  Next.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

class ArrowParams {
  DocumentReference<Object?>? reference;

  ArrowParams({
    this.color,
    this.endArrowPositionX,
    this.endArrowPositionY,
    this.startArrowPositionX,
    this.startArrowPositionY,
    this.thickness,
  });

  var color;
  var endArrowPositionX;
  var endArrowPositionY;
  var startArrowPositionX;
  var startArrowPositionY;
  var thickness;

  factory ArrowParams.fromJson(Map<String, dynamic> json) => ArrowParams(
        color: json["color"],
        endArrowPositionX: json["endArrowPositionX"],
        endArrowPositionY: json["endArrowPositionY"],
        startArrowPositionX: json["startArrowPositionX"],
        startArrowPositionY: json["startArrowPositionY"],
        thickness: json["thickness"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "endArrowPositionX": endArrowPositionX,
        "endArrowPositionY": endArrowPositionY,
        "startArrowPositionX": startArrowPositionX,
        "startArrowPositionY": startArrowPositionY,
        "thickness": thickness,
      };

  ArrowParams.fromMap(json, {this.reference}) {
    color = json["color"];
    endArrowPositionX = json["endArrowPositionX"];
    endArrowPositionY = json["endArrowPositionY"];
    startArrowPositionX = json["startArrowPositionX"];
    startArrowPositionY = json["startArrowPositionY"];
    thickness = json["thickness"];
  }

  ArrowParams.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

class PersonalQuestionsModel {
  PersonalQuestionsModel({
    this.userFaceDetection,
    this.image,
    this.imageAwsPath,
    this.video,
    this.completeAudioRecording,
    this.fullName,
    this.firstName,
    this.lastName,
    this.age,
    this.dob,
    this.aadharNumber,
    this.motherName,
    this.mobileNumber,
    this.gender,
    this.height,
    this.weight,
    this.address,
  });

  var userFaceDetection;
  String? image;
  String? imageAwsPath;
  String? video;
  String? completeAudioRecording;
  String? fullName;
  String? firstName;
  String? lastName;
  String? age;
  String? dob;
  String? aadharNumber;
  String? motherName;
  String? mobileNumber;
  String? gender;
  String? address;
  var height;
  var weight;
}

class VitalsQuestionsModel {
  VitalsQuestionsModel({
    this.systolic,
    this.diastolic,
    this.bp,
    this.pulse,
    this.temperature,
    this.respiratoryRate,
    this.bglRbs,
    this.bglFbs,
    this.bglPpbs,
    this.spo2,
    this.hemoglobin,
  });

  var systolic;
  var diastolic;
  var bp;
  var pulse;
  var temperature;
  var spo2;
  var respiratoryRate;
  var bglRbs;
  var bglFbs;
  var bglPpbs;
  var hemoglobin;
}
