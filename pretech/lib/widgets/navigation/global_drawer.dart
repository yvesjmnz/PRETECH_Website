import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/content_registry.dart';

/// Global navigation drawer following Single Responsibility Principle
/// Responsibility: Provide consistent navigation across all pages
class GlobalDrawer extends StatelessWidget {
  final String? currentRoute;
  
  const GlobalDrawer({
    super.key,
    this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final resources = ContentRegistry.availableResources;
    
    return Drawer(
      backgroundColor: AppTheme.cardColor,
      child: Column(
        children: [
          // Header
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.primaryColor,
                  AppTheme.primaryLight,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppTheme.spacingM),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(AppTheme.radiusL),
                      ),
                      child: const Icon(
                        Icons.school,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingM),
                    Text(
                      'Weigh Smarter!',
                      style: AppTheme.headlineSmall.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingXs),
                    Text(
                      'Learning Resources',
                      style: AppTheme.bodyMedium.copyWith(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Navigation items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
              children: [
                // Home
                _buildNavigationTile(
                  context: context,
                  icon: Icons.home,
                  title: 'Home',
                  route: '/',
                  isSelected: currentRoute == '/',
                ),
                
                const SizedBox(height: AppTheme.spacingS),
                
                // Section header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingM,
                    vertical: AppTheme.spacingS,
                  ),
                  child: Text(
                    'LEARNING MODULES',
                    style: AppTheme.labelLarge.copyWith(
                      color: AppTheme.textHint,
                      fontSize: 11,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                
                // Learning resources
                ...resources.map((resource) {
                  if (resource.isSection) {
                    return _buildSectionHeader(resource.title);
                  } else if (resource.isSubItem) {
                    return _buildSubNavigationTile(
                      context: context,
                      icon: resource.icon,
                      title: resource.title,
                      route: resource.route,
                      isSelected: currentRoute == resource.route,
                    );
                  } else {
                    return _buildNavigationTile(
                      context: context,
                      icon: resource.icon,
                      title: resource.title,
                      route: resource.route,
                      isSelected: currentRoute == resource.route,
                    );
                  }
                }),
              ],
            ),
          ),
          
          // Footer
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              border: Border(
                top: BorderSide(
                  color: AppTheme.dividerColor,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 16,
                  color: AppTheme.textHint,
                ),
                const SizedBox(width: AppTheme.spacingS),
                Expanded(
                  child: Text(
                    'Weight Management Resources',
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.textHint,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String route,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingS,
        vertical: AppTheme.spacingXs,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context); // Close drawer
            if (!isSelected) {
              Navigator.pushReplacementNamed(context, route);
            }
          },
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingM,
              vertical: AppTheme.spacingM,
            ),
            decoration: BoxDecoration(
              color: isSelected 
                ? AppTheme.primaryColor.withOpacity(0.1)
                : Colors.transparent,
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              border: isSelected 
                ? Border.all(
                    color: AppTheme.primaryColor.withOpacity(0.3),
                    width: 1,
                  )
                : null,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppTheme.spacingS),
                  decoration: BoxDecoration(
                    color: isSelected 
                      ? AppTheme.primaryColor
                      : AppTheme.textHint.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusS),
                  ),
                  child: Icon(
                    icon,
                    size: 20,
                    color: isSelected 
                      ? Colors.white
                      : AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Text(
                    title,
                    style: AppTheme.bodyMedium.copyWith(
                      color: isSelected 
                        ? AppTheme.primaryColor
                        : AppTheme.textSecondary,
                      fontWeight: isSelected 
                        ? FontWeight.w600
                        : FontWeight.w500,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    size: 16,
                    color: AppTheme.primaryColor,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppTheme.spacingM,
        right: AppTheme.spacingM,
        top: AppTheme.spacingM,
        bottom: AppTheme.spacingS,
      ),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 16,
            decoration: BoxDecoration(
              color: AppTheme.pageColorSchemes[1].primary, // Using yellow/gold from palette
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: AppTheme.spacingS),
          Text(
            title.toUpperCase(),
            style: AppTheme.labelLarge.copyWith(
              color: AppTheme.pageColorSchemes[1].primary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubNavigationTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String route,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        left: AppTheme.spacingL + AppTheme.spacingS,
        right: AppTheme.spacingS,
        top: AppTheme.spacingXs,
        bottom: AppTheme.spacingXs,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context); // Close drawer
            if (!isSelected) {
              Navigator.pushReplacementNamed(context, route);
            }
          },
          borderRadius: BorderRadius.circular(AppTheme.radiusS),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingM,
              vertical: AppTheme.spacingS,
            ),
            decoration: BoxDecoration(
              color: isSelected 
                ? AppTheme.pageColorSchemes[2].primary.withOpacity(0.1) // Using red from palette
                : Colors.transparent,
              borderRadius: BorderRadius.circular(AppTheme.radiusS),
              border: isSelected 
                ? Border.all(
                    color: AppTheme.pageColorSchemes[2].primary.withOpacity(0.3),
                    width: 1,
                  )
                : null,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: isSelected 
                      ? AppTheme.pageColorSchemes[2].primary
                      : AppTheme.pageColorSchemes[2].primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    icon,
                    size: 16,
                    color: isSelected 
                      ? Colors.white
                      : AppTheme.pageColorSchemes[2].primary,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingS),
                Expanded(
                  child: Text(
                    title,
                    style: AppTheme.bodyMedium.copyWith(
                      color: isSelected 
                        ? AppTheme.pageColorSchemes[2].primary
                        : AppTheme.textSecondary,
                      fontWeight: isSelected 
                        ? FontWeight.w600
                        : FontWeight.w500,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (isSelected)
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppTheme.pageColorSchemes[2].primary,
                      shape: BoxShape.circle,
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