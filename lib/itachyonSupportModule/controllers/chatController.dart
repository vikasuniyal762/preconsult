import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:medongosupport/itachyonSupportModule/models/chatModels/allChats.dart';
import 'package:medongosupport/itachyonSupportModule/models/chatModels/chatMessages.dart';
import 'package:medongosupport/itachyonSupportModule/preferences/userDataPrefs.dart';
import 'package:medongosupport/itachyonSupportModule/services/chatServices.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/toastMessage.dart';


final ChatController chatsController = Get.find<ChatController>();

class ChatController extends GetxController {
  String dummyImageUrl =
      "https://w7.pngwing.com/pngs/178/595/png-transparent-user-profile-computer-icons-login-user-avatars-thumbnail.png";

  ///OBJECT OF USER DATA - PREFERENCES METHODS
  UserData userData = UserData();

  ///OBJECT OF CHAT SERVICES
  ChatServices chatServices = ChatServices();

  ///LIST OF ALL THE CHATS
  List<AllChat> allChatsList = [];
  ///
  TextEditingController messageController = TextEditingController();

  RxString selectedChatId = "".obs;

  ///UPDATES SELECTED CHAT ID
  Future updateChatId({required String chatId}) async {
    selectedChatId.value = chatId;
    update();
  }

  ///GET INITIALS OF FIRST NAME
  getShortName({required String name}) {
    List alteredName = name.split(" ");

    return alteredName.length > 1
        ? "${alteredName[0][0]}${alteredName[1][0]}".toUpperCase()
        : "${alteredName[0][0]}${alteredName[0][1]}".toUpperCase();
  }

  ///DATE FORMATTER
  formatDateForChats({String? dateString}) {
    DateTime date = DateTime.parse(dateString!);

    final formattedDate =

        ///CHECKS IF THE GIVEN DATE IS OLDER THAN 7 DAYS
        date.isBefore(DateTime.now().subtract(const Duration(days: 7)))
            ?

            ///DATE FORMAT - Jan 26 2023
            DateFormat("").add_yMMMd().format(date)
            :

            ///CHECKS IF THE GIVEN DATE IS OLDER THAN 24 HOURS
            date.isBefore(DateTime.now().subtract(const Duration(hours: 24)))
                ?

                ///DATE FORMAT - Jan 26
                DateFormat().add_MMMd().format(date)
                :

                ///DATE FORMAT - 12:00 AM/PM
                DateFormat("").add_jm().format(date);

    return formattedDate.toString();
  }

  ///GET DELIVERED AND RECEIVED ICON
  getDeliveredOrReceivedStatus({String? status}) {
    return status == "received" ? 0 : 1;
  }

  getUserInfoForChats({required}) {}

  getUserNameForChats() {}

  ///RETURNS PROFILE PHOTO LINK
  getProfilePhoto({required AllChat chat, required var authId}) {
    // print("CURRENT USED ID ${authController.currentUser?.id} : AUTH ID ${authId}");
    //
    // authController.currentUser?.id == authId.toString()
    //     ? authController.currentUser?.personalPhoto ?? dummyImageUrl
    //     : getUserProfilePhotoUrlFromUserListForChats(chat: chat, authId: authId);
  }


  ///LOOPS THE USERS LIST TO MATCH SPECIFIC USER PROFILE PHOTO
   getUserProfilePhotoUrlFromUserListForChats(){}
       // ({required Chats chat, required var authId}) {
  //   for (ChatUsers chatUsers in chat.users!) {
  //     print("CHAT USER ID ${chatUsers.id} : AUTH ID ${authId}");
  //     return chatUsers.id == authId.toString() ? chatUsers.avatar : dummyImageUrl;
  //   }
  // }




  ///CALLS DATABASE FUNCTION AND UPDATES "allChatsList" VALUE AFTER FETCHING THE DATA
  getAllChats() async {
    ///URI TO FETCH ALL THE CHATS
        Uri url = Uri.http('43.205.255.99:3000','/api/chat');
    var headers = {
      'Authorization': 'Bearer ${itUserController.userPrefsModel.accessToken}',
    };

    ///EXCEPTION HANDLING
    try {
      ///EXECUTION LOGIC
      ///MAKING GET REQUEST TO GET ALL CHATS DATA FROM THE INTERNET
      allChatsList = await chatServices.getAllChatsFromInternet(
          url: url,
          headers: headers);

      update();
    } catch (error) {
      ///SHOW AN ERROR
      showToast(message: "UNABLE TO FETCH ALL THE CHATS",gravity: ToastGravity.BOTTOM);
    }
  }



///SEND MESSAGE METHOD
void sendMessage() async {

  // Uri url = Uri.https(
  //     '${authController.userPrefsModelWeb!.domain}',
  //     '/rest/im.message.add'
  // );
  //
  //
  // if(messageController.text.isEmpty){
  //  print("Please enter the message");
  //   return;
  //
  // }
  //
  // ///EXCEPTION HANDLING
  // try {
  //
  //   print("THIS IS CHAT ID ${selectedChatId.value}");
  //   chatServices.sendMessageToInternet(url: url, chatId: selectedChatId.value ,message: messageController.text);
  //
  //
  // } catch (error) {
  //  print("UNABLE TO SEND MESSAGE ");
  // }
}
}

