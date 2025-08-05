import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'models/lecture_content.dart';
import 'widgets/lecture/slide_renderer.dart';
import 'pages/welcome_page.dart';
import 'pages/introduction_page.dart';
import 'pages/concept_map_page.dart';
import 'pages/lecture_page.dart';
import 'pages/module_placeholder_page.dart';
import 'pages/poster_making_page.dart';
import 'pages/about_page.dart';
import 'pages/video_lecture_page.dart';
import 'pages/video_page.dart';
import 'pages/lesson1_module_page.dart';
import 'pages/lesson2_module_page.dart';
import 'pages/lesson2_assessment_page.dart';
import 'pages/lesson3_module_page.dart';
import 'data/lesson3_lecture.dart';
import 'widgets/custom_header.dart';
import 'widgets/navigation/global_drawer.dart';

void main() {
  runApp(const WeightManagementApp());
}

/// Main application widget following Single Responsibility Principle
/// Responsibility: App configuration and routing
class WeightManagementApp extends StatelessWidget {
  const WeightManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weigh Smarter!',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/introduction': (context) => const IntroductionView(),
        '/concept-map': (context) => const ConceptMapView(),
        '/lecture': (context) => const LectureView(),
        '/materials': (context) => const MaterialsView(),
        '/lesson2-module': (context) => const Lesson2ModuleView(),
        '/lesson2-assessment': (context) => const Lesson2AssessmentView(),
        '/lesson3-module': (context) => const Lesson3ModuleView(),
        '/lesson3-lecture': (context) => const Lesson3LectureView(),
        '/video-lecture-lesson3': (context) => const Lesson3VideoLectureView(),
        '/video-lecture': (context) => const VideoLectureView(),
        '/video-lecture-advanced': (context) => const AdvancedVideoLectureView(),
        '/poster-making': (context) => const PosterMakingView(),
        '/about': (context) => const AboutView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Introduction view with global navigation
/// Single Responsibility: Display introduction content with navigation
class IntroductionView extends StatelessWidget {
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Introduction to Weight Management',
        icon: Icons.info_outline,
        colorScheme: AppTheme.pageColorSchemes[4],
        currentRoute: '/introduction',
      ),
      drawer: const GlobalDrawer(currentRoute: '/introduction'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const IntroductionPage(),
      ),
    );
  }
}

/// Concept map view with global navigation
/// Single Responsibility: Display concept map content with navigation
class ConceptMapView extends StatelessWidget {
  const ConceptMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Interactive Concept Map',
        icon: Icons.hub,
        colorScheme: AppTheme.pageColorSchemes[0],
        currentRoute: '/concept-map',
      ),
      drawer: const GlobalDrawer(currentRoute: '/concept-map'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const ConceptMapPage(),
      ),
    );
  }
}

/// Lecture view with global navigation
/// Single Responsibility: Display lecture content with navigation
class LectureView extends StatelessWidget {
  const LectureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Weight Management Lecture',
        icon: Icons.school,
        colorScheme: AppTheme.pageColorSchemes[1],
        currentRoute: '/lecture',
      ),
      drawer: const GlobalDrawer(currentRoute: '/lecture'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const LecturePage(),
      ),
    );
  }
}

/// Materials view with global navigation
/// Single Responsibility: Display Lesson 1 module content with navigation
class MaterialsView extends StatelessWidget {
  const MaterialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Lesson 1: Weight Management Module',
        icon: Icons.school,
        colorScheme: AppTheme.pageColorSchemes[1], // Using yellow/gold
        currentRoute: '/materials',
      ),
      drawer: const GlobalDrawer(currentRoute: '/materials'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const Lesson1ModulePage(),
      ),
    );
  }
}

/// Lesson 2 Module view with global navigation
/// Single Responsibility: Display Lesson 2 module content with navigation
class Lesson2ModuleView extends StatelessWidget {
  const Lesson2ModuleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Lesson 2: Nutrition and Pinggang Pinoy',
        icon: Icons.restaurant,
        colorScheme: AppTheme.pageColorSchemes[2], // Using red
        currentRoute: '/lesson2-module',
      ),
      drawer: const GlobalDrawer(currentRoute: '/lesson2-module'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const Lesson2ModulePage(),
      ),
    );
  }
}

/// Lesson 2 Assessment view with global navigation
/// Single Responsibility: Display Lesson 2 assessment with navigation
class Lesson2AssessmentView extends StatelessWidget {
  const Lesson2AssessmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Lesson 2: Nutrition Assessment',
        icon: Icons.assignment,
        colorScheme: AppTheme.pageColorSchemes[2], // Using red
        currentRoute: '/lesson2-assessment',
      ),
      drawer: const GlobalDrawer(currentRoute: '/lesson2-assessment'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const Lesson2AssessmentPage(),
      ),
    );
  }
}

/// Lesson 3 Module view with global navigation
/// Single Responsibility: Display Lesson 3 module content with navigation
class Lesson3ModuleView extends StatelessWidget {
  const Lesson3ModuleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Lesson 3: Physical Activities for Weight Management',
        icon: Icons.fitness_center,
        colorScheme: AppTheme.pageColorSchemes[3], // Using green theme (index 3)
        currentRoute: '/lesson3-module',
      ),
      drawer: const GlobalDrawer(currentRoute: '/lesson3-module'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const Lesson3ModulePage(),
      ),
    );
  }
}

/// Lesson 3 Lecture view with global navigation
/// Single Responsibility: Display Lesson 3 lecture content with navigation
class Lesson3LectureView extends StatelessWidget {
  const Lesson3LectureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Lesson 3: Physical Activities Assessment',
        icon: Icons.assignment,
        colorScheme: AppTheme.pageColorSchemes[3], // Using green theme (index 3)
        currentRoute: '/lesson3-lecture',
      ),
      drawer: const GlobalDrawer(currentRoute: '/lesson3-lecture'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const Lesson3LecturePage(),
      ),
    );
  }
}

/// Lesson 3 Video lecture view with global navigation
/// Single Responsibility: Display Lesson 3 video lecture content with navigation
class Lesson3VideoLectureView extends StatelessWidget {
  const Lesson3VideoLectureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Physical Activities for Weight Management',
        icon: Icons.play_circle,
        colorScheme: AppTheme.pageColorSchemes[3], // Using green theme (index 3)
        currentRoute: '/video-lecture-lesson3',
      ),
      drawer: const GlobalDrawer(currentRoute: '/video-lecture-lesson3'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const Lesson3VideoLecturePage(),
      ),
    );
  }
}

/// Poster making view with global navigation
/// Single Responsibility: Display poster making content with navigation
class PosterMakingView extends StatelessWidget {
  const PosterMakingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Poster Making',
        icon: Icons.image,
        colorScheme: AppTheme.pageColorSchemes[2], // Using red
        currentRoute: '/poster-making',
      ),
      drawer: const GlobalDrawer(currentRoute: '/poster-making'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const PosterMakingPage(),
      ),
    );
  }
}

/// Video lecture view with global navigation
/// Single Responsibility: Display video lecture content with navigation
class VideoLectureView extends StatelessWidget {
  const VideoLectureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Weight Management Fundamentals',
        icon: Icons.play_circle,
        colorScheme: AppTheme.pageColorSchemes[1], // Using yellow/gold
        currentRoute: '/video-lecture',
      ),
      drawer: const GlobalDrawer(currentRoute: '/video-lecture'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const VideoLecturePage(),
      ),
    );
  }
}

/// Advanced video lecture view with global navigation
/// Single Responsibility: Display advanced video lecture content with navigation
class AdvancedVideoLectureView extends StatelessWidget {
  const AdvancedVideoLectureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Nutrition and Pinggang Pinoy',
        icon: Icons.play_circle,
        colorScheme: AppTheme.pageColorSchemes[2], // Using red
        currentRoute: '/video-lecture-advanced',
      ),
      drawer: const GlobalDrawer(currentRoute: '/video-lecture-advanced'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const AdvancedVideoLecturePage(),
      ),
    );
  }
}

/// About view with global navigation
/// Single Responsibility: Display about content with navigation
class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'About Us',
        icon: Icons.people,
        colorScheme: AppTheme.pageColorSchemes[3], // Using green
        currentRoute: '/about',
      ),
      drawer: const GlobalDrawer(currentRoute: '/about'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const AboutPage(),
      ),
    );
  }
}

/// Lesson 3 Lecture Page using the data-driven approach
/// Single Responsibility: Display Lesson 3 lecture content using LecturePage
class Lesson3LecturePage extends StatefulWidget {
  const Lesson3LecturePage({super.key});

  @override
  State<Lesson3LecturePage> createState() => _Lesson3LecturePageState();
}

class _Lesson3LecturePageState extends State<Lesson3LecturePage> {
  late LectureContent _lecture;
  int _currentSlideIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _lecture = Lesson3Lecture.lectureContent;
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
              AppTheme.pageColorSchemes[3].primary, // Using green theme (index 3)
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
                      ? AppTheme.pageColorSchemes[3].primary // Using green theme (index 3)
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
              backgroundColor: AppTheme.pageColorSchemes[3].primary, // Using green theme (index 3)
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}