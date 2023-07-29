import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appImages.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';

///TITLE APP BAR
titleAppBar(
    {required BuildContext context,
    String? title,
    Widget? tabBars,
    double? height,
    List<Widget>? actions}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height ?? 50.0),
    child: Container(
      width: ScreenSize.width(context),
      decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius:  BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          )),
      child: AppBar(
        actions: actions ?? [],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(25),
            right: Radius.circular(25),
          ),
        ),
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(130.0),
          child: Image.asset(AppImages.appLogo),
        ),
        elevation: 5,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: tabBars ?? Container(height: 1),
        ),
      ),
    ),
  );
}



///TITLE APP BAR BACK BUTTON
titleAppBarWithBackButton({
  String? title,
  Function()? onPress,
  required BuildContext context,
  Widget? tabBars,
  Widget? leading,
  List<Widget>? actions,
  double? height,
}) {
  return PreferredSize(
    preferredSize:  Size.fromHeight(height ?? 50.0),
    child: Container(
      width: ScreenSize.width(context),
      decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          )),
      child: AppBar(
        actions: actions ?? [],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(30),
            right: Radius.circular(30),
          ),
        ),
        backgroundColor: AppColor.white,
        leading: leading ?? IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.primaryColor,
            size: 25,
          ),
          onPressed: onPress ??
              () {
                Get.back();
              },
        ),
        centerTitle: true,
        title: Image.asset(AppImages.appLogo, height: ScreenSize.width(context) * 0.25,width: ScreenSize.width(context) * 0.25),
        elevation: 4,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            child: tabBars ??
                Container(
                  height: 1,
                ),
        ),
      ),
    ),
  );
}




