import 'package:flutter/material.dart';
class UsernameTextField extends StatelessWidget {
  const UsernameTextField({
    super.key,
    required TextEditingController usernameController,
    required this.hint
  }) : _usernameController = usernameController;

  final TextEditingController _usernameController;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _usernameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hint
      ),
    );
  }
}

