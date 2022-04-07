import 'package:login_flutter_example/data/model/login_response_model.dart';

abstract class AuthService {
  Future<LoginResponseModel> login(String email, String password);
}
