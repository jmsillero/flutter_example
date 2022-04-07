import 'package:flutter/material.dart';
import 'package:login_flutter_example/injection/injection.dart';
import 'package:login_flutter_example/presentation/components/generic_input.dart';
import 'package:login_flutter_example/presentation/components/login_form.dart';
import 'package:login_flutter_example/presentation/providers/auth_provider.dart';
import 'package:login_flutter_example/presentation/utils/validators.dart';
import 'package:login_flutter_example/routes/routes.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final validator = getIt<Validators>();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 64,
            ),
            const Center(
              child: Text(
                'Welcome',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 48),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Form(
                key: _formKey,
                child: LoginForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  emailValidator: validator.validateEmail,
                  passwordValidator: validator.validatePassword,
                )),
            const SizedBox(
              height: 24,
            ),
            authProvider.authStatus == Status.loading
                ? const SizedBox(
                    height: 48,
                    width: 48,
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () => _login(authProvider),
                      child: const Text('Login'),
                    ),
                  ),
            const SizedBox(
              height: 24,
            ),
            TextButton(onPressed: () {}, child: const Text('Forgot password')),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.grey.withOpacity(.8),
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'or',
                    style: TextStyle(
                      color: Colors.grey.withOpacity(.8),
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey.withOpacity(.8),
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 3,
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () => _login(authProvider),
                child: const Text(
                  'Explore The App',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _login(AuthProvider authProvider) async {
    if (_formKey.currentState!.validate()) {
      final result = await authProvider.login(
          _emailController.text, _passwordController.text);

      if (result is String) {
        // in the case of any error
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(result),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Accept'))
              ],
            );
          },
        );
      } else {
        Navigator.of(context).pushReplacementNamed(AppRoutes.PROFILE_ROUTE);
      }
    }
  }
}
