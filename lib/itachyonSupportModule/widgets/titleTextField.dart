import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';


// ignore: must_be_immutable
class TitleTextField extends StatelessWidget {
  TitleTextField(
      {Key? key,
        required this.title,
        this.keyboardType,
        this.customHeight,
        this.controller,
        this.padding,
        this.icon,
        this.iconData,
        this.enabled = true,
        this.hint = '',
        this.onChanged,
        this.validator,
        this.iconTap,
        this.node,
        this.onSubmit,
        this.obscure = false,
        this.maxLength,
        this.cursorColor,
        this.textColor,
        this.hintTextColor,
        this.len,
        this.textSize,
        this.hintTextSize,
        this.labelText,
        this.maxLines})
      : super(key: key);

  final String title;
  TextEditingController? controller;
  TextInputType? keyboardType;
  double? customHeight, padding;
  Icon? icon;
  IconData? iconData;
  bool enabled;
  String hint;
  Function(String?)? onChanged;
  Function()? iconTap;
  String? Function(String?)? validator;
  bool obscure;
  FocusNode? node;
  Function(String)? onSubmit;
  int? maxLength;
  Color? cursorColor;
  Color? textColor;
  Color? hintTextColor;
  double? textSize;
  double? hintTextSize;
  int? len;
  int? maxLines;
  String? labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: padding == 0 ? 0 : 5),
          CustomTextField(
            customHeight: customHeight,
            keyboardType: keyboardType,
            controller: controller,
            hintText: hint,
            icon: icon,
            iconData: iconData,
            enabled: enabled,
            onChanged: onChanged,
            validator: validator,
            iconTap: iconTap,
            maxLines: maxLines,
            obscure: obscure,
            node: node,
            labelText : labelText,
            onSubmit: onSubmit,
            maxLength: maxLength,
            cursorColor: cursorColor,
            textColor: textColor,
            hintTextColor: hintTextColor,
            len: len,
            textSize: textSize,
            hintTextSize: hintTextSize,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
        this.keyboardType,
        this.customHeight,
        this.padding,
        this.hintText = '',
        this.enabled = true,
        this.controller,
        this.icon,
        this.iconData,
        this.iconTap,
        this.obscure = false,
        this.onChanged,
        this.validator,
        this.node,
        this.onSubmit,
        this.maxLength,
        this.cursorColor,
        this.hintTextColor,
        this.textColor,
        this.len,
        this.textSize,
        this.hintTextSize,
        this.labelText,
        this.maxLines})
      : super(key: key);

  TextInputType? keyboardType;
  String? hintText;
  String? labelText;
  bool? enabled;
  TextEditingController? controller;
  double? customHeight, padding;
  Icon? icon;
  IconData? iconData;
  Function()? iconTap;
  Function(String?)? onChanged;
  String? Function(String?)? validator;
  bool obscure;
  FocusNode? node;
  Function(String)? onSubmit;
  int? maxLength;
  Color? cursorColor;
  Color? textColor;
  double? textSize;
  Color? hintTextColor;
  double? hintTextSize;
  int? len;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      //height: customHeight ?? 60,
      decoration: const BoxDecoration(
         border: Border(bottom: BorderSide(color: AppColor.primaryColor)),
      ),

      child: TextFormField(
        //maxLengthEnforcement: ,
        maxLength: maxLength,
        inputFormatters: [
          LengthLimitingTextInputFormatter(len),
        ],
        cursorColor: AppColor.primaryColor,
        enabled: enabled,
        focusNode: node,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        maxLines: maxLines ?? 1,
        onFieldSubmitted: onSubmit,
        style: TextStyle(fontSize: textSize ?? 15, color: textColor),
        obscureText: obscure,
        keyboardType: keyboardType ?? TextInputType.name,
        decoration: InputDecoration(
          //icon: icon,
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: hintTextSize ?? 15,
            color: AppColor.grey,
          ),
          prefixIcon: icon,
          fillColor: AppColor.primaryColor,
          //prefixIconConstraints: const BoxConstraints(maxHeight: double.infinity,maxWidth: double.infinity),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: hintTextSize ?? 15,
            color: hintTextColor,
          ),
          suffixIcon: iconData != null
              ? IconButton(
            onPressed: iconTap,
            icon: Icon(
              iconData,
              size: 25,
              color: AppColor.primaryColor,
            ),
          )
              : const SizedBox(
            height: 0,
            width: 0,
          ),
        ),
      ),
    );
  }
}
