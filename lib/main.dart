import 'package:flutter/material.dart';
import 'presentation/pages/get_started_page.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'presentation/pages/discover_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GetStartedPage(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/mainMenu': (context) => const DiscoverPage(),
      },
    );
  }
}
