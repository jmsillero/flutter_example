import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:login_flutter_example/injection/injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
configureInjection() => $initGetIt(getIt);