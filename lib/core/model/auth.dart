class AuthData {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? urlPhoto;

  AuthData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.urlPhoto,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      urlPhoto: json['url_photo']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'url_photo': urlPhoto
    };
  }
}
