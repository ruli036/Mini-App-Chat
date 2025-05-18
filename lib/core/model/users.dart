class UserModel {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  int unreadMessage;
  final bool isOnline;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.unreadMessage,
    required this.isOnline,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      unreadMessage: json['unread_message'],
      isOnline: json['isOnline'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'photoUrl': photoUrl,
    'unread_message': unreadMessage,
    'isOnline': isOnline,
  };
}
