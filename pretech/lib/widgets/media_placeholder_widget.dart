import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Media placeholder widget following Single Responsibility Principle
/// Responsibility: Display placeholder for GIF/video content with fallback
class MediaPlaceholderWidget extends StatelessWidget {
  final String? assetPath;
  final double? width;
  final double? height;
  final String placeholderText;
  final IconData placeholderIcon;
  final bool isLooping;

  const MediaPlaceholderWidget({
    super.key,
    this.assetPath,
    this.width,
    this.height,
    this.placeholderText = 'Media Content',
    this.placeholderIcon = Icons.play_circle_outline,
    this.isLooping = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    return Container(
      width: width ?? (isMobile ? 200 : 300),
      height: height ?? (isMobile ? 150 : 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        gradient: LinearGradient(
          colors: [
            AppTheme.pageColorSchemes[0].primary.withOpacity(0.1),
            AppTheme.pageColorSchemes[0].secondary.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: AppTheme.pageColorSchemes[0].primary.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: assetPath != null ? _buildMediaContent() : _buildPlaceholder(isMobile),
    );
  }

  Widget _buildMediaContent() {
    // For now, we'll show a placeholder since we need to handle different media types
    // This can be extended to support actual GIF/video playback
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppTheme.radiusL - 2),
      child: Stack(
        children: [
          // Placeholder for actual media content
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[200],
            child: const Center(
              child: Icon(
                Icons.image,
                size: 48,
                color: Colors.grey,
              ),
            ),
          ),
          
          // Play indicator overlay
          if (isLooping)
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.loop,
                      size: 12,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'LOOP',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(bool isMobile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          placeholderIcon,
          size: isMobile ? 48 : 64,
          color: AppTheme.pageColorSchemes[0].primary,
        ),
        const SizedBox(height: AppTheme.spacingM),
        Text(
          placeholderText,
          style: (isMobile ? AppTheme.titleMedium : AppTheme.titleLarge).copyWith(
            color: AppTheme.pageColorSchemes[0].primary,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppTheme.spacingS),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingS,
          ),
          decoration: BoxDecoration(
            color: AppTheme.pageColorSchemes[0].primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
          ),
          child: Text(
            'Add your GIF or video here',
            style: AppTheme.bodyMedium.copyWith(
              color: AppTheme.pageColorSchemes[0].primary,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}