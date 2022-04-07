import 'package:dartz/dartz.dart';
import 'package:login_flutter_example/data/model/failure.dart';
import 'package:login_flutter_example/data/model/login_response_model.dart';
import 'package:login_flutter_example/data/model/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> login(
      String email, String password);

  Future<Either<Failure, UserModel>> profile();
}
