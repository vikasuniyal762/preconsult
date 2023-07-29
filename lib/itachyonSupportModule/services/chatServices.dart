import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:medongosupport/itachyonSupportModule/models/chatModels/allChats.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/toastMessage.dart';


class ChatServices {


  Future getAllChatsFromInternet({required Uri url,
    required headers}) async
  {
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      // print("responseBody2$responseBody");
      return allChatsFromJson(responseBody);
    } else {
      showToast(message: "DATABASE ERROR", gravity: ToastGravity.BOTTOM);
    }
  }


    ///RETURNS ALL CHATS STREAM
    Stream getAllChatsStream() async* {

      ///URI TO FETCH ALL THE CHATS
      Uri url = Uri.https('43.205.255.99:3000','/api/chat');
      var headers = {
        'Authorization': 'Bearer ${itUserController.userPrefsModel.accessToken}',
      };
      // print(url);
      // print(headers);
      yield* Stream.periodic(const Duration(seconds: 1), (_) async {
        final response = await http.get(url, headers: headers);

        if (response.statusCode == 200) {
          final responseBody = json.decode(response.body);
          // print("responseBody1$responseBody");
          return allChatsFromJson(responseBody);
        }
      }).asyncMap((event) async => await event);
    }


    ///RETURNS ALL THE MESSAGES IN SINGLE CHAT ID - INDIVIDUAL OR GROUP
    Stream getChatMessages() async* {

      ///URI TO FETCH ALL THE CHATS
      Uri url = Uri.https('43.205.255.99:3000','/api/message/6474bd7c1feffc9c389a24ff');
      var headers = {
        'Authorization': 'Bearer ${itUserController.userPrefsModel.accessToken}',
      };
      print( "url$url");
      print("headers$headers");
      yield* Stream.periodic(const Duration(seconds: 1), (_) async {
        final response = await http.get(url, headers: headers);

        if (response.statusCode == 200) {
          final responseBody = json.decode(response.body);
          print("responseBody12$responseBody");
          // return allChatsFromJson(responseBody);
        }
      }).asyncMap((event) async => await event);
    }


    ///..........................
    Future sendMessageToInternet({required Uri url,
      required String chatId,
      required String message}) async {
      //   Uri urlMain = Uri.https(
      //       '${authController.userPrefsModelWeb!.domain}',
      //       '/rest/im.message.add'
      //   );
      //   print("url$url");
      //
      //
      //
      //   final response = await http.post(
      //     urlMain,
      //     headers: {
      //       'Content-Type': 'application/json',
      //       'Authorization': 'Bearer your-access-token',
      //     },
      //     body: json.encode({
      //       'chat_id': chatId,
      //       'message': message,
      //       'access_token': '${authController.userPrefsModelWeb!.accessToken}'
      //     }),
      //   );
      //
      //   if (response.statusCode == 200) {
      //    print('Message sent');
      //   } else {
      //   print('Failed to send message');
      //   }
    }
  }


