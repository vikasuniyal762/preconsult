import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';
import 'package:readmore/readmore.dart';

Widget titleText({required BuildContext context ,required String text, double? fontSize,Color? color,FontWeight? fontWeight,int? maxLines,TextAlign? textAlign}){
  return AutoSizeText(
    text,
    maxLines: maxLines ?? 2,
    textAlign: textAlign ?? TextAlign.center,

    style: TextStyle(
        letterSpacing: 1.5,
        wordSpacing: 1.0,
        fontSize: fontSize ?? 20.0,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColor.black
    ),
  );
}

Widget regularText({required BuildContext context ,required String text, double? fontSize,Color? color,FontWeight? fontWeight,int? maxLines}){
  return AutoSizeText(
    text,
    maxLines: maxLines ?? 2,
    style: TextStyle(
        fontSize: fontSize ?? 20.0,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColor.black
    ),
  );
}


Widget regularTextWithNoLimit({required BuildContext context ,required String text, double? fontSize,Color? color,FontWeight? fontWeight}){
  return AutoSizeText(
    text,
    style: TextStyle(
        fontSize: fontSize ?? 20.0,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColor.black
    ),
  );
}



Widget readMoreText({required BuildContext context ,required String text, double? fontSize,Color? color,FontWeight? fontWeight}) {
  return ReadMoreText(
    text,
    trimLines: 5,
    colorClickableText: color ?? AppColor.tertiaryColor,
    trimMode: TrimMode.Line,
    trimCollapsedText: 'Show more',
    trimExpandedText: 'Show less',
    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  );
}

Widget chatUsersProfile({ required String? header, String? text}) {
  if (text != null) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$header $text",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,

          ),
        ),
        SizedBox(height: 8),
      ],
    );
  } else {
    return Container(height:0.0001);
  }
}
