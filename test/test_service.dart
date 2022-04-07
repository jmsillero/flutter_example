import 'package:flutter_test/flutter_test.dart';
import 'package:login_flutter_example/data/model/login_response_model.dart';
import 'package:login_flutter_example/data/model/user_model.dart';
import 'package:login_flutter_example/data/service/auth_service.dart';
import 'package:login_flutter_example/domain/repository/impl/user_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockLoginService extends Mock implements AuthService {}

void main() {
  late MockLoginService service;
  late UserRepositoryImpl userRepositoryImpl;

  LoginResponseModel fakeUser = LoginResponseModel(
      token: 'valid_token',
      user: UserModel(
          name: 'Jm',
          lastName: 'Rd',
          picture: 'no_picture',
          email: 'email@gmail.com'));

  setUp(() async {
    service = MockLoginService();
    userRepositoryImpl = UserRepositoryImpl(service);
  });

  group('Login user', () {
    test('Check repository call', () async {
      when(
        service.login('juan@gmail.com', 'test123456'),
      ).thenAnswer((_) async => fakeUser);

      expect(await userRepositoryImpl.login('juan@gmail.com', 'test123456'),
          isA<LoginResponseModel>());
    });

    test('in the case of exception', () async {
      when(
        service.login('juan@gmail.com', 'test123456'),
      ).thenAnswer((_) async => throw Exception('Error'));

      expect(await userRepositoryImpl.login('juan@gmail.com', 'test123456'),
          throwsException);
    });
  });
}
