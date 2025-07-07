import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'navigation_item.dart';

/// Professional sidebar navigation component
/// Follows Single Responsibility Principle - only handles sidebar layout and navigation
class SidebarNavigation extends StatelessWidget {
  final List<NavigationItem> items;
  final int selectedIndex;
  final Function(int) onItemSelected;
  
  const SidebarNavigation({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        border: Border(
          right: BorderSide(
            color: AppTheme.dividerColor,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingL),
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
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppTheme.spacingS),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppTheme.radiusM),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Weight Management',
                        style: AppTheme.titleLarge.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Grade 10 Health Education',
                        style: AppTheme.bodyMedium.copyWith(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Navigation Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
              children: [
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
                const SizedBox(height: AppTheme.spacingS),
                ...items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  
                  return NavigationTile(
                    item: item,
                    isSelected: index == selectedIndex,
                    onTap: () => onItemSelected(index),
                  );
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
                  Icons.school,
                  size: 16,
                  color: AppTheme.textHint,
                ),
                const SizedBox(width: AppTheme.spacingS),
                Text(
                  'Interactive Learning Platform',
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.textHint,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}