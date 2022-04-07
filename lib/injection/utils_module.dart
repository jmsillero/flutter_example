import 'package:injectable/injectable.dart';
import 'package:login_flutter_example/presentation/utils/validators.dart';

@module
abstract class UtilsModule {
  @lazySingleton
  Validators get validators => Validators();
}
