import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Lesson 1 Module Page - Weight Management Fundamentals
/// Single Responsibility: Display comprehensive weight management educational content
class Lesson1ModulePage extends StatelessWidget {
  const Lesson1ModulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final colorScheme = AppTheme.pageColorSchemes[1]; // Yellow/gold theme
    
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          _buildHeroSection(colorScheme, isMobile),
          
          // Content Section
          _buildContentSection(context, colorScheme, isMobile),
        ],
      ),
    );
  }

  Widget _buildHeroSection(PageColorScheme colorScheme, bool isMobile) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withOpacity(0.1),
            colorScheme.secondary.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? AppTheme.spacingL : AppTheme.spacingXxl),
        child: Column(
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
                Icons.school,
                size: isMobile ? 48 : 64,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'Lesson 1: Weight Management Fundamentals',
              style: isMobile ? AppTheme.headlineMedium : AppTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingM),
            Text(
              'Understanding the basics of healthy weight management through science-based approaches',
              style: AppTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection(BuildContext context, PageColorScheme colorScheme, bool isMobile) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? AppTheme.spacingL : AppTheme.spacingXxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // What is Weight Management Section
          _buildSection(
            title: '1. What is Weight Management?',
            content: _buildWeightManagementContent(),
            colorScheme: colorScheme,
            isMobile: isMobile,
          ),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Factors Affecting Weight Section
          _buildFactorsSection(colorScheme, isMobile),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Myth vs Fact Section
          _buildMythFactSection(colorScheme, isMobile),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Significance and Importance Section
          _buildSection(
            title: '2. Significance and Importance of Weight Management',
            content: _buildSignificanceContent(),
            colorScheme: colorScheme,
            isMobile: isMobile,
          ),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Benefits Section
          _buildBenefitsSection(colorScheme, isMobile),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Fun Fact Section
          _buildFunFactSection(colorScheme, isMobile),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Navigation Section
          _buildNavigationSection(context, colorScheme, isMobile),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Widget content,
    required PageColorScheme colorScheme,
    required bool isMobile,
  }) {
    return Card(
      elevation: AppTheme.elevationM,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: isMobile ? AppTheme.titleLarge : AppTheme.headlineSmall,
            ),
            const SizedBox(height: AppTheme.spacingL),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildWeightManagementContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Weight Management Concept Image
        _buildResponsiveImage(
          'assets/images/lesson1image1.jpeg',
          'Weight Management Concept',
          mobileHeight: 200,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'Weight management is the process of maintaining a healthy body weight by balancing the nutrition and physical activities. It maintains a healthy weight through sustainable lifestyle habits, food you eat with the energy your body uses in everyday activities and metabolism. Weight is influenced by many factors beyond just calorie intake or output, such as the following:',
          style: AppTheme.bodyLarge,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'Moreover, body regulates weight through hormonal pathways, which are complex chemical signals controlling hunger, fat storage, and energy use. Because each person\'s body and circumstances are unique, there is no single "one-size-fits-all" solution or diet plan for managing weight. Instead, weight management involves understanding your own body and the various factors that affect it, then adjusting your habits to support your health and wellness.',
          style: AppTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildFactorsSection(PageColorScheme colorScheme, bool isMobile) {
    final factors = [
      {'title': 'Genetics', 'description': 'Influence how your body stores fat and uses energy.'},
      {'title': 'Mood and Emotions', 'description': 'Can lead to eating for comfort rather than hunger.'},
      {'title': 'Types of Food', 'description': 'Especially processed and sugary items affect weight management.'},
      {'title': 'Medications', 'description': 'Certain medicines may cause weight gain.'},
      {'title': 'Stress', 'description': 'Impacts hormones that regulate appetite.'},
      {'title': 'Environment', 'description': 'Access to healthy foods and opportunities for exercise play a role.'},
      {'title': 'Lifestyle Habits', 'description': 'Sleep quality and activity levels affect weight control.'},
    ];

    return Card(
      elevation: AppTheme.elevationM,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Factors Influencing Weight Management',
              style: isMobile ? AppTheme.titleLarge : AppTheme.headlineSmall,
            ),
            const SizedBox(height: AppTheme.spacingL),
            // Factors Affecting Weight Image
            _buildResponsiveImage(
              'assets/images/lesson1image2.webp',
              'Factors Affecting Weight',
              mobileHeight: 180,
            ),
            const SizedBox(height: AppTheme.spacingL),
            ...factors.map((factor) => Padding(
              padding: const EdgeInsets.only(bottom: AppTheme.spacingM),
              child: _buildFactorItem(
                factor['title']!,
                factor['description']!,
                colorScheme,
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildFactorItem(String title, String description, PageColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  description,
                  style: AppTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMythFactSection(PageColorScheme colorScheme, bool isMobile) {
    final mythFacts = [
      {
        'myth': 'Weight management is just about calories in versus calories out.',
        'fact': 'While balancing calories matters, genetics, emotions, and your environment also play important roles in your weight.',
      },
      {
        'myth': 'You can control your weight simply by eating less and moving more.',
        'fact': 'Your body\'s weight is mainly regulated by hormones like insulin and leptin, not just calorie counting.',
      },
      {
        'myth': 'One diet works for everyone.',
        'fact': 'Each person\'s body is unique, so individualized approaches work best; there is no universal diet or method.',
      },
      {
        'myth': 'Weight gain is a sign of weak willpower.',
        'fact': 'Obesity and weight gain are medical conditions influenced by many factors, not just willpower.',
      },
      {
        'myth': 'Only calories affect fat storage.',
        'fact': 'Hormonal imbalances caused by refined foods, frequent eating, stress, and medications can disrupt how fat is stored.',
      },
      {
        'myth': 'Emotional eating is a sign of lack of discipline.',
        'fact': 'Stress, sadness, and other emotions often lead to overeating and unhealthy food choices; these are natural responses.',
      },
      {
        'myth': 'Eating small amounts frequently is always healthy.',
        'fact': 'Constant eating, especially processed snacks and sugary drinks, can upset hormonal balance and promote fat storage.',
      },
    ];

    return Card(
      elevation: AppTheme.elevationM,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Common Myths vs Facts',
              style: isMobile ? AppTheme.titleLarge : AppTheme.headlineSmall,
            ),
            const SizedBox(height: AppTheme.spacingL),
            // Myth vs Fact Image
            _buildResponsiveImage(
              'assets/images/lesson1image3.jpg',
              'Myth vs Fact',
              mobileHeight: 160,
            ),
            const SizedBox(height: AppTheme.spacingL),
            ...mythFacts.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: AppTheme.spacingL),
              child: _buildMythFactItem(
                item['myth']!,
                item['fact']!,
                colorScheme,
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildMythFactItem(String myth, String fact, PageColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Myth section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppTheme.radiusM),
                topRight: Radius.circular(AppTheme.radiusM),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.close, color: Colors.red, size: 20),
                    const SizedBox(width: AppTheme.spacingS),
                    Text(
                      'MYTH',
                      style: AppTheme.labelLarge.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  myth,
                  style: AppTheme.bodyMedium,
                ),
              ],
            ),
          ),
          // Fact section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppTheme.radiusM),
                bottomRight: Radius.circular(AppTheme.radiusM),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.check, color: Colors.green, size: 20),
                    const SizedBox(width: AppTheme.spacingS),
                    Text(
                      'FACT',
                      style: AppTheme.labelLarge.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  fact,
                  style: AppTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignificanceContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Weight Management Benefits Image (GIF)
        _buildResponsiveImage(
          'assets/images/lesson1image4.gif',
          'Weight Management Benefits',
          mobileHeight: 200,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'Maintaining a healthy weight goes beyond looking good—it has profound effects on your overall health and well-being. Losing excess weight or keeping it healthy has a lot of benefits. Wherein, committing to a sustainable weight management means adopting healthy eating, regular exercise, and lifestyle changes that support long-term health. It helps individuals safely lose weight and maintain it, improving both physical and emotional and overall quality and enjoyment of life.',
          style: AppTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildBenefitsSection(PageColorScheme colorScheme, bool isMobile) {
    final benefits = [
      {'title': 'Lowers chronic disease risk', 'description': 'Reduces chances of heart disease, diabetes, and hypertension.'},
      {'title': 'Strengthens immunity', 'description': 'Helps the body fight infections.'},
      {'title': 'Boosts brain and hormones', 'description': 'Enhances memory, focus, problem-solving, and supports overall health and mood by increasing blood flow.'},
      {'title': 'Improves mobility', 'description': 'Losing 1lb cuts 4lbs of knee stress, easing joint and muscle strain for easier movement.'},
      {'title': 'Controls cravings', 'description': 'Strengthens self-discipline over time.'},
      {'title': 'Improves digestion', 'description': 'Supports regular and comfortable digestion.'},
      {'title': 'Increases energy and improves sleep', 'description': 'Prevents fatigue and promotes restful sleep.'},
      {'title': 'Improves mental health', 'description': 'Reduces anxiety and boosts self-esteem.'},
      {'title': 'Extends lifespan', 'description': 'Linked to a longer, healthier life.'},
    ];

    return Card(
      elevation: AppTheme.elevationM,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Benefits of Weight Management',
              style: isMobile ? AppTheme.titleLarge : AppTheme.headlineSmall,
            ),
            const SizedBox(height: AppTheme.spacingL),
            // Health Benefits Image (GIF)
            _buildResponsiveImage(
              'assets/images/lesson1image5.gif',
              'Health Benefits',
              mobileHeight: 180,
            ),
            const SizedBox(height: AppTheme.spacingL),
            ...benefits.map((benefit) => Padding(
              padding: const EdgeInsets.only(bottom: AppTheme.spacingM),
              child: _buildBenefitItem(
                benefit['title']!,
                benefit['description']!,
                colorScheme,
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitItem(String title, String description, PageColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: Colors.green.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 20,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.green[700],
                  ),
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  description,
                  style: AppTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFunFactSection(PageColorScheme colorScheme, bool isMobile) {
    return Card(
      elevation: AppTheme.elevationM,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          gradient: LinearGradient(
            colors: [
              colorScheme.primary.withOpacity(0.1),
              colorScheme.secondary.withOpacity(0.1),
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
            children: [
              Row(
                children: [
                  Icon(
                    Icons.lightbulb,
                    color: colorScheme.primary,
                    size: isMobile ? 24 : 32,
                  ),
                  const SizedBox(width: AppTheme.spacingM),
                  Text(
                    'Fun Fact!',
                    style: (isMobile ? AppTheme.titleLarge : AppTheme.headlineSmall).copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacingL),
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
                  'When you lose weight, your metabolism slows and the "fullness" hormone leptin drops, making you hungrier and crave tasty snacks. But with discipline, managing cravings and sticking to healthy habits helps you stay in control for the long run!',
                  style: AppTheme.bodyLarge.copyWith(
                    height: 1.6,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationSection(BuildContext context, PageColorScheme colorScheme, bool isMobile) {
    return Card(
      elevation: AppTheme.elevationS,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          children: [
            Text(
              'Continue Your Learning Journey',
              style: isMobile ? AppTheme.titleLarge : AppTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'Ready to dive deeper? Explore the video lecture and test your knowledge with the assessment.',
              style: AppTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingXl),
            Wrap(
              spacing: AppTheme.spacingM,
              runSpacing: AppTheme.spacingM,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/video-lecture'),
                  icon: const Icon(Icons.play_circle),
                  label: const Text('Watch Video Lecture'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.spacingL,
                      vertical: AppTheme.spacingM,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/lecture'),
                  icon: const Icon(Icons.assignment),
                  label: const Text('Take Assessment'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.secondary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.spacingL,
                      vertical: AppTheme.spacingM,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Responsive image widget that adapts to screen size
  /// Single Responsibility: Handle image display with responsive behavior
  Widget _buildResponsiveImage(
    String assetPath,
    String fallbackText, {
    required double mobileHeight,
    double? maxDesktopHeight,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        
        if (isMobile) {
          // Mobile: Fixed height for consistent layout
          return Container(
            width: double.infinity,
            height: mobileHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              child: Image.asset(
                assetPath,
                width: double.infinity,
                height: mobileHeight,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildImageFallback(fallbackText, mobileHeight);
                },
              ),
            ),
          );
        } else {
          // Desktop: Natural image size with constraints
          return Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxHeight: maxDesktopHeight ?? 400,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              child: Image.asset(
                assetPath,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return _buildImageFallback(fallbackText, mobileHeight);
                },
              ),
            ),
          );
        }
      },
    );
  }

  /// Fallback widget for failed image loads
  /// Single Responsibility: Provide consistent error state UI
  Widget _buildImageFallback(String text, double height) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.image, size: 48, color: Colors.grey),
            const SizedBox(height: AppTheme.spacingS),
            Text(text, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}