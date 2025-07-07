import 'package:flutter/material.dart';
import '../../models/lecture_content.dart';
import '../../theme/app_theme.dart';

/// Word cloud widget following Single Responsibility Principle
/// Responsibility: Handle word cloud input interaction
class WordCloudWidget extends StatefulWidget {
  final WordCloudSlide slide;
  final VoidCallback? onNext;

  const WordCloudWidget({
    super.key,
    required this.slide,
    this.onNext,
  });

  @override
  State<WordCloudWidget> createState() => _WordCloudWidgetState();
}

class _WordCloudWidgetState extends State<WordCloudWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _submissions = [];
  bool _hasSubmitted = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitResponse() {
    final response = _controller.text.trim();
    if (response.isNotEmpty) {
      setState(() {
        _submissions.add(response);
        _hasSubmitted = true;
        _controller.clear();
      });
    }
  }

  void _addAnother() {
    setState(() {
      _hasSubmitted = false;
    });
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
                  Icons.cloud,
                  color: Colors.white,
                  size: 32,
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Text(
                    'Word Cloud Activity',
                    style: AppTheme.titleLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingXl),
          
          // Question
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppTheme.spacingL),
            decoration: BoxDecoration(
              color: AppTheme.cardColor,
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              border: Border.all(
                color: AppTheme.pageColorSchemes[1].primary.withOpacity(0.2),
                width: 2,
              ),
            ),
            child: Text(
              widget.slide.question,
              style: AppTheme.headlineSmall.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // Input section
          if (!_hasSubmitted) ...[
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingL),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Response:',
                    style: AppTheme.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: widget.slide.placeholder,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppTheme.radiusM),
                        borderSide: BorderSide(
                          color: AppTheme.dividerColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppTheme.radiusM),
                        borderSide: BorderSide(
                          color: AppTheme.pageColorSchemes[1].primary,
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(AppTheme.spacingM),
                    ),
                    maxLines: 3,
                    onSubmitted: (_) => _submitResponse(),
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitResponse,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.pageColorSchemes[1].primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
                      ),
                      child: const Text('Submit Response'),
                    ),
                  ),
                ],
              ),
            ),
          ],
          
          // Submissions display
          if (_submissions.isNotEmpty) ...[
            const SizedBox(height: AppTheme.spacingL),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppTheme.spacingL),
              decoration: BoxDecoration(
                color: AppTheme.pageColorSchemes[1].primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusM),
                border: Border.all(
                  color: AppTheme.pageColorSchemes[1].primary.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: AppTheme.pageColorSchemes[1].primary,
                        size: 20,
                      ),
                      const SizedBox(width: AppTheme.spacingS),
                      Text(
                        'Your Responses:',
                        style: AppTheme.titleMedium.copyWith(
                          color: AppTheme.pageColorSchemes[1].primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  Wrap(
                    spacing: AppTheme.spacingS,
                    runSpacing: AppTheme.spacingS,
                    children: _submissions.map((submission) => 
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.spacingM,
                          vertical: AppTheme.spacingS,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.pageColorSchemes[1].primary,
                          borderRadius: BorderRadius.circular(AppTheme.radiusXl),
                        ),
                        child: Text(
                          submission,
                          style: AppTheme.bodyMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ).toList(),
                  ),
                ],
              ),
            ),
          ],
          
          // Action buttons
          if (_hasSubmitted) ...[
            const SizedBox(height: AppTheme.spacingL),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _addAnother,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.textSecondary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
                    ),
                    child: const Text('Add Another'),
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
          
          // Instructions
          const SizedBox(height: AppTheme.spacingL),
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(AppTheme.radiusS),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppTheme.textHint,
                  size: 16,
                ),
                const SizedBox(width: AppTheme.spacingS),
                Expanded(
                  child: Text(
                    'Share your thoughts! Your responses help create a collaborative learning experience.',
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.textHint,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}