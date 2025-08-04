import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/lecture_content.dart';
import '../data/lesson2_assessment_data.dart';
import '../widgets/lecture/slide_renderer.dart';
import '../services/lecture_persistence_service.dart';

/// Lesson 2 Assessment Page - Nutrition and Pinggang Pinoy Quiz
/// Single Responsibility: Manage Lesson 2 assessment navigation and state
/// Follows the same pattern as LecturePage for consistency
class Lesson2AssessmentPage extends StatefulWidget {
  const Lesson2AssessmentPage({super.key});

  @override
  State<Lesson2AssessmentPage> createState() => _Lesson2AssessmentPageState();
}

class _Lesson2AssessmentPageState extends State<Lesson2AssessmentPage> {
  late LectureContent _assessment;
  int _currentSlideIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _assessment = Lesson2AssessmentData.assessmentContent;
    _loadSavedProgress();
  }

  Future<void> _loadSavedProgress() async {
    final savedSlide = await LecturePersistenceService.loadCurrentSlide();
    if (savedSlide < _assessment.slides.length) {
      setState(() {
        _currentSlideIndex = savedSlide;
      });
      // Animate to saved slide after a brief delay
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_pageController.hasClients) {
          _pageController.animateToPage(
            savedSlide,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  Future<void> _saveProgress() async {
    await LecturePersistenceService.saveCurrentSlide(_currentSlideIndex);
    await LecturePersistenceService.markSlideCompleted(_currentSlideIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextSlide() {
    if (_currentSlideIndex < _assessment.slides.length - 1) {
      setState(() {
        _currentSlideIndex++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _saveProgress();
    }
  }

  void _previousSlide() {
    if (_currentSlideIndex > 0) {
      setState(() {
        _currentSlideIndex--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _saveProgress();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress indicator
        _buildProgressIndicator(),
        
        // Slide content
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentSlideIndex = index;
              });
            },
            itemCount: _assessment.slides.length,
            itemBuilder: (context, index) {
              return SlideRenderer(
                slide: _assessment.slides[index],
                onNext: _nextSlide,
              );
            },
          ),
        ),
        
        // Navigation controls
        _buildNavigationControls(),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingM,
        vertical: AppTheme.spacingS,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Question ${_currentSlideIndex + 1} of ${_assessment.slides.length}',
                style: AppTheme.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                '${((_currentSlideIndex + 1) / _assessment.slides.length * 100).round()}%',
                style: AppTheme.bodyMedium.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingS),
          LinearProgressIndicator(
            value: (_currentSlideIndex + 1) / _assessment.slides.length,
            backgroundColor: AppTheme.dividerColor,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppTheme.pageColorSchemes[2].primary, // Red theme for Lesson 2
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationControls() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        border: Border(
          top: BorderSide(
            color: AppTheme.dividerColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Previous button
          ElevatedButton.icon(
            onPressed: _currentSlideIndex > 0 ? _previousSlide : null,
            icon: const Icon(Icons.arrow_back),
            label: const Text('Previous'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.textSecondary,
              foregroundColor: Colors.white,
            ),
          ),
          
          const Spacer(),
          
          // Slide indicator dots
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              _assessment.slides.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _currentSlideIndex
                      ? AppTheme.pageColorSchemes[2].primary // Red theme
                      : AppTheme.dividerColor,
                ),
              ),
            ),
          ),
          
          const Spacer(),
          
          // Next button
          ElevatedButton.icon(
            onPressed: _currentSlideIndex < _assessment.slides.length - 1 
              ? _nextSlide 
              : () => Navigator.pushReplacementNamed(context, '/'),
            icon: Icon(_currentSlideIndex == _assessment.slides.length - 1 
              ? Icons.home 
              : Icons.arrow_forward),
            label: Text(
              _currentSlideIndex == _assessment.slides.length - 1 
                ? 'Home' 
                : 'Next'
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.pageColorSchemes[2].primary, // Red theme
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}