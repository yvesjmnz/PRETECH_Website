import 'package:flutter/material.dart';
import '../../models/lecture_content.dart';
import '../../theme/app_theme.dart';

/// Content slide widget following Single Responsibility Principle
/// Responsibility: Display content slide with bullet points
class ContentSlideWidget extends StatelessWidget {
  final ContentSlide slide;
  final VoidCallback? onNext;

  const ContentSlideWidget({
    super.key,
    required this.slide,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppTheme.spacingL),
            decoration: BoxDecoration(
              gradient: AppTheme.pageColorSchemes[1].gradient,
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  slide.title,
                  style: AppTheme.headlineMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (slide.subtitle != null) ...[
                  const SizedBox(height: AppTheme.spacingS),
                  Text(
                    slide.subtitle!,
                    style: AppTheme.titleMedium.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingXl),
          
          // Content section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppTheme.spacingL),
            decoration: BoxDecoration(
              color: AppTheme.cardColor,
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: slide.bulletPoints.map((point) => 
                _buildBulletPoint(point)
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String point) {
    // Check if this is a sub-bullet (starts with •)
    final isSubBullet = point.trim().startsWith('•');
    final cleanPoint = isSubBullet ? point.trim().substring(1).trim() : point;
    
    return Padding(
      padding: EdgeInsets.only(
        bottom: AppTheme.spacingM,
        left: isSubBullet ? AppTheme.spacingL : 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: isSubBullet ? 4 : 6,
            height: isSubBullet ? 4 : 6,
            decoration: BoxDecoration(
              color: isSubBullet 
                ? AppTheme.pageColorSchemes[1].secondary
                : AppTheme.pageColorSchemes[1].primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Text(
              cleanPoint,
              style: AppTheme.bodyLarge.copyWith(
                fontSize: isSubBullet ? 16 : 18,
                fontWeight: isSubBullet ? FontWeight.normal : FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}