import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:medongosupport/itachyonSupportModule/constants/appConst.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:medongosupport/itachyonSupportModule/models/userModel.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/toastMessage.dart';

class UserService {

  ///FETCHES CURRENT USER INFO FROM THE DATABASE
  Future getCurrentUserFromInternet() async {

    ///GETS CURRENT USER INFO FROM THE INTERNET
    Uri url = Uri.https(AppConst.domainLogin, '/GetCurrentUserData/${itUserController.userPrefsModel.id}');


    ///HEADERS
    var headers={
      'Authorization': 'bearer ${itUserController.userPrefsModel.accessToken}',
    };


    try {
      ///GETS CURRENT USER INFORMATION FROM THE INTERNET
      final response = await http.get(url,headers: headers);
      ///DECODES RESPONSE BODY
      final responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        ///PARSES USER JSON TO THE MODEL
        User currentUser =  User.fromJson(responseBody);

        print("THIS IS CURRENT USER $currentUser");
        return currentUser;
      }else {
        ///IF FAILED TO GET USER DETAILS - THIS BLOCK WILL BE EXECUTED
        ///IF THERE IS ANY ERROR - RETURN ERROR MESSAGE FROM THE SERVER
        showToast(
          message: '${responseBody['Error']}',
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (error) {
      ///ERROR CLAUSE
      showToast(
        message: '$error',
        gravity: ToastGravity.BOTTOM,
      );
    }
  }


  ///FETCHES LOGIN USER INFO FROM THE DATABASE FOR LOGIN
  Future getLoginUserFromInternet({required String email, required String password}) async {
    ///AUTH URL
    Uri url = Uri.https(AppConst.domainLogin, '/auth');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      ///DECODES RESPONSE BODY
      final responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        ///PARSES USER JSON TO THE MODEL
        return User.fromJson(responseBody);
      }else {
        ///IF THERE IS ANY ERROR - RETURN ERROR MESSAGE FROM THE SERVER
        showToast(
          message: '${responseBody['Error']}',
          gravity: ToastGravity.BOTTOM,
        );
        return User();
      }
    } catch (error) {
      ///ERROR CLAUSE
      showToast(
        message: '$error',
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}

