// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/service/auth_service.dart' as _i3;
import '../data/service/impl/auth_service_impl.dart' as _i4;
import '../domain/repository/impl/user_repository_impl.dart' as _i6;
import '../domain/repository/user_repository.dart' as _i5;
import '../presentation/utils/validators.dart' as _i7;
import 'utils_module.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final utilsModule = _$UtilsModule();
  gh.lazySingleton<_i3.AuthService>(() => _i4.AuthServiceImpl());
  gh.lazySingleton<_i5.UserRepository>(
      () => _i6.UserRepositoryImpl(get<_i3.AuthService>()));
  gh.lazySingleton<_i7.Validators>(() => utilsModule.validators);
  return get;
}

class _$UtilsModule extends _i8.UtilsModule {}
