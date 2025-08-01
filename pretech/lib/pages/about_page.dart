import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// About page following Single Responsibility Principle
/// Single Responsibility: Display information about the app and team
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;
    
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          _buildHeroSection(isMobile),
          
          // Content
          if (isMobile)
            _buildMobileLayout()
          else if (isTablet)
            _buildTabletLayout()
          else
            _buildDesktopLayout(),
        ],
      ),
    );
  }

  Widget _buildHeroSection(bool isMobile) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.pageColorSchemes[2].primary.withOpacity(0.1),
            AppTheme.pageColorSchemes[3].primary.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? AppTheme.spacingL : AppTheme.spacingXxl),
        child: Column(
          children: [
            Icon(
              Icons.favorite,
              size: isMobile ? 48 : 64,
              color: AppTheme.pageColorSchemes[2].primary,
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'About Weigh Smarter!',
              style: isMobile ? AppTheme.headlineMedium : AppTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingM),
            Text(
              'Empowering healthier lives through evidence-based weight management education',
              style: AppTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      child: Column(
        children: [
          _buildMissionCard(),
          const SizedBox(height: AppTheme.spacingXl),
          _buildTeamCard(),
          const SizedBox(height: AppTheme.spacingXl),
          _buildContactCard(),
        ],
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacingXl),
      child: Column(
        children: [
          _buildMissionCard(),
          const SizedBox(height: AppTheme.spacingXxl),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildTeamCard()),
              const SizedBox(width: AppTheme.spacingXl),
              Expanded(child: _buildContactCard()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacingXxl),
      child: Column(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: _buildMissionCard(),
            ),
          ),
          const SizedBox(height: AppTheme.spacingXxl),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildTeamCard()),
              const SizedBox(width: AppTheme.spacingXl),
              Expanded(child: _buildContactCard()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMissionCard() {
    return Card(
      elevation: AppTheme.elevationM,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          gradient: LinearGradient(
            colors: [
              AppTheme.pageColorSchemes[2].primary.withOpacity(0.1),
              AppTheme.pageColorSchemes[0].primary.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingXxl),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingL,
                  vertical: AppTheme.spacingM,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.pageColorSchemes[2].primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusL),
                  border: Border.all(
                    color: AppTheme.pageColorSchemes[2].primary.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.rocket_launch,
                      size: 24,
                      color: AppTheme.pageColorSchemes[2].primary,
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Text(
                      'OUR MISSION',
                      style: AppTheme.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.pageColorSchemes[2].primary,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppTheme.spacingXl),
              Text(
                'Transforming Weight Management Education',
                style: AppTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppTheme.spacingL),
              Text(
                'We are dedicated to providing comprehensive, science-based educational resources that empower individuals to make informed decisions about their weight management journey. Our platform combines evidence-based nutrition guidance with practical physical activity recommendations to support sustainable, healthy lifestyle changes.',
                style: AppTheme.bodyLarge.copyWith(height: 1.6),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamCard() {
    return Card(
      elevation: AppTheme.elevationS,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          children: [
            Icon(
              Icons.group,
              size: 48,
              color: AppTheme.pageColorSchemes[1].primary,
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'Our Team',
              style: AppTheme.titleLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: AppTheme.pageColorSchemes[1].primary,
              ),
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'A group of students from De La Salle University, Manila, Philippines, committed to enhancing public health through education.',
              style: AppTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingL),
            _buildTeamMember('Developer', 'Yves Jimenez'),
            const SizedBox(height: AppTheme.spacingS),
            _buildTeamMember('Nutrition Specialists', 'Evidence-based dietary guidance'),
            const SizedBox(height: AppTheme.spacingS),
            _buildTeamMember('Fitness Experts', 'Physical activity recommendations'),
            const SizedBox(height: AppTheme.spacingS),
            _buildTeamMember('Developers', 'Platform design and user experience'),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember(String role, String description) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: AppTheme.pageColorSchemes[1].primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: AppTheme.pageColorSchemes[1].primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            role,
            style: AppTheme.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppTheme.pageColorSchemes[1].primary,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            description,
            style: AppTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard() {
    return Card(
      elevation: AppTheme.elevationS,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          children: [
            Icon(
              Icons.contact_mail,
              size: 48,
              color: AppTheme.pageColorSchemes[3].primary,
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'Get in Touch',
              style: AppTheme.titleLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: AppTheme.pageColorSchemes[3].primary,
              ),
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'We value your feedback and are here to support your wellness journey.',
              style: AppTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingL),
            _buildContactItem(Icons.email, 'support@weighsmarter.com'),
            const SizedBox(height: AppTheme.spacingM),
            _buildContactItem(Icons.web, 'www.weighsmarter.com'),
            const SizedBox(height: AppTheme.spacingM),
            _buildContactItem(Icons.location_on, 'Educational Resources Center'),
            const SizedBox(height: AppTheme.spacingL),
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingM),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.pageColorSchemes[3].primary.withOpacity(0.8),
                    AppTheme.pageColorSchemes[2].primary.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(AppTheme.radiusM),
              ),
              child: Text(
                'Your health journey matters to us',
                style: AppTheme.titleMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: AppTheme.pageColorSchemes[3].primary,
        ),
        const SizedBox(width: AppTheme.spacingM),
        Expanded(
          child: Text(
            text,
            style: AppTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}