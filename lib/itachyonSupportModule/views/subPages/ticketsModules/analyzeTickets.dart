
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/chartController.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/homeController.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:get/get.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/appBar.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/charts.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/posterCarouselWidget.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/texts.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/toastMessage.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/willPopBottomSheet.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:loading_overlay/loading_overlay.dart';


class AnalyzeTickets extends StatefulWidget {
  const AnalyzeTickets({Key? key}) : super(key: key);

  @override
  State<AnalyzeTickets> createState() => _AnalyzeTicketsState();
}

class _AnalyzeTicketsState extends State<AnalyzeTickets> {


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ///GET TICKETS DATA FOR GRAPHS
      homeController.resetLoadingStatusHomeMainPage();

      ///GETS CURRENT USER DATA WHICH IS SAVED IN GET STORAGE ( SHARED PREFERENCES )
      itUserController.getDataFromPrefs();

      ///GETS CURRENT USER INFO FROM THE INTERNET
      itUserController.getCurrentUserInfo();

      ///GETS TICKETS DATA FOR LAST 7 DAYS
      // chartController.getAllTicketLastSevenDays();

      ///GETS TICKETS DATA FOR LAST 30 DAYS
      //chartController.getAllTicketsLastThirtyDays();
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ///CLEARS ALL THE TICKETS DATA
        chartController.clearAllTheTicketsData();
        Get.back();
        return true;
      },
      child: SafeArea(
        child: LoadingOverlay(
          color: AppColor.white,
          opacity: 1.0,
          progressIndicator: LoadingBouncingGrid.square(
            size: 75.0,
            backgroundColor: AppColor.primaryColor,
            borderColor: AppColor.primaryColor,
            duration: const Duration(milliseconds: 1000),
          ),
          isLoading: chartController.isAnalyticsPageLoading.value,
          child: SafeArea(
            child: Scaffold(
              appBar: titleAppBarWithBackButton(context: context,onPress: () async{
                chartController.clearAllTheTicketsData();
                Get.back();
              }),
              backgroundColor: AppColor.white,
              body: GetBuilder(
                init: ITChartController(),
                builder: (GetxController controller) { return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Column(
                      children: [

                        const SizedBox(
                          height: 15
                        ),

                        ///TICKET ANALYZES
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: titleText(
                                context: context,
                                text: "Ticket Analyzes",
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          ),
                        ),


                        ///PIE CHART FOR LAST ONE MONTH TICKETS DATA
                        chartController.allTicketsCharts?.length != 0 ?
                        const PieChartForLastThirtyDaysData() : NoTicketsErrorPage(),


                        ///BAR CHART FOR LAST ONE WEEK TICKETS DATA
                        chartController.allTicketsChartsSevenDays?.length != 0 ?
                          BarChartLatestWeek() : Container(height: 1,),

                        // const PieChartForLastThirtyDaysData(),

                      ],
                    ),
                  ),
                ],
              ); },
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class NoTicketsErrorPage extends StatelessWidget {
  const NoTicketsErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: ScreenSize.height(context) * 0.25),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.task_alt,
                size: 75.0,
                color: AppColor.primaryColor,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text(
                  'NO TICKETS',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColor.blackMild),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}