import 'package:flutter/material.dart';
import '../../models/lecture_content.dart';
import '../../theme/app_theme.dart';

/// Open-ended widget following Single Responsibility Principle
/// Responsibility: Handle open-ended discussion questions
class OpenEndedWidget extends StatefulWidget {
  final OpenEndedSlide slide;
  final VoidCallback? onNext;

  const OpenEndedWidget({
    super.key,
    required this.slide,
    this.onNext,
  });

  @override
  State<OpenEndedWidget> createState() => _OpenEndedWidgetState();
}

class _OpenEndedWidgetState extends State<OpenEndedWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _hasResponse = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveResponse() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _hasResponse = true;
      });
    }
  }

  void _editResponse() {
    setState(() {
      _hasResponse = false;
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
                  Icons.forum,
                  color: Colors.white,
                  size: 32,
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Text(
                    'Discussion Question',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.slide.question,
                  style: AppTheme.headlineSmall.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (widget.slide.context != null) ...[
                  const SizedBox(height: AppTheme.spacingM),
                  Container(
                    padding: const EdgeInsets.all(AppTheme.spacingM),
                    decoration: BoxDecoration(
                      color: AppTheme.pageColorSchemes[1].primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppTheme.radiusS),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: AppTheme.pageColorSchemes[1].primary,
                          size: 16,
                        ),
                        const SizedBox(width: AppTheme.spacingS),
                        Expanded(
                          child: Text(
                            widget.slide.context!,
                            style: AppTheme.bodyMedium.copyWith(
                              color: AppTheme.pageColorSchemes[1].primary,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // Response section
          Container(
            width: double.infinity,
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
                Row(
                  children: [
                    Icon(
                      _hasResponse ? Icons.edit : Icons.create,
                      color: AppTheme.pageColorSchemes[1].primary,
                      size: 20,
                    ),
                    const SizedBox(width: AppTheme.spacingS),
                    Text(
                      _hasResponse ? 'Your Response:' : 'Write Your Response:',
                      style: AppTheme.titleMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spacingM),
                
                if (_hasResponse) ...[
                  // Display saved response
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppTheme.spacingM),
                    decoration: BoxDecoration(
                      color: AppTheme.pageColorSchemes[1].primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppTheme.radiusS),
                      border: Border.all(
                        color: AppTheme.pageColorSchemes[1].primary.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      _controller.text,
                      style: AppTheme.bodyLarge.copyWith(
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _editResponse,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.textSecondary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
                          ),
                          child: const Text('Edit Response'),
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
                ] else ...[
                  // Input field
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Share your thoughts and ideas...',
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
                    maxLines: 6,
                    minLines: 4,
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _saveResponse,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.pageColorSchemes[1].primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
                      ),
                      child: const Text('Save Response'),
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          // Tips section
          const SizedBox(height: AppTheme.spacingL),
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(AppTheme.radiusS),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.tips_and_updates,
                      color: AppTheme.textHint,
                      size: 16,
                    ),
                    const SizedBox(width: AppTheme.spacingS),
                    Text(
                      'Discussion Tips:',
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textHint,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  '• Use specific examples from your experience\n'
                  '• Consider different perspectives\n'
                  '• Connect to concepts from the lecture',
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.textHint,
                    fontSize: 12,
                    height: 1.4,
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