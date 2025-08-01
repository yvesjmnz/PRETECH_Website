import 'package:flutter/material.dart';

/// Nature-inspired theme system with earthy, calming colors
/// Designed for educational content - promoting wellness and natural health
class AppTheme {
  // Primary color palette - nature-inspired colors
  static const Color primaryColor = Color(0xFF28603D); // Dark green
  static const Color primaryLight = Color(0xFF4A8B5C); // Medium green
  static const Color primaryDark = Color(0xFF1A4029); // Darker green
  
  // Surface colors - soft, natural backgrounds
  static const Color surfaceColor = Color(0xFFEAF0E7); // Light green/cream
  static const Color cardColor = Color(0xFFF5F8F3); // Very light green
  static const Color dividerColor = Color(0xFFD4E0D1); // Light green divider
  
  // Text colors - dark on light for readability
  static const Color textPrimary = Color(0xFF1A4029); // Dark green text
  static const Color textSecondary = Color(0xFF28603D); // Primary green
  static const Color textHint = Color(0xFF6B8E6B); // Medium green hint
  
  // Page-specific color schemes - nature and wellness inspired
  static const List<PageColorScheme> pageColorSchemes = [
    PageColorScheme(
      primary: Color(0xFF28603D), // Dark green
      secondary: Color(0xFF4A8B5C), // Medium green
      accent: Color(0xFFEAF0E7), // Light green/cream
      name: 'Concept Map',
    ),
    PageColorScheme(
      primary: Color(0xFFEDBB58), // Yellow/gold
      secondary: Color(0xFFF5D982), // Light yellow
      accent: Color(0xFFFDF6E3), // Very light yellow
      name: 'Nutritional Habits',
    ),
    PageColorScheme(
      primary: Color(0xFFC3443B), // Red
      secondary: Color(0xFFD66B62), // Light red
      accent: Color(0xFFFAEAE8), // Very light red
      name: 'Physical Activities',
    ),
    PageColorScheme(
      primary: Color(0xFF28603D), // Dark green
      secondary: Color(0xFF6B8E6B), // Medium green
      accent: Color(0xFFEAF0E7), // Light green/cream
      name: 'Health Benefits',
    ),
    PageColorScheme(
      primary: Color(0xFFEDBB58), // Yellow/gold
      secondary: Color(0xFF28603D), // Dark green
      accent: Color(0xFFEAF0E7), // Light green/cream
      name: 'Importance',
    ),
  ];
  
  // Typography scale - larger fonts for better readability
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.25,
    color: textPrimary,
  );
  
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    color: textPrimary,
  );
  
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: textPrimary,
  );
  
  static const TextStyle titleLarge = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: textPrimary,
  );
  
  static const TextStyle titleMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: textPrimary,
  );
  
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    color: textPrimary,
    height: 1.5,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
    color: textPrimary,
    height: 1.4,
  );
  
  static const TextStyle labelLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: textPrimary,
  );
  
  // Spacing system
  static const double spacingXs = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingXxl = 48.0;
  
  // Border radius
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXl = 24.0;
  
  // Elevation
  static const double elevationS = 2.0;
  static const double elevationM = 4.0;
  static const double elevationL = 8.0;
  
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        surface: surfaceColor,
      ),
      scaffoldBackgroundColor: surfaceColor,
      cardTheme: const CardThemeData(
        color: cardColor,
        elevation: elevationS,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radiusM)),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: elevationS,
          padding: const EdgeInsets.symmetric(
            horizontal: spacingL,
            vertical: spacingM,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radiusL)),
          ),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        labelLarge: labelLarge,
      ),
    );
  }
}

/// Page-specific color scheme for consistent theming
class PageColorScheme {
  final Color primary;
  final Color secondary;
  final Color accent;
  final String name;
  
  const PageColorScheme({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.name,
  });
  
  LinearGradient get gradient => LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  Color get onPrimary => Colors.white;
  Color get onSecondary => Colors.white;
}