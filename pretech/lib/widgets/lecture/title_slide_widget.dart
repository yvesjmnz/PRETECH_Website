import 'package:flutter/material.dart';
import '../../models/lecture_content.dart';
import '../../theme/app_theme.dart';

/// Title slide widget following Single Responsibility Principle
/// Responsibility: Display title slide content
class TitleSlideWidget extends StatelessWidget {
  final TitleSlide slide;
  final VoidCallback? onNext;

  const TitleSlideWidget({
    super.key,
    required this.slide,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Main title
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingXl),
            decoration: BoxDecoration(
              gradient: AppTheme.pageColorSchemes[1].gradient,
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.pageColorSchemes[1].primary.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                Icon(
                  Icons.school,
                  size: 80,
                  color: Colors.white,
                ),
                const SizedBox(height: AppTheme.spacingL),
                Text(
                  slide.title,
                  style: AppTheme.headlineLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (slide.subtitle != null) ...[
                  const SizedBox(height: AppTheme.spacingM),
                  Text(
                    slide.subtitle!,
                    style: AppTheme.titleLarge.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Welcome message
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingL),
            decoration: BoxDecoration(
              color: AppTheme.cardColor,
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              border: Border.all(
                color: AppTheme.pageColorSchemes[1].primary.withOpacity(0.2),
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.play_circle_outline,
                  size: 48,
                  color: AppTheme.pageColorSchemes[1].primary,
                ),
                const SizedBox(height: AppTheme.spacingM),
                Text(
                  'Interactive Lecture & Quiz',
                  style: AppTheme.titleLarge.copyWith(
                    color: AppTheme.pageColorSchemes[1].primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  'Learn about healthy weight management through engaging content and interactive activities.',
                  style: AppTheme.bodyLarge.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}