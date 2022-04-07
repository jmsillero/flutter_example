import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:login_flutter_example/data/model/login_response_model.dart';
import 'package:login_flutter_example/data/service/api_constants.dart';
import 'package:login_flutter_example/data/service/auth_service.dart';

@LazySingleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  @override
  Future<LoginResponseModel> login(String email, String password) async {
    final url = Uri.parse('${ApiConstants.API_URL}/login/');

    final response =
        await http.post(url, body: {'email': email, 'password': password});

    if (response.statusCode != 200) {
      throw Exception(jsonDecode(response.body)['message']);
    }

    return LoginResponseModel.fromMap(jsonDecode(response.body));
  }
}
