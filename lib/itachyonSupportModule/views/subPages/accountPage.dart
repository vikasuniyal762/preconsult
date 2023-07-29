import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/appBar.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/appDialogs.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/texts.dart';
import 'package:shimmer/shimmer.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
            appBar: titleAppBarWithBackButton(
              context: context,
              leading: Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: AppColor.primaryColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///USER PHOTO
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: CachedNetworkImage(
                        imageUrl: '${itUserController.currentUser?.photo}',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          highlightColor: AppColor.greyShimmer,
                          baseColor: AppColor.primaryColor,
                          child: Icon(Icons.account_circle,
                              color: AppColor.primaryColor,
                              size: ScreenSize.height(context) * 0.1),
                        ),
                        errorWidget: (context, url, error) => Icon(
                            Icons.account_circle,
                            color: AppColor.primaryColor,
                            size: ScreenSize.height(context) * 0.1),
                      ),
                    ),

                    const SizedBox(height: 20),

                    ///USER NAME
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Role : ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '${itUserController.currentUser?.firstName ?? ""} ${itUserController.currentUser?.lastName ?? ""}',
                          //"Doctor",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    ///USER WORK POSITION
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "User type : ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          itUserController.currentUser?.userRole ?? "",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),

                    const Divider(
                      height: 20.0,
                      thickness: 2,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    ///GENERAL
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        children: [
                          regularText(
                              context: context,
                              text: 'General',
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        children: [
                          const Icon(Icons.email),
                          const SizedBox(width: 5),
                          const Text(
                            "Email :",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            itUserController.currentUser?.email ?? "",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),


                    Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        children: [
                          regularText(
                              context: context,
                              text: 'More',
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        children: [
                          const Icon(Icons.local_hospital),
                          const SizedBox(width: 5),
                          const Text(
                            "Clinic Name :",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            itUserController.currentUser?.clinicName ?? "",

                            //"Khotwadi Clinic",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),



                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(

                          onTap: () async
                          {
                            yesNoDialog(context: context, text: "Do you want to logout?", onTapAction: () async {
                              await itUserController.logoutUser();
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,

                            padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0,right: 20.0),
                            margin: const EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                                color: AppColor.primaryColor.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Row(
                              children: [
                                regularText(
                                    context: context,
                                    text: 'LOGOUT',
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.white,
                                    fontSize: 20.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            )));
  }
}
