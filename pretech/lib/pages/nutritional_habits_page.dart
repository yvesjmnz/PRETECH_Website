import 'package:flutter/material.dart';

class NutritionalHabitsPage extends StatelessWidget {
  const NutritionalHabitsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth < 600 ? constraints.maxWidth * 0.95 : 500;
        double titleFontSize = constraints.maxWidth < 400 ? 20 : 28;
        double subtitleFontSize = constraints.maxWidth < 400 ? 16 : 20;
        double iconSize = constraints.maxWidth < 400 ? 32 : 40;
        
        return Center(
          child: SingleChildScrollView(
            child: Card(
              color: const Color(0xFFFFF8E1),
              elevation: 6,
              margin: const EdgeInsets.all(16),
              child: Container(
                width: cardWidth,
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Nutritional Habits',
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFFFB300),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.restaurant_menu, size: iconSize, color: const Color(0xFFFFB300)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Subtitle
                    Text(
                      'Recommended Diet Habits',
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFFB300),
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Tips Card
                    Card(
                      color: Colors.orange[50],
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTipItem('Balanced, hypocaloric diets', constraints),
                            _buildTipItem('High-protein, low-carb diets', constraints),
                            _buildTipItem('Low-fat diets', constraints),
                            _buildTipItem('Very-low-calorie diets', constraints),
                            _buildTipItem('High-fiber diets', constraints),
                            _buildTipItem('Eat from all food groups', constraints),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTipItem(String tip, BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: const Color(0xFFFFB300),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              tip,
              style: TextStyle(
                fontSize: constraints.maxWidth < 400 ? 13 : 14,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}