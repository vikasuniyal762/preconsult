import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medongosupport/preConsultModule/models/questionsModel.dart';
import 'package:medongosupport/preConsultModule/widgets/toastMessage.dart';

final PCVitalsController vitalsController = Get.find<PCVitalsController>();

class PCVitalsController extends GetxController {
  VitalsQuestionsModel vitalsQuestionsModel = VitalsQuestionsModel(
  bp : '0/0',
  systolic : '',
  diastolic: '',
  pulse : '0',
  temperature: '0',
  spo2: '',
  respiratoryRate: '0',
  bglRbs : '0',
  bglFbs : '0',
  bglPpbs : '0',
  hemoglobin : '',
  );


  ///UPDATES USER PERSONAL DETAILS
  updateVitalsDetails({required String field, required String response}) {

    if(response!="" && response!=null){
      switch (field) {
        case "BP Systolic/Diastolic (mmhg)":
          vitalsQuestionsModel.bp = response;

          if(response.split('/').length == 2){
            vitalsQuestionsModel.systolic = response.split('/')[0];
            vitalsQuestionsModel.diastolic = response.split('/')[1];
          }
          break;
        case "Pulse (bpm)":
          vitalsQuestionsModel.pulse = response;
          break;
        case "Temperature (F)":
          vitalsQuestionsModel.temperature = response;
          break;
        case "SPO2 %":
          vitalsQuestionsModel.spo2 = response;
          break;
        case "Respiratory Rate":
          vitalsQuestionsModel.respiratoryRate = response;
          break;
        case "BGL(RBS) mg/dl":
          vitalsQuestionsModel.bglRbs = response;
          break;
        case "BGL(FBS) mg/dl":
          vitalsQuestionsModel.bglFbs = response;
          break;
        case "BGL(PPBS) mg/dl":
          vitalsQuestionsModel.bglPpbs = response;
          break;
        case "Hemoglobin g/dl":
          vitalsQuestionsModel.hemoglobin = response;
          FocusManager.instance.primaryFocus?.unfocus();
          break;
        default:
          break;
      //showToast("INVALID TYPE", ToastGravity.CENTER);
      }
    }





    update();
  }


}
