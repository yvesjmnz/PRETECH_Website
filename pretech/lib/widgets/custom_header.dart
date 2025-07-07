import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Professional header component following Material Design 3
/// Single Responsibility: Display page header with consistent styling
class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData icon;
  final PageColorScheme colorScheme;
  
  const CustomHeader({
    super.key, 
    required this.title,
    required this.icon,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        
        return Container(
          decoration: BoxDecoration(
            gradient: colorScheme.gradient,
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? AppTheme.spacingM : AppTheme.spacingL,
                vertical: AppTheme.spacingS, // Reduced padding to prevent overflow
              ),
              child: Row(
                children: [
                  // Icon container
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      key: ValueKey(icon),
                      padding: const EdgeInsets.all(AppTheme.spacingS), // Reduced padding
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(AppTheme.radiusS),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        icon,
                        size: 24, // Fixed size to prevent overflow
                        color: Colors.white,
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: AppTheme.spacingM),
                  
                  // Title section - using Flexible instead of Expanded to prevent overflow
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            title,
                            key: ValueKey(title),
                            style: AppTheme.titleMedium.copyWith( // Consistent smaller font size
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: isMobile ? 16 : 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        // Removed subtitle to prevent overflow - following YAGNI principle
                        // Only show essential information in header
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64); // Reduced height to match content
}