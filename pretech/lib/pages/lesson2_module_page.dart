import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Lesson 2 Module Page - Nutrition and Healthy Eating Using Pinggang Pinoy
/// Single Responsibility: Display comprehensive nutrition education content
class Lesson2ModulePage extends StatelessWidget {
  const Lesson2ModulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final colorScheme = AppTheme.pageColorSchemes[2]; // Red theme for Lesson 2
    
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
                Icons.restaurant,
                size: isMobile ? 48 : 64,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'Lesson 2: Nutrition and Healthy Eating Using Pinggang Pinoy',
              style: isMobile ? AppTheme.headlineMedium : AppTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingM),
            Text(
              'Learn about balanced nutrition through the Filipino food guide for healthy eating habits',
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
          // What is Nutrition Section
          _buildSection(
            title: 'What is Nutrition?',
            content: _buildNutritionContent(),
            colorScheme: colorScheme,
            isMobile: isMobile,
          ),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // What is Pinggang Pinoy Section
          _buildSection(
            title: 'What is Pinggang Pinoy?',
            content: _buildPinggangPinoyContent(),
            colorScheme: colorScheme,
            isMobile: isMobile,
          ),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Components Section
          _buildComponentsSection(colorScheme, isMobile),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Water and Hydration Section
          _buildSection(
            title: 'The Importance of Water and Hydration',
            content: _buildHydrationContent(),
            colorScheme: colorScheme,
            isMobile: isMobile,
          ),
          
          const SizedBox(height: AppTheme.spacingXxl),
          
          // Sample Menu Section
          _buildSampleMenuSection(colorScheme, isMobile),
          
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

  Widget _buildNutritionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nutrition Concept Image
        _buildResponsiveImage(
          'images/lesson2image1.gif',
          'Nutrition Concept',
          mobileHeight: 200,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'Nutrition is the process of getting the food and nutrients your body needs to function well. It\'s about fueling your body so that your brain has the energy to think, your muscles have the nutrients to grow and repair, and your immune system can protect you from getting sick. Good nutrition leads to more energy, better growth, and overall health.',
          style: AppTheme.bodyLarge,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'This is especially important for adolescents, as your bodies are growing and changing rapidly. The food you eat now plays a big role in your physical, mental, and emotional development.',
          style: AppTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildPinggangPinoyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Pinggang Pinoy Image
        _buildResponsiveImage(
          'images/lesson2image2.gif',
          'Pinggang Pinoy Guide',
          mobileHeight: 220,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'Pinggang Pinoy, which translates to "Filipino Plate," is a food guide developed by the Food and Nutrition Research Institute (FNRI) of the Department of Science and Technology (DOST). It is a visual representation of the ideal food proportions on a meal-by-meal basis for a healthy and active Filipino.',
          style: AppTheme.bodyLarge,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'Unlike the traditional food pyramid, Pinggang Pinoy is designed to be more practical and easier to understand. It shows the recommended amount of food from the different food groups that a person should eat per meal, helping to build a balanced and nutritious diet.',
          style: AppTheme.bodyLarge,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'The guide divides a plate into three main food groups: Go, Grow, and Glow. It also emphasizes the importance of drinking water.',
          style: AppTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildComponentsSection(PageColorScheme colorScheme, bool isMobile) {
    return Card(
      elevation: AppTheme.elevationM,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The Components of Pinggang Pinoy',
              style: isMobile ? AppTheme.titleLarge : AppTheme.headlineSmall,
            ),
            const SizedBox(height: AppTheme.spacingL),
            
            // // Components Overview Image
            // _buildResponsiveImage(
            //   'assets/images/lesson2image3.jpg',
            //   'Pinggang Pinoy Components',
            //   mobileHeight: 180,
            // ),
            // const SizedBox(height: AppTheme.spacingL),
            
            Text(
              'The Pinggang Pinoy plate is divided into three sections with specific proportions, each representing a different food group.',
              style: AppTheme.bodyLarge,
            ),
            const SizedBox(height: AppTheme.spacingXl),
            
            // Glow Foods
            _buildFoodGroupCard(
              title: '1. Glow Foods (Body-Regulating)',
              proportion: 'One-half (1/2) of the plate',
              description: 'This group occupies the largest portion of the plate, covering one-half (1/2). Glow foods are rich in vitamins, minerals, and fiber. They keep your body\'s systems working properly and help protect you from diseases.',
              scientificExplanation: 'Glow foods are rich in vitamins, minerals, fiber, and antioxidants. Vitamins and minerals support our immune systems by acting as immunomodulators and preventing pathogens from entering the body. Fiber supports digestive health by aiding in bowel regularity and preventing constipation. Lastly, antioxidants are vital for protecting the body against free radicals which cause harmful damage to cells.',
              whatTheyAre: 'Fruits and vegetables',
              examples: [
                'Vegetables: Malunggay, kangkong, talong (eggplant), kalabasa (squash), sitaw (string beans), pechay',
                'Fruits: Mango, banana, papaya, pineapple, guava, watermelon'
              ],
              color: Colors.green,
              colorScheme: colorScheme,
            ),
            
            const SizedBox(height: AppTheme.spacingL),
            
            // Go Foods
            _buildFoodGroupCard(
              title: '2. Go Foods (Energy-Giving)',
              proportion: 'One-quarter (1/4) of the plate',
              description: 'This group occupies one-quarter (1/4) of the plate. Go foods are the primary source of energy for the body, allowing you to perform daily activities.',
              scientificExplanation: 'These foods are high in carbohydrates. Carbohydrates are a type of biomolecule that is broken down by our bodies to fuel our cells, giving us the energy to keep our minds and bodies active.',
              whatTheyAre: 'Carbohydrates',
              examples: [
                'Rice, corn, bread, root crops like kamote (sweet potato) and kamoteng kahoy (cassava), pasta, and oats. For Filipinos, rice is the main Go food.'
              ],
              color: Colors.orange,
              colorScheme: colorScheme,
            ),
            
            const SizedBox(height: AppTheme.spacingL),
            
            // Grow Foods
            _buildFoodGroupCard(
              title: '3. Grow Foods (Body-Building)',
              proportion: 'One-quarter (1/4) of the plate',
              description: 'This group also occupies one-quarter (1/4) of the plate. Grow foods are essential for building and repairing body tissues, muscles, and bones. They are rich in protein.',
              scientificExplanation: 'Grow foods are rich in protein, another type of biomolecule used by our bodies as building blocks for tissues like muscles, bones, skin, and blood. Proteins are crucial for tissue growth, repair, and strength. They also support physiological functions like hormone control and enzyme production.',
              whatTheyAre: 'Protein sources',
              examples: [
                'Meat and Poultry: Chicken, beef, pork',
                'Seafood: Fish, shrimp, shellfish',
                'Legumes and Nuts: Munggo (mung beans), beans, tofu, nuts',
                'Eggs and Dairy: Eggs, milk, cheese'
              ],
              color: Colors.blue,
              colorScheme: colorScheme,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodGroupCard({
    required String title,
    required String proportion,
    required String description,
    required String scientificExplanation,
    required String whatTheyAre,
    required List<String> examples,
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
                  _getFoodGroupIcon(title),
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
                      title,
                      style: AppTheme.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    Text(
                      proportion,
                      style: AppTheme.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ],
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
            'What they are: $whatTheyAre',
            style: AppTheme.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
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

  IconData _getFoodGroupIcon(String title) {
    if (title.contains('Glow')) return Icons.eco;
    if (title.contains('Go')) return Icons.flash_on;
    if (title.contains('Grow')) return Icons.fitness_center;
    return Icons.restaurant;
  }

  Widget _buildHydrationContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Water and Hydration Image
        _buildResponsiveImage(
          'images/lesson2image3.gif',
          'Water and Hydration',
          mobileHeight: 180,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'A key element of the Pinggang Pinoy guide is the recommendation to drink plenty of water. Water is vital for digestion, absorption of nutrients, circulation, and maintaining body temperature. The guide recommends drinking 6 to 8 glasses of water daily.',
          style: AppTheme.bodyLarge,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'It also advises against consuming too many sugary drinks, such as soda, juice drinks, and sweetened teas, which can contribute to weight gain and other health problems.',
          style: AppTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildSampleMenuSection(PageColorScheme colorScheme, bool isMobile) {
    final menuData = [
      {
        'meal': 'Breakfast',
        'go': '1 cup of rice',
        'grow': '1 fried egg',
        'glow': '1 cup of vegetable stir-fry with a serving of mango'
      },
      {
        'meal': 'Lunch',
        'go': '1 cup of brown rice',
        'grow': 'Grilled fish (tilapia)',
        'glow': 'A large serving of steamed okra and grilled eggplant'
      },
      {
        'meal': 'Dinner',
        'go': '1 cup of rice',
        'grow': 'Chicken adobo',
        'glow': 'A salad with leafy greens and tomatoes'
      },
      {
        'meal': 'Snack',
        'go': '',
        'grow': '',
        'glow': 'A banana or an apple'
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
              'Putting It All Together: A Sample Menu',
              style: isMobile ? AppTheme.titleLarge : AppTheme.headlineSmall,
            ),
            const SizedBox(height: AppTheme.spacingL),
            
            // // Sample Menu Image
            // _buildResponsiveImage(
            //   'assets/images/lesson2image5.png',
            //   'Sample Daily Menu',
            //   mobileHeight: 200,
            // ),
            // const SizedBox(height: AppTheme.spacingL),
            
            Text(
              'Here is an example of a daily menu that follows the Pinggang Pinoy proportions.',
              style: AppTheme.bodyLarge,
            ),
            const SizedBox(height: AppTheme.spacingL),
            
            // Menu Table
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.primary.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(AppTheme.radiusM),
              ),
              child: Column(
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.all(AppTheme.spacingM),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppTheme.radiusM),
                        topRight: Radius.circular(AppTheme.radiusM),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Meal',
                            style: AppTheme.titleMedium.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Go Foods (1/4 Plate)',
                            style: AppTheme.titleMedium.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Grow Foods (1/4 Plate)',
                            style: AppTheme.titleMedium.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            'Glow Foods (1/2 Plate)',
                            style: AppTheme.titleMedium.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Menu Items
                  ...menuData.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    return Container(
                      padding: const EdgeInsets.all(AppTheme.spacingM),
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.grey.withOpacity(0.05) : Colors.transparent,
                        border: Border(
                          bottom: BorderSide(
                            color: colorScheme.primary.withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              item['meal']!,
                              style: AppTheme.bodyMedium.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              item['go']!,
                              style: AppTheme.bodyMedium,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              item['grow']!,
                              style: AppTheme.bodyMedium,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              item['glow']!,
                              style: AppTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
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
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.blue, size: 20),
                  const SizedBox(width: AppTheme.spacingS),
                  Expanded(
                    child: Text(
                      'Note: Remember to drink a glass of water with every meal and in between. The specific amounts can be adjusted based on age, sex, and physical activity level.',
                      style: AppTheme.bodyMedium.copyWith(
                        color: Colors.blue[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyTakeawaysSection(PageColorScheme colorScheme, bool isMobile) {
    final takeaways = [
      'Pinggang Pinoy is a simple, visual guide for a balanced meal.',
      'Fill half of your plate with Glow foods (fruits and vegetables).',
      'Divide the other half of your plate equally between Go foods (carbohydrates) and Grow foods (protein).',
      'Prioritize water and avoid sugary drinks.',
      'The guide is a template, and your specific needs may vary. Consult a health professional for personalized dietary advice.',
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
                'The Pinggang Pinoy model is an easy way to manage and control your daily diet. At least half of the plate should consist of glow foods, and the other half should consist of equal parts go and grow foods. We need a balance of all these foods to be able to excel in school, have the strength to enjoy our hobbies, and have the power to stay healthy.',
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
                  onPressed: () => Navigator.pushNamed(context, '/video-lecture-advanced'),
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
                  onPressed: () => Navigator.pushNamed(context, '/lesson2-assessment'),
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