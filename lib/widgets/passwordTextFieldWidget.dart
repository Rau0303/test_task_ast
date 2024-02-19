import 'package:flutter/material.dart';
class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required TextEditingController passwordController,
    required this.hint
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;
  final String hint;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isHiddenPassword = true;

  void togglePass(){
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._passwordController,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      decoration:InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: widget.hint,
          suffix: InkWell(
            onTap: togglePass,
            child: Icon(
              isHiddenPassword
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
          )
      ) ,
    );
  }
}