
import 'package:flutter/material.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';
import 'package:get/get.dart';






yesNoDialog({required BuildContext context,required String text,String? actionButton,String? cancelButton,required void Function()? onTapAction,void Function()? onTapCancel}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        content: Builder(
          builder: (context) {
            return SizedBox(
              height: ScreenSize.height(context) * 0.18,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: ScreenSize.height(context) * 0.05),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: onTapCancel ?? () {
                            Get.back();
                          },
                          child: Container(
                            height: ScreenSize.height(context) * 0.055,
                            width: ScreenSize.width(context) * 0.28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: AppColor.primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                cancelButton ?? 'No',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: InkWell(
                          onTap: onTapAction,
                          child: Container(
                            height: ScreenSize.height(context) * 0.055,
                            // width: width(context) * 0.32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: AppColor.primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                actionButton ?? 'Yes',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      );
    },
  );
}