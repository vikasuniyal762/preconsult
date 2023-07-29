import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/shimmerWidgets.dart';
import 'package:medongosupport/preConsultModule/consts/appColors.dart';
import 'package:medongosupport/preConsultModule/controllers/attachmentsController.dart';
import 'package:medongosupport/preConsultModule/controllers/audioFileController.dart';
import 'package:medongosupport/preConsultModule/controllers/locationController.dart';
import 'package:medongosupport/preConsultModule/controllers/permissionController.dart';
import 'package:medongosupport/preConsultModule/controllers/preConsultationController.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/controllers/userController.dart';
import 'package:medongosupport/preConsultModule/controllers/vitalsController.dart';
import 'package:medongosupport/preConsultModule/view/confirmPage.dart';
import 'package:medongosupport/preConsultModule/view/faceDetectionModules/detector.dart';
import 'package:medongosupport/preConsultModule/widgets/appBars.dart';
import 'package:medongosupport/preConsultModule/widgets/shimmer.dart';
import 'package:medongosupport/preConsultModule/widgets/willPopScope.dart';

class PreConsultationModuleMain extends StatefulWidget {
  const PreConsultationModuleMain({Key? key}) : super(key: key);

  @override
  State<PreConsultationModuleMain> createState() =>
      _PreConsultationModuleMainState();
}


class _PreConsultationModuleMainState extends State<PreConsultationModuleMain> {

  ///METHOD CHANNEL TO RECEIVE DATA FROM NATIVE ANDROID
  static const platform = MethodChannel('com.axiphyl.preconsult/config');


  Future<void> receiveFromHost(MethodCall call) async {
    var jData;

    try {
      if (call.method == "configData") {
        final String data = call.arguments;
        debugPrint("JSON RESPONSE FROM THE NATIVE METHOD$data");

        jData = await jsonDecode(data);

        debugPrint("JSON RESPONSE FROM THE NATIVE METHOD$jData");

        ///UPDATE DATA
        preConsultationController.updateValueFromNativeMethod(json: jData);
      }
    } on PlatformException catch (error) {
      print(error);
    }
  }


  @override
  void initState() {


    ///CHECKS IF THE PERMISSIONS ARE GRANTED OR NOT
    permissionController.checkAllPermissions();


    ///PORTRAIT ORIENTATION ONLY
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    ///METHOD CHANNEL'S METHOD TO RECEIVE DATA FROM NATIVE ANDROID
    platform.setMethodCallHandler(receiveFromHost);

    ///GET ALL QUESTIONS FROM THE INTERNET
    questionsController.getAllQuestions();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () => onWillPopFaceDetector(context, "Registration data will be lost. Do you want to continue?"),
      child: SafeArea(
        child: Obx(
              () => LoadingOverlay(
              color: AppColor.white,
              opacity: 1.0,
              progressIndicator: LoadingBouncingGrid.square(
                size: 75.0,
                backgroundColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
                duration: const Duration(milliseconds: 1000),
              ),
              isLoading: preConsultationController.isLoadingPermissionsPage.value,
              child: SafeArea(
                  child: Scaffold(
                    //appBar: titleAppBar(context: context, title: "Allow Permissions"),
                    body: Center(
                      child: LoadingBouncingGrid.square(
                        size: 75.0,
                        backgroundColor: AppColor.primaryColor,
                        borderColor: AppColor.primaryColor,
                        duration: const Duration(milliseconds: 1000),
                      ),
                    ),
                  ),
              ),
          ),
        ),
      ),
    );
  }
}




///OLD BODY
//appBar: titleAppBar(context: context, title: "Allow Permissions"),
// body: Center(
//   child: Padding(
//     padding: const EdgeInsets.only(
//         right: 8.0, left: 4.0, top: 8.0, bottom: 8.0),
//     child: ListView(
//       children: [
//         ListTile(
//             onTap: () async {
//               await permissionController.getLocationPermission();
//             },
//             title: const Text("Location Permission"),
//             trailing: Obx(
//                   () => Icon(
//                 Icons.location_on_outlined,
//                 color:
//                 permissionController.locationPermissionGranted.value
//                     ? AppColor.primaryColor
//                     : AppColor.grey,
//               ),
//             )),
//         ListTile(
//             onTap: () async {
//               await permissionController.getCameraPermission();
//             },
//             title: const Text("Camera Permission"),
//             trailing: Obx(
//                   () => Icon(
//                 Icons.camera,
//                 color: permissionController.cameraPermissionGranted.value
//                     ? AppColor.primaryColor
//                     : AppColor.grey,
//               ),
//             )),
//         ListTile(
//           onTap: () async {
//             await permissionController.getMicrophonePermission();
//           },
//           title: const Text("Microphone Permission"),
//           trailing: Obx(
//                 () => Icon(
//               Icons.mic_none_rounded,
//               color:
//               permissionController.microphonePermissionGranted.value
//                   ? AppColor.primaryColor
//                   : AppColor.grey,
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 50,
//         ),
//         FloatingActionButton(
//           onPressed: () async {
//             await permissionController.checkAllPermissions();
//           },
//           backgroundColor: AppColor.white,
//           child: const Icon(
//             Icons.arrow_circle_right_outlined,
//             color: AppColor.primaryColor,
//           ),
//         ),
//       ],
//     ),
//   ),
// ),






