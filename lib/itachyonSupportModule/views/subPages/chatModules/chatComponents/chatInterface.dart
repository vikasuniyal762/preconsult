import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/chatController.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:medongosupport/itachyonSupportModule/models/chatModels/allChats.dart';

class ChatInterface extends StatefulWidget {
  ChatInterface({Key? key, required this.chatsMain}) : super(key: key);
  AllChat chatsMain;

  @override
  State<ChatInterface> createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ///THIS METHOD WILL UPDATE THE DATA TO THE LOCAL INSTANCE OF PREFERENCE CLASS OBJECT BY FETCHING IT USING GET STORAGE
      itUserController.getDataFromPrefs();

      ///FETCHES ALL THE CHATS FROM THE INTERNET

      chatsController.chatServices.getChatMessages();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        ///APP BAR
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            width: ScreenSize.width(context),
            decoration: const BoxDecoration(
                color: AppColor.tertiaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                )),
            child: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20),
                  right: Radius.circular(20),
                ),
              ),
              backgroundColor: AppColor.primaryColor,
              leading: Container(
                width: ScreenSize.width(context) * 0.20,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.white,
                        size: 20,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              title: AutoSizeText(
                "${widget.chatsMain.title}",
                style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              elevation: 4,
            ),
          ),
        ),

        bottomSheet: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            color: AppColor.white,
            padding: const EdgeInsets.all(0),
            height: 50,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(
                          color: AppColor.primaryColor,
                        ),
                        border: InputBorder.none),
                    style: const TextStyle(
                      color: AppColor.primaryColor,
                    ),
                    controller: chatsController.messageController,
                    cursorColor: AppColor.white,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () {
                    chatsController.sendMessage();
                    chatsController.messageController.clear();
                  },
                  backgroundColor: AppColor.white,
                  elevation: 0,
                  child: const Icon(
                    Icons.send,
                    color: AppColor.primaryColor,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),

        // ///BODY - CHAT DETAILS
        // body: Center(
        //   child: StreamBuilder(
        //       stream: chatsController.chatServices.getChatMessages(),
        //       builder: (context, snapshot) {
        //         if (snapshot.hasData) {
        //           Chat chats = snapshot.data;
        //           return ListView.builder(
        //               reverse: true,
        //               itemCount: chats.messages?.length,
        //               itemBuilder: (context, index) {
        //                 ChatMessage chatMessage = chats.messages![index];
        //                 if (chatMessage.id == 0) {
        //                   // Show chat message without container when authorId == 0
        //                   return Align(
        //                     alignment: Alignment.center,
        //                     child: Padding(
        //                       padding: const EdgeInsets.all(8.0),
        //                       child: readMoreText(
        //                         context: context,
        //                         text: chatMessage.content,
        //                         fontWeight: FontWeight.w100,
        //                         fontSize: 15.0,
        //                         color: AppColor.primaryColor,
        //                       ),
        //                     ),
        //                   );
        //                 }
        //
        //                 DateTime messageTime =
        //                     DateTime.parse(chatMessage.createdAt!);
        //                 DateTime now = DateTime.now();
        //                 DateTime yesterday =
        //                     DateTime(now.year, now.month, now.day - 1);
        //                 String formattedDateTime;
        //
        //                 if (messageTime.year == now.year &&
        //                     messageTime.month == now.month &&
        //                     messageTime.day == now.day) {
        //                   // Today's message
        //                   formattedDateTime =
        //                       DateFormat.jm().format(messageTime);
        //                 } else if (messageTime.year == yesterday.year &&
        //                     messageTime.month == yesterday.month &&
        //                     messageTime.day == yesterday.day) {
        //                   // Yesterday's message
        //                   formattedDateTime = 'Yesterday ' +
        //                       DateFormat.jm().format(messageTime);
        //                 } else {
        //                   // Other days
        //                   formattedDateTime = DateFormat('MMMM dd, yyyy')
        //                       .add_jm()
        //                       .format(messageTime);
        //                 }
        //
        //                 return Card(
        //                   child: Padding(
        //                     padding:
        //                         const EdgeInsets.only(top: 20.0, bottom: 20.0),
        //                     child: Flex(
        //                       direction: Axis.horizontal,
        //                       children: [
        //                         Flexible(
        //                           child: Row(
        //                             mainAxisAlignment: MainAxisAlignment.start,
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                             children: [
        //                               Flexible(
        //                                 flex: 2,
        //                                 child: Column(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.start,
        //                                   crossAxisAlignment:
        //                                       CrossAxisAlignment.start,
        //                                   children: [
        //                                     Container(
        //                                       margin:
        //                                           const EdgeInsets.all(10.0),
        //                                       width: ScreenSize.width(context) *
        //                                           0.125,
        //                                       height:
        //                                           ScreenSize.width(context) *
        //                                               0.125,
        //                                       child: Container(
        //                                         color: AppColor.transparent,
        //                                         child: SizedBox(
        //                                           height: 20,
        //                                           width: 50,
        //                                           child: ListView.builder(
        //                                             scrollDirection:
        //                                                 Axis.vertical,
        //                                             itemCount:
        //                                                 chats.users?.length,
        //                                             itemBuilder:
        //                                                 (context, indexSub) {
        //                                               // ChatUsers chatUsers =
        //                                               //     chats
        //                                               //         .users![indexSub];
        //
        //                                               // if (chatMessage
        //                                               //         .authorId ==
        //                                               //     chatUsers.id) {
        //                                               //   return GestureDetector(
        //                                               //     onTap: () {
        //                                               //      // Get.to(() =>
        //                                               //           // ChatUserProfileView(
        //                                               //           //   chatUsers:
        //                                               //           //       chatUsers,
        //                                               //           // ));
        //                                               //     },
        //                                               //     child: Align(
        //                                               //       alignment: Alignment
        //                                               //           .topLeft,
        //                                               //       child: ClipRRect(
        //                                               //         borderRadius:
        //                                               //             BorderRadius
        //                                               //                 .circular(
        //                                               //                     60.0),
        //                                               //         child:
        //                                               //             Image.network(
        //                                               //           chatUsers.avatar ==
        //                                               //                   ""
        //                                               //               ? chatsController
        //                                               //                   .dummyImageUrl
        //                                               //               : chatUsers
        //                                               //                   .avatar,
        //                                               //           fit:
        //                                               //               BoxFit.fill,
        //                                               //         ),
        //                                               //       ),
        //                                               //     ),
        //                                               //   );
        //                                               // } else {
        //                                               //   return Container(
        //                                               //       height: 0.0001);
        //                                               // }
        //                                             },
        //                                           ),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ),
        //                               Flexible(
        //                                 flex: 8,
        //                                 child: Container(
        //                                   decoration: BoxDecoration(
        //                                       color: AppColor.white
        //                                           .withOpacity(0.2),
        //                                       borderRadius:
        //                                           BorderRadius.circular(10.0)),
        //                                   margin: EdgeInsets.all(10.0),
        //                                   padding: const EdgeInsets.all(5.0),
        //                                   child: Column(
        //                                     crossAxisAlignment:
        //                                         CrossAxisAlignment.start,
        //                                     children: [
        //                                       Container(
        //                                         // Container for user messages
        //                                         child: readMoreText(
        //                                             context: context,
        //                                             text: chatMessage.content,
        //                                             fontWeight: FontWeight.w100,
        //                                             fontSize: 15.0,
        //                                             color:
        //                                                 AppColor.primaryColor),
        //                                       ),
        //                                       Align(
        //                                         alignment:
        //                                             Alignment.bottomRight,
        //                                         child: regularText(
        //                                           context: context,
        //                                           text: formattedDateTime,
        //                                           fontWeight: FontWeight.w200,
        //                                           fontSize: 12.0,
        //                                         ),
        //                                       ),
        //                                     ],
        //                                   ),
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                         SizedBox(
        //                           height: 100,
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 );
        //               });
        //         } else {
        //           return const ShimmerForChats();
        //         }
        //       }),
        // ),
      ),
    );
  }
}
