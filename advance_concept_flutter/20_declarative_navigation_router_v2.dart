// File: 20_declarative_navigation_router_v2.dart
import 'package:flutter/material.dart';

class DeclarativeNavigationConcept extends StatelessWidget {
  final bool isLoggedIn;
  const DeclarativeNavigationConcept({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          const MaterialPage(child: HomeScreen()),
          if (!isLoggedIn) const MaterialPage(child: LoginScreen()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Text('Home'));
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Text('Login'));
}