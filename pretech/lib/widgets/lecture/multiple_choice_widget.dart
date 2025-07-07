import 'package:flutter/material.dart';
import '../../models/lecture_content.dart';
import '../../theme/app_theme.dart';

/// Multiple choice widget following Single Responsibility Principle
/// Responsibility: Handle multiple choice question interaction
class MultipleChoiceWidget extends StatefulWidget {
  final MultipleChoiceSlide slide;
  final VoidCallback? onNext;

  const MultipleChoiceWidget({
    super.key,
    required this.slide,
    this.onNext,
  });

  @override
  State<MultipleChoiceWidget> createState() => _MultipleChoiceWidgetState();
}

class _MultipleChoiceWidgetState extends State<MultipleChoiceWidget> {
  int? _selectedAnswer;
  bool _showResult = false;

  void _selectAnswer(int index) {
    if (!_showResult) {
      setState(() {
        _selectedAnswer = index;
      });
    }
  }

  void _submitAnswer() {
    if (_selectedAnswer != null) {
      setState(() {
        _showResult = true;
      });
    }
  }

  void _resetQuestion() {
    setState(() {
      _selectedAnswer = null;
      _showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question header
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
                  Icons.quiz,
                  color: Colors.white,
                  size: 32,
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Text(
                    'Multiple Choice Question',
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
          
          // Question text
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
          
          // Answer options
          ...widget.slide.options.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            return _buildAnswerOption(index, option);
          }),
          
          const SizedBox(height: AppTheme.spacingXl),
          
          // Action buttons
          Row(
            children: [
              if (!_showResult && _selectedAnswer != null)
                Expanded(
                  child: ElevatedButton(
                    onPressed: _submitAnswer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.pageColorSchemes[1].primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
                    ),
                    child: const Text('Submit Answer'),
                  ),
                ),
              if (_showResult) ...[
                Expanded(
                  child: ElevatedButton(
                    onPressed: _resetQuestion,
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
            ],
          ),
          
          // Result explanation
          if (_showResult) ...[
            const SizedBox(height: AppTheme.spacingL),
            _buildResultExplanation(),
          ],
        ],
      ),
    );
  }

  Widget _buildAnswerOption(int index, String option) {
    final isSelected = _selectedAnswer == index;
    final isCorrect = index == widget.slide.correctAnswerIndex;
    
    Color backgroundColor;
    Color borderColor;
    Color textColor = AppTheme.textPrimary;
    
    if (_showResult) {
      if (isCorrect) {
        backgroundColor = Colors.green.withOpacity(0.1);
        borderColor = Colors.green;
        textColor = Colors.green.shade700;
      } else if (isSelected && !isCorrect) {
        backgroundColor = Colors.red.withOpacity(0.1);
        borderColor = Colors.red;
        textColor = Colors.red.shade700;
      } else {
        backgroundColor = AppTheme.cardColor;
        borderColor = AppTheme.dividerColor;
      }
    } else {
      backgroundColor = isSelected 
        ? AppTheme.pageColorSchemes[1].primary.withOpacity(0.1)
        : AppTheme.cardColor;
      borderColor = isSelected 
        ? AppTheme.pageColorSchemes[1].primary
        : AppTheme.dividerColor;
      if (isSelected) {
        textColor = AppTheme.pageColorSchemes[1].primary;
      }
    }
    
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _selectAnswer(index),
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              border: Border.all(color: borderColor, width: 2),
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: borderColor, width: 2),
                    color: isSelected ? borderColor : Colors.transparent,
                  ),
                  child: isSelected
                    ? Icon(
                        Icons.check,
                        size: 16,
                        color: _showResult 
                          ? Colors.white 
                          : Colors.white,
                      )
                    : null,
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Text(
                    '${String.fromCharCode(65 + index)}. $option',
                    style: AppTheme.bodyLarge.copyWith(
                      color: textColor,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
                if (_showResult && isCorrect)
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 24,
                  ),
                if (_showResult && isSelected && !isCorrect)
                  Icon(
                    Icons.cancel,
                    color: Colors.red,
                    size: 24,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultExplanation() {
    final isCorrect = _selectedAnswer == widget.slide.correctAnswerIndex;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: isCorrect 
          ? Colors.green.withOpacity(0.1)
          : Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: isCorrect ? Colors.green : Colors.orange,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isCorrect ? Icons.check_circle : Icons.info,
                color: isCorrect ? Colors.green : Colors.orange,
                size: 24,
              ),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                isCorrect ? 'Correct!' : 'Not quite right',
                style: AppTheme.titleMedium.copyWith(
                  color: isCorrect ? Colors.green.shade700 : Colors.orange.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            widget.slide.explanation,
            style: AppTheme.bodyMedium.copyWith(
              color: isCorrect ? Colors.green.shade700 : Colors.orange.shade700,
            ),
          ),
        ],
      ),
    );
  }
}