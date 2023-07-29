import 'package:app_settings/app_settings.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appImages.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/chartController.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/homeController.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:medongosupport/itachyonSupportModule/views/subPages/accountPage.dart';
//import 'package:medongosupport/itachyonSupportModule/views/subPages/chatModules/chatPage.dart';
import 'package:medongosupport/itachyonSupportModule/views/subPages/ticketsModules/analyzeTickets.dart';
import 'package:medongosupport/itachyonSupportModule/views/subPages/ticketsModules/createTicket.dart';
import 'package:medongosupport/itachyonSupportModule/views/subPages/ticketsModules/manageTickets.dart';
import 'package:medongosupport/itachyonSupportModule/views/subPages/ticketsModules/ticketReports.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/appDialogs.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/posterCarouselWidget.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/toastMessage.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/willPopBottomSheet.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:loading_overlay/loading_overlay.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  //INITIALIZE PAGE WITH USER DATA
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      itUserController.getDataFromPrefs();

      itUserController.resetLoadingStatus();

      itUserController.getCurrentUserInfo().whenComplete(() {});
    });

    super.initState();
  }



  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: WillPopScope(
          onWillPop: () async {
            Get.back();
            Get.back();
            return true;
          },
          child: Obx(
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
                  key: const Key("homePage"),
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(50.0),
                    child: Container(
                      width: ScreenSize.width(context),
                      decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          )),
                      child: AppBar(
                        leading: Builder(
                            builder: (context) => IconButton(
                                icon: const Icon(
                                  Icons.account_circle_outlined,
                                  color: AppColor.primaryColor,
                                  size: 25,
                                ),
                                onPressed: () async {
                                  var connectivityResult =
                                      await Connectivity().checkConnectivity();
                                  if (connectivityResult ==
                                      ConnectivityResult.none) {
                                    yesNoDialog(
                                        context: context,
                                        text: 'Please check your internet',
                                        onTapAction: () async {
                                          ///OPEN SETTINGS
                                          await AppSettings.openWIFISettings();
                                        },
                                        onTapCancel: () {
                                          Get.back();
                                        },
                                        actionButton: "Open Settings",
                                        cancelButton: "Try again");
                                  } else {
                                    itUserController.getCurrentUserInfo();
                                    Get.to(() => const AccountPage(), transition: Transition.leftToRight,

                                        duration: const Duration(milliseconds: 100));
                                  }
                                })),
                        actions: [
                          IconButton(
                            onPressed: () async {
                              showToast(
                                  message: "COMING SOON",
                                  gravity: ToastGravity.BOTTOM,
                                  color: AppColor.grey);
                            },
                            icon: const Icon(
                              Icons.search,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          IconButton(
                              onPressed: () async {
                                showToast(
                                    message: "COMING SOON",
                                    gravity: ToastGravity.BOTTOM,
                                    color: AppColor.grey);
                              },
                              icon: const Icon(
                                Icons.chat_outlined,
                                color: AppColor.primaryColor,
                              )),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(25),
                            right: Radius.circular(25),
                          ),
                        ),
                        backgroundColor: AppColor.white,
                        centerTitle: true,
                        title: SizedBox(
                          width: ScreenSize.width(context) * 0.25,
                          child: Image.asset(AppImages.appLogo),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
                  backgroundColor: AppColor.white,
                  body: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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

                              ///TICKET SYSTEM
                              Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Container(
                                  margin: const EdgeInsets.all(0.0),
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          const Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.0, bottom: 10.0),
                                                child: AutoSizeText(
                                                  "iTachyon Ticket System",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              tabIcon(
                                                icon: Icons.add_task_rounded,
                                                title: "Create\nTicket",
                                                onTap: () async {
                                                  Get.to(
                                                    () => const CreateTicket(),
                                                    transition: Transition
                                                        .rightToLeftWithFade,
                                                  );
                                                },
                                              ),
                                              tabIcon(
                                                icon: Icons.add_moderator,
                                                title: "Manage\nTickets",
                                                onTap: () async {
                                                  Get.to(
                                                    () => const ManageTickets(),
                                                    transition: Transition
                                                        .rightToLeftWithFade,
                                                  );
                                                },
                                              ),
                                              tabIcon(
                                                  icon: Icons.analytics,
                                                  title: "Analyze\nTickets",
                                                  onTap: () async {
                                                    homeController
                                                        .updateLoadingStatusHomeMainPage();

                                                    chartController
                                                        .getAllTicketsLastThirtyDays()
                                                        .then((value) {
                                                      if (value) {
                                                        chartController
                                                            .getAllTicketLastSevenDays()
                                                            .then((value) {
                                                          ///FILTERS BASED ON MONTHS

                                                          if (value) {
                                                            chartController
                                                                .filterDataForMonthlyCharts()
                                                                .then((value) {
                                                              if (value) {
                                                                ///FILTERS BASED ON WEEKS
                                                                chartController
                                                                    .filterDataForWeeklyCharts()
                                                                    .then(
                                                                        (value) {
                                                                  if (value) {
                                                                    Get.to(
                                                                        () =>
                                                                            const AnalyzeTickets(),
                                                                        transition:
                                                                            Transition.rightToLeftWithFade);
                                                                  }
                                                                });
                                                              }
                                                            });
                                                          }
                                                        });
                                                      }
                                                    });
                                                  }),
                                              tabIcon(
                                                icon: Icons.task,
                                                title: "Ticket\nReports",
                                                onTap: () async {
                                                  Get.to(
                                                    () => const TicketReports(),
                                                    transition: Transition
                                                        .rightToLeftWithFade,
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: AppColor.primaryColor
                                                .withOpacity(0.1),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(20.0),
                                            )),
                                        padding: const EdgeInsets.only(
                                            left: 20.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 0.0, bottom: 0.0),
                                              child: AutoSizeText(
                                                "iTachyon is always ready to help",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              ///COMMUNICATION
                              Card(
                                color: AppColor.white,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Container(
                                  margin: const EdgeInsets.all(0.0),
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          const Row(
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.0, bottom: 10.0),
                                                  child: AutoSizeText(
                                                    "iTachyon Support Communication",
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              tabIcon(
                                                icon: Icons.chat,
                                                color: AppColor.greyShimmer,
                                                title: "Chats",
                                                onTap: () async {
                                                  showToast(
                                                      message: "COMING SOON",
                                                      gravity:
                                                      ToastGravity.BOTTOM,
                                                      color: AppColor.grey);
                                                },
                                              ),
                                              tabIcon(
                                                  icon: Icons.videocam_sharp,
                                                  title: "Meet",
                                                  color: AppColor.greyShimmer,
                                                  onTap: () {
                                                    showToast(
                                                        message: "COMING SOON",
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        color: AppColor.grey);
                                                  }),
                                              tabIcon(
                                                  icon: Icons.email,
                                                  color: AppColor.greyShimmer,
                                                  title: "Email",
                                                  onTap: () {
                                                    showToast(
                                                        message: "COMING SOON",
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        color: AppColor.grey);
                                                  }),
                                              tabIcon(
                                                  icon: Icons.phone,
                                                  color: AppColor.greyShimmer,
                                                  title: "Call",
                                                  onTap: () {
                                                    showToast(
                                                        message: "COMING SOON",
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        color: AppColor.grey);
                                                  }),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: AppColor.primaryColor
                                                .withOpacity(0.1),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(20.0),
                                            )),
                                        padding: const EdgeInsets.only(
                                            left: 20.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 0.0, bottom: 0.0),
                                              child: AutoSizeText(
                                                "iTachyon is always ready to connect",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 30,
                              ),

                              ///
                              const PosterCarouselWidgetBottom(),

                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // drawerEnableOpenDragGesture: false,
                  //
                  // ///SIDE DRAWER FOR  USER PROFILE
                  // drawer: Container(
                  //   width: userController.isWebLoginForDrawer.value
                  //       ? ScreenSize.width(context)
                  //       : ScreenSize.width(context) * 0.8,
                  //   decoration: const BoxDecoration(
                  //       color: AppColor.primaryColor,
                  //       borderRadius: BorderRadius.only(
                  //         topRight: Radius.circular(50.0),
                  //       )),
                  //   child: const Drawer(
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.only(
                  //         topRight: Radius.circular(0.0),
                  //       )),
                  //       backgroundColor: AppColor.white,
                  //       child: SideDrawerForHomeScreen()),
                  // ),
                ),
              ),
            ),
          )),
    );
  }

  Widget tabIcon(
      {required IconData icon,
      Color? color,
      required String? title,
      required void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          width: ScreenSize.width(context) * 0.2,
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 0,
                ),
                Icon(
                  icon,
                  size: ScreenSize.width(context) * 0.1,
                  color: color ?? AppColor.primaryColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                AutoSizeText(
                  title ?? "Coming Soon",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
