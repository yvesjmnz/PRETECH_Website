import 'package:flutter/material.dart';

class ImportancePage extends StatelessWidget {
  const ImportancePage({Key? key}) : super(key: key);

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
              color: const Color(0xFFE3F2FD),
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
                            'Why Manage Weight?',
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1976D2),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.lightbulb, size: iconSize, color: const Color(0xFF1976D2)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Subtitle
                    Text(
                      'Why is it important?',
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1976D2),
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Importance Card
                    Card(
                      color: Colors.blue[50],
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildReasonItem('Prevents diseases', Icons.security, Colors.green, constraints),
                            _buildReasonItem('Boosts confidence and energy', Icons.battery_charging_full, Colors.orange, constraints),
                            _buildReasonItem('Improves quality of life', Icons.trending_up, Colors.purple, constraints),
                            _buildReasonItem('Helps you do more every day!', Icons.star, Colors.amber, constraints),
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

  Widget _buildReasonItem(String reason, IconData icon, Color color, BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 20,
                color: color,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                reason,
                style: TextStyle(
                  fontSize: constraints.maxWidth < 400 ? 13 : 14,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}