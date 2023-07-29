// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medongosupport/preConsultModule/consts/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/chartController.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/homeController.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/ticketController.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:medongosupport/itachyonSupportModule/views/splashPage.dart';
import 'package:medongosupport/preConsultModule/controllers/attachmentsController.dart';
import 'package:medongosupport/preConsultModule/controllers/audioFileController.dart';
import 'package:medongosupport/preConsultModule/controllers/locationController.dart';
import 'package:medongosupport/preConsultModule/controllers/permissionController.dart';
import 'package:medongosupport/preConsultModule/controllers/preConsultationController.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/controllers/userController.dart';
import 'package:medongosupport/preConsultModule/controllers/vitalsController.dart';
import 'package:medongosupport/preConsultModule/firebase_options.dart';

import 'package:medongosupport/preConsultModule/view/preconsultationModuleMain.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart';
//import 'amplifyconfiguration.dart';


// ///CONFIGURING AMAZON AMPLIFY - TO INTERACT WITH AWS - START
// Future<void> configureAmplify() async {
//   try {
//     await Amplify.addPlugin(AmplifyStorageS3());
//     await Amplify.addPlugin(AmplifyAuthCognito());
//     await Amplify.configure(amplifyconfig);
//     safePrint('Successfully configured');
//   } on Exception catch (e) {
//     safePrint('Error configuring Amplify: $e');
//   }
// }
// ///CONFIGURING AMAZON AMPLIFY - TO INTERACT WITH AWS - END



///MAIN METHOD WHICH RUNS THE APP
void main() async {
  ///INITIALIZE
  WidgetsFlutterBinding.ensureInitialized();

  ///INITIALIZE FLUTTER
  await Firebase.initializeApp(

      ///TODO - COMMENT IT IN THE RELEASE
      options: DefaultFirebaseOptions.android
      );

  ///INITIALIZE GET STORAGE (ALTERNATIVE T0 SHARED PREFERENCES)
  GetStorage.init();

  ///CONFIGURE AWS - TODO - TRY AGAIN
  //await configureAmplify();

  ///MEDONGO SUPPORT CONTROLLERS
  Get.put(ITUserController());
  Get.put(ITHomeController());
  Get.put(ITTicketController());
  Get.put(ITChartController());

  ///PRE-CONSULT MODULE CONTROLLERS
  Get.put(PCPermissionController());
  Get.lazyPut(() => PCAudioFileController());
  Get.lazyPut(() => PCLocationController());
  Get.put(PCPreConsultationController());
  Get.put(PCQuestionsController());
  Get.put(PCUserController());
  Get.put(PCVitalsController());
  Get.put(PCAttachmentsController());


  ///RUN APP
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ///ROOT OF THE PROJECT
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Modules',
      color: AppColor.primaryColor,

      routes: {
        ///NAVIGATES TO MEDONGO SUPPORT

        "/medongosupport": (context) => const ITSupportMain(),

        ///NAVIGATES TO PRE-CONSULT MODULE MAIN

        "/preconsult": (context) => const PreConsultationModuleMain(),
      },

      theme: ThemeData(
        primaryColor: AppColor.primaryColor,
      ),

      ///TODO - COMMENT IT IN THE RELEASE
      home: const PreConsultationModuleMain(),
    );
  }
}
