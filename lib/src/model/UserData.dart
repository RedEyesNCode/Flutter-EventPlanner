class UserData {
  final String id;
  final String email;
  final String password;
  final bool isLoggedIn;
  final String createdAt;
  final String updatedAt;
  final String version;

  UserData({
    required this.id,
    required this.email,
    required this.password,
    required this.isLoggedIn,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json['_id'],
    email: json['email'],
    password: json['password'],
    isLoggedIn: json['isLoggedIn'],
    createdAt: json['createdAt'],
    updatedAt: json['updatedAt'],
    version: json['__v'],
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'email': email,
    'password': password,
    'isLoggedIn': isLoggedIn,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': version,
  };
}
