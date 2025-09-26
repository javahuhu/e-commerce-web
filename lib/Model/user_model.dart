class UserModel {
  final String username;
  final String password;

  UserModel({required this.username, required this.password});

  UserModel copyWith({final String? username, final String? password}) {
    return UserModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
