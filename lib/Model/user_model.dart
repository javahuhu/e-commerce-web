class LoginModel {
  final String username;
  final String password;

  LoginModel({required this.username, required this.password});

  LoginModel copyWith({final String? username, final String? password}) {
    return LoginModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() => {"username": username, "password": password};

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(username: json['username'], password: json['password']);
  }
}

class SignUpModel {
  final String username;
  final String email;
  final String password;
  final String confirmpassword;

  SignUpModel({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmpassword,
  });

  SignUpModel copyWith({
    final String? username,
    final String? email,
    final String? password,
    final String? confirmpassword,
  }) {
    return SignUpModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmpassword: confirmpassword ?? this.confirmpassword,
    );
  }

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "password": password,
    "confirmpassword": confirmpassword,
  };

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      confirmpassword: json['confirmpassword'],
    );
  }
}
