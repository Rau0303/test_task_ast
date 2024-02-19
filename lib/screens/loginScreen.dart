import 'package:flutter/material.dart';
import 'package:test_task_ast/screens/homeScreen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/TitleTextWidget.dart';
import '../widgets/passwordTextFieldWidget.dart';
import '../widgets/saveButtonWidget.dart';
import '../widgets/usernameTextFieldWidget.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleText( title: 'Вход',),
            const SizedBox(height: 20,),
            UsernameTextField(usernameController: _usernameController, hint: 'username',),
            const SizedBox(height: 20,),
            PasswordTextField(passwordController: _passwordController, hint: 'password',),
            const SizedBox(height: 20,),
            SaveButton(onPressed: () {Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const HomeScreen()), (route) => false);
            }, title: 'Войти',),
            TextButton(
              onPressed: () {
                launch("https://www.google.com");
              },
              child: Text(
                "Перейти на страницу инструкции",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            )


          ],
        ),
        ),
      ),
    );
  }
}









