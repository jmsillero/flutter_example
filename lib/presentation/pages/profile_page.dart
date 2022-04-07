import 'package:flutter/material.dart';
import 'package:login_flutter_example/presentation/components/avatar_component.dart';
import 'package:login_flutter_example/presentation/components/login_form.dart';
import 'package:login_flutter_example/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      AuthProvider authProvider = Provider.of<AuthProvider>(
        context,
        listen: false,
      );
      _emailController.text = authProvider.user?.email ?? '';
    });

    _passwordController.text = 'secret!';
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 120,
              child: authProvider.authStatus == Status.authenticated
                  ? AvatarComponent(
                      avatar: user?.picture,
                      lastName: user?.lastName,
                      name: user?.name,
                    )
                  : const Center(
                      child: Text(
                        'You are not logged in',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
            const SizedBox(
              height: 24,
            ),
            LoginForm(
              emailController: _emailController,
              passwordController: _passwordController,
              isPasswordEnabled: false,
              isEmailEnabled: authProvider.authStatus == Status.authenticated,
            ),
            const SizedBox(
              height: 2,
            ),
            Align(
                alignment: Alignment.topLeft,
                child:
                    TextButton(onPressed: () {}, child: const Text('Change'))),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 130,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: authProvider.updateStatus,
                    child: Text(authProvider.authStatus == Status.authenticated
                        ? 'Log Out'
                        : 'Log In'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
