import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  TitleText({
    required this.title,
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
    ),);
  }
}