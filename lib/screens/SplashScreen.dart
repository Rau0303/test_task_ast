import 'package:flutter/material.dart';
import 'package:test_task_ast/screens/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // После задержки в 1 секунду переходим к основному содержимому
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white, // Например, белый фон
      body: Center(
        child: Image.asset('assets/splash.png'), // Укажите путь к изображению
      ),
    );
  }
}
