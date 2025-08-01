import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Professional header component following Material Design 3
/// Single Responsibility: Display page header with consistent styling and navigation
class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData icon;
  final PageColorScheme colorScheme;
  final bool showMenuButton;
  final String? currentRoute;
  
  const CustomHeader({
    super.key, 
    required this.title,
    required this.icon,
    required this.colorScheme,
    this.showMenuButton = true,
    this.currentRoute,
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
                vertical: AppTheme.spacingS,
              ),
              child: Row(
                children: [
                  // Menu button
                  if (showMenuButton)
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        tooltip: 'Open navigation menu',
                      ),
                    ),
                  
                  // Icon container
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      key: ValueKey(icon),
                      padding: const EdgeInsets.all(AppTheme.spacingS),
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
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: AppTheme.spacingM),
                  
                  // Title section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            title,
                            key: ValueKey(title),
                            style: AppTheme.titleMedium.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: isMobile ? 16 : 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        if (!isMobile) ...[
                          const SizedBox(height: AppTheme.spacingXs),
                          Text(
                            'Weigh Smarter!',
                            style: AppTheme.bodyMedium.copyWith(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  
                  // Home button
                  if (currentRoute != '/')
                    IconButton(
                      icon: const Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                      tooltip: 'Go to home',
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
  Size get preferredSize => const Size.fromHeight(64);
}