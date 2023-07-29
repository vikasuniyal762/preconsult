
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medongosupport/preConsultModule/consts/appColors.dart';
import 'package:medongosupport/preConsultModule/consts/screenSize.dart';


///OPEN SETTINGS DIALOG
openSettingsDialog(
    {String? title,
    String? content,
    required void Function() onTapOk,
    required void Function() onTapOpenSettings}) {
  return Get.dialog(AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    backgroundColor: AppColor.white,
    insetPadding: const EdgeInsets.symmetric(horizontal: 20),
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
    content: Builder(
      builder: (context) {
        return SizedBox(
          height: ScreenSize.height(context) * 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title ?? "Permission is required",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ScreenSize.height(context) * 0.025),
              Text(
                content ?? "Please grant the permission in the settings",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ScreenSize.height(context) * 0.05),
              Row(
                children: [
                  //OK BUTTON
                  Expanded(
                    child: InkWell(
                      onTap: onTapOk,
                      child: Container(
                        height: ScreenSize.height(context) * 0.055,
                        width: ScreenSize.width(context) * 0.28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: AppColor.tertiaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Ok',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  //OPEN SETTINGS BUTTON
                  Expanded(
                    child: InkWell(
                      onTap: onTapOpenSettings,
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
                        child: const Center(
                          child: Text(
                            'Open Settings',
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
  ));
}


///YES OR NO DIALOG - GENERAL
yesNoDialog(
    {required BuildContext context,
    required String text,
    String? actionButton,
    String? cancelButton,
    required void Function()? onTapAction,
    void Function()? onTapCancel}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        content: Builder(
          builder: (context) {
            return SizedBox(
              height: ScreenSize.height(context) * 0.18,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
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
                          onTap: onTapCancel ??
                              () {
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



///RETAKE VIDEO DIALOG
retakeVideoDialog(
    {required BuildContext context,
    required String text,
    String? actionButton,
    String? cancelButton,
    required void Function()? onTapAction,
    void Function()? onTapCancel}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        content: Builder(
          builder: (context) {
            return SizedBox(
              height: ScreenSize.height(context) * 0.18,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: ScreenSize.height(context) * 0.05),
                  Row(
                    children: [
                      // Expanded(
                      //   child: InkWell(
                      //     onTap: onTapCancel ?? () {
                      //       Get.back();
                      //     },
                      //     child: Container(
                      //       height: ScreenSize.height(context) * 0.055,
                      //       width: ScreenSize.width(context) * 0.28,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(22),
                      //         color: AppColor.primaryColor,
                      //         boxShadow: [
                      //           BoxShadow(
                      //             color: Colors.black.withOpacity(0.3),
                      //             blurRadius: 3,
                      //           ),
                      //         ],
                      //       ),
                      //       child: Center(
                      //         child: Text(
                      //           cancelButton ?? 'No',
                      //           style: TextStyle(
                      //             fontSize: 16,
                      //             color: Colors.white,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(width: 15),
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
