import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'video_page.dart';

/// Video lecture page for weight management education
/// Single Responsibility: Display specific video lecture content
class VideoLecturePage extends StatelessWidget {
  const VideoLecturePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example YouTube video ID - replace with actual educational content
    // This is a placeholder - you can change this to any YouTube video ID
    const videoId = 'F94IY408Q4E'; // Replace with actual educational video
    
    return VideoPage(
      videoId: videoId,
      title: 'Weight Management Fundamentals',
      description: 'Comprehensive video lecture covering the essential principles of healthy weight management, including nutrition basics, physical activity guidelines, and sustainable lifestyle changes.',
      colorScheme: AppTheme.pageColorSchemes[1], // Yellow/gold theme
    );
  }
}

/// Advanced video lecture page for Lesson 2
class AdvancedVideoLecturePage extends StatelessWidget {
  const AdvancedVideoLecturePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example YouTube video ID for advanced content
    const videoId = 'dQw4w9WgXcQ'; // Replace with actual advanced educational video
    
    return VideoPage(
      videoId: videoId,
      title: 'Advanced Weight Management Strategies',
      description: 'Advanced techniques and strategies for long-term weight management success, including behavior modification, meal planning, and overcoming common challenges.',
      colorScheme: AppTheme.pageColorSchemes[2], // Red theme
    );
  }
}

/// Factory class for creating video pages with different content
/// Single Responsibility: Provide easy video page creation
class VideoLectureFactory {
  /// Create a video lecture page from YouTube URL
  static Widget fromYouTubeUrl({
    required String youtubeUrl,
    required String title,
    required String description,
    PageColorScheme? colorScheme,
  }) {
    return VideoPage.fromUrl(
      youtubeUrl: youtubeUrl,
      title: title,
      description: description,
      colorScheme: colorScheme ?? AppTheme.pageColorSchemes[1],
    );
  }
  
  /// Create Lesson 1 video lecture
  static Widget lesson1({String? youtubeUrl}) {
    if (youtubeUrl != null) {
      return fromYouTubeUrl(
        youtubeUrl: youtubeUrl,
        title: 'Weight Management Fundamentals',
        description: 'Comprehensive video lecture covering the essential principles of healthy weight management, including nutrition basics, physical activity guidelines, and sustainable lifestyle changes.',
        colorScheme: AppTheme.pageColorSchemes[1],
      );
    }
    return const VideoLecturePage();
  }
  
  /// Create Lesson 2 video lecture
  static Widget lesson2({String? youtubeUrl}) {
    if (youtubeUrl != null) {
      return fromYouTubeUrl(
        youtubeUrl: youtubeUrl,
        title: 'Advanced Weight Management Strategies',
        description: 'Advanced techniques and strategies for long-term weight management success, including behavior modification, meal planning, and overcoming common challenges.',
        colorScheme: AppTheme.pageColorSchemes[2],
      );
    }
    return const AdvancedVideoLecturePage();
  }
}