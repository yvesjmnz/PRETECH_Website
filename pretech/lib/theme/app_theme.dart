import 'package:flutter/material.dart';

/// Professional theme system following Material Design 3 principles
/// Designed for 10th grade students - modern but approachable
class AppTheme {
  // Primary color palette - professional teal
  static const Color primaryColor = Color(0xFF00695C);
  static const Color primaryLight = Color(0xFF4DB6AC);
  static const Color primaryDark = Color(0xFF004D40);
  
  // Surface colors
  static const Color surfaceColor = Color(0xFFFAFAFA);
  static const Color cardColor = Colors.white;
  static const Color dividerColor = Color(0xFFE0E0E0);
  
  // Text colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFF9E9E9E);
  
  // Page-specific color schemes
  static const List<PageColorScheme> pageColorSchemes = [
    PageColorScheme(
      primary: Color(0xFF00695C),
      secondary: Color(0xFF4DB6AC),
      accent: Color(0xFFB2DFDB),
      name: 'Concept Map',
    ),
    PageColorScheme(
      primary: Color(0xFFE65100),
      secondary: Color(0xFFFF9800),
      accent: Color(0xFFFFE0B2),
      name: 'Nutritional Habits',
    ),
    PageColorScheme(
      primary: Color(0xFF2E7D32),
      secondary: Color(0xFF4CAF50),
      accent: Color(0xFFC8E6C9),
      name: 'Physical Activities',
    ),
    PageColorScheme(
      primary: Color(0xFFC62828),
      secondary: Color(0xFFF44336),
      accent: Color(0xFFFFCDD2),
      name: 'Health Benefits',
    ),
    PageColorScheme(
      primary: Color(0xFF1565C0),
      secondary: Color(0xFF2196F3),
      accent: Color(0xFFBBDEFB),
      name: 'Importance',
    ),
  ];
  
  // Typography scale
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.25,
    color: textPrimary,
  );
  
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    color: textPrimary,
  );
  
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: textPrimary,
  );
  
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: textPrimary,
  );
  
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: textPrimary,
  );
  
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    color: textPrimary,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
    color: textPrimary,
  );
  
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
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