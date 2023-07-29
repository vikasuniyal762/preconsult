List<AllChat> allChatsFromJson(str) => List<AllChat>.from((str).map((x) => AllChat.fromJson(x)));

class AllChat {
  var id;
 var title;
 var description;
 var isGroupChat;
AuthorId? authorId;
 var users;
 var count;
 var createdAt;
 var updatedAt;
 var iV;
LatestMessage? latestMessage;

 AllChat({
   this.id,
    this.title,
    this.description,
    this.isGroupChat,
    this.authorId,
    this.users,
    this.count,
    this.createdAt,
    this.updatedAt,
   this.iV,
   this.latestMessage
  });

  factory AllChat.fromJson(Map<String, dynamic> json) {
    return AllChat(
      id: json['_id'],
      title: json['title'],
      description: json['description']??"",
      isGroupChat: json['isGroupChat'],
      authorId: json['authorId']!= null ? AuthorId.fromJson(json['authorId']) : null,
      users: json['users'],
      count: json['count'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
      latestMessage:json['latestMessage']!= null ? LatestMessage.fromJson(json['latestMessage']):null ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'isGroupChat': isGroupChat,
      'authorId': authorId,
      'users': users,
      'count': count,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v':iV,
      // 'latestMessage':latestMessage
    };
  }
}

class AuthorId {
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

  AuthorId(
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
  factory AuthorId.fromJson(Map<String, dynamic> json) {
    return AuthorId(
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
class LatestMessage {
var id;
var sender;
 var content;
 var chat;
  var readBy;
  var createdAt;
var updatedAt;
  var iV;

   LatestMessage(
      {this.id,
      this.sender,
      this.content,
      this.chat,
      this.readBy,
      this.createdAt,
      this.updatedAt,
      this.iV});
factory LatestMessage.fromJson(Map<String, dynamic> json) {
  return LatestMessage(
    id : json['_id'],
    sender: json['sender'],
    content : json['content'],
    chat: json['chat'],
    createdAt : json['createdAt'],
    readBy: json['readBy'] ,
    updatedAt: json['updatedAt'],
    iV: json['__v'],
  );
}

Map<String, dynamic> toJson() {
  return {
    '_id':id,
    'sender':sender,
    'content':content,
    'chat':chat,
    'readBy':readBy,
    'createdAt':createdAt,
    'updatedAt':updatedAt,
    '__v':iV
  };
}
}