import 'package:flutter/material.dart';

/// Simple content registry following Open/Closed Principle
/// Responsibility: Manage available learning resources
class ContentRegistry {
  static const List<LearningResource> _resources = [
    LearningResource(
      id: 'concept-map',
      title: 'Interactive Concept Map',
      description: 'Explore the interconnected factors that influence healthy weight management',
      icon: Icons.hub,
      route: '/concept-map',
    ),
    LearningResource(
      id: 'lecture-quiz',
      title: 'Weight Management Lecture & Quiz',
      description: 'Interactive presentation with engaging activities and knowledge checks',
      icon: Icons.school,
      route: '/lecture',
    ),
    // Future resources can be added here without modifying existing code
  ];
  
  /// Get all available learning resources
  static List<LearningResource> get availableResources => _resources;
  
  /// Get the primary/featured resource (first one)
  static LearningResource get primaryResource => _resources.first;
  
  /// Check if multiple resources are available
  static bool get hasMultipleResources => _resources.length > 1;
}

/// Learning resource model following Single Responsibility Principle
class LearningResource {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final String route;
  
  const LearningResource({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.route,
  });
}