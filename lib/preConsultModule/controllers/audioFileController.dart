import 'dart:io';

import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as pathLibrary;

import 'package:path_provider/path_provider.dart';
import 'package:medongosupport/preConsultModule/controllers/attachmentsController.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/controllers/userController.dart';
import 'package:record/record.dart';


final PCAudioFileController audioFileController = Get.find<PCAudioFileController>();


class PCAudioFileController extends GetxController {
  ///RECORDING STATUS
  final isRecording = false.obs;

  /// INSTANCE OF RECORD PACKAGE
  final audioRecorder = Record();

  ///needed for storing the time stamps
  List nextPressed = [];
  double previous = 0;
  late double next;
  String recordFilePath = "";

  /// START RECODING WITH THIS FUNCTIONS
  startRecord() async {
    try{

      ///INITIAL TIMESTAMP
      nextPressed.add(DateTime.now().millisecondsSinceEpoch);

      ///COMPLETE AUDIO RECORDING FILE PATH
      recordFilePath = await getFilePath();
      update();

      await audioRecorder.start(
        path: recordFilePath,
        encoder: AudioEncoder.wav,
        bitRate: 16000,
        samplingRate: 16000,
      );

      ///UPDATES RECORDING STATUS TO TRUE
      updateRecordingStatus();

      ///UPDATE AUDIO FILE PATH
      //userController.updateAudioFiles(completeAudioPath: recordFilePath);


    }catch(exception){
      debugPrint("$exception");}
  }



  ///GLOBAL INDEX
  int index = 0;


  ///AUDIO TRIMMING AND SAVING METHOD
  Future<void> trimAndSaveAudio({required String key}) async{

    ///ADDS CURRENT TIMESTAMP TO THE LIST - HELPS IN TRIMMING THE AUDIO
    nextPressed.add(DateTime.now().millisecondsSinceEpoch);

    /// initialization for variables
    List timeStamps =  nextPressed;
    /// splitting the audio file in chunks duration
    double dur = timeStamps[index+1].toDouble() - timeStamps[index].toDouble();

    next = dur/1000;
    next += previous;
    index++;

    ///Give the file path in pathToFile variable
    String pathToFile = recordFilePath;

    if(key!=null && key!=""){
      await cutAudio(path: pathToFile,start:previous,end: next,key: key);
    }

    previous = next;

    update();
  }





   ///CUT AUDIO AND SAVE IT THE DOCUMENT LIST IN ATTACHMENT CONTROLLER
   cutAudio({required String path,required double start,required double end,required String key}) async {
    if (start < 0 || end < 0) {
      throw ArgumentError('The starting and ending points cannot be negative');
    }
    if (start > end) {
      throw ArgumentError('The starting point cannot be greater than the ending point');
    }

    //final Directory dir = await getTemporaryDirectory();

    // Get the app's external files directory
    Directory? appDir = await getExternalStorageDirectory();
    if (appDir == null) {
      throw PlatformException(code: 'DIR_ERROR', message: 'Failed to get the app directory.');
    }

    Directory adkDir = Directory(pathLibrary.join(appDir.path, 'ADK'));
    Directory audioDirectory = Directory(pathLibrary.join(adkDir.path, '_Documents'));

    if (!adkDir.existsSync()) {
      adkDir.createSync(recursive: true);
    }

    if (!audioDirectory.existsSync()) {
      audioDirectory.createSync(recursive: true);
    }




    ///FILE PATH UNDER RECORDINGS FOLDER
    final outPath = '${audioDirectory.path}/${questionsController.appointmentId}_$key.wav';


    ///CREATING A NEW FILE FOR EACH KEY
    await File(outPath).create(recursive: true);

    var cmd = "-y -i \"$path\" -vn -ss $start -to $end -ar 16k -ac 2 -b:a 96k -acodec copy $outPath";

    ///EXECUTING
    await FFmpegKit.execute(cmd);


    ///ADD THE ATTACHMENT TO THE DOCUMENT LIST
    attachmentsController.addDataToMainAttachments(key: key, path: outPath ?? "");
  }


  ///UPDATES RECORDING STATUS TO TRUE
  updateRecordingStatus(){
    isRecording.value = true;
    update();
  }


  ///RESETS RECORDING STATUS
  resetRecordingStatus(){
    isRecording.value = false;
    update();
  }



  /// FUNCTION FOR STOP RECODING
  void stopRecord() async {
    ///ADDING END TIMESTAMP TO THE LIST
    nextPressed.add(DateTime.now().millisecondsSinceEpoch);
    ///STOPS RECORDING
    await audioRecorder.stop();
    ///RESETS RECORDING STATUS
    resetRecordingStatus();
    update();
  }


  /// LOCAL DIRECTORY FILE PATH
  Future<String> getFilePath() async {
    Directory? appDir = await getExternalStorageDirectory();

    Directory adkDir = Directory(pathLibrary.join(appDir!.path, 'ADK'));
    Directory audioDirectory = Directory(pathLibrary.join(adkDir.path, '_Documents'));

    var finalAudioPath = "${audioDirectory?.path}/${questionsController.appointmentId}_COMPLETE_AUDIO.wav";

    userController.personalQuestionsModel.completeAudioRecording = finalAudioPath;
    attachmentsController.addDataToMainAttachments(key: "COMPLETE_AUDIO", path: finalAudioPath ?? "");
    update();

    return finalAudioPath;
  }

}





























