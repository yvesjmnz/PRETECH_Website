import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Lesson 3 Module Page - Physical Activities for Weight Management
/// Single Responsibility: Display comprehensive physical activity education content
class Lesson3ModulePage extends StatelessWidget {
  const Lesson3ModulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final colorScheme = AppTheme.pageColorSchemes[3]; // Green theme for Lesson 3
    
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
                Icons.fitness_center,
                size: isMobile ? 48 : 64,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'Lesson 3: Physical Activities for Weight Management',
              style: isMobile ? AppTheme.headlineMedium : AppTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingM),
            Text(
              'Discover the science behind exercise and movement for effective weight management and overall health',
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
          // Introduction Section
          _buildSection(
            title: 'Introduction to Physical Activity',
            content: _buildIntroductionContent(),
            colorScheme: colorScheme,
            isMobile: isMobile,
          ),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // How the Body Loses Weight Section
          _buildSection(
            title: 'How the Body Loses Weight',
            content: _buildMetabolismContent(),
            colorScheme: colorScheme,
            isMobile: isMobile,
          ),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Exercise Myths Section
          _buildSection(
            title: 'Common Exercise Myths',
            content: _buildMythsContent(),
            colorScheme: colorScheme,
            isMobile: isMobile,
          ),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Types of Physical Activities Section
          _buildActivitiesSection(colorScheme, isMobile),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Benefits Section
          _buildBenefitsSection(colorScheme, isMobile),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Key Takeaways Section
          _buildKeyTakeawaysSection(colorScheme, isMobile),
          
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

  Widget _buildIntroductionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Introduction Image
        _buildResponsiveImage(
          'assets/images/lesson3image1.jpg',
          'Physical Activity Introduction',
          mobileHeight: 200,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'Physical activity is essential for effective weight management and overall health. This lesson will provide you with essential knowledge and practical insights into leveraging physical activity for effective weight management.',
          style: AppTheme.bodyLarge,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'We will explore the profound health benefits of incorporating regular movement into daily life, discuss various recommended physical activities, and delve into specific types of exercises that are particularly beneficial for weight loss and overall well-being.',
          style: AppTheme.bodyLarge,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Container(
          padding: const EdgeInsets.all(AppTheme.spacingM),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.05),
            borderRadius: BorderRadius.circular(AppTheme.radiusS),
            border: Border.all(
              color: Colors.blue.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.info, color: Colors.blue, size: 20),
                  const SizedBox(width: AppTheme.spacingS),
                  Text(
                    'CDC Recommendation:',
                    style: AppTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacingS),
              Text(
                'The Centers for Disease Control and Prevention (2024) states that staying physically active is most important for good health and weight control as you get older. Individuals who maintain a healthy weight are less likely to have serious health conditions.',
                style: AppTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMetabolismContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Understanding how your body burns calories is crucial for effective weight management. Let\'s explore the science behind metabolism and energy expenditure.',
          style: AppTheme.bodyLarge,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Container(
          padding: const EdgeInsets.all(AppTheme.spacingM),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.05),
            borderRadius: BorderRadius.circular(AppTheme.radiusS),
            border: Border.all(
              color: Colors.blue.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.science, color: Colors.blue, size: 20),
                  const SizedBox(width: AppTheme.spacingS),
                  Text(
                    'Scientific Explanation:',
                    style: AppTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacingS),
              Text(
                'According to Mayo Clinic (2022), metabolism is the way your body absorbs food and beverages and converts them into energy for normal body functions such as breathing and movement.',
                style: AppTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'Your daily calorie expenditure consists of three main components:',
          style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppTheme.spacingS),
        _buildMetabolismComponent(
          'Basal Metabolic Rate (BMR)',
          'Varies with body size, muscle mass, sex, and age. This is the energy your body needs for basic functions.',
          Icons.favorite,
          Colors.red,
        ),
        const SizedBox(height: AppTheme.spacingS),
        _buildMetabolismComponent(
          'Food Digestion',
          'Approximately 10% of your daily calories are burned during the digestion process.',
          Icons.restaurant,
          Colors.orange,
        ),
        const SizedBox(height: AppTheme.spacingS),
        _buildMetabolismComponent(
          'Physical Activity & NEAT',
          'Exercise and daily activities (Non-Exercise Activity Thermogenesis) like walking, standing, and fidgeting.',
          Icons.directions_run,
          Colors.green,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'Martin-Smith et al. (2020) proves that physical activities result in net calorie expenditure and increase metabolism. Regular exercise can increase your resting metabolic rate, meaning your body burns more calories even when not working out.',
          style: AppTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildMetabolismComponent(String title, String description, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppTheme.radiusS),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXs),
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

  Widget _buildMythsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(AppTheme.spacingM),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.05),
            borderRadius: BorderRadius.circular(AppTheme.radiusS),
            border: Border.all(
              color: Colors.red.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.warning, color: Colors.red, size: 24),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MYTH: More sweat = more fat burning',
                      style: AppTheme.bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingXs),
                    Text(
                      'Many people believe that sweating more during exercise means burning more fat.',
                      style: AppTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppTheme.spacingL),
        Container(
          padding: const EdgeInsets.all(AppTheme.spacingM),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.05),
            borderRadius: BorderRadius.circular(AppTheme.radiusS),
            border: Border.all(
              color: Colors.green.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 24),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FACT: Sweat is thermoregulation, not fat burning',
                      style: AppTheme.bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingXs),
                    Text(
                      'Sweat is a cooling system for thermoregulation, not an indicator of calorie or fat burning (Gonzalez et al., 2012).',
                      style: AppTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'The efficiency of exercise for weight control depends on intensity, duration, and type - not the volume of sweat produced. You burn the same calories in a cold gym as in a hot room, regardless of how much you sweat.',
          style: AppTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildActivitiesSection(PageColorScheme colorScheme, bool isMobile) {
    return Card(
      elevation: AppTheme.elevationM,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Types of Physical Activities',
              style: isMobile ? AppTheme.titleLarge : AppTheme.headlineSmall,
            ),
            const SizedBox(height: AppTheme.spacingL),
            
            // Activities Image
            _buildResponsiveImage(
              'assets/images/lesson3image2.jpg',
              'Types of Physical Activities',
              mobileHeight: 180,
            ),
            const SizedBox(height: AppTheme.spacingL),
            
            // Aerobic Activities
            _buildActivityCard(
              title: 'Aerobic (Cardio) Activities',
              description: 'Rhythmic, continuous movement of large muscle groups that elevates heart rate and breathing for sustained periods. This "with oxygen" activity improves cardiovascular and respiratory function.',
              scientificExplanation: 'Aerobic exercise enhances the body\'s oxygen utilization, improving cardiovascular health and endurance. It primarily uses the aerobic energy system, which efficiently burns both carbohydrates and fats.',
              examples: [
                'Walking and jogging',
                'Cycling and swimming',
                'Dancing and aerobics classes',
                'Sports like basketball and soccer'
              ],
              icon: Icons.directions_run,
              color: Colors.blue,
              colorScheme: colorScheme,
            ),
            
            const SizedBox(height: AppTheme.spacingL),
            
            // HIIT
            _buildActivityCard(
              title: 'High-Intensity Interval Training (HIIT)',
              description: 'Alternates short bursts of near-maximum effort with brief recovery periods. Research shows HIIT sessions (10–30 minutes) can be as effective as longer moderate-intensity workouts.',
              scientificExplanation: 'HIIT improves cardiovascular fitness and insulin sensitivity through the principle of excess post-exercise oxygen consumption (EPOC), where your body continues burning calories after the workout.',
              examples: [
                'Sprint intervals',
                'Cycling intervals',
                'Burpees and jumping jacks',
                'Circuit training'
              ],
              icon: Icons.flash_on,
              color: Colors.orange,
              colorScheme: colorScheme,
            ),
            
            const SizedBox(height: AppTheme.spacingL),
            
            // Strength Training
            _buildActivityCard(
              title: 'Strength/Resistance Training',
              description: 'Exercises muscles against external resistance to improve strength, power, and muscle mass. Creates microscopic muscle damage that prompts repair and stronger rebuilding.',
              scientificExplanation: 'Resistance training increases muscle mass, which boosts resting metabolic rate. More muscle tissue means higher calorie burn even at rest, making it crucial for long-term weight management.',
              examples: [
                'Weight lifting',
                'Resistance bands',
                'Body weight exercises (push-ups, squats)',
                'Functional training'
              ],
              icon: Icons.fitness_center,
              color: Colors.green,
              colorScheme: colorScheme,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard({
    required String title,
    required String description,
    required String scientificExplanation,
    required List<String> examples,
    required IconData icon,
    required Color color,
    required PageColorScheme colorScheme,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingS),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(AppTheme.radiusS),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Text(
                  title,
                  style: AppTheme.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            description,
            style: AppTheme.bodyLarge,
          ),
          const SizedBox(height: AppTheme.spacingM),
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.05),
              borderRadius: BorderRadius.circular(AppTheme.radiusS),
              border: Border.all(
                color: Colors.blue.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.science, color: Colors.blue, size: 20),
                    const SizedBox(width: AppTheme.spacingS),
                    Text(
                      'Scientific Explanation:',
                      style: AppTheme.bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  scientificExplanation,
                  style: AppTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            'Examples:',
            style: AppTheme.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
          ...examples.map((example) => Padding(
            padding: const EdgeInsets.only(left: AppTheme.spacingM, bottom: AppTheme.spacingS),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingS),
                Expanded(
                  child: Text(
                    example,
                    style: AppTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }

  Widget _buildBenefitsSection(PageColorScheme colorScheme, bool isMobile) {
    final benefits = [
      {
        'title': 'Weight Management',
        'description': 'Burns calories and increases metabolism',
        'icon': Icons.monitor_weight,
      },
      {
        'title': 'Cardiovascular Health',
        'description': 'Strengthens heart and improves circulation',
        'icon': Icons.favorite,
      },
      {
        'title': 'Mental Health',
        'description': 'Reduces stress and improves mood',
        'icon': Icons.psychology,
      },
      {
        'title': 'Bone Health',
        'description': 'Increases bone density',
        'icon': Icons.accessibility_new,
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
              'Benefits of Regular Physical Activity',
              style: isMobile ? AppTheme.titleLarge : AppTheme.headlineSmall,
            ),
            const SizedBox(height: AppTheme.spacingL),
            LayoutBuilder(
              builder: (context, constraints) {
                if (isMobile) {
                  // Mobile: Single column layout
                  return Column(
                    children: benefits.map((benefit) => Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
                      padding: const EdgeInsets.all(AppTheme.spacingM),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(AppTheme.radiusM),
                        border: Border.all(
                          color: colorScheme.primary.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            benefit['icon'] as IconData,
                            color: colorScheme.primary,
                            size: 28,
                          ),
                          const SizedBox(width: AppTheme.spacingM),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  benefit['title'] as String,
                                  style: AppTheme.titleMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(height: AppTheme.spacingXs),
                                Text(
                                  benefit['description'] as String,
                                  style: AppTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )).toList(),
                  );
                } else {
                  // Desktop: Two column layout
                  return Wrap(
                    spacing: AppTheme.spacingM,
                    runSpacing: AppTheme.spacingM,
                    children: benefits.map((benefit) => Container(
                      width: (constraints.maxWidth - AppTheme.spacingM) / 2,
                      padding: const EdgeInsets.all(AppTheme.spacingM),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(AppTheme.radiusM),
                        border: Border.all(
                          color: colorScheme.primary.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            benefit['icon'] as IconData,
                            color: colorScheme.primary,
                            size: 32,
                          ),
                          const SizedBox(height: AppTheme.spacingS),
                          Text(
                            benefit['title'] as String,
                            style: AppTheme.titleMedium.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.spacingXs),
                          Text(
                            benefit['description'] as String,
                            style: AppTheme.bodyMedium,
                          ),
                        ],
                      ),
                    )).toList(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyTakeawaysSection(PageColorScheme colorScheme, bool isMobile) {
    final takeaways = [
      'Physical activity is essential for effective weight management and overall health.',
      'Combine aerobic exercise, strength training, and NEAT activities for best results.',
      'Exercise efficiency depends on intensity, duration, and type - not sweat volume.',
      'Regular exercise increases resting metabolic rate for long-term benefits.',
      'Stay physically active throughout life for health and weight control as you age.',
    ];

    return Card(
      elevation: AppTheme.elevationM,
      child: Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.key,
                    color: colorScheme.primary,
                    size: isMobile ? 24 : 32,
                  ),
                  const SizedBox(width: AppTheme.spacingM),
                  Text(
                    'Key Takeaways',
                    style: (isMobile ? AppTheme.titleLarge : AppTheme.headlineSmall).copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacingL),
              Text(
                'Physical activity is a cornerstone of effective weight management. By understanding the science behind exercise and incorporating various types of activities into your routine, you can achieve sustainable weight control and improved overall health.',
                style: AppTheme.bodyLarge.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: AppTheme.spacingL),
              ...takeaways.map((takeaway) => Padding(
                padding: const EdgeInsets.only(bottom: AppTheme.spacingM),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Icon(
                        Icons.check_circle,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Expanded(
                      child: Text(
                        takeaway,
                        style: AppTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              )).toList(),
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
                  onPressed: () => Navigator.pushNamed(context, '/video-lecture-lesson3'),
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
                  onPressed: () => Navigator.pushNamed(context, '/lesson3-lecture'),
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