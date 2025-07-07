import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// Single navigation item component
/// Follows Single Responsibility Principle - only handles individual nav item display
class NavigationItem {
  final String title;
  final IconData icon;
  final Widget page;
  final PageColorScheme colorScheme;
  
  const NavigationItem({
    required this.title,
    required this.icon,
    required this.page,
    required this.colorScheme,
  });
}

/// Professional navigation tile widget
class NavigationTile extends StatelessWidget {
  final NavigationItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isCompact;
  
  const NavigationTile({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
    this.isCompact = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingS,
        vertical: AppTheme.spacingXs,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(
              horizontal: isCompact ? AppTheme.spacingS : AppTheme.spacingM,
              vertical: AppTheme.spacingM,
            ),
            decoration: BoxDecoration(
              color: isSelected 
                ? item.colorScheme.primary.withOpacity(0.1)
                : Colors.transparent,
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              border: isSelected 
                ? Border.all(
                    color: item.colorScheme.primary.withOpacity(0.3),
                    width: 1,
                  )
                : null,
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(AppTheme.spacingS),
                  decoration: BoxDecoration(
                    color: isSelected 
                      ? item.colorScheme.primary
                      : AppTheme.textHint.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusS),
                  ),
                  child: Icon(
                    item.icon,
                    size: 20,
                    color: isSelected 
                      ? Colors.white
                      : AppTheme.textSecondary,
                  ),
                ),
                if (!isCompact) ...[
                  const SizedBox(width: AppTheme.spacingM),
                  Expanded(
                    child: Text(
                      item.title,
                      style: AppTheme.titleMedium.copyWith(
                        color: isSelected 
                          ? item.colorScheme.primary
                          : AppTheme.textSecondary,
                        fontWeight: isSelected 
                          ? FontWeight.w600
                          : FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}