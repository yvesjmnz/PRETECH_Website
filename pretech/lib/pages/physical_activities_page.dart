import 'package:flutter/material.dart';

class PhysicalActivitiesPage extends StatelessWidget {
  const PhysicalActivitiesPage({Key? key}) : super(key: key);

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
              color: const Color(0xFFE8F5E9),
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
                            'Physical Activities',
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF43A047),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.fitness_center, size: iconSize, color: const Color(0xFF43A047)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Subtitle
                    Text(
                      'Recommended Physical Activities',
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF43A047),
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Activities Card
                    Card(
                      color: Colors.green[50],
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildActivityItem('Aerobic (Cardio) Activities', Icons.directions_run, constraints),
                            _buildActivityItem('High-Intensity Interval Training (HIIT)', Icons.timer, constraints),
                            _buildActivityItem('Strength/Resistance Training', Icons.fitness_center, constraints),
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

  Widget _buildActivityItem(String activity, IconData icon, BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF43A047).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 16,
              color: const Color(0xFF43A047),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              activity,
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