import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/content_registry.dart';
import '../widgets/navigation/global_drawer.dart';
import '../widgets/media_placeholder_widget.dart';

/// Generic welcome page following Open/Closed Principle
/// Single Responsibility: Welcome users and navigate to available learning resources
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _showContent = false;
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    _startAnimations();
  }

  void _startAnimations() {
    // Show content after a brief delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _showContent = true;
        });
      }
    });

    // Show button after content is visible
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _showButton = true;
        });
      }
    });
  }

  void _navigateToResources() {
    // Navigate to primary resource (currently concept map)
    // Future: Could show resource selection if multiple resources available
    final primaryResource = ContentRegistry.primaryResource;
    Navigator.of(context).pushReplacementNamed(primaryResource.route);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final availableResources = ContentRegistry.availableResources;
    
    return Scaffold(
      drawer: const GlobalDrawer(currentRoute: '/'),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.pageColorSchemes[0].gradient,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Main content
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? AppTheme.spacingL : AppTheme.spacingXxl),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        // Logo/GIF
                        AnimatedOpacity(
                          opacity: _showContent ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 800),
                          child: Container(
                            width: isMobile ? 120 : 350,
                            height: isMobile ? 120 : 350,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(AppTheme.radiusXl),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(AppTheme.radiusXl),
                              child: Image.asset(
                                'images/intro.gif',
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  // Fallback to icon if GIF fails to load
                                  return Icon(
                                    Icons.school,
                                    size: isMobile ? 60 : 80,
                                    color: Colors.white,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        
                        SizedBox(height: isMobile ? AppTheme.spacingXl : AppTheme.spacingXxl),
                        
                        // Generic Welcome Title
                        AnimatedOpacity(
                          opacity: _showContent ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 1000),
                          child: Text(
                            'Be Weigh Smarter!',
                            style: (isMobile 
                              ? AppTheme.headlineMedium 
                              : AppTheme.headlineLarge
                            ).copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        
                        const SizedBox(height: AppTheme.spacingM),
                        
                        // Generic Subtitle
                        AnimatedOpacity(
                          opacity: _showContent ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 1200),
                          child: Text(
                            'Be way smarter by using our interactive learning resources about weight management!',
                            style: AppTheme.bodyLarge.copyWith(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: isMobile ? 16 : 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        
                        SizedBox(height: isMobile ? AppTheme.spacingXl : AppTheme.spacingS),
                        
                        // Simplified welcome message
                        AnimatedOpacity(
                          opacity: _showContent ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 1400),
                          child: Container(
                            padding: const EdgeInsets.all(AppTheme.spacingL),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(AppTheme.radiusL),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              'Your comprehensive guide to evidence-based weight management and healthy living.',
                              style: AppTheme.bodyLarge.copyWith(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        
                        SizedBox(height: isMobile ? AppTheme.spacingXl : AppTheme.spacingXxl),
                        
                        // Get Started Button
                        AnimatedOpacity(
                          opacity: _showButton ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 600),
                          child: AnimatedScale(
                            scale: _showButton ? 1.0 : 0.8,
                            duration: const Duration(milliseconds: 600),
                            child: SizedBox(
                              width: isMobile ? double.infinity : null,
                              child: ElevatedButton(
                                onPressed: _navigateToResources,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppTheme.pageColorSchemes[0].primary,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? AppTheme.spacingXl : 40,
                                    vertical: AppTheme.spacingM,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(AppTheme.radiusXl),
                                  ),
                                  elevation: AppTheme.elevationL,
                                ),
                                child: Row(
                                  mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      ContentRegistry.hasMultipleResources 
                                        ? 'Explore Resources' 
                                        : 'Start Learning',
                                      style: AppTheme.titleMedium.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: AppTheme.spacingS),
                                    const Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ),
              
              // Menu button in top-left
              Positioned(
                top: AppTheme.spacingM,
                left: AppTheme.spacingM,
                child: SafeArea(
                  child: Builder(
                    builder: (context) => IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(AppTheme.spacingS),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(AppTheme.radiusS),
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      tooltip: 'Open navigation menu',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildResourceCard(LearningResource resource, bool isMobile) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.of(context).pushReplacementNamed(resource.route),
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        child: Container(
          width: isMobile ? double.infinity : 300,
          padding: const EdgeInsets.all(AppTheme.spacingL),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(AppTheme.radiusL),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                resource.icon,
                size: isMobile ? 40 : 48,
                color: Colors.white,
              ),
              const SizedBox(height: AppTheme.spacingM),
              Text(
                resource.title,
                style: AppTheme.titleLarge.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppTheme.spacingS),
              Text(
                resource.description,
                style: AppTheme.bodyMedium.copyWith(
                  color: Colors.white.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}