import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'navigation_item.dart';

/// Professional mobile drawer navigation
/// Follows Single Responsibility Principle - only handles mobile drawer layout
class MobileDrawer extends StatelessWidget {
  final List<NavigationItem> items;
  final int selectedIndex;
  final Function(int) onItemSelected;
  
  const MobileDrawer({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
  });
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.cardColor,
      child: Column(
        children: [
          // Professional header
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
                        Icons.favorite,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingM),
                    Text(
                      'Weight Management 101',
                      style: AppTheme.headlineSmall.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingXs),
                    Text(
                      'Grade 10 Health Education',
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
                    onTap: () {
                      Navigator.pop(context);
                      onItemSelected(index);
                    },
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
                  Icons.info_outline,
                  size: 16,
                  color: AppTheme.textHint,
                ),
                const SizedBox(width: AppTheme.spacingS),
                Expanded(
                  child: Text(
                    'Tap any module to start learning',
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
}