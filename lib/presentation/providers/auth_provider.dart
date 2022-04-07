import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:login_flutter_example/data/model/user_model.dart';
import 'package:login_flutter_example/domain/repository/user_repository.dart';
import 'package:login_flutter_example/injection/injection.dart';

enum Status { noAuthenticated, authenticated, loading }

class AuthProvider with ChangeNotifier {
  final UserRepository userRepository = getIt<UserRepository>();

  Status _authStatus = Status.noAuthenticated;
  UserModel? _user;

  Status get authStatus => _authStatus;

  UserModel? get user => _user;

  Future<dynamic> login(String email, String password) async {
    _authStatus = Status.loading;
    notifyListeners();

    final userResp = await userRepository.login(email, password);
    return userResp.fold((l) {
      _authStatus = Status.noAuthenticated;
      notifyListeners();

      if (kDebugMode) {
        print("Error ${l.message}");
      }
      return l.message;
    }, (r) {
      _authStatus = Status.authenticated;
      _user = r;
      if (kDebugMode) {
        print("User: ${_user.toString()}");
      }
      notifyListeners();
      return _user;
    });
  }

  /// Use this function for logout
  /// Just change  status, but not remove the user
  updateStatus() {
    if (_authStatus == Status.authenticated) {
      _authStatus = Status.noAuthenticated;
    } else {
      _authStatus = Status.authenticated;
    }

    notifyListeners();
  }
}
