import 'package:flutter/material.dart';
import 'package:mvvm_architecture/Res/Components/round_button.dart';
import 'package:mvvm_architecture/Utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Build');

    return Scaffold(
      appBar: AppBar(
        title: Text('Login View'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                    borderSide: BorderSide(width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                    borderSide: BorderSide(width: 2, color: Colors.deepPurple)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                    borderSide: BorderSide(width: 2, color: Colors.red)),
                labelText: 'Email Address',
                prefixIcon: Icon(Icons.email),
              ),
              onFieldSubmitted: (value) {
                // FocusScope.of(context).requestFocus(passwordFocusNode);
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            const SizedBox(height: 12),

            // Password:

            ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (context, value, child) => TextFormField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                obscureText: _obsecurePassword.value,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                      borderSide: const BorderSide(width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.deepPurple)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.red)),
                  labelText: 'password',
                  prefixIcon: const Icon(Icons.lock_open),
                  suffixIcon: IconButton(
                    icon: _obsecurePassword.value
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      // No need to set state because of valueNotifier.
                      _obsecurePassword.value = !_obsecurePassword.value;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Button:
            RoundButton(
              title: 'Login',
              onPressed: () {
                if (emailController.text.isEmpty &&
                    passwordController.text.isEmpty) {
                  Utils.flushbar(context, 'Field Empty',
                      'Email and Password Cannot be empty');
                } else if (passwordController.text.length < 6) {
                  Utils.flushbar(context, 'Short Password',
                      'Please enter 6 digit password');
                } else {
                  Utils.toastMessage('Api Hit');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
