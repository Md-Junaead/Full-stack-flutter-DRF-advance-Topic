// File: 23_gorouter_transitions_params.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter customAnimationRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/products',
      builder: (context, state) {
        // Parsing Query Parameter (/products?category=shoes)
        final category = state.uri.queryParameters['category'] ?? 'all';
        return Scaffold(body: Text('Category: $category'));
      },
    ),
    GoRoute(
      path: '/details/:id', // Path Parameter
      pageBuilder: (context, state) {
        final id = state.pathParameters['id'];
        return CustomTransitionPage(
          key: state.pageKey,
          child: Scaffold(body: Text('Product Detail ID: $id')),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
  ],
);