import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/content_registry.dart';

/// Introduction page following Single Responsibility Principle
/// Single Responsibility: Display comprehensive introduction to weight management
class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;
    
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section - Full Width
          _buildHeroSection(context, isMobile),
          
          // Main Content with Asymmetrical Layout
          if (isMobile)
            _buildMobileLayout()
          else if (isTablet)
            _buildTabletLayout()
          else
            _buildDesktopLayout(),
        ],
      ),
    );
  }

  // Hero Section - Full width with gradient background
  Widget _buildHeroSection(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? AppTheme.spacingL : AppTheme.spacingXxl,
          vertical: isMobile ? AppTheme.spacingXl : AppTheme.spacingXxl * 2,
        ),
        child: Row(
          children: [
            Expanded(
              flex: isMobile ? 1 : 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.favorite,
                    size: isMobile ? 48 : 64,
                    color: AppTheme.pageColorSchemes[4].primary,
                  ),
                  const SizedBox(height: AppTheme.spacingL),
                  Text(
                    'Welcome to Weigh Smarter!',
                    style: isMobile ? AppTheme.headlineMedium : AppTheme.headlineLarge,
                  ),
                  const SizedBox(height: AppTheme.spacingL),
                  Text(
                    'Navigating the journey toward healthy weight management and overall well-being can feel complex, filled with conflicting advice and overwhelming choices.',
                    style: AppTheme.bodyLarge,
                  ),
                  const SizedBox(height: AppTheme.spacingXl),
                  Container(
                    padding: const EdgeInsets.all(AppTheme.spacingL),
                    decoration: BoxDecoration(
                      color: AppTheme.cardColor,
                      borderRadius: BorderRadius.circular(AppTheme.radiusL),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      'This resource website is designed to cut through the noise and provide you with clear, practical, and science-backed information.',
                      style: AppTheme.titleMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (!isMobile) ...[
              const SizedBox(width: AppTheme.spacingXxl),
              Expanded(
                flex: 2,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppTheme.radiusL),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppTheme.radiusL),
                    child: Image.asset(
                      'images/welcome.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppTheme.pageColorSchemes[1].primary.withOpacity(0.3),
                                AppTheme.pageColorSchemes[2].primary.withOpacity(0.3),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(AppTheme.radiusL),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.health_and_safety,
                                  size: 80,
                                  color: AppTheme.pageColorSchemes[4].primary.withOpacity(0.7),
                                ),
                                const SizedBox(height: AppTheme.spacingS),
                                Text(
                                  'Welcome Image',
                                  style: AppTheme.bodyMedium.copyWith(
                                    color: AppTheme.pageColorSchemes[4].primary.withOpacity(0.8),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Mobile Layout - Stacked cards
  Widget _buildMobileLayout() {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      child: Column(
        children: [
          _buildMissionSection(true),
          const SizedBox(height: AppTheme.spacingXxl),
          _buildCoreConceptsSection(true),
          const SizedBox(height: AppTheme.spacingXl),
          _buildUnderstandingWhySection(true),
          const SizedBox(height: AppTheme.spacingXl),
          _buildNutritionalFoundationsSection(true),
          const SizedBox(height: AppTheme.spacingXl),
          _buildPhysicalActivitySection(true),
          const SizedBox(height: AppTheme.spacingXxl),
          _buildQuickActionsSection(),
        ],
      ),
    );
  }

  // Tablet Layout - Two column grid
  Widget _buildTabletLayout() {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacingXl),
      child: Column(
        children: [
          // Mission takes full width
          _buildMissionSection(false),
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Core concepts full width with enhanced styling
          _buildCoreConceptsSection(false),
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Two column layout for remaining sections
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildUnderstandingWhySection(false),
                    const SizedBox(height: AppTheme.spacingXl),
                    _buildNutritionalFoundationsSection(false),
                  ],
                ),
              ),
              const SizedBox(width: AppTheme.spacingXl),
              Expanded(
                child: _buildPhysicalActivitySection(false),
              ),
            ],
          ),
          
          const SizedBox(height: AppTheme.spacingXxl),
          _buildQuickActionsSection(),
        ],
      ),
    );
  }

  // Desktop Layout - Centered mission with enhanced core concepts
  Widget _buildDesktopLayout() {
    return Column(
      children: [
        // Mission section - centered
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingXxl,
            vertical: AppTheme.spacingXl,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1300),
              child: _buildMissionSection(false),
            ),
          ),
        ),
        
        const SizedBox(height: AppTheme.spacingXxl),
        
        // Core concepts - enhanced with full width and special styling
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.pageColorSchemes[0].primary.withOpacity(0.05),
                AppTheme.pageColorSchemes[1].primary.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingXxl,
              vertical: AppTheme.spacingXxl,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: _buildCoreConceptsSection(false),
              ),
            ),
          ),
        ),
        
        const SizedBox(height: AppTheme.spacingXxl),
        
        // Three column layout for remaining sections
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingXxl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left column - Understanding Why (offset down)
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const SizedBox(height: AppTheme.spacingXxl),
                    _buildUnderstandingWhySection(false),
                  ],
                ),
              ),
              
              const SizedBox(width: AppTheme.spacingXl),
              
              // Center column - Nutritional Foundations
              Expanded(
                flex: 3,
                child: _buildNutritionalFoundationsSection(false),
              ),
              
              const SizedBox(width: AppTheme.spacingXl),
              
              // Right column - Physical Activity (offset down)
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const SizedBox(height: AppTheme.spacingXl),
                    _buildPhysicalActivitySection(false),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: AppTheme.spacingXxl),
        
        // Quick Action Buttons Section
        _buildQuickActionsSection(),
        
        const SizedBox(height: AppTheme.spacingXxl),
      ],
    );
  }
  
  Widget _buildCoreConceptsSection(bool isMobile) {
    return Card(
      elevation: AppTheme.elevationM,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          gradient: LinearGradient(
            colors: [
              AppTheme.pageColorSchemes[0].primary.withOpacity(0.1),
              AppTheme.pageColorSchemes[1].primary.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: AppTheme.pageColorSchemes[0].primary.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingXxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Enhanced header with icon and badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingL,
                  vertical: AppTheme.spacingM,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.pageColorSchemes[0].primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusL),
                  border: Border.all(
                    color: AppTheme.pageColorSchemes[0].primary.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.lightbulb,
                      size: isMobile ? 32 : 40,
                      color: AppTheme.pageColorSchemes[0].primary,
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Text(
                      'CORE CONCEPTS',
                      style: AppTheme.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.pageColorSchemes[0].primary,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppTheme.spacingXl),
              
              // Main title
              Text(
                'Sustainable Weight Management',
                style: isMobile ? AppTheme.headlineSmall : AppTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppTheme.spacingL),
              
              // Description with enhanced styling
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                decoration: BoxDecoration(
                  color: AppTheme.cardColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(AppTheme.radiusL),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  'Here, you\'ll find comprehensive guidance based on the core concepts of sustainable weight management. Our evidence-based approach focuses on long-term health and wellness.',
                  style: AppTheme.bodyLarge.copyWith(
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              const SizedBox(height: AppTheme.spacingXl),
              
              // Call to action
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingL,
                  vertical: AppTheme.spacingM,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.pageColorSchemes[0].primary.withOpacity(0.8),
                      AppTheme.pageColorSchemes[1].primary.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(AppTheme.radiusL),
                ),
                child: Text(
                  'Explore the fundamentals below',
                  style: AppTheme.titleMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildUnderstandingWhySection(bool isMobile) {
    return Card(
      elevation: AppTheme.elevationS,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.psychology,
                  size: isMobile ? 32 : 40,
                  color: AppTheme.pageColorSchemes[4].primary,
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Text(
                    'Understanding the "Why"',
                    style: AppTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'Explore the crucial reasons why managing your weight is vital for long-term health, disease prevention, and enhancing your quality of life.',
              style: AppTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildNutritionalFoundationsSection(bool isMobile) {
    return Card(
      elevation: AppTheme.elevationS,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.restaurant,
                  size: isMobile ? 32 : 40,
                  color: AppTheme.pageColorSchemes[1].primary,
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Text(
                    'Building Nutritional Foundations',
                    style: AppTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'Dive deep into Nutrition Education, learning about essential food groups and developing sound Nutritional Habits. Discover Recommended Diets for Weight Management, including the benefits and applications of:',
              style: AppTheme.bodyLarge,
            ),
            const SizedBox(height: AppTheme.spacingL),
            _buildDietList(isMobile),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDietList(bool isMobile) {
    final diets = [
      'High-Fiber Diets',
      'Low-Fat Diets',
      'Very-Low-Calorie Diets (with appropriate guidance)',
      'Diet Habits for Weight-gain',
    ];
    
    return Column(
      children: diets.map((diet) => Padding(
        padding: const EdgeInsets.only(bottom: AppTheme.spacingS),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppTheme.pageColorSchemes[1].primary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Text(
                diet,
                style: AppTheme.bodyLarge,
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }
  
  Widget _buildPhysicalActivitySection(bool isMobile) {
    return Card(
      elevation: AppTheme.elevationS,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.fitness_center,
                  size: isMobile ? 32 : 40,
                  color: AppTheme.pageColorSchemes[2].primary,
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Text(
                    'Harnessing the Power of Movement',
                    style: AppTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'Learn about Recommended Physical Activities and their profound Health Benefits. We\'ll break down different modalities to help you build a balanced routine:',
              style: AppTheme.bodyLarge,
            ),
            const SizedBox(height: AppTheme.spacingL),
            _buildActivityList(isMobile),
          ],
        ),
      ),
    );
  }
  
  Widget _buildActivityList(bool isMobile) {
    final activities = [
      'Aerobic (Cardio) Activities',
      'High-Intensity Interval Training (HIIT)',
      'Strength/Resistance Training',
    ];
    
    return Column(
      children: activities.map((activity) => Padding(
        padding: const EdgeInsets.only(bottom: AppTheme.spacingS),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppTheme.pageColorSchemes[2].primary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Text(
                activity,
                style: AppTheme.bodyLarge,
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }
  
  Widget _buildMissionSection(bool isMobile) {
    return Card(
      elevation: AppTheme.elevationS,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          gradient: LinearGradient(
            colors: [
              AppTheme.pageColorSchemes[4].primary.withOpacity(0.2),
              AppTheme.pageColorSchemes[0].primary.withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingXl),
          child: isMobile 
            ? _buildMissionContent(isMobile)
            : Row(
                children: [
                  // Mission GIF on the left
                  Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppTheme.radiusL),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppTheme.radiusL),
                      child: Image.asset(
                        'images/mission.gif',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: BoxDecoration(
                              color: AppTheme.pageColorSchemes[4].primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(AppTheme.radiusL),
                              border: Border.all(
                                color: AppTheme.pageColorSchemes[4].primary.withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.rocket_launch,
                                  size: 60,
                                  color: AppTheme.pageColorSchemes[4].primary.withOpacity(0.6),
                                ),
                                const SizedBox(height: AppTheme.spacingS),
                                Text(
                                  'Mission',
                                  style: AppTheme.bodyMedium.copyWith(
                                    color: AppTheme.pageColorSchemes[4].primary.withOpacity(0.8),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: AppTheme.spacingXl),
                  // Mission content on the right
                  Expanded(
                    child: _buildMissionContent(isMobile),
                  ),
                ],
              ),
        ),
      ),
    );
  }

  Widget _buildMissionContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.rocket_launch,
          size: isMobile ? 40 : 48,
          color: AppTheme.pageColorSchemes[4].primary,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'Our Mission',
          style: isMobile ? AppTheme.headlineSmall : AppTheme.headlineMedium,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'Our mission is to empower you with knowledge, and offer actionable strategies. We believe sustainable weight management isn\'t about quick fixes, but about cultivating informed habits for nutrition and physical activity that support a healthier, more vibrant you.',
          style: AppTheme.bodyLarge,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Container(
          padding: const EdgeInsets.all(AppTheme.spacingL),
          decoration: BoxDecoration(
            color: AppTheme.cardColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(AppTheme.radiusL),
            border: Border.all(
              color: AppTheme.pageColorSchemes[4].primary.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Text(
            'Explore our resources and take the next step on your personalized wellness journey.',
            style: AppTheme.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  /// Quick Actions Section - Horizontal layout for desktop, vertical for mobile
  /// Single Responsibility: Provide quick navigation to key resources
  Widget _buildQuickActionsSection() {
    return Builder(
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isMobile = screenWidth < 600;
        final isTablet = screenWidth >= 600 && screenWidth < 1200;
        
        // Define the 3 lessons
        final lessons = [
          {
            'title': 'Lesson 1',
            'description': 'Weight Management Fundamentals',
            'icon': Icons.school,
            'colorScheme': AppTheme.pageColorSchemes[1], // Yellow
            'route': '/materials',
          },
          {
            'title': 'Lesson 2',
            'description': 'Advanced Weight Management',
            'icon': Icons.school,
            'colorScheme': AppTheme.pageColorSchemes[2], // Red
            'route': '/materials',
          },
          {
            'title': 'Lesson 3',
            'description': 'Lifestyle Integration',
            'icon': Icons.school,
            'colorScheme': AppTheme.pageColorSchemes[3], // Green
            'route': '/materials',
          },
        ];
        
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.pageColorSchemes[0].primary.withOpacity(0.05),
                AppTheme.pageColorSchemes[2].primary.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? AppTheme.spacingL : AppTheme.spacingXxl,
              vertical: AppTheme.spacingXxl,
            ),
            child: Column(
              children: [
                // Section Header
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingL,
                    vertical: AppTheme.spacingM,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.pageColorSchemes[0].primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusL),
                    border: Border.all(
                      color: AppTheme.pageColorSchemes[0].primary.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.explore,
                        size: isMobile ? 24 : 32,
                        color: AppTheme.pageColorSchemes[0].primary,
                      ),
                      const SizedBox(width: AppTheme.spacingM),
                      Text(
                        'QUICK ACTIONS',
                        style: AppTheme.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.pageColorSchemes[0].primary,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: AppTheme.spacingL),
                
                Text(
                  'Choose your lesson to begin your weight management journey',
                  style: AppTheme.titleLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: AppTheme.spacingXl),
                
                // Lesson Cards Layout
                if (isMobile)
                  _buildMobileLessons(lessons)
                else if (isTablet)
                  _buildTabletLessons(lessons)
                else
                  _buildDesktopLessons(lessons),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileLessons(List<Map<String, dynamic>> lessons) {
    return Column(
      children: lessons.map((lesson) => Padding(
        padding: const EdgeInsets.only(bottom: AppTheme.spacingL),
        child: _buildLessonCard(lesson, true),
      )).toList(),
    );
  }

  Widget _buildTabletLessons(List<Map<String, dynamic>> lessons) {
    return Wrap(
      spacing: AppTheme.spacingL,
      runSpacing: AppTheme.spacingL,
      alignment: WrapAlignment.center,
      children: lessons.map((lesson) => 
        SizedBox(
          width: 280,
          child: _buildLessonCard(lesson, false),
        )
      ).toList(),
    );
  }

  Widget _buildDesktopLessons(List<Map<String, dynamic>> lessons) {
    return Row(
      children: lessons.asMap().entries.map((entry) {
        final index = entry.key;
        final lesson = entry.value;
        return [
          Expanded(child: _buildLessonCard(lesson, false)),
          if (index < lessons.length - 1) const SizedBox(width: AppTheme.spacingL),
        ];
      }).expand((widgets) => widgets).toList(),
    );
  }

  Widget _buildLessonCard(Map<String, dynamic> lesson, bool isMobile) {
    final colorScheme = lesson['colorScheme'] as PageColorScheme;
    
    return Builder(
      builder: (context) => Card(
        elevation: AppTheme.elevationM,
        child: InkWell(
          onTap: () => Navigator.of(context).pushReplacementNamed(lesson['route']),
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
              border: Border.all(
                color: colorScheme.primary.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.spacingXl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppTheme.spacingL),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppTheme.radiusXl),
                      border: Border.all(
                        color: colorScheme.primary.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      lesson['icon'],
                      size: isMobile ? 40 : 48,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingL),
                  Text(
                    lesson['title'],
                    style: AppTheme.headlineSmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  Text(
                    lesson['description'],
                    style: AppTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppTheme.spacingL),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.spacingL,
                      vertical: AppTheme.spacingM,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          colorScheme.primary.withOpacity(0.8),
                          colorScheme.primary.withOpacity(0.6),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(AppTheme.radiusL),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Start Module',
                          style: AppTheme.titleMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: AppTheme.spacingS),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}