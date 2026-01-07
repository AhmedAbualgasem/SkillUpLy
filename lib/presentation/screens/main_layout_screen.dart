import 'package:flutter/material.dart';

import '../../core/localization/app_localizations.dart';
import 'browse_screen.dart';
import 'home_screen.dart';
import 'learning_screen.dart';
import 'profile_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    BrowseScreen(),
    LearningScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      // Using IndexedStack to preserve the state of each page
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home_outlined), label: loc.t('nav_home')),
          NavigationDestination(icon: const Icon(Icons.search), label: loc.t('nav_browse')),
          NavigationDestination(icon: const Icon(Icons.play_circle_outline), label: loc.t('nav_learning')),
          NavigationDestination(icon: const Icon(Icons.person_outline), label: loc.t('nav_profile')),
        ],
      ),
    );
  }
}
