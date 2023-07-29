import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';

///SHOWS A TOAST MESSAGE
showToast({required String message,required ToastGravity gravity, Color? color}) {
  return Fluttertoast.showToast(
    msg: message,
    backgroundColor: color ?? AppColor.primaryColor,
    gravity: gravity,
    textColor: AppColor.white,
    fontSize: 15,
    toastLength: Toast.LENGTH_SHORT,
  );
}
