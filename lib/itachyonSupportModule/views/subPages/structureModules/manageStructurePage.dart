
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/homeController.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:get/get.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/appBar.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/posterCarouselWidget.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/toastMessage.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/willPopBottomSheet.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:loading_overlay/loading_overlay.dart';


class ManageStructurePage extends StatefulWidget {
  const ManageStructurePage({Key? key}) : super(key: key);

  @override
  State<ManageStructurePage> createState() => _ManageStructurePageState();
}

class _ManageStructurePageState extends State<ManageStructurePage> {
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => LoadingOverlay(
        color: AppColor.white,
        opacity: 1.0,
        progressIndicator: LoadingBouncingGrid.square(
          size: 75.0,
          backgroundColor: AppColor.primaryColor,
          borderColor: AppColor.primaryColor,
          duration: const Duration(milliseconds: 1000),
        ),
        isLoading: homeController.isHomeLoading.value,
        child: SafeArea(
          child: Scaffold(
            appBar: titleAppBarWithBackButton(context: context),
            backgroundColor: AppColor.white,
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),

                      ///POSTERS
                      const PosterCarouselWidgetTop(),

                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
