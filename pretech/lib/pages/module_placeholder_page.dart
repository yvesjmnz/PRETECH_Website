import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Module placeholder page following Single Responsibility Principle
/// Single Responsibility: Display placeholder content for modules in development
class ModulePlaceholderPage extends StatelessWidget {
  final String moduleTitle;
  final String moduleDescription;
  final IconData moduleIcon;
  final PageColorScheme colorScheme;

  const ModulePlaceholderPage({
    super.key,
    required this.moduleTitle,
    required this.moduleDescription,
    required this.moduleIcon,
    required this.colorScheme,
  });

  /// Factory constructors for common module types
  factory ModulePlaceholderPage.lessonPlan() {
    return ModulePlaceholderPage(
      moduleTitle: 'Lesson Plans',
      moduleDescription: 'Structured learning modules for comprehensive weight management education',
      moduleIcon: Icons.school,
      colorScheme: AppTheme.pageColorSchemes[0],
    );
  }

  factory ModulePlaceholderPage.videos() {
    return ModulePlaceholderPage(
      moduleTitle: 'Video Library',
      moduleDescription: 'Educational video content and interactive tutorials',
      moduleIcon: Icons.play_circle,
      colorScheme: AppTheme.pageColorSchemes[2],
    );
  }

  factory ModulePlaceholderPage.posterMaking() {
    return ModulePlaceholderPage(
      moduleTitle: 'Poster Making',
      moduleDescription: 'Create and customize educational posters and infographics',
      moduleIcon: Icons.design_services,
      colorScheme: AppTheme.pageColorSchemes[3],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          _buildHeroSection(isMobile),
          
          // Content Section
          _buildContentSection(context, isMobile),
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
            colorScheme.primary.withOpacity(0.1),
            colorScheme.secondary.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? AppTheme.spacingL : AppTheme.spacingXxl),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingL),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusXl),
                border: Border.all(
                  color: colorScheme.primary.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Icon(
                moduleIcon,
                size: isMobile ? 48 : 64,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              moduleTitle,
              style: isMobile ? AppTheme.headlineMedium : AppTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingM),
            Text(
              moduleDescription,
              style: AppTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection(BuildContext context, bool isMobile) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? AppTheme.spacingL : AppTheme.spacingXxl),
      child: Column(
        children: [
          // Coming Soon Card
          _buildComingSoonCard(isMobile),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Features Preview
          _buildFeaturesPreview(isMobile),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Back to Materials Button
          _buildBackButton(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildComingSoonCard(bool isMobile) {
    return Card(
      elevation: AppTheme.elevationM,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          gradient: LinearGradient(
            colors: [
              colorScheme.primary.withOpacity(0.1),
              colorScheme.primary.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: colorScheme.primary.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingXxl),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingL,
                  vertical: AppTheme.spacingM,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusL),
                  border: Border.all(
                    color: colorScheme.primary.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.construction,
                      size: isMobile ? 24 : 32,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Text(
                      'COMING SOON',
                      style: AppTheme.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: AppTheme.spacingXl),
              
              Text(
                'Module In Development',
                style: isMobile ? AppTheme.headlineSmall : AppTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: AppTheme.spacingL),
              
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                decoration: BoxDecoration(
                  color: AppTheme.cardColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(AppTheme.radiusL),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  'We\'re working hard to bring you comprehensive educational content. This module will include interactive lessons, practical exercises, and valuable resources to support your weight management journey.',
                  style: AppTheme.bodyLarge.copyWith(height: 1.6),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesPreview(bool isMobile) {
    final features = _getModuleFeatures();
    
    return Card(
      elevation: AppTheme.elevationS,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.preview,
                  size: isMobile ? 24 : 32,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: AppTheme.spacingM),
                Text(
                  'What to Expect',
                  style: isMobile ? AppTheme.titleLarge : AppTheme.headlineSmall,
                ),
              ],
            ),
            
            const SizedBox(height: AppTheme.spacingL),
            
            ...features.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: AppTheme.spacingM),
              child: _buildFeatureItem(feature['title']!, feature['description']!),
            )).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String title, String description) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
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

  Widget _buildBackButton(BuildContext context, bool isMobile) {
    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: ElevatedButton.icon(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back),
        label: const Text('Back to Materials'),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? AppTheme.spacingXl : AppTheme.spacingL,
            vertical: AppTheme.spacingM,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusL),
          ),
          elevation: AppTheme.elevationS,
        ),
      ),
    );
  }

  List<Map<String, String>> _getModuleFeatures() {
    switch (moduleIcon) {
      case Icons.school:
        return [
          {
            'title': 'Interactive Lessons',
            'description': 'Step-by-step guided learning with practical exercises and assessments',
          },
          {
            'title': 'Progress Tracking',
            'description': 'Monitor your learning journey with detailed progress indicators',
          },
          {
            'title': 'Downloadable Resources',
            'description': 'Access lesson materials, worksheets, and reference guides offline',
          },
          {
            'title': 'Expert Content',
            'description': 'Evidence-based information from nutrition and health professionals',
          },
        ];
      case Icons.play_circle:
        return [
          {
            'title': 'HD Video Content',
            'description': 'High-quality educational videos with clear audio and visuals',
          },
          {
            'title': 'Interactive Tutorials',
            'description': 'Hands-on video guides for practical weight management techniques',
          },
          {
            'title': 'Expert Interviews',
            'description': 'Insights from nutritionists, fitness experts, and health professionals',
          },
          {
            'title': 'Closed Captions',
            'description': 'Accessible content with subtitles and transcript options',
          },
        ];
      case Icons.design_services:
        return [
          {
            'title': 'Design Templates',
            'description': 'Professional poster templates for various health topics',
          },
          {
            'title': 'Customization Tools',
            'description': 'Easy-to-use editor for personalizing colors, text, and images',
          },
          {
            'title': 'Educational Graphics',
            'description': 'Library of health-related icons, charts, and infographic elements',
          },
          {
            'title': 'Export Options',
            'description': 'Download your creations in multiple formats for printing or sharing',
          },
        ];
      case Icons.folder:
        return [
          {
            'title': 'Lesson Plans',
            'description': 'Structured learning modules with comprehensive weight management curriculum',
          },
          {
            'title': 'Video Library',
            'description': 'Educational video content and interactive tutorials from health experts',
          },
          {
            'title': 'Poster Making Tools',
            'description': 'Create custom educational posters and infographics for learning',
          },
          {
            'title': 'Assessment Resources',
            'description': 'Quizzes, worksheets, and progress tracking tools for effective learning',
          },
        ];
      default:
        return [
          {
            'title': 'Comprehensive Content',
            'description': 'Detailed educational materials covering all aspects of the topic',
          },
          {
            'title': 'Interactive Elements',
            'description': 'Engaging activities and exercises to enhance learning',
          },
          {
            'title': 'Progress Tracking',
            'description': 'Monitor your advancement through the module content',
          },
          {
            'title': 'Expert Resources',
            'description': 'Access to professional insights and evidence-based information',
          },
        ];
    }
  }
}