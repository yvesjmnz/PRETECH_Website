import 'package:flutter/material.dart';

class HealthBenefitsPage extends StatelessWidget {
  const HealthBenefitsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth < 600 ? constraints.maxWidth * 0.95 : 500;
        double titleFontSize = constraints.maxWidth < 400 ? 20 : 28;
        double subtitleFontSize = constraints.maxWidth < 400 ? 14 : 20;
        double iconSize = constraints.maxWidth < 400 ? 32 : 40;
        
        return Center(
          child: SingleChildScrollView(
            child: Card(
              color: const Color(0xFFFFEBEE),
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
                            'Health Benefits',
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFD32F2F),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.health_and_safety, size: iconSize, color: const Color(0xFFD32F2F)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Subtitle
                    Text(
                      'Why be active?',
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFD32F2F),
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Benefits Card
                    Card(
                      color: Colors.red[50],
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildBenefitItem('Stronger heart, muscles, and bones', Icons.favorite, Colors.red, constraints),
                            _buildBenefitItem('Better mood and energy', Icons.sentiment_very_satisfied, Colors.orange, constraints),
                            _buildBenefitItem('Healthy weight management', Icons.balance, Colors.green, constraints),
                            _buildBenefitItem('Less risk of chronic diseases', Icons.shield, Colors.blue, constraints),
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

  Widget _buildBenefitItem(String benefit, IconData icon, Color color, BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: color.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Icon(
              icon,
              size: 18,
              color: color,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              benefit,
              style: TextStyle(
                fontSize: constraints.maxWidth < 400 ? 13 : 14,
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}