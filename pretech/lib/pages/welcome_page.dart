import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted) {
        setState(() {
          _showButton = true;
        });
      }
    });
  }

  void _navigateToMain() {
    Navigator.of(context).pushReplacementNamed('/main');
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 480;
    final isTablet = screenWidth >= 480 && screenWidth < 1024;
    final isDesktop = screenWidth >= 1024;
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00BFAE), Color(0xFF4DD0E1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: isDesktop 
            ? Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildContent(isMobile, isTablet, isDesktop),
                    ),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: screenHeight - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16.0 : 32.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildContent(isMobile, isTablet, isDesktop),
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }

  List<Widget> _buildContent(bool isMobile, bool isTablet, bool isDesktop) {
    return [
      // Logo/Icon
      AnimatedOpacity(
        opacity: _showContent ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 800),
        child: Container(
          padding: EdgeInsets.all(isMobile ? 16 : 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            Icons.favorite,
            size: isMobile ? 60 : (isTablet ? 70 : 80),
            color: Colors.white,
          ),
        ),
      ),
      
      SizedBox(height: isMobile ? 24 : (isTablet ? 32 : 40)),
      
      // Title
      AnimatedOpacity(
        opacity: _showContent ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 1000),
        child: Text(
          'Weight Management 101',
          style: TextStyle(
            fontSize: isMobile ? 24 : (isTablet ? 28 : 36),
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      
      SizedBox(height: isMobile ? 12 : 16),
      
      // Subtitle
      AnimatedOpacity(
        opacity: _showContent ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 1200),
        child: Text(
          'A fun website to healthy living\nfor Grade 10 students!',
          style: TextStyle(
            fontSize: isMobile ? 16 : (isTablet ? 18 : 20),
            color: Colors.white70,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      
      SizedBox(height: isMobile ? 32 : (isTablet ? 48 : 60)),
      
      // Feature Cards
      AnimatedOpacity(
        opacity: _showContent ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 1400),
        child: Wrap(
          spacing: isMobile ? 12 : 20,
          runSpacing: isMobile ? 12 : 20,
          alignment: WrapAlignment.center,
          children: [
            _buildFeatureCard(
              icon: Icons.hub,
              title: 'Interactive\nConcept Map',
              color: Colors.white.withOpacity(0.9),
              isMobile: isMobile,
              isTablet: isTablet,
              isDesktop: isDesktop,
            ),
            _buildFeatureCard(
              icon: Icons.restaurant_menu,
              title: 'Nutritional\nHabits',
              color: Colors.white.withOpacity(0.9),
              isMobile: isMobile,
              isTablet: isTablet,
              isDesktop: isDesktop,
            ),
            _buildFeatureCard(
              icon: Icons.fitness_center,
              title: 'Physical\nActivities',
              color: Colors.white.withOpacity(0.9),
              isMobile: isMobile,
              isTablet: isTablet,
              isDesktop: isDesktop,
            ),
            _buildFeatureCard(
              icon: Icons.health_and_safety,
              title: 'Health\nBenefits',
              color: Colors.white.withOpacity(0.9),
              isMobile: isMobile,
              isTablet: isTablet,
              isDesktop: isDesktop,
            ),
          ],
        ),
      ),
      
      SizedBox(height: isMobile ? 40 : (isTablet ? 50 : 60)),
      
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
              onPressed: _navigateToMain,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF00BFAE),
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 32 : (isTablet ? 36 : 40),
                  vertical: isMobile ? 14 : (isTablet ? 15 : 16),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8,
              ),
              child: Row(
                mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: isMobile ? 16 : (isTablet ? 17 : 18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ),
      ),
      
      SizedBox(height: isMobile ? 20 : 40),
    ];
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required Color color,
    required bool isMobile,
    required bool isTablet,
    required bool isDesktop,
  }) {
    double cardWidth = isMobile ? 100 : (isTablet ? 130 : 140);
    double cardHeight = isMobile ? 85 : (isTablet ? 110 : 120);
    double iconSize = isMobile ? 28 : (isTablet ? 36 : 40);
    double fontSize = isMobile ? 10 : (isTablet ? 12 : 14);
    
    return Container(
      width: cardWidth,
      height: cardHeight,
      padding: EdgeInsets.all(isMobile ? 10 : (isTablet ? 12 : 14)),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: const Color(0xFF00BFAE),
          ),
          SizedBox(height: isMobile ? 6 : 8),
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF00BFAE),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}