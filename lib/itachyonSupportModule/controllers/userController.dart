import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appConst.dart';
import 'package:medongosupport/itachyonSupportModule/models/userModel.dart';
import 'package:medongosupport/itachyonSupportModule/preferences/userDataPrefs.dart';
import 'package:medongosupport/itachyonSupportModule/services/userService.dart';
import 'package:flutter/material.dart';
import 'package:medongosupport/itachyonSupportModule/views/authPages/loginPage.dart';
import 'package:medongosupport/itachyonSupportModule/views/homeMain.dart';
import 'package:medongosupport/itachyonSupportModule/views/splashPage.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/toastMessage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

final ITUserController itUserController = Get.find<ITUserController>();

class ITUserController extends GetxController {
  RxBool isLoading = false.obs,
      isLoadingRegisterPage = false.obs,
      emailAvailable = true.obs,
      clinicAvailable = true.obs,
      isWebLoginForDrawer = true.obs;

  RxString clinicAvailableName = ''.obs;

  RxBool phoneAvailable = true.obs,
      loginPasswordObscure = true.obs,
      passwordObscure = false.obs,
      confirmPasswordObscure = false.obs,
      registerConfirmObscure = false.obs;

  ///LOGIN
  FocusNode loginEmailNode = FocusNode(), loginPasswordNode = FocusNode();

  TextEditingController loginEmailController = TextEditingController(),
      loginPasswordController = TextEditingController();

///LOGIN KEY
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>(),
      forgotPassword = GlobalKey<FormState>(),
      signUpKey1 = GlobalKey<FormState>(),
      signUpKey2 = GlobalKey<FormState>(),
      signUpKey3 = GlobalKey<FormState>(),
      signUpKey4 = GlobalKey<FormState>();

  ///INSTANCE OF AUTH SERVICE
  UserService userService = UserService();

  ///OBJECT OF USER DATA - PREFERENCES METHODS
  UserData userData = UserData();


  ///CURRENT USER MODEL
  User? currentUser;


  ///OBJECT OF USER PREFS MODEL
  late UserPrefsModel userPrefsModel;




  ///SETS USER INFO WHILE SIGN IN TO THE USER PREFS MODEL
  setUserInfoWhileSignIn(
      {
        required String id,
        required String email,
        required String accessToken,
      }) {
    userPrefsModel = UserPrefsModel(id, email,accessToken);
    update();
  }


  ///GETS CURRENT USER INFO AND UPDATES IT TO THE CURRENT USER FIELD
  Future getCurrentUserInfo() async {
    currentUser = await userService.getCurrentUserFromInternet();
    update();
  }

  ///GET INITIALS OF FIRST NAME AND SECOND NAME
  getShortName({required String name}) {
    List alteredName = name.split(" ");
    return alteredName.length > 1
        ? "${alteredName[0][0]}${alteredName[1][0]}".toUpperCase()
        : "${alteredName[0][0]}${alteredName[0][1]}".toUpperCase();
  }

  ///FETCHES ALL THE DATA FROM THE PREFERENCES
  getDataFromPrefs() async {
    userPrefsModel = await userData.getUserInfo();
    debugPrint("THIS IS AUTH TOKEN FOR DEBUG TESTING : Bearer ${userPrefsModel.accessToken}");
    update();
  }

  ///DEFAULT USER PROFILE
  User profile = User(
    id :  "",
    photo:  "",
    firstName:  "",
    lastName:  "",
    email:  "",
    password:  "",
    login:  "",
    userRole:  "",
    clinicName:  "",
    clinicCode:  "",
    clinicBlock:  "",
    status:  "",
    position:  "",
    sex:  "",
    department:  "",
    city:  "",
    country:  "",
    region:  "",
    token:  "",

  );


  ///LOGOUT USER
  logoutUser() async {
    GetStorage().erase();
    Get.offAll(() => const LoginPage(),transition: Transition.fade,duration:const Duration(milliseconds: 100));
  }


  ///UPDATE LOADING STATE
  updateLoadingStatus() async {
    isLoading.value = true;
    update();
  }

  ///RESET LOADING STATE
  resetLoadingStatus() async {
    isLoading.value = false;
    update();
  }



  ///CHECKS CONNECTIVITY STATUS
  checkConnectivityStatus() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult;
  }

  ///RETURNS ALERT DIALOG AFTER CHECKING STATUS
  showNetworkErrorDialogForLogin({required BuildContext context}){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        title: const Text('No Internet'),
        content: const Text('Please check your network connection.'),
        actions: [
          TextButton(
            onPressed: () async {
              await checkAuth(context);
              Get.back();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }


  ///CHECK AUTHENTICATION STATUS
  checkAuth(BuildContext context) async {
    var connectivityResult = await checkConnectivityStatus();
    if (connectivityResult == ConnectivityResult.none) {
      ///SHOWS ALERT DIALOG
      showNetworkErrorDialogForLogin(context: context);
    } else if (connectivityResult == ConnectivityResult.wifi||connectivityResult == ConnectivityResult.mobile) {
      ///GETS DATA FROM PREFERENCES
      await itUserController.getDataFromPrefs();

      ///IF THE DATA  IS EMPTY NAVIGATES TO LOGIN PAGE
      if (userPrefsModel.email == "") {
        ///NAVIGATES TO LOGIN PAGE
        Get.to(() => const LoginPage(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 500));
      }
      ///IF THE USER IS ALREADY LOGGED IN NAVIGATES HOME PAGE
      else {
        ///FETCHES USER PROFILE FROM THE INTERNET
        await itUserController.getCurrentUserInfo();
        ///NAVIGATES TO HOME PAGE
        Get.to(() => const HomeMain(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 500));
      }
    }
  }





  ///LOGIN RETAILER TO THE APP
  Future loginUser() async {
    if (loginKey.currentState!.validate()) {
      if (loginEmailController.text.isEmpty) {
        showToast(message: "Please enter email", gravity: ToastGravity.BOTTOM);
        return;
      } else if (!loginEmailController.text.isEmail) {
        showToast(message: "Please enter valid email", gravity: ToastGravity.BOTTOM);
        return;
      } else if (loginPasswordController.text.isEmpty) {
        showToast(message: "Please enter password", gravity: ToastGravity.BOTTOM);
        return;
      } else if (loginPasswordController.text.length < 6) {
        showToast(
          message: 'Password should be minimum 6 characters',
          gravity: ToastGravity.BOTTOM,
        );
        return;
      }

      try {
        ///RETURNS USER MODEL AFTER LOGIN
        User user = await userService.getLoginUserFromInternet(
          email: loginEmailController.text,
          password: loginPasswordController.text,
        );

        if (user.id != null) {
          // Set user info
          var id = user.id ?? "";
          var email = user.email ?? "";
          var accessToken = user.token ?? "";

          ///UPDATES DATA IN SHARED PREFS
          userData.setUserInfo(
            id: id,
            email: email,
            accessToken: accessToken,
          );

          showToast(
            message: 'Login successful',
            gravity: ToastGravity.BOTTOM,
          );

          loginEmailController.clear();
          loginPasswordController.clear();

          // Navigate to home screen
          Get.offAll(() => const HomeMain());
        }
      } catch (error) {
        showToast(
          message: 'User not found',
          gravity: ToastGravity.BOTTOM,
        );
      }
    }
  }
}
