import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'module_placeholder_page.dart';

/// Materials page following Single Responsibility Principle
/// Single Responsibility: Display educational materials and resources
class MaterialsPage extends StatelessWidget {
  const MaterialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;
    
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          _buildHeroSection(isMobile),
          
          // Materials Grid
          if (isMobile)
            _buildMobileLayout(context)
          else if (isTablet)
            _buildTabletLayout(context)
          else
            _buildDesktopLayout(context),
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
            AppTheme.pageColorSchemes[1].primary.withOpacity(0.1),
            AppTheme.pageColorSchemes[2].primary.withOpacity(0.1),
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
              Icons.library_books,
              size: isMobile ? 48 : 64,
              color: AppTheme.pageColorSchemes[1].primary,
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'Educational Materials',
              style: isMobile ? AppTheme.headlineMedium : AppTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingM),
            Text(
              'Comprehensive resources to support your weight management journey',
              style: AppTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      child: Column(
        children: [
          _buildMaterialCard(
            title: 'Lesson Plans',
            description: 'Structured learning modules for comprehensive understanding',
            icon: Icons.school,
            colorScheme: AppTheme.pageColorSchemes[0],
            onTap: () => _navigateToPlaceholder(context, ModulePlaceholderPage.lessonPlan()),
          ),
          const SizedBox(height: AppTheme.spacingL),
          _buildMaterialCard(
            title: 'Videos',
            description: 'Educational video content and tutorials',
            icon: Icons.play_circle,
            colorScheme: AppTheme.pageColorSchemes[2],
            onTap: () => _navigateToPlaceholder(context, ModulePlaceholderPage.videos()),
          ),
          const SizedBox(height: AppTheme.spacingL),
          _buildMaterialCard(
            title: 'Poster Making',
            description: 'Create and customize educational posters',
            icon: Icons.design_services,
            colorScheme: AppTheme.pageColorSchemes[3],
            onTap: () => _navigateToPlaceholder(context, ModulePlaceholderPage.posterMaking()),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacingXl),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildMaterialCard(
                  title: 'Lesson Plans',
                  description: 'Structured learning modules for comprehensive understanding',
                  icon: Icons.school,
                  colorScheme: AppTheme.pageColorSchemes[0],
                  onTap: () => _navigateToPlaceholder(context, ModulePlaceholderPage.lessonPlan()),
                ),
              ),
              const SizedBox(width: AppTheme.spacingL),
              Expanded(
                child: _buildMaterialCard(
                  title: 'Videos',
                  description: 'Educational video content and tutorials',
                  icon: Icons.play_circle,
                  colorScheme: AppTheme.pageColorSchemes[2],
                  onTap: () => _navigateToPlaceholder(context, ModulePlaceholderPage.videos()),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingXl),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: _buildMaterialCard(
                title: 'Poster Making',
                description: 'Create and customize educational posters',
                icon: Icons.design_services,
                colorScheme: AppTheme.pageColorSchemes[3],
                onTap: () => _navigateToPlaceholder(context, ModulePlaceholderPage.posterMaking()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacingXxl),
      child: Row(
        children: [
          Expanded(
            child: _buildMaterialCard(
              title: 'Lesson Plans',
              description: 'Structured learning modules for comprehensive understanding',
              icon: Icons.school,
              colorScheme: AppTheme.pageColorSchemes[0],
              onTap: () => _navigateToPlaceholder(context, ModulePlaceholderPage.lessonPlan()),
            ),
          ),
          const SizedBox(width: AppTheme.spacingXl),
          Expanded(
            child: _buildMaterialCard(
              title: 'Videos',
              description: 'Educational video content and tutorials',
              icon: Icons.play_circle,
              colorScheme: AppTheme.pageColorSchemes[2],
              onTap: () => _navigateToPlaceholder(context, ModulePlaceholderPage.videos()),
            ),
          ),
          const SizedBox(width: AppTheme.spacingXl),
          Expanded(
            child: _buildMaterialCard(
              title: 'Poster Making',
              description: 'Create and customize educational posters',
              icon: Icons.design_services,
              colorScheme: AppTheme.pageColorSchemes[3],
              onTap: () => _navigateToPlaceholder(context, ModulePlaceholderPage.posterMaking()),
            ),
          ),
        ],
      ),
    );
  }

  /// Navigate to module placeholder page
  /// Single Responsibility: Handle navigation to placeholder pages
  void _navigateToPlaceholder(BuildContext context, ModulePlaceholderPage placeholderPage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(placeholderPage.moduleTitle),
            backgroundColor: placeholderPage.colorScheme.primary,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          body: Container(
            color: AppTheme.surfaceColor,
            child: placeholderPage,
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialCard({
    required String title,
    required String description,
    required IconData icon,
    required PageColorScheme colorScheme,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: AppTheme.elevationS,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        child: Container(
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
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.spacingXl),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppTheme.spacingL),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusL),
                    border: Border.all(
                      color: colorScheme.primary.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: 48,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingL),
                Text(
                  title,
                  style: AppTheme.titleLarge.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTheme.spacingM),
                Text(
                  description,
                  style: AppTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTheme.spacingL),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingM,
                    vertical: AppTheme.spacingS,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusM),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Explore',
                        style: AppTheme.bodyMedium.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: AppTheme.spacingS),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}