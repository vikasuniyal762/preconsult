

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appImages.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/texts.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/willPopBottomSheet.dart';
import 'package:shimmer/shimmer.dart';



class ITSupportMain extends StatefulWidget {
  const ITSupportMain({Key? key}) : super(key: key);

  @override
  State<ITSupportMain> createState() => _ITSupportMainState();
}

class _ITSupportMainState extends State<ITSupportMain> {



  //INITIALIZE PAGE WITH USER DATA
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      itUserController.getDataFromPrefs();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    ///CHECK CONNECTIVITY
    itUserController.checkAuth(context);

    return WillPopScope(
        onWillPop: () async {
          Get.back();
          return true;
        },

        child:  SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.white,
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      CircleAvatar(
                        backgroundColor: AppColor.white,
                        radius: ScreenSize.width(context) * 0.25,
                        child: Center(
                          child:  Image.asset(
                            AppImages.appLogo,
                            height: ScreenSize.height(context) * 0.25,
                          ),
                        ),
                      ),


                      titleText(
                          context: context,
                          //text: "JOIN A TRUSTED COMMUNITY",
                          text: "JOIN A TRUSTED COMMUNITY OF\nHEALTHCARE WORKERS",
                          fontWeight: FontWeight.w300,
                          fontSize: 18),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),



    );
  }
}
