import 'package:flutter/material.dart';
import 'package:login_flutter_example/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN_ROUTE);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(
      child: Text(
        'PROFILE APP',
        style: TextStyle(fontSize: 36),
      ),
    ),);
  }
}
