class AndroidNativeDataTransferModel {
  String? clinicId;
  String? colorCode;
  String? appName;
  String? instituteId;
  String? partyId;
  String? tabCode;
  int? shift;
  String? bucketName;
  String? accessName;
  String? regionId;
  String? keyName;

  AndroidNativeDataTransferModel(
      {
     required this.clinicId,
     required this.colorCode,
     required this.appName,
     required this.instituteId,
     required this.partyId,
     required this.tabCode,
     required this.shift,
     required this.bucketName,
     required this.accessName,
     required this.regionId,
     required this.keyName});

  factory AndroidNativeDataTransferModel.fromJson(Map<String, dynamic> json) =>
      AndroidNativeDataTransferModel(
        clinicId: json["clinicId"],
        colorCode: json["colorCode"],
        appName: json["appName"],
        instituteId: json["instituteId"],
        partyId: json["partyId"],
        tabCode: json["tabCode"],
        shift: json["shift"],
        bucketName: json["bucketName"],
        accessName: json["accessName"],
        regionId: json["regionId"],
        keyName: json["keyName"],
      );
}
