import 'package:flutter/material.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appImages.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/chatController.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/appButtons.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/titleTextField.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        Get.back();
        return true;
      },
      child: SafeArea(
        child: Obx(() => LoadingOverlay(
          color: AppColor.white,
          opacity: 1.0,
          progressIndicator: LoadingBouncingGrid.square(
            size: 75.0,
            backgroundColor: AppColor.primaryColor,
            borderColor: AppColor.primaryColor,
            duration: const Duration(milliseconds: 1000),
          ),
          isLoading: itUserController.isLoading.value,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColor.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top:70,bottom: 70),
                  child: Center(
                    child: Form(
                      key: itUserController.loginKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          ///TOP ROW
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child:  CircleAvatar(
                                    backgroundColor: AppColor.white,
                                    radius: ScreenSize.width(context) * 0.3,
                                    child: Center(
                                      child: Image.asset(
                                        AppImages.appLogo,
                                        height: ScreenSize.height(context) * 0.15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: ScreenSize.height(context) * 0.025),

                          ///EMAIL
                          TitleTextField(
                            title: 'Email',
                            hint: 'Email',
                            customHeight: ScreenSize.height(context) * 0.05,
                            icon: const Icon(Icons.email,color: AppColor.primaryColor,),
                            controller: itUserController.loginEmailController,
                            keyboardType: TextInputType.emailAddress,
                            node: itUserController.loginEmailNode,
                            onSubmit: (val) => itUserController.loginPasswordNode.requestFocus(),
                          ),


                          ///PASSWORD
                          Obx(
                                () => TitleTextField(
                              title: 'Password',
                              hint: 'Password',
                                  customHeight: ScreenSize.height(context) * 0.05,
                              controller: itUserController.loginPasswordController,
                              icon: const Icon(Icons.key,color: AppColor.primaryColor,),

                              node: itUserController.loginPasswordNode,

                              onSubmit: (val) => itUserController.loginPasswordNode.unfocus(),

                              obscure: itUserController.loginPasswordObscure.value,

                              ///UPDATED AFTER TESTING - NEXT RELEASE 5 - NOT FIXED IN CURRENT RELEASE 4
                               iconData: itUserController.loginPasswordObscure.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,

                              iconTap: () => itUserController.loginPasswordObscure.value = !itUserController.loginPasswordObscure.value,
                            ),
                          ),


                          SizedBox(height: ScreenSize.height(context) * 0.01),

                         ///SIGN IN BUTTON - GOES TO HOME OR SHOWS A TOAST
                          AppButton(
                            buttonText: 'Sign In',
                            fontSize: 20,
                            height: ScreenSize.height(context) * 0.075,
                            onTap: () async {
                              ///
                              await itUserController.loginUser();
                            },
                          ),

                          SizedBox(height: ScreenSize.height(context) * 0.025)
                        ],
                      ),
                    ),
                  ),
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
