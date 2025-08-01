import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Navigation drawer following Single Responsibility Principle
/// Single Responsibility: Provide consistent navigation across the app
class AppNavigationDrawer extends StatelessWidget {
  final String? currentRoute;
  
  const AppNavigationDrawer({
    super.key,
    this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.pageColorSchemes[4].primary.withOpacity(0.1),
              AppTheme.pageColorSchemes[0].primary.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              height: 120,
              decoration: BoxDecoration(
                gradient: AppTheme.pageColorSchemes[4].gradient,
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.spacingL),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        size: 32,
                        color: Colors.white,
                      ),
                      const SizedBox(width: AppTheme.spacingM),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weigh Smarter!',
                              style: AppTheme.titleLarge.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Your wellness journey',
                              style: AppTheme.bodyMedium.copyWith(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ],
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
                  _buildNavigationItem(
                    context,
                    icon: Icons.home,
                    title: 'Introduction',
                    route: '/',
                    colorScheme: AppTheme.pageColorSchemes[4],
                  ),
                  _buildNavigationItem(
                    context,
                    icon: Icons.library_books,
                    title: 'Materials',
                    route: '/materials',
                    colorScheme: AppTheme.pageColorSchemes[1],
                  ),
                  _buildNavigationItem(
                    context,
                    icon: Icons.info,
                    title: 'About Us',
                    route: '/about',
                    colorScheme: AppTheme.pageColorSchemes[2],
                  ),
                ],
              ),
            ),
            
            // Footer
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingL),
              child: Text(
                'Version 1.0.0',
                style: AppTheme.bodyMedium.copyWith(
                  color: AppTheme.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
    required PageColorScheme colorScheme,
  }) {
    final isSelected = currentRoute == route;
    
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingM,
        vertical: AppTheme.spacingXs,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        color: isSelected ? colorScheme.primary.withOpacity(0.1) : null,
        border: isSelected 
          ? Border.all(color: colorScheme.primary.withOpacity(0.3))
          : null,
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(AppTheme.spacingS),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppTheme.radiusS),
          ),
          child: Icon(
            icon,
            color: colorScheme.primary,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: AppTheme.titleMedium.copyWith(
            color: isSelected ? colorScheme.primary : AppTheme.textPrimary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        onTap: () {
          Navigator.pop(context); // Close drawer
          if (!isSelected) {
            Navigator.pushReplacementNamed(context, route);
          }
        },
      ),
    );
  }
}