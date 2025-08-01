import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';

/// Poster Inspiration page following Single Responsibility Principle
/// Single Responsibility: Display sample poster for inspiration and download
class PosterMakingPage extends StatelessWidget {
  const PosterMakingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          _buildHeroSection(isMobile),
          
          // Content
          _buildContent(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildHeroSection(bool isMobile) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.pageColorSchemes[2].primary.withOpacity(0.1),
            AppTheme.pageColorSchemes[1].primary.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? AppTheme.spacingL : AppTheme.spacingXxl),
        child: Column(
          children: [
            Icon(
              Icons.image,
              size: isMobile ? 48 : 64,
              color: AppTheme.pageColorSchemes[2].primary,
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'Educational Poster',
              style: isMobile ? AppTheme.headlineMedium : AppTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingM),
            Text(
              'Use our sample poster as inspiration for your weight management education',
              style: AppTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool isMobile) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? AppTheme.spacingL : AppTheme.spacingXxl),
      child: Column(
        children: [
          // Sample Poster Section
          _buildPosterGallerySection(context, isMobile),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Usage Guidelines Section
          _buildUsageGuidelinesSection(isMobile),
        ],
      ),
    );
  }

  /// Poster Gallery Section - Display poster with download functionality
  /// Single Responsibility: Show poster and provide download options
  Widget _buildPosterGallerySection(BuildContext context, bool isMobile) {
    return Card(
      elevation: AppTheme.elevationM,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          gradient: LinearGradient(
            colors: [
              AppTheme.pageColorSchemes[2].primary.withOpacity(0.1),
              AppTheme.pageColorSchemes[0].primary.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingXl),
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingL,
                  vertical: AppTheme.spacingM,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.pageColorSchemes[2].primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusL),
                  border: Border.all(
                    color: AppTheme.pageColorSchemes[2].primary.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.image,
                      size: isMobile ? 24 : 32,
                      color: AppTheme.pageColorSchemes[2].primary,
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Text(
                      'EDUCATIONAL POSTER',
                      style: AppTheme.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.pageColorSchemes[2].primary,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: AppTheme.spacingXl),
              
              // Poster Display
              Container(
                constraints: BoxConstraints(
                  maxWidth: isMobile ? 300 : 500,
                  maxHeight: isMobile ? 400 : 600,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppTheme.radiusL),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppTheme.radiusL),
                  child: Image.asset(
                    'assets/images/poster.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                          color: AppTheme.pageColorSchemes[2].primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(AppTheme.radiusL),
                          border: Border.all(
                            color: AppTheme.pageColorSchemes[2].primary.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_not_supported,
                              size: 64,
                              color: AppTheme.pageColorSchemes[2].primary.withOpacity(0.6),
                            ),
                            const SizedBox(height: AppTheme.spacingM),
                            Text(
                              'Weight Management Poster',
                              style: AppTheme.titleMedium.copyWith(
                                color: AppTheme.pageColorSchemes[2].primary.withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: AppTheme.spacingS),
                            Text(
                              'poster.png',
                              style: AppTheme.bodyMedium.copyWith(
                                color: AppTheme.pageColorSchemes[2].primary.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              
              
              
              const SizedBox(height: AppTheme.spacingL),
              
            ],
          ),
        ),
      ),
    );
  }

  /// Usage Guidelines Section - Simple guidance for using the poster
  /// Single Responsibility: Provide clear usage instructions
  Widget _buildUsageGuidelinesSection(bool isMobile) {
    return Card(
      elevation: AppTheme.elevationS,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingL,
                vertical: AppTheme.spacingM,
              ),
              decoration: BoxDecoration(
                color: AppTheme.pageColorSchemes[1].primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusL),
                border: Border.all(
                  color: AppTheme.pageColorSchemes[1].primary.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.lightbulb,
                    size: isMobile ? 24 : 32,
                    color: AppTheme.pageColorSchemes[1].primary,
                  ),
                  const SizedBox(width: AppTheme.spacingM),
                  Text(
                    'USAGE GUIDELINES',
                    style: AppTheme.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.pageColorSchemes[1].primary,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: AppTheme.spacingXl),
            
            Text(
              'How to Use This Poster',
              style: isMobile ? AppTheme.headlineSmall : AppTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: AppTheme.spacingL),
            
            _buildUsageItem(
              icon: Icons.print,
              title: 'Print & Display',
              description: 'Print the poster in high quality and display in educational settings',
              colorScheme: AppTheme.pageColorSchemes[0],
            ),
            
            const SizedBox(height: AppTheme.spacingM),
            
            _buildUsageItem(
              icon: Icons.school,
              title: 'Educational Tool',
              description: 'Use as a reference during weight management discussions and lessons',
              colorScheme: AppTheme.pageColorSchemes[1],
            ),
            
    
          ],
        ),
      ),
    );
  }

  Widget _buildUsageItem({
    required IconData icon,
    required String title,
    required String description,
    required PageColorScheme colorScheme,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppTheme.radiusS),
            ),
            child: Icon(
              icon,
              size: 24,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  description,
                  style: AppTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Download functionality - Simple download with user feedback
  /// Single Responsibility: Handle poster download
  void _downloadPoster(BuildContext context) {
    // Show download feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.download, color: Colors.white),
            const SizedBox(width: AppTheme.spacingS),
            const Text('Downloading poster...'),
          ],
        ),
        backgroundColor: AppTheme.pageColorSchemes[2].primary,
        duration: const Duration(seconds: 2),
      ),
    );

    // Copy asset path to clipboard as a simple download simulation
    Clipboard.setData(const ClipboardData(text: 'assets/images/poster.png'));
    
    // Show completion message
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: AppTheme.spacingS),
                const Text('Poster path copied to clipboard!'),
              ],
            ),
            backgroundColor: AppTheme.pageColorSchemes[3].primary,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    });
  }
}