import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:login_flutter_example/data/model/failure.dart';
import 'package:login_flutter_example/data/model/login_response_model.dart';
import 'package:login_flutter_example/data/model/user_model.dart';
import 'package:login_flutter_example/data/service/auth_service.dart';
import 'package:login_flutter_example/domain/repository/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final AuthService _authService;

  UserRepositoryImpl(this._authService);

  @override
  Future<Either<Failure, UserModel>> login(
      String email, String password) async {
    try {
      final response = await _authService.login(email, password);
      if (response.user != null) {
        //save token
        return Right(response.user!);
      }
      return Left(ServerErrorFailure("User not found"));
    } catch (e) {
      return Left(ServerErrorFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> profile() {
    // TODO: implement profile
    throw UnimplementedError();
  }
}
