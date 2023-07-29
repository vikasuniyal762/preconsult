
List<ChatMessage> messageFromJson(str) => List<ChatMessage>.from((str).map((x) =>  ChatMessage.fromJson(x)));

class ChatMessage {
  var id;
  var sender;
  var content;
  var chat;
  var readBy;
  var createdAt;
  var updatedAt;

ChatMessage({
    this.id,
    this.sender,
    this.content,
    this.chat,
    this.readBy,
    this.createdAt,
    this.updatedAt,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['_id'],
      sender: json['sender'],
      content: json['content'],
      chat: json['chat'],
      readBy:json['readBy'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'sender': sender,
      'content': content,
      'chat': chat,
      'readBy': readBy,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
