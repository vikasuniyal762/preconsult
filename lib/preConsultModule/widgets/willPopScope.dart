import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:medongosupport/main.dart';
import 'package:medongosupport/preConsultModule/consts/appColors.dart';
import 'package:medongosupport/preConsultModule/controllers/attachmentsController.dart';
import 'package:medongosupport/preConsultModule/controllers/audioFileController.dart';
import 'package:medongosupport/preConsultModule/controllers/locationController.dart';
import 'package:medongosupport/preConsultModule/controllers/permissionController.dart';
import 'package:medongosupport/preConsultModule/controllers/preConsultationController.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/controllers/userController.dart';
import 'package:medongosupport/preConsultModule/controllers/vitalsController.dart';
import 'package:medongosupport/preConsultModule/view/faceDetectionModules/detector.dart';
import 'package:medongosupport/preConsultModule/view/preconsultationModuleMain.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

///QUESTIONS PAGE
Future<bool> onWillPop(BuildContext context, String? message) async {
  bool? exitResult = await showExitBottomSheet(context, message);
  return exitResult ?? false;
}

showExitBottomSheet(BuildContext context, String? message) async {
  return await showModalBottomSheet(
    backgroundColor: AppColor.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: buildBottomSheet(context, message),
      );
    },
  );
}

Widget buildBottomSheet(BuildContext context, String? message) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(
        height: 24,
      ),
      Text(message ?? 'Do you really want to exit the app?',
          style: const TextStyle(color: AppColor.blackMild, fontSize: 18)),
      const SizedBox(
        height: 24,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('CANCEL',
                style: TextStyle(color: AppColor.primaryColor)),
          ),
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
              ),
            ),
            onPressed: () async {
              try {
                // Get.back();
                Get.back();

                ///UPDATES LOADING STATUS ON PRE - CONSULT MAIN PAGE
                preConsultationController.updateLoadingStatusPermissionsPage();

                await questionsController.resetAllQuestionsAndStatus(totalExit: false);
                await preConsultationController.resetRecordingStatus();

                //preConsultationController.updateAlertDialogStatus();
                //Get.reset(clearFactory: true,clearRouteBindings: true);
                // Get.reload<PCPreConsultationController>();
                // Get.reload<PCQuestionsController>();

                Future.delayed(const Duration(seconds: 1));

                ///KILLS AND RESTARTS THE APP
                Get.offAll(() => FaceDetectorView());

                //Get.offAll(() =>  FaceDetectorView());
                ///CLEAR DATA
                // const platform = MethodChannel('com.axiphyl.preconsult/preconsultData');
                // platform.invokeMethod("clearData");
                //SystemNavigator.pop();
                // SystemNavigator.pop();
              } catch (error) {
                debugPrint("$error");
              }
            },
            child: const Text(
              'YES',
              style: TextStyle(color: AppColor.primaryColor),
            ),
          ),
        ],
      ),
    ],
  );
}




///FACE DETECTOR
Future<bool> onWillPopFaceDetector(
    BuildContext context, String? message) async {
  bool? exitResult = await showExitBottomSheetFaceDetector(context, message);
  return exitResult ?? false;
}

showExitBottomSheetFaceDetector(BuildContext context, String? message) async {
  return await showModalBottomSheet(
    backgroundColor: AppColor.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: buildBottomSheetFaceDetector(context, message),
      );
    },
  );
}

Widget buildBottomSheetFaceDetector(BuildContext context, String? message) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(
        height: 24,
      ),
      Text(message ?? 'Do you really want to exit the app?',
          style: const TextStyle(color: AppColor.blackMild, fontSize: 18)),
      const SizedBox(
        height: 24,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('CANCEL',
                style: TextStyle(color: AppColor.primaryColor)),
          ),
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
              ),
            ),
            onPressed: () async {
              try {
                Get.back();

                ///UPDATES LOADING STATUS ON PRE - CONSULT MAIN PAGE
                preConsultationController.updateLoadingStatusPermissionsPage();
                await questionsController.resetAllQuestionsAndStatus(totalExit: true);
                await preConsultationController.resetRecordingStatus();
                //preConsultationController.updateAlertDialogStatus();
                //await FlutterSecureStorage().deleteAll();
                Get.offAll(() => const PreConsultationModuleMain());
                // permissionController.dispose();
                // audioFileController.dispose();
                // locationController.dispose();
                // preConsultationController.dispose();
                // questionsController.dispose();
                // userController.dispose();
                // vitalsController.dispose();
                // attachmentsController.dispose();
                Future.delayed(const Duration(milliseconds: 500));
                SystemNavigator.pop();

                ///CLEAR DATA
                // const platform = MethodChannel('com.axiphyl.preconsult/preconsultData');
                // platform.invokeMethod("clearData");
              } catch (error) {
                debugPrint("$error");
              }
            },
            child: const Text(
              'YES',
              style: TextStyle(color: AppColor.primaryColor),
            ),
          ),
        ],
      ),
    ],
  );
}
