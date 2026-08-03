
// File: 22_shell_route_nested_nav.dart
import 'package0:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter statefulShellRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (index) => navigationShell.goBranch(index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [GoRoute(path: '/home', builder: (c, s) => const Text('Home Tab'))],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/profile', builder: (c, s) => const Text('Profile Tab'))],
        ),
      ],
    ),
  ],
);