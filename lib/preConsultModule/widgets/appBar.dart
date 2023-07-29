
import 'package:flutter/material.dart';
import 'package:medongosupport/preConsultModule/consts/appColors.dart';
import 'package:medongosupport/preConsultModule/consts/screenSize.dart';

appBar(
    {required BuildContext context, Widget? tabBars, List<Widget>? actions}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(40.0),
    child: AppBar(
      backgroundColor: AppColor.teal,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// HOME BUTTON IN THE A
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
          SizedBox(width: ScreenSize.width(context) * 0.01),
          Text("Pre Counsulting"),
          SizedBox(width: ScreenSize.width(context) * 0.2),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.help),
          onPressed: () {
          },
        ),
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){}
        ),
      ],
    ),
  );
}