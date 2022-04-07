import 'package:login_flutter_example/data/model/user_model.dart';

/// Login response, for demo we will not use refresh token
class LoginResponseModel {
  final UserModel? user;
  final String? token;

  LoginResponseModel({this.user, this.token});



  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
      token: map['token'] as String,
    );
  }
}
