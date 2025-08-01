import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/lecture_content.dart';
import '../data/weight_management_lecture.dart';
import '../widgets/lecture/slide_renderer.dart';
import '../services/lecture_persistence_service.dart';

/// Interactive lecture page following Single Responsibility Principle
/// Responsibility: Manage lecture navigation and state
class LecturePage extends StatefulWidget {
  const LecturePage({super.key});

  @override
  State<LecturePage> createState() => _LecturePageState();
}

class _LecturePageState extends State<LecturePage> {
  late LectureContent _lecture;
  int _currentSlideIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _lecture = WeightManagementLecture.lectureContent;
    _loadSavedProgress();
  }

  Future<void> _loadSavedProgress() async {
    final savedSlide = await LecturePersistenceService.loadCurrentSlide();
    if (savedSlide < _lecture.slides.length) {
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
    if (_currentSlideIndex < _lecture.slides.length - 1) {
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
            itemCount: _lecture.slides.length,
            itemBuilder: (context, index) {
              return SlideRenderer(
                slide: _lecture.slides[index],
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
                'Slide ${_currentSlideIndex + 1} of ${_lecture.slides.length}',
                style: AppTheme.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                '${((_currentSlideIndex + 1) / _lecture.slides.length * 100).round()}%',
                style: AppTheme.bodyMedium.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingS),
          LinearProgressIndicator(
            value: (_currentSlideIndex + 1) / _lecture.slides.length,
            backgroundColor: AppTheme.dividerColor,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppTheme.pageColorSchemes[1].primary,
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
              _lecture.slides.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _currentSlideIndex
                      ? AppTheme.pageColorSchemes[1].primary
                      : AppTheme.dividerColor,
                ),
              ),
            ),
          ),
          
          const Spacer(),
          
          // Next button
          ElevatedButton.icon(
            onPressed: _currentSlideIndex < _lecture.slides.length - 1 
              ? _nextSlide 
              : () => Navigator.pushReplacementNamed(context, '/'),
            icon: Icon(_currentSlideIndex == _lecture.slides.length - 1 
              ? Icons.home 
              : Icons.arrow_forward),
            label: Text(
              _currentSlideIndex == _lecture.slides.length - 1 
                ? 'Home' 
                : 'Next'
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.pageColorSchemes[1].primary,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}