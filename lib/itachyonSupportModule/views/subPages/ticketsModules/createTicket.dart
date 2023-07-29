import 'package:flutter/material.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/ticketController.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/appBar.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/appButtons.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/texts.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/titleTextField.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:get/get.dart';

class CreateTicket extends StatefulWidget {
  const CreateTicket({Key? key}) : super(key: key);

  @override
  State<CreateTicket> createState() => _CreateTicketState();
}

class _CreateTicketState extends State<CreateTicket> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ///GETS CURRENT USER DATA WHICH IS SAVED IN GET STORAGE ( SHARED PREFERENCES )
      itUserController.getDataFromPrefs();

      ///GETS CURRENT USER INFO FROM THE INTERNET
      itUserController.getCurrentUserInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => LoadingOverlay(
          color: AppColor.white,
          opacity: 1.0,
          progressIndicator: LoadingBouncingGrid.square(
            size: 75.0,
            backgroundColor: AppColor.primaryColor,
            borderColor: AppColor.primaryColor,
            duration: const Duration(milliseconds: 500),
          ),
          isLoading: ticketController.isCreateTicketLoading.value,
          child: SafeArea(
            child: Scaffold(
              appBar: titleAppBarWithBackButton(context: context),
              backgroundColor: AppColor.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Form(
                    key: itUserController.loginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),

                        ///CREATE TICKET
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: titleText(
                                context: context,
                                text: "Create Ticket",
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          ),
                        ),

                        SizedBox(height: ScreenSize.height(context) * 0.025),

                        ///Title
                        TitleTextField(
                          title: 'Title',
                          hint: 'Title',
                          customHeight: ScreenSize.height(context) * 0.05,
                          controller: ticketController.titleController,
                          node: ticketController.titleNode,
                          // onChanged: (val) => ticketController.isMobileAvailable(val: val),
                          onSubmit: (val) => ticketController
                              .descriptionNode
                              .requestFocus(),
                        ),
                        SizedBox(height: ScreenSize.height(context) * 0.05),

                        ///DESCRIPTION
                        TitleTextField(
                          title: 'Description',
                          hint: 'Description',
                          maxLines: 3,
                          //customHeight: ScreenSize.height(context) * 0.25,
                          controller:
                          ticketController.descriptionController,
                          node: ticketController.descriptionNode,
                          onSubmit: (val) =>
                              ticketController.descriptionNode.unfocus(),
                        ),
                        SizedBox(height: ScreenSize.height(context) * 0.05),


                       ///SIGN IN BUTTON - GOES TO HOME OR SHOWS A TOAST
                        AppButton(
                          buttonText: 'Add ticket',
                          fontSize: 20,
                          height: ScreenSize.height(context) * 0.075,
                          onTap: () {
                            ///CREATES NEW TICKET
                            ticketController.addTask();
                          },
                        ),

                        SizedBox(height: ScreenSize.height(context) * 0.025)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
