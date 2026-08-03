// File: 21_gorouter_auth_guards.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final bool isUserLoggedIn = false;

final GoRouter router = GoRouter(
  initialLocation: '/dashboard',
  redirect: (BuildContext context, GoRouterState state) {
    final loggingIn = state.matchedLocation == '/login';
    if (!isUserLoggedIn && !loggingIn) return '/login';
    if (isUserLoggedIn && loggingIn) return '/dashboard';
    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const Scaffold(body: Text('Login Screen')),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const Scaffold(body: Text('Protected Dashboard')),
    ),
  ],
);