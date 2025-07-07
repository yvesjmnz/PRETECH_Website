import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/welcome_page.dart';
import 'pages/concept_map_page.dart';
import 'pages/lecture_page.dart';
import 'widgets/custom_header.dart';
import 'widgets/navigation/global_drawer.dart';

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
        '/lecture': (context) => const LectureView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Concept map view with global navigation
/// Single Responsibility: Display concept map content with navigation
class ConceptMapView extends StatelessWidget {
  const ConceptMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Interactive Concept Map',
        icon: Icons.hub,
        colorScheme: AppTheme.pageColorSchemes[0],
        currentRoute: '/concept-map',
      ),
      drawer: const GlobalDrawer(currentRoute: '/concept-map'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const ConceptMapPage(),
      ),
    );
  }
}

/// Lecture view with global navigation
/// Single Responsibility: Display lecture content with navigation
class LectureView extends StatelessWidget {
  const LectureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Weight Management Lecture',
        icon: Icons.school,
        colorScheme: AppTheme.pageColorSchemes[1],
        currentRoute: '/lecture',
      ),
      drawer: const GlobalDrawer(currentRoute: '/lecture'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const LecturePage(),
      ),
    );
  }
}