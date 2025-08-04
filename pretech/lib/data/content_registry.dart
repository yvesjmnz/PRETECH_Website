import 'package:flutter/material.dart';

/// Simple content registry following Open/Closed Principle
/// Responsibility: Manage available learning resources
class ContentRegistry {
  static const List<LearningResource> _resources = [
    // Introduction Page
    LearningResource(
      id: 'introduction',
      title: 'Introduction',
      description: 'Introduction to Weight Management',
      icon: Icons.info_outline,
      route: '/introduction',
    ),
    
    // Concept Map
    LearningResource(
      id: 'concept-map',
      title: 'Concept Map',
      description: 'Interactive concept mapping',
      icon: Icons.hub,
      route: '/concept-map',
    ),
    
    // Lesson 1 Section
    LearningResource(
      id: 'lesson1',
      title: 'Lesson 1',
      description: 'Weight Management Fundamentals',
      icon: Icons.school,
      route: '/materials',
      isSection: true,
    ),
    LearningResource(
      id: 'lesson1-module',
      title: 'Module',
      description: 'Learning materials and resources',
      icon: Icons.folder,
      route: '/materials',
      isSubItem: true,
    ),
    LearningResource(
      id: 'lesson1-video',
      title: 'Video Lecture',
      description: 'Educational video content',
      icon: Icons.play_circle,
      route: '/video-lecture',
      isSubItem: true,
    ),
    LearningResource(
      id: 'lesson1-assessment',
      title: 'Assessment',
      description: 'Weight management lecture quiz',
      icon: Icons.assignment,
      route: '/lecture',
      isSubItem: true,
    ),
    LearningResource(
      id: 'lesson1-poster',
      title: 'Poster',
      description: 'Download educational poster samples',
      icon: Icons.image,
      route: '/poster-making',
      isSubItem: true,
    ),
    
    // Lesson 2 Section
    LearningResource(
      id: 'lesson2',
      title: 'Lesson 2',
      description: 'Advanced Weight Management',
      icon: Icons.school,
      route: '/materials',
      isSection: true,
    ),
    LearningResource(
      id: 'lesson2-module',
      title: 'Module',
      description: 'Advanced learning materials',
      icon: Icons.folder,
      route: '/lesson2-module',
      isSubItem: true,
    ),
    LearningResource(
      id: 'lesson2-video',
      title: 'Video Lecture',
      description: 'Advanced educational content',
      icon: Icons.play_circle,
      route: '/video-lecture-advanced',
      isSubItem: true,
    ),
    LearningResource(
      id: 'lesson2-assessment',
      title: 'Assessment',
      description: 'Advanced weight management quiz',
      icon: Icons.assignment,
      route: '/lesson2-assessment',
      isSubItem: true,
    ),
    
    // About Us
    LearningResource(
      id: 'about',
      title: 'About Us',
      description: 'Learn more about our mission',
      icon: Icons.people,
      route: '/about',
    ),
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
  final bool isSection;
  final bool isSubItem;
  
  const LearningResource({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.route,
    this.isSection = false,
    this.isSubItem = false,
  });
}