import 'package:flutter/material.dart';

import 'presentation/authentication/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secret Messenger',
      theme: ThemeData(
        primaryColor: Colors.blue,
        
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}
