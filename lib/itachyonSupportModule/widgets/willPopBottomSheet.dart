import 'package:flutter/material.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';

Future<bool> onWillPop(BuildContext context) async {
  bool? exitResult = await showExitBottomSheet(context);
  return exitResult ?? false;
}

showExitBottomSheet(BuildContext context) async {
  return await showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: buildBottomSheet(context),
      );
    },
  );
}

Widget buildBottomSheet(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(
        height: 24,
      ),
      Text(
          'Do you really want to exit the app?',
          style: TextStyle(color: AppColor.blackMild,fontSize: 18)
      ),
      const SizedBox(
        height: 24,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('CANCEL',style: TextStyle(color: AppColor.primaryColor)),
          ),
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('YES, EXIT',style: TextStyle(color: AppColor.primaryColor),),
          ),
        ],
      ),
    ],
  );
}



//NO USE
Future<bool> showExitPopup(context) async {
  return await showDialog( //show confirm dialogue
    //the return value will be from "Yes" or "No" options
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Exit App'),
      content: Text('Do you want to exit an App?'),
      actions:[
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          //return false when click on "NO"
          child:Text('No'),
        ),

        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          //return true when click on "Yes"
          child:Text('Yes'),
        ),

      ],
    ),
  )??false; //if showDialouge had returned null, then return false
}