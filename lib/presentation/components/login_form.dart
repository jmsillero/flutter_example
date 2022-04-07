import 'package:flutter/material.dart';
import 'package:login_flutter_example/presentation/components/generic_input.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? passwordValidator;
  final bool isPasswordEnabled;
  final bool isEmailEnabled;

  const LoginForm(
      {Key? key,
      this.emailController,
      this.passwordController,
      this.emailValidator,
      this.passwordValidator,
      this.isPasswordEnabled = true,
      this.isEmailEnabled = true})
      : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late bool isPasswordVisible;

  @override
  void initState() {
    isPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenericInput(
            child: TextFormField(
              controller: widget.emailController,
              validator: widget.emailValidator,
              decoration: InputDecoration(
                  hintText: 'e.g johndoe@gmail.com',
                  enabled: widget.isEmailEnabled,
                  filled: !widget.isEmailEnabled,
                  fillColor: widget.isEmailEnabled ? Colors.white : Colors.grey.withOpacity(.5),
                  border: const OutlineInputBorder()),
            ),
            label: 'Email'),
        const SizedBox(
          height: 24,
        ),
        GenericInput(
            child: TextFormField(
              controller: widget.passwordController,
              validator: widget.passwordValidator,

              decoration: InputDecoration(
                  hintText: 'enter password',
                  border: const OutlineInputBorder(),
                  enabled: widget.isPasswordEnabled,
                  filled: !widget.isPasswordEnabled,
                  fillColor: widget.isPasswordEnabled ? Colors.white : Colors.grey.withOpacity(.5),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off))),
              obscureText: !isPasswordVisible,
            ),
            label: 'Password'),
      ],
    );
  }
}
