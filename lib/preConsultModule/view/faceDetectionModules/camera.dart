import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:medongosupport/itachyonSupportModule/views/splashPage.dart';
import 'package:medongosupport/preConsultModule/consts/appColors.dart';
import 'package:medongosupport/preConsultModule/consts/screenSize.dart';
import 'package:medongosupport/preConsultModule/controllers/preConsultationController.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/widgets/alertDialogs.dart';
import 'package:path_provider/path_provider.dart';
import 'package:restart_app/restart_app.dart';

import '../../models/videoErrorModel.dart';
import '../questionModules/questionsScreen.dart';

class CameraSingleton {
  static CameraSingleton? instance;
  late CameraController cameraController;

  factory CameraSingleton() {
    instance ??= CameraSingleton.internal();
    return instance!;
  }

  CameraSingleton.internal();

  Future<void> initCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    cameraController = CameraController(
        const CameraDescription(
            name: '0',
            lensDirection: CameraLensDirection.back,
            sensorOrientation: 90),
        ResolutionPreset.max);
    await cameraController.initialize();
  }

  Future<void> releaseCamera() async {
    print("hi from singleton release cam");
    if (cameraController.value.isInitialized) {
      preConsultationController.isReleased.value = true;
      await cameraController.dispose();
      print("hi release");
    }
  }
}

class CameraView extends StatefulWidget {
  CameraView({
    Key? key,
    this.onImage,
    this.initialDirection = CameraLensDirection.back,
    this.faceCount,
    this.customPaint,
  }) : super(key: key);

  ///FIGURE OUT SOMETHING
  final Function(InputImage inputImage)? onImage;
  final CameraLensDirection? initialDirection;
  late final int? faceCount;
  late final CustomPaint? customPaint;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  final GlobalKey<_CameraViewState> cameraKey = GlobalKey<_CameraViewState>();

  ///ZOOM LEVELS - NOT USED - FUTURE USE
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;

  ///FOCUS
  Offset? tapPosition;

  ///EXPOSURE SETTINGS
  final double _minAvailableExposureOffset = -1;
  final double _maxAvailableExposureOffset = 1;
  double currentExposureOffset = 0.0;
  late AnimationController _exposureModeControlRowAnimationController;
  late Animation<double> _exposureModeControlRowAnimation;
  String output = '';


  ///
  late CameraSingleton cameraSingleton;
  @override
  void initState() {
    try {
      ///PORTRAIT ORIENTATION ONLY
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      preConsultationController.cameraIndex = 0;

      ///START LIVE FEED ON INIT
      startLiveFeed();

      ///EXPOSURE ANIMATION
      _exposureModeControlRowAnimationController = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      );
      _exposureModeControlRowAnimation = CurvedAnimation(
        parent: _exposureModeControlRowAnimationController,
        curve: Curves.easeInCubic,
      );

      super.initState();
    } catch (error) {
      debugPrint("$error");
    }
  }

  void autoFocusOnTap(TapDownDetails details) {
    if (cameraSingleton.cameraController.value.isInitialized) {
      final screenSize = MediaQuery.of(context).size;
      final focusPoint = Offset(
        details.localPosition.dx / screenSize.width,
        details.localPosition.dy / screenSize.height,
      );
      cameraSingleton.cameraController.setExposurePoint(focusPoint);
      cameraSingleton.cameraController.setFocusPoint(focusPoint);
      cameraSingleton.cameraController.setFocusMode(FocusMode.auto);
    }
  }

  Future startLiveFeed() async {
    try {
      cameraSingleton = CameraSingleton();
      cameraSingleton.initCamera().then((_) {
        cameraSingleton.cameraController.startImageStream(processCameraImage);

        ///RESET LOADING INDICATORS
        setState(() {
          preConsultationController.isLoadingPermissionsPage.value = false;
          preConsultationController.isLoadingFaceDetectorPage.value = false;
          questionsController.isLoadingQuestions.value = false;
          cameraSingleton.cameraController.setFocusMode(FocusMode.auto);
        });
      });
    } catch (error) {
      debugPrint("Exception while initializing camera $error");
    }

    ///TODO - UNCOMMENT IF IT DOESN'T WORK
    ///RESETS AFTER LOADING CAMERA
    //preConsultationController.resetLoadingStatusPermissionsPage();
  }

  @override
  void dispose() {
    try {
      print("hi dispose");
      preConsultationController.faceDetector.close();
      print("face detector closed");
      cameraSingleton.releaseCamera();
      super.dispose();
    } catch (e) {
      debugPrint("Run time error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder(
      init: PCPreConsultationController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColor.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
              child: Card(
                elevation: 2,
                child: Container(
                  color: AppColor.white,
                  width: ScreenSize.width(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Aligns text and IconButton at start and end of Row
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Text(
                          "Detecting Face",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),

                      SizedBox(
                        width: ScreenSize.width(context) * 0.4,
                      ),

                      ///RESTART BUTTON
                      IconButton(
                        icon: const Icon(
                          Icons.restart_alt,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          yesNoDialog(
                              context: context,
                              text: "Do you want to re-start the application?",
                              onTapAction: () async {
                                await Restart.restartApp();
                              });
                        },
                      ),

                      ///HELP BUTTON
                      IconButton(
                        icon: const Icon(
                          Icons.help,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          ///TODO - UNCOMMENT IN NATIVE ANDROID
                          Get.to(() => const ITSupportMain());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: GestureDetector(
            onTapDown: autoFocusOnTap,
            child: SafeArea(
                child: SizedBox(
              width: ScreenSize.width(context),
              child: startLiveFeedBody(),
            )),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                )),
            height: ScreenSize.height(context) * 0.13,
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Obx(
                    () => Center(
                        child: AutoSizeText(
                      preConsultationController.bottomMessage.value,
                      maxLines: 1,
                      minFontSize: 12,
                      maxFontSize: 24,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: AppColor.blackMild,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    )),
                  ),
                ),

                const SizedBox(
                  height: 0.0,
                ),

                ///BOTTOM BUTTON
                Obx(() => bottomSheetForRecordingAndStatus()),
              ],
            ),
          ),
        );
      },
    ));
  }

  Widget bottomSheetForRecordingAndStatus() {
    if (preConsultationController.hideButton.value == true) {
      return const SizedBox(
        child: Text("Wait for 5 sec"),
      );
    } else {
      return GestureDetector(
          onTap: () async =>
              preConsultationController.isRecording.value == false
                  ? await captureImage()
                  : await stopRecordingAndResetAllValues(),
          child: preConsultationController.isRecording.value == false
              ? titleButtonForBottomSheet(
                  text: "START RECORDING",
                  icon: Icons.camera_alt,
                  iconColor: AppColor.primaryColor)
              : titleButtonForBottomSheet(
                  text: "STOP RECORDING",
                  icon: Icons.stop_circle_outlined,
                  iconColor: AppColor.red));
    }
  }

  Widget titleButtonForBottomSheet(
      {required String? text,
      required IconData icon,
      required Color? iconColor}) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColor.primaryColor),
          padding: const EdgeInsets.all(10.0),
          height: ScreenSize.height(context) * 0.08,
          width: ScreenSize.width(context) * 0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 5.0,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(360.0),
                    color: AppColor.white),
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  icon,
                  color: iconColor ?? AppColor.primaryColor,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                text ?? "",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
              const SizedBox(
                width: 5.0,
              ),
            ],
          )),
    );
  }

  ///STARTS LIVE FEED BODY - DISPLAYS THE CAMERA VIEW
  Widget startLiveFeedBody() {
    if (cameraSingleton.cameraController.value.isInitialized == false) {
      return Container();
    }
    final size = MediaQuery.of(context).size;

    var scale =
        size.aspectRatio * cameraSingleton.cameraController!.value.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Obx(
      () => Container(
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Transform.scale(
              scale: scale,
              child: Center(
                child: preConsultationController.isReleased.value == false
                    ? (CameraPreview(cameraSingleton.cameraController))
                    : null,
              ),
            ),
            if (widget.customPaint != null) widget.customPaint!,
            Positioned(
                bottom:ScreenSize.height(context) * 0,
                //bottom: 0.1,
                //left: 187,
                left: ScreenSize.width(context) * 0.3,
                child: _modeControlRowWidget()),
            Obx(
              () => Positioned(
                  top: ScreenSize.height(context) * 0.001,
                  left: ScreenSize.width(context) * 0.4,
                  child: preConsultationController.lowLight.value == true &&
                          preConsultationController.badQuality.value == true
                      ? Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
                    padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Center(
                      child:  Text("Low Light",
                          style: TextStyle(
                            color: AppColor.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          )),
                    ),
                  )
                      : const Text("")),
            ),
          ],
        ),
      ),
    );
  }

  ///PROCESSES STREAM OF IMAGES FROM THE CAMERA TO DETECT FACE, CAPTURE IMAGE AND VIDEO
  Future processCameraImage(CameraImage image) async {
    switch (preConsultationController.frameCounter.value) {
      case 0:
        try {
          final WriteBuffer allBytes = WriteBuffer();
          for (final Plane plane in image.planes) {
            allBytes.putUint8List(plane.bytes);
          }
          final bytes = allBytes.done().buffer.asUint8List();

          final Size imageSize =
              Size(image.width.toDouble(), image.height.toDouble());

          ///CAMERA DESCRIPTION
          CameraDescription camera =
              preConsultationController.cameraDescriptionMain;

          final imageRotation =
              InputImageRotationValue.fromRawValue(camera.sensorOrientation);
          if (imageRotation == null) return;

          final inputImageFormat =
              InputImageFormatValue.fromRawValue(image.format.raw);
          if (inputImageFormat == null) return;

          final planeData = image.planes.map(
            (Plane plane) {
              return InputImagePlaneMetadata(
                bytesPerRow: plane.bytesPerRow,
                height: plane.height,
                width: plane.width,
              );
            },
          ).toList();

          final inputImageData = InputImageData(
            size: imageSize,
            imageRotation: imageRotation,
            inputImageFormat: inputImageFormat,
            planeData: planeData,
          );

          final inputImage = InputImage.fromBytes(
              bytes: bytes, inputImageData: inputImageData);

          widget.onImage!(inputImage);
        } catch (error) {
          debugPrint("$error");
        }
        preConsultationController.frameCounter.value++;
        break;
      case 1:

        // cropAndSaveImage(imageFile.path,imageSize);
        preConsultationController.frameCounter.value++;
        return;
      case 2:
        preConsultationController.calculateAverageGrayscaleBrightness(image);
        preConsultationController.frameCounter.value++;
        return;
      case 3:
        preConsultationController.calculateLight();
        preConsultationController.frameCounter.value = 0;
        return;
      default:
        return;
    }
  }

  Future processCameraVideo(CameraImage image) async {
    switch (preConsultationController.frameCounter.value) {
      case 0:
        try {
          final WriteBuffer allBytes = WriteBuffer();
          for (final Plane plane in image.planes) {
            allBytes.putUint8List(plane.bytes);
          }
          final bytes = allBytes.done().buffer.asUint8List();

          final Size imageSize =
              Size(image.width.toDouble(), image.height.toDouble());

          ///CAMERA DESCRIPTION
          CameraDescription camera =
              preConsultationController.cameraDescriptionMain;

          final imageRotation =
              InputImageRotationValue.fromRawValue(camera.sensorOrientation);
          if (imageRotation == null) return;

          final inputImageFormat =
              InputImageFormatValue.fromRawValue(image.format.raw);
          if (inputImageFormat == null) return;

          final planeData = image.planes.map(
            (Plane plane) {
              return InputImagePlaneMetadata(
                bytesPerRow: plane.bytesPerRow,
                height: plane.height,
                width: plane.width,
              );
            },
          ).toList();

          final inputImageData = InputImageData(
            size: imageSize,
            imageRotation: imageRotation,
            inputImageFormat: inputImageFormat,
            planeData: planeData,
          );

          final inputImage = InputImage.fromBytes(
              bytes: bytes, inputImageData: inputImageData);

          widget.onImage!(inputImage);

          /// VALIDATE CONDITION FACE THERE OR NOT
          if (preConsultationController.faceCount.value == 0) {
            preConsultationController.updateDetectionError;
            if (preConsultationController.gotOffTime.value == false) {
              preConsultationController.faceOffTime = [
                DateTime.now().millisecondsSinceEpoch
              ];

              await preConsultationController.updateGotOffTimeError();
            }
            if (preConsultationController.gotOffTime.value == true) {
              if (((DateTime.now().millisecondsSinceEpoch -
                              preConsultationController.faceOffTime[0]) /
                          1000) >=
                      5 &&
                  preConsultationController.alertDialogShown.value == false) {
                await preConsultationController.updateAlertDialogShown();

                await preConsultationController.updateTheMessage(status: 4);

                ///UPDATES RECORDING STATUS TO FALSE AND STOPS RECORDING AND ALSO SETS ALERT DIALOG SHOWN TO FALSE
                await cameraSingleton.cameraController.stopVideoRecording();
                await preConsultationController.resetRecordingStatus();

                ///ALERT DIALOG TO TAKE VALIDATION FROM THE NURSE
                Get.dialog(
                  AlertDialog(
                    title: const Text("Face not detected for too long"),
                    content: const Text(
                        "Please restart the procedure,and focus on patient"),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          await restartRecordingAndResetAllValues();
                          Get.back();
                        },
                        child: const Text("Retake"),
                      ),
                    ],
                  ),
                  barrierDismissible:
                      false, // Disable dismissing the dialog by tapping outside the dialog area
                );
              }
            }
          } else {
            preConsultationController.resetDetectionError;
            if (
                //gotOffTime==true
                preConsultationController.gotOffTime.value == true) {
              // setState(() {
              //   gotOffTime=false;
              // });
              await preConsultationController.resetGotOffTimeError();
            }
          }
        } catch (error) {
          debugPrint("$error");
        }
        preConsultationController.frameCounter.value++;
        break;
      case 1:

        ///NO FACE DETECTED ERROR
        if (preConsultationController.detectionError.value == true) {
          preConsultationController.errorTime = [
            DateTime.now().millisecondsSinceEpoch
          ];
          if (preConsultationController.errorTime.isNotEmpty) {
            int errorDuration = ((preConsultationController.errorTime[0] -
                        preConsultationController.startTime[0]) /
                    1000)
                .round();
            if (errorDuration != preConsultationController.prevFaceError) {
              preConsultationController.errorLog
                  .add({"noFaceDetected": errorDuration});
              addVideoErrorToLog(error: "noFaceDetected", time: errorDuration.toString(), value: "0");
            }
            preConsultationController.prevFaceError = errorDuration;
          }
        }
        preConsultationController.frameCounter.value++;
        return;
      case 2:
        preConsultationController
            .calculateAverageGrayscaleBrightnessForVideo(image);
        preConsultationController.frameCounter.value++;
        return;
      case 3:
        if (preConsultationController.badQuality.value == true) {
          preConsultationController.errorTime = [
            DateTime.now().millisecondsSinceEpoch
          ];
          if (preConsultationController.errorTime.isNotEmpty) {
            int errorDuration = ((preConsultationController.errorTime[0] -
                        preConsultationController.startTime[0]) /
                    1000)
                .round();
            if (errorDuration != preConsultationController.prevBadLightError) {
              preConsultationController.errorLog.add({
                "badLight": errorDuration,
                "exposureValue": preConsultationController.grayScale.value
              });
              addVideoErrorToLog(error: "badLight", time: errorDuration.toString(), value: preConsultationController.grayScale.value.toString());
              
            }
            preConsultationController.prevBadLightError = errorDuration;
          }
        }
        preConsultationController.frameCounter.value++;
        return;
      case 4:
        preConsultationController.calculateLightForVideo();
        preConsultationController.frameCounter.value++;
        return;
      case 5:
        if (preConsultationController.lowLight.value == true) {
          preConsultationController.errorTime = [
            DateTime.now().millisecondsSinceEpoch
          ];
          if (preConsultationController.errorTime.isNotEmpty) {
            int errorDuration = ((preConsultationController.errorTime[0] -
                        preConsultationController.startTime[0]) /
                    1000)
                .round();
            if (errorDuration != preConsultationController.prevLowLightError) {
              preConsultationController.errorLog.add({
                "lowLight": errorDuration,
                "luxValue": preConsultationController.lux.value
              });
              addVideoErrorToLog(error: "lowLight", time: errorDuration.toString(), value: preConsultationController.lux.value.toString());
            }
            preConsultationController.prevLowLightError = errorDuration;
          }
        }
        preConsultationController.frameCounter.value = 0;
        return;
      default:
        return;
    }
  }

  ///CAPTURE IMAGE METHOD WHICH IS STARTING ALL THE PROCEDURE FOR REGISTRATION
  captureImage() async {
    ///CHECK IF FACE IS PRESENT THEN ONLY CAPTURE IMAGE AND GO AHEAD WITH THE PROCESS
    try {
      // ///IF VIDEO IS ALREADY GOING ON TO HANDLE ERROR
      // if (preConsultationController.isRecording.value == true) {
      //   return;
      // }

      // if (!cameraSingleton.cameraController.value.isInitialized) {
      //   return;
      // }

      if (preConsultationController.faceCount.value == 1) {
        ///FACE DETECTED. FOCUS ON THE PATIENT'S FACE.
        preConsultationController.updateTheMessage(status: 2);

        ///HIDE BUTTON FOR 5 SECONDS
        preConsultationController.hideButton.value = true;
        Future.delayed(const Duration(seconds: 5), () {
          preConsultationController.hideButton.value = false;
        });

        ///CAPTURES IMAGE AND SAVES IT
        await preConsultationController.captureImageAndStartRecording();

        ///TAKING START TIME TO CALCULATE DURATION OF ERRORS BY SUBTRACTING IT FROM ERROR TIME
        preConsultationController.startTime = [
          DateTime.now().millisecondsSinceEpoch
        ];

        ///START VIDEO RECORDING AND SEND THE FRAMES TO PROCESS FOR FACE DETECTION
        await cameraSingleton.cameraController
            .startVideoRecording(onAvailable: processCameraVideo);

        ///UPDATES RECORDING STATUS TO TRUE
        preConsultationController.updateRecordingStatus();
      }
      if (preConsultationController.faceCount.value == 2) {
        ///MULTIPLE FACES DETECTED. FOCUS ON THE PATIENT'S FACE.
        preConsultationController.updateTheMessage(status: 8);
      }
      if (preConsultationController.faceCount.value == 0) {
        ///NO FACE DETECTED.
        preConsultationController.updateTheMessage(status: 3);
      }
    } catch (e) {
      debugPrint('Error capturing image: $e');
    }
  }

  ///STOP RECORDING AND RESET ALL THE VALUES
  stopRecordingAndResetAllValues() async {
    try {
      ///STOPS RECORDING, UPDATES THE FILE PATH AND NAVIGATES TO QUESTIONS PAGE
      await preConsultationController.stopRecordingAndNavigatesToNextPage();
      print("hihihi ${preConsultationController.errorLog}");
      print(videoErrorLog.map((document) => document.toJson()).toList());


      ///NAVIGATES IT QUESTIONS PAGE
      Future.delayed(const Duration(seconds: 2), () async {
        ///UPDATES RECORDING STATUS TO FALSE AND STOPS RECORDING
        Get.to(() => const QuestionsScreen());
      });
    } catch (error) {
      debugPrint("FAILED TO DISPOSE CAMERA");
    }
  }

  ///RESTART RECORDING AND RESET ALL THE VALUES
  restartRecordingAndResetAllValues() async {
    try {
      ///RECORDING IS IN PROGRESS. FOCUS ON THE PATIENT'S FACE.
      preConsultationController.updateTheMessage(status: 0);

      await preConsultationController.resetFrameCounter();
      await preConsultationController.resetGotOffTimeError();

      ///START THE IMAGE STREAM FOR FACE DETECTION FOR CAPTURING IMAGE
      if (cameraSingleton.cameraController.value.isInitialized) {
        cameraSingleton.cameraController.startImageStream(processCameraImage);
      }

      ///RESET LOADING INDICATORS
      await preConsultationController.resetAlertDialogShown();

      ///ERROR TIMING RESET
      setState(() {
        //gotOffTime=false;
        preConsultationController.faceOffTime = [];
        currentExposureOffset = 0.0;
      });

      ///GET BACK FROM ALERT BOX
      Get.back();
    } catch (e) {
      if (kDebugMode) {
        print("THIS IS ERROR IN RESTARTING RECORDING $e");
      }
    }
  }

  ///EXPOSURE
  Widget _modeControlRowWidget() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // The exposure and focus mode are currently not supported on the web.
            ...!kIsWeb
                ? <Widget>[
                    IconButton(
                        iconSize: 50.0,
                        icon: const Icon(Icons.exposure),
                        color: Colors.green,
                        onPressed: onExposureModeButtonPressed),
                  ]
                : <Widget>[],
          ],
        ),
        _exposureModeControlRowWidget(),
        SizedBox(
          height: 10,
        ),
        Text(
          output,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }

  Widget _exposureModeControlRowWidget() {
    return SizeTransition(
      sizeFactor: _exposureModeControlRowAnimation,
      child: ClipRect(
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              const Center(
                child: Text(
                  'Exposure Mode',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: () => {
                      cameraSingleton.cameraController.setExposureOffset(0.0),
                      currentExposureOffset = 0.0
                    },
                    child: const Text(
                      'DEFAULT',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
              const Center(
                child: Text(
                  'Move to set Exposure',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    _minAvailableExposureOffset.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  Slider(
                    inactiveColor: Colors.white54,
                    activeColor: Colors.green,
                    value: currentExposureOffset,
                    min: _minAvailableExposureOffset,
                    max: _maxAvailableExposureOffset,
                    label: currentExposureOffset.toString(),
                    onChanged: _minAvailableExposureOffset ==
                            _maxAvailableExposureOffset
                        ? null
                        : setExposureOffset,
                  ),
                  Text(
                    _maxAvailableExposureOffset.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> setExposureOffset(double offset) async {
    setState(() {
      currentExposureOffset = offset;
    });
    try {
      offset = await cameraSingleton.cameraController.setExposureOffset(offset);
    } on CameraException catch (e) {
      //  _showCameraException(e);
      rethrow;
    }
  }

  void onExposureModeButtonPressed() {
    if (_exposureModeControlRowAnimationController.value == 1) {
      _exposureModeControlRowAnimationController.reverse();
    } else {
      _exposureModeControlRowAnimationController.forward();
    }
  }
  
  
  List<VideoError> videoErrorLog =[];
  addVideoErrorToLog({required String error,required String time,required String value}){
    VideoError errorDetailVideo = VideoError(
      error:error,
      errorSec: time,
      errorValue: value,
    );
    videoErrorLog.add(errorDetailVideo);
  }

  ///vikas
  Future<void> cropAndSaveImage(
      String videoPath,
      Size imageSize,
      ) async {
    //preConsultationController
    final left = preConsultationController.left;
    final top = preConsultationController.top;

    final String outputPath = '${(await getTemporaryDirectory()).path}/cropped_frame.png';
   final String cmd = '-i $videoPath -vf "crop=${imageSize.width}:${imageSize.height}:$left:$top" $outputPath';

    try {
      final FlutterFFmpeg fFmpeg = FlutterFFmpeg();
      await fFmpeg.execute(cmd);
      print('Video frame cropped successfully: $outputPath');
    } catch (error) {
      print('Error occurred while cropping video frame: $error');
    }
  }


}
