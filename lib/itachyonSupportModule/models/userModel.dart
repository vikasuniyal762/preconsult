
import 'dart:convert';

User userFromJson(str) => User.fromJson((str));

String userToJson(User data) => json.encode(data.toJson());





///MODEL CLASS FOR USER
class User {
  var id;
  var photo;
  var firstName;
  var lastName;
  var email;
  var password;
  var login;
  var userRole;
  var clinicName;
  var clinicCode;
  var clinicBlock;
  var status;
  var position;
  var sex;
  var department;
  var city;
  var country;
  var region;
  var token;

  User(
      {this.id,
        this.photo,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.login,
        this.userRole,
        this.clinicName,
        this.clinicCode,
        this.clinicBlock,
        this.status,
        this.position,
        this.sex,
        this.department,
        this.city,
        this.country,
        this.region,
        this.token});


  ///USER FROM JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id : json['_id'],
        firstName: json['firstname'],
        lastName: json['lastname'],
        email: json['email'],
        login : json['login'],
        clinicName: json['clinicName'] ?? "",
        clinicCode: json['clinicCode'],
        clinicBlock : json['clinicBlock'],
        position : json['position'],
        sex: json['sex'],
        password: json['password'],
        userRole: json['userRole'] ?? "",
        photo : json['photo'] ?? "",
        status: json['status'] ?? false,
        department : json['department'],
        city : json['city'],
        country : json['country'],
        region : json['region'],
        token : json['token']
    );
  }

  ///USER TO JSON
  Map<String, dynamic> toJson() {
    return {
      '_id':id,
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'login': login,
      'sex':sex,
      'clinicName': clinicName ?? "",
      'clinicCode': clinicCode,
      'clinicBlock':clinicBlock,
      'password': password,
      'userRole': userRole ?? "",
      'photoUrl': photo ?? "",
      'status': status ?? false,
      'position':position,
      'department':department,
      'city':city,
      'country':country,
      'region':region,
      'token':token
    };
  }
}


///CUSTOM MODEL FOR LOGIN USER
// CustomUser customuserFromJson(str) => CustomUser.fromJson((str));
//
// String customuserToJson(User data) => json.encode(data.toJson());
//
// class CustomUser{
//   var id;
//   var email;
//   var token;
//
//
//   CustomUser(
//   {
//   this.id,
//   this.email,
//   this.token,});
//
//   factory CustomUser.fromJson(Map<String, dynamic> json) {
//     return CustomUser(
//         id : json['_id'],
//         email: json['email'],
//         token : json['token']);
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       '_id':id,
//       'email': email,
//       'token':token,};}
//
// }
