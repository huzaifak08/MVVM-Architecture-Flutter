import 'package:flutter/material.dart';
import 'package:mvvm_architecture/Utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Utils.toastMessage('Login not Implemented');
                Utils.flushbar(context, 'Huzaifa', 'Potar G');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
