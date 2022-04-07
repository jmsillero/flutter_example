import 'package:flutter/material.dart';
import 'package:login_flutter_example/injection/injection.dart';
import 'package:login_flutter_example/presentation/providers/auth_provider.dart';
import 'package:login_flutter_example/routes/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme:
                  const AppBarTheme(color: Color.fromARGB(255, 28, 55, 96))),
          initialRoute: AppRoutes.HOME_ROUTE,
          onGenerateRoute: AppRoutes.generateRoute,
        ));
  }
}
