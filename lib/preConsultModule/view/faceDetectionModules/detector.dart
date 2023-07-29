import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:medongosupport/preConsultModule/consts/appColors.dart';
import 'package:medongosupport/preConsultModule/controllers/preConsultationController.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/view/faceDetectionModules/camera.dart';
import 'package:medongosupport/preConsultModule/view/faceDetectionModules/painter.dart';
import 'package:medongosupport/preConsultModule/widgets/toastMessage.dart';
import 'package:medongosupport/preConsultModule/widgets/willPopScope.dart';

class FaceDetectorView extends StatefulWidget {
  const FaceDetectorView({super.key});

  @override
  State<FaceDetectorView> createState() => _FaceDetectorViewState();
}

class _FaceDetectorViewState extends State<FaceDetectorView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ///GENERATE PATIENT ID
      questionsController.generatePatientId();

      ///PORTRAIT ORIENTATION ONLY
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp
      ]);
    });
    super.initState();
  }


  @override
  void dispose() {
    try{
      //preConsultationController.canProcess.value = false;
      super.dispose();
    }catch(error){
      debugPrint("$error");
    }
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
            isLoading: preConsultationController.isLoadingFaceDetectorPage.value,
            child: CameraView(
              customPaint: preConsultationController.customPaint,
              // onImage: (inputImage) {
              //   processImage(inputImage);
              // },
              onImage: (inputImage) {
                if (preConsultationController.canProcess.value && !preConsultationController.isBusy.value && preConsultationController.frameCounter.value % preConsultationController.frameInterval == 0) {
                  processImage(inputImage);
                } else {
                  return;
                }
              },
              initialDirection: CameraLensDirection.front,
              faceCount: preConsultationController.faceCount.value,
            )
          ),
        ),
      ),
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    try{
      if (!preConsultationController.canProcess.value) return;

      ///EXITS THE PROGRAM IF THE CAMERA IS BUSY
      if (preConsultationController.isBusy.value) return;
      preConsultationController.isBusy.value = true;

      final faces = await preConsultationController.faceDetector.processImage(inputImage);
      final painter = FaceDetectorPainter(
        faces,
        inputImage.inputImageData!.size,
        inputImage.inputImageData!.imageRotation,
      );


      if (faces.length==1) {
        preConsultationController.faceCount.value = 1;
      }
      if(faces.length>1){
        preConsultationController.faceCount.value = 2;
      }
      if (faces.isEmpty) {
        preConsultationController.faceCount.value = 0;
      }

      preConsultationController.customPaint = CustomPaint(painter: painter);
      preConsultationController.isBusy.value = false;

      if (mounted) {
        setState(() {});
      }

      ///IMP
      ///NAVIGATES TO NEXT PAGE AFTER DETECTING FACE
      //preConsultationController.updateTheCounterAndNavigateToCaptureFunctionality();
    }catch(error){
      debugPrint("$error");
    }
  }
}
