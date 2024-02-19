import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task_ast/screens/SplashScreen.dart';
import 'package:test_task_ast/screens/loginScreen.dart';
import 'package:test_task_ast/services/apiService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ApiService()),
    ],
    child:MaterialApp(

      title: 'test-task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    ) ,
    );
      

  }
}


