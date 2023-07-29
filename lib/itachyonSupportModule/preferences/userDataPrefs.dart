import 'package:get_storage/get_storage.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';

///USER DATA - STORES USER DATA IN PREFERENCES AND LOADS IT WHEN TRIGGERED
class UserData {
  GetStorage getStorage = GetStorage();

  ///SETS USER INFO
  setUserInfo(
      {required String id, required String email,required String accessToken}) {
    getStorage.write('id', id);
    getStorage.write('email', email);
    getStorage.write('token', accessToken);

    ///UPDATES DATA TO THE INSTANCE OF USER INFO MODEL IN USER CONTROLLER FOR QUICK ACCESS OF DATA BEFORE IT IS LOADED FROM THE PREFS
    itUserController.setUserInfoWhileSignIn(
      id: id,
      email: email,
      accessToken: accessToken,
    );
  }

  ///GETS USER INFO
  getUserInfo() async {
    return UserPrefsModel(getStorage.read('id') ?? "", getStorage.read('email') ?? "",getStorage.read('token') ?? "");
  }
}

///USER PREFS MODEL
class UserPrefsModel {
  String? id;
  String? email;
  String? accessToken;

  UserPrefsModel(this.id, this.email, this. accessToken);
}

