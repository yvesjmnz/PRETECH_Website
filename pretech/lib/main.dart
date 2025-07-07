import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/welcome_page.dart';
import 'pages/concept_map_page.dart';
import 'widgets/custom_header.dart';

void main() {
  runApp(const WeightManagementApp());
}

/// Main application widget following Single Responsibility Principle
/// Responsibility: App configuration and routing
class WeightManagementApp extends StatelessWidget {
  const WeightManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PRETECH L81 Learning Resources',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/concept-map': (context) => const ConceptMapView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Simple concept map view following KISS principle
/// Single Responsibility: Display concept map content with minimal navigation
class ConceptMapView extends StatelessWidget {
  const ConceptMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Concept Map',
        icon: Icons.hub,
        colorScheme: AppTheme.pageColorSchemes[0],
      ),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const ConceptMapPage(),
      ),
      // Simple back button for mobile - no complex navigation needed yet
      floatingActionButton: MediaQuery.of(context).size.width < 600
          ? FloatingActionButton(
              onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
              backgroundColor: AppTheme.pageColorSchemes[0].primary,
              child: const Icon(Icons.home, color: Colors.white),
            )
          : null,
    );
  }
}