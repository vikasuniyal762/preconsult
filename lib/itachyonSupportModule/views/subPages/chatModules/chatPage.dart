import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/chatController.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:medongosupport/itachyonSupportModule/models/chatModels/allChats.dart';
import 'package:medongosupport/itachyonSupportModule/views/subPages/chatModules/chatComponents/chatInterface.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/appBar.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/shimmerWidgets.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/texts.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ///THIS METHOD WILL UPDATE THE DATA TO THE LOCAL INSTANCE OF PREFERENCE CLASS OBJECT BY FETCHING IT USING GET STORAGE


      ///FETCHES ALL THE CHATS FROM THE INTERNET
      // chatsController.getAllChats();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        ///APP BAR
        appBar:titleAppBarWithBackButton(context: context,height: 40.0),

        ///BODY - ALL CHAT LIST
        body: Center(
          child: StreamBuilder(
              stream: chatsController.chatServices.getAllChatsStream(),
              builder: (context, snapshot) => (snapshot.hasData && snapshot.data.length > 2)
                  ? ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        AllChat chat = snapshot.data[index];

                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              dense: true,
                              minVerticalPadding: 5.0,
                              horizontalTitleGap: 10.0,
                              onTap: () {
                                ///UPDATES SELECTED CHAT ID
                                chatsController.updateChatId(chatId: chat.id.toString());

                                // ///NAVIGATES TO CHAT INTERFACE
                                Get.to(() => ChatInterface(chatsMain: chat));
                              },
                              leading: SizedBox(
                                width: ScreenSize.width(context) * 0.125,
                                height: ScreenSize.width(context) * 0.125,
                                child: chat.authorId?.photo != null && chat.authorId?.photo!.isNotEmpty
                                    ? Container(
                                  color: AppColor.transparent,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(60.0),
                                    child: Image.network(
                                      chat.authorId?.photo!.url!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                                    : Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.tertiaryColor,
                                    borderRadius: BorderRadius.circular(60.0),
                                  ),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: titleText(
                                        context: context,
                                        text: chatsController.getShortName(name: chat.title),
                                        fontSize: 25.0,
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              title: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      ///CHAT SENDER TITLE
                                      Flexible(
                                        child: titleText(
                                            context: context,
                                            text: chat.title,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400),
                                      ),

                                      Row(
                                        children: [
                                          ///DELIVERED OR RECEIVED ICON
                                          Icon(
                                            chatsController.getDeliveredOrReceivedStatus(status:  chat.latestMessage?.content) == 0 ?
                                            Icons.done : Icons.done_all,
                                            size: 15,
                                          ),


                                          const SizedBox(width: 5.0,),
                                      //
                                      //     ///DATE TIME OF THE CONVERSATION
                                          regularText(
                                              context: context,
                                              text:chatsController.formatDateForChats(dateString: chat.createdAt),
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w300
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                              ),

                              subtitle: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: regularText(
                                        context: context,
                                        text:chat.latestMessage?.content??"",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,// Set the desired color for the counter
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                    child: regularText(
                                      context: context,
                                      text: chat.count.toString(),
                                      fontSize: 12.0,
                                      color: Colors.white, // Set the desired text color for the counter
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),



                            ),

                          ),
                        );
                      },
                    )
                  : const ShimmerForChats()),
        ),
      ),
    );
  }
}
