import 'dart:async';
import 'dart:convert';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medongosupport/preConsultModule/controllers/preConsultationController.dart';
import 'package:medongosupport/preConsultModule/view/confirmPage.dart';
import 'package:medongosupport/preConsultModule/view/preconsultationModuleMain.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/view/faceDetectionModules/detector.dart';
import 'package:medongosupport/preConsultModule/view/questionModules/questionsScreen.dart';
import 'package:medongosupport/preConsultModule/widgets/alertDialogs.dart';

final PCPermissionController permissionController =
    Get.find<PCPermissionController>();

class PCPermissionController extends GetxController {
  RxBool locationPermissionGranted = false.obs;
  RxBool cameraPermissionGranted = false.obs;
  RxBool microphonePermissionGranted = false.obs;

  BuildContext? context;

  ///METHOD CHANNEL TO RECEIVE DATA FROM NATIVE ANDROID
  static const platform = MethodChannel('com.axiphyl.preconsult/config');

  getLocationPermission() async {
    await Permission.locationAlways.request();
  }

  getCameraPermission() async {
    await Permission.camera.request();
  }

  getMicrophonePermission() async {
    await Permission.microphone.request();
  }

  Future<void> openAppSettings() async {
    await AppSettings.openAppSettings();
  }

  ///CHECKS ALL THE PERMISSIONS
  Future<void> checkAllPermissions() async {
    //locationController.getLocationPermission();

    // Check if the location permission is accepted

    try {
      var locationStatus = await Permission.locationWhenInUse.status;
      locationPermissionGranted.value = locationStatus.isGranted;

      // Check if the camera permission is accepted
      var cameraStatus = await Permission.camera.status;
      cameraPermissionGranted.value = cameraStatus.isGranted;

      // Check if the microphone permission is accepted
      var microphoneStatus = await Permission.microphone.status;
      microphonePermissionGranted.value = microphoneStatus.isGranted;

      update();

      Future receiveFromHost(MethodCall call) async {
        var jData;

        try {
          if (call.method == "configData") {
            final String data = call.arguments;
            print("JSON RESPONSE FROM THE NATIVE METHOD$data");

            jData = await jsonDecode(data);

            print("JSON RESPONSE FROM THE NATIVE METHOD$jData");

            ///UPDATE DATA
            preConsultationController.updateValueFromNativeMethod(json: jData);
          }
        } on PlatformException catch (error) {
          print(error);
        }
      }

      ///CALLS METHOD TO GET DATA AND THEN PROCEEDS TO CAMERA VIEW
      platform.setMethodCallHandler(receiveFromHost);

      // Navigate to the next page if all permissions are accepted
      if (locationPermissionGranted.value &&
          cameraPermissionGranted.value &&
          microphonePermissionGranted.value) {
        ///GET ALL QUESTIONS FROM THE INTERNET
        var res = await questionsController.getAllQuestions();

        if (res) {
          Future.delayed(const Duration(seconds: 1), () {
            if (questionsController.allQuestionsList!.length != 0) {
              ///NAVIGATE TO FACE DETECTOR VIEW - IF ALL THE PERMISSIONS ARE GIVEN
              Get.offAll(() => FaceDetectorView());
            } else {
              Get.offAll(() => const NoInternetUnableToLoadPage());
            }
          });
        }

      } else {
        requestPermissions();
        //Get.to(() => const PreConsultationModuleMain());
      }
    } catch (error) {
      debugPrint("$error");
    }
  }

  ///REQUESTS PERMISSION FROM THE USER
  Future<void> requestPermissions() async {
    if (!locationPermissionGranted.value) {
      var locationStatus = await Permission.locationWhenInUse.request();

      ///UPDATES LOCATION PERMISSION
      locationPermissionGranted.value = locationStatus.isGranted;
      update();

      if (!locationPermissionGranted.value) {
        // Show a message to the user explaining why the permission is necessary
        openSettingsDialog(
            title: 'Permission Required',
            content: 'Please allow location access to use this app',
            onTapOk: () async {
              Get.back();
              // Wait a second before requesting the permission again
              Future.delayed(const Duration(seconds: 1), () {
                requestPermissions();
              });
            },
            onTapOpenSettings: () async {
              Get.back();
              openAppSettings();
            });
        return;
      }
    }

    if (!cameraPermissionGranted.value) {
      var cameraStatus = await Permission.camera.request();
      cameraPermissionGranted.value = cameraStatus.isGranted;
      update();

      if (!cameraPermissionGranted.value) {
        // Show a message to the user explaining why the permission is necessary
        openSettingsDialog(
            title: 'Permission Required',
            content: 'Please allow camera access to use this app',
            onTapOk: () async {
              Get.back();
              // Wait a second before requesting the permission again
              Future.delayed(const Duration(seconds: 1), () {
                requestPermissions();
              });
            },
            onTapOpenSettings: () async {
              Get.back();
              openAppSettings();
            });

        return;
      }
    }
    if (!microphonePermissionGranted.value) {
      var microphoneStatus = await Permission.microphone.request();
      microphonePermissionGranted.value = microphoneStatus.isGranted;
      update();

      if (!microphonePermissionGranted.value) {
        // Show a message to the user explaining why the permission is necessary
        openSettingsDialog(
            title: 'Permission Required',
            content: 'Please allow microphone access to use this app',
            onTapOk: () async {
              Get.back();
              // Wait a second before requesting the permission again
              Future.delayed(const Duration(seconds: 1), () {
                requestPermissions();
              });
            },
            onTapOpenSettings: () async {
              Get.back();
              openAppSettings();
            });

        return;
      }
    }
  }
}
