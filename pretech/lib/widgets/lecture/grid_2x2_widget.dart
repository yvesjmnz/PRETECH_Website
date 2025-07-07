import 'package:flutter/material.dart';
import '../../models/lecture_content.dart';
import '../../theme/app_theme.dart';

/// 2x2 Grid widget following Single Responsibility Principle
/// Responsibility: Handle 2x2 grid classification activity
class Grid2x2Widget extends StatefulWidget {
  final Grid2x2Slide slide;
  final VoidCallback? onNext;

  const Grid2x2Widget({
    super.key,
    required this.slide,
    this.onNext,
  });

  @override
  State<Grid2x2Widget> createState() => _Grid2x2WidgetState();
}

class _Grid2x2WidgetState extends State<Grid2x2Widget> {
  final Map<String, int?> _placements = {};
  bool _showResults = false;

  @override
  void initState() {
    super.initState();
    // Initialize placements
    for (final item in widget.slide.items) {
      _placements[item.name] = null;
    }
  }

  void _placeItem(String itemName, int quadrant) {
    if (!_showResults) {
      setState(() {
        _placements[itemName] = quadrant;
      });
    }
  }

  void _checkAnswers() {
    setState(() {
      _showResults = true;
    });
  }

  void _resetActivity() {
    setState(() {
      _showResults = false;
      for (final item in widget.slide.items) {
        _placements[item.name] = null;
      }
    });
  }

  bool get _allItemsPlaced {
    return _placements.values.every((placement) => placement != null);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppTheme.spacingL),
            decoration: BoxDecoration(
              gradient: AppTheme.pageColorSchemes[1].gradient,
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.grid_view,
                  color: Colors.white,
                  size: 32,
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Text(
                    widget.slide.title,
                    style: AppTheme.titleLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // Instructions
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: AppTheme.cardColor,
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              border: Border.all(
                color: AppTheme.pageColorSchemes[1].primary.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Text(
              widget.slide.instructions,
              style: AppTheme.bodyLarge.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // Items to place
          if (!_showResults) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppTheme.spacingM),
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(AppTheme.radiusM),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Drag items to the correct quadrant:',
                    style: AppTheme.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  Wrap(
                    spacing: AppTheme.spacingS,
                    runSpacing: AppTheme.spacingS,
                    children: widget.slide.items
                        .where((item) => _placements[item.name] == null)
                        .map((item) => _buildDraggableItem(item))
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppTheme.spacingL),
          ],
          
          // 2x2 Grid
          _build2x2Grid(),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // Action buttons
          if (!_showResults && _allItemsPlaced) ...[
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _checkAnswers,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.pageColorSchemes[1].primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
                ),
                child: const Text('Check Answers'),
              ),
            ),
          ],
          
          if (_showResults) ...[
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _resetActivity,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.textSecondary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
                    ),
                    child: const Text('Try Again'),
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: ElevatedButton(
                    onPressed: widget.onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.pageColorSchemes[1].primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
                    ),
                    child: const Text('Continue'),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDraggableItem(GridItem item) {
    return Draggable<String>(
      data: item.name,
      feedback: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingS,
          ),
          decoration: BoxDecoration(
            color: AppTheme.pageColorSchemes[1].primary,
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
          ),
          child: Text(
            item.name,
            style: AppTheme.bodyMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      childWhenDragging: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingM,
          vertical: AppTheme.spacingS,
        ),
        decoration: BoxDecoration(
          color: AppTheme.dividerColor,
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
        ),
        child: Text(
          item.name,
          style: AppTheme.bodyMedium.copyWith(
            color: AppTheme.textHint,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingM,
          vertical: AppTheme.spacingS,
        ),
        decoration: BoxDecoration(
          color: AppTheme.pageColorSchemes[1].primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          border: Border.all(
            color: AppTheme.pageColorSchemes[1].primary,
            width: 1,
          ),
        ),
        child: Text(
          item.name,
          style: AppTheme.bodyMedium.copyWith(
            color: AppTheme.pageColorSchemes[1].primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _build2x2Grid() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Y-axis label (top)
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            child: Text(
              widget.slide.yAxisLabels[1], // Top label
              style: AppTheme.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          
          // Grid content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
            child: Row(
              children: [
                // Y-axis label (left)
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    widget.slide.yAxisLabel,
                    style: AppTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                
                const SizedBox(width: AppTheme.spacingM),
                
                // Grid
                Expanded(
                  child: Column(
                    children: [
                      // Top row
                      Row(
                        children: [
                          Expanded(child: _buildGridQuadrant(0)), // Top-left
                          const SizedBox(width: 2),
                          Expanded(child: _buildGridQuadrant(1)), // Top-right
                        ],
                      ),
                      const SizedBox(height: 2),
                      // Bottom row
                      Row(
                        children: [
                          Expanded(child: _buildGridQuadrant(2)), // Bottom-left
                          const SizedBox(width: 2),
                          Expanded(child: _buildGridQuadrant(3)), // Bottom-right
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // X-axis labels
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            child: Row(
              children: [
                const SizedBox(width: 40), // Space for Y-axis label
                Expanded(
                  child: Text(
                    widget.slide.xAxisLabels[0], // Left label
                    style: AppTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.slide.xAxisLabels[1], // Right label
                    style: AppTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          
          // Y-axis label (bottom)
          Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.spacingM),
            child: Text(
              widget.slide.yAxisLabels[0], // Bottom label
              style: AppTheme.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          
          // X-axis label
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppTheme.radiusM),
                bottomRight: Radius.circular(AppTheme.radiusM),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.slide.xAxisLabel,
                  style: AppTheme.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingS),
                const Icon(Icons.arrow_forward, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridQuadrant(int quadrant) {
    final itemsInQuadrant = _placements.entries
        .where((entry) => entry.value == quadrant)
        .map((entry) => entry.key)
        .toList();

    return DragTarget<String>(
      onAccept: (itemName) {
        _placeItem(itemName, quadrant);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          height: 120,
          padding: const EdgeInsets.all(AppTheme.spacingS),
          decoration: BoxDecoration(
            color: candidateData.isNotEmpty
                ? AppTheme.pageColorSchemes[1].primary.withOpacity(0.1)
                : AppTheme.surfaceColor,
            border: Border.all(
              color: candidateData.isNotEmpty
                  ? AppTheme.pageColorSchemes[1].primary
                  : AppTheme.dividerColor,
              width: candidateData.isNotEmpty ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(AppTheme.radiusS),
          ),
          child: Column(
            children: [
              if (itemsInQuadrant.isEmpty && candidateData.isEmpty)
                Expanded(
                  child: Center(
                    child: Text(
                      'Drop here',
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textHint,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ...itemsInQuadrant.map((itemName) {
                final item = widget.slide.items.firstWhere((i) => i.name == itemName);
                final isCorrect = item.correctQuadrant == quadrant;
                
                return Container(
                  margin: const EdgeInsets.only(bottom: AppTheme.spacingXs),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingS,
                    vertical: AppTheme.spacingXs,
                  ),
                  decoration: BoxDecoration(
                    color: _showResults
                        ? (isCorrect ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2))
                        : AppTheme.pageColorSchemes[1].primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppTheme.radiusS),
                    border: _showResults
                        ? Border.all(
                            color: isCorrect ? Colors.green : Colors.red,
                            width: 1,
                          )
                        : null,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          itemName,
                          style: AppTheme.bodyMedium.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: _showResults
                                ? (isCorrect ? Colors.green.shade700 : Colors.red.shade700)
                                : AppTheme.pageColorSchemes[1].primary,
                          ),
                        ),
                      ),
                      if (_showResults)
                        Icon(
                          isCorrect ? Icons.check : Icons.close,
                          size: 16,
                          color: isCorrect ? Colors.green : Colors.red,
                        ),
                    ],
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}