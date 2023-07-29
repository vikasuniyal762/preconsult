// import 'package:aws3_bucket/aws3_bucket.dart';
// import 'package:aws3_bucket/aws_region.dart';
// import 'package:aws3_bucket/iam_crediental.dart';
// import 'package:aws3_bucket/image_data.dart';
// import 'package:aws_common/vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:medongosupport/preConsultModule/consts/appConst.dart';
import 'package:medongosupport/preConsultModule/controllers/locationController.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/controllers/userController.dart';
import 'package:medongosupport/preConsultModule/globals.dart';
import 'package:medongosupport/preConsultModule/models/consultationDtoModel.dart';
import 'package:path/path.dart' as pathExtenstion;

// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/foundation.dart';

import 'package:medongosupport/preConsultModule/widgets/toastMessage.dart';


final PCAttachmentsController attachmentsController =
    Get.put(PCAttachmentsController());

class PCAttachmentsController extends GetxController {
  List<DocumentsList> documentsListMain = [];

  ///LIST OF ALL THE ATTACHMENTS IN THE REGISTRATION PROCESS
   addDataToMainAttachments({required String key, required String path}) {
    try {
      ///SEPARATE THE FILE EXTENSION FROM THE PATH
      String fileExtension = pathExtenstion.extension(path);
      String cleanExtension = fileExtension.substring(1);
      String fileType = getFileType(extension: cleanExtension.toUpperCase());

      DocumentsList documentsList = DocumentsList(
          apptId: questionsController.appointmentId,
          description: cleanExtension.toUpperCase(),
          ftpPath: key == "PROFILE_IMAGE"
              ? "ProfileImages/${questionsController.patientId}/${questionsController.patientId}.$cleanExtension"
              : "ProfileImages/${questionsController.patientId}/${questionsController.appointmentId}/${questionsController.appointmentId}_$key.$cleanExtension",
          latitude: locationController.latitude,
          longitude: locationController.longitude,
          path: path,
          pid: questionsController.patientId,
          subcategory: AppConst.stage,
          type: fileType,
          ///ADDITIONAL FIELD
          key: key);


      key != "PROFILE_IMAGE" ?
      documentsListMain.add(documentsList) : null;


      List<Map<String, dynamic>> documentsJsonListMap = documentsListMain.map((document) => document.toJson()).toList();

      debugPrint("THIS IS DOCUMENTS MAP ${documentsJsonListMap}");

      update();

      if (key == "PROFILE_IMAGE") {
        userController.personalQuestionsModel.imageAwsPath = documentsList.ftpPath;
        update();
      }


    } catch (e) {
      debugPrint("THIS IS ERROR ONE $e");
    }
  }

  ///HANDLES ATTACHMENTS
  handleAttachmentOption(
      {required int value, required BuildContext context}) async {
    switch (value) {
      case 0:
        await attachmentsController.getImage();
        break;
      case 1:
        await attachmentsController.getFiles();
        break;
      case 2:
        getScannedDocument(context: context);
        break;

      default:
        break;
    }
  }

  ///GET IMAGE - OPENS A CAMERA
  getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      ///ADDING DATA TO SPECIFIC QUESTIONS
      questionsController.attachments.add(image.path);

      ///TOAST MESSAGE
      showToast("Attached Image", ToastGravity.CENTER);
    }

    questionsController.attachmentsCounter.value++;
    update();
  }

  ///PICKS FILES WITH ALLOWED EXTENSIONS FROM THE DEVICE FOLDER
  getFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["pdf", "png", "jpg", "jpeg", "docx"],
        type: FileType.custom);

    if (result != null) {
      String? file = result.files[0].path;

      ///ADDING DATA TO SPECIFIC QUESTIONS
      questionsController.attachments.add(file);

      ///TOAST MESSAGE
      showToast("Attached File", ToastGravity.CENTER);
    }

    questionsController.attachmentsCounter.value++;
    update();
  }

  ///TODO - SCAN MULTIPLE DOCUMENTS AND ADD IT TO PDF FILE
  ///SCAN DOCUMENTS
  getScannedDocument({required BuildContext context}) async {
    // var image = await DocumentScannerFlutter.launch(context,
    //     source: ScannerFileSource.CAMERA,
    //     labelsConfig: {
    //       ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL: "Next Step",
    //       ScannerLabelsConfig.ANDROID_OK_LABEL: "OK"
    //     });
    // if (image != null) {
    //   ///ADDING DATA TO SPECIFIC QUESTIONS
    //   questionsController.attachments.add(image.path);
    // }
    questionsController.attachmentsCounter.value++;
    update();
  }

  ///RETURNS FILE TYPE BY TAKING THE INPUT
  getFileType({required String extension}) {
    switch (extension) {
      case "PNG":
      case "JPG":
      case "JPEG":
      case "GIF":
        return "Image";
      case "WAV":
      case "MP3":
        return "Audio";
      case "MP4":
      case "MOV":
        return "Video";
      case "PDF":
      case "DOC":
      case "DOCX":
      case "XLS":
      case "XLSX":
        return "File";
      default:
        return "NOT_SPECIFIED";
    }
  }

  ///AWS CONFIGURATION
  // Future<bool> uploadFilesToS3() async {
  //   try {
  //     for (DocumentsList documentsList in documentsListMain) {
  //       ///AMPLIFY SETTINGS START - TODO - TRY AGAIN
  //       // final fileObj = AWSFile.fromPath(documentsList.path);
  //       //
  //       // final result = Amplify.Storage.uploadFile(
  //       //   localFile: fileObj,
  //       //   key: documentsList.ftpPath,
  //       // );
  //       //
  //       //
  //       // print("THIS IS AWS RESULT OBJ ${result.result}");
  //       ///AMPLIFY SETTINGS END - TODO - TRY AGAIN
  //
  //
  //       IAMCrediental awsCredentials = IAMCrediental();
  //       awsCredentials.secretKey = AdkAwsInfo.adkAccessKey;
  //       awsCredentials.secretId = AdkAwsInfo.adkSecretKey;
  //
  //       ///PROFILE_IMAGE
  //       ImageData imageData = documentsList.key == "PROFILE_IMAGE" ? ImageData(
  //           documentsList.ftpPath.split('/')[2], ///FILE NAME
  //           documentsList.path, ///FILE LOCAL PATH
  //           imageUploadFolder: "${documentsList.ftpPath.split('/')[0]}/${documentsList.ftpPath.split('/')[1]}") ///FOLDER PATH
  //
  //       ///ALL OTHER FILES
  //            : ImageData(
  //           documentsList.ftpPath.split('/')[3], ///FILE NAME
  //           documentsList.path, ///FILE LOCAL PATH
  //           imageUploadFolder: "${documentsList.ftpPath.split('/')[0]}/${documentsList.ftpPath.split('/')[1]}/${documentsList.ftpPath.split('/')[2]}"); ///FOLDER PATH
  //
  //
  //       final result = await Aws3Bucket.upload(AdkAwsInfo.adkBucketName,
  //           AdkAwsInfo.adkRegion, AdkAwsInfo.adkRegion, imageData, awsCredentials);
  //
  //       debugPrint("THIS IS AWS RESULT OBJ ${result}");
  //     }
  //     return true;
  //   } catch (e) {
  //     safePrint('Error uploading image to S3: $e');
  //     return false;
  //   }
  // }
}
