import 'dart:convert';

List<VideoError> videoErrorsFromJson(str) => List<VideoError>.from(
    (str).map((x) => VideoError.fromJson(x.data())));

String videoErrorsToJson(List<VideoError> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoError {
  String? error;
  String? errorSec;
  String? errorValue;

  VideoError({this.error, this.errorSec, this.errorValue});

  VideoError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorSec = json['errorSec'];
    errorValue = json['errorValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['errorSec'] = this.errorSec;
    data['errorValue'] = this.errorValue;
    return data;
  }
}