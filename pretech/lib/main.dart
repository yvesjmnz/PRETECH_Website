import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/welcome_page.dart';
import 'pages/concept_map_page.dart';
import 'pages/nutritional_habits_page.dart';
import 'pages/physical_activities_page.dart';
import 'pages/health_benefits_page.dart';
import 'pages/importance_page.dart';
import 'widgets/custom_header.dart';
import 'widgets/navigation/navigation_item.dart';
import 'widgets/navigation/sidebar_navigation.dart';
import 'widgets/navigation/mobile_drawer.dart';

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
      title: 'Weight Management Education',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/main': (context) => const MainNavigation(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


/// Professional main navigation following SOLID principles
/// Single Responsibility: Handle navigation state and layout coordination
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // Navigation items configuration - Open/Closed Principle
  // New pages can be added without modifying existing code
  static final List<NavigationItem> _navigationItems = [
    NavigationItem(
      title: 'Concept Map',
      icon: Icons.hub,
      page: const ConceptMapPage(),
      colorScheme: AppTheme.pageColorSchemes[0],
    ),
    NavigationItem(
      title: 'Nutritional Habits',
      icon: Icons.restaurant_menu,
      page: const NutritionalHabitsPage(),
      colorScheme: AppTheme.pageColorSchemes[1],
    ),
    NavigationItem(
      title: 'Physical Activities',
      icon: Icons.fitness_center,
      page: const PhysicalActivitiesPage(),
      colorScheme: AppTheme.pageColorSchemes[2],
    ),
    NavigationItem(
      title: 'Health Benefits',
      icon: Icons.health_and_safety,
      page: const HealthBenefitsPage(),
      colorScheme: AppTheme.pageColorSchemes[3],
    ),
    NavigationItem(
      title: 'Why Manage Weight?',
      icon: Icons.lightbulb,
      page: const ImportancePage(),
      colorScheme: AppTheme.pageColorSchemes[4],
    ),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 800;
        final currentItem = _navigationItems[_selectedIndex];
        
        return Scaffold(
          appBar: CustomHeader(
            title: currentItem.title,
            icon: currentItem.icon,
            colorScheme: currentItem.colorScheme,
          ),
          drawer: isWideScreen ? null : MobileDrawer(
            items: _navigationItems,
            selectedIndex: _selectedIndex,
            onItemSelected: _onItemSelected,
          ),
          body: Row(
            children: [
              // Desktop sidebar navigation
              if (isWideScreen)
                SidebarNavigation(
                  items: _navigationItems,
                  selectedIndex: _selectedIndex,
                  onItemSelected: _onItemSelected,
                ),
              
              // Main content area
              Expanded(
                child: Container(
                  color: AppTheme.surfaceColor,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0.1, 0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: currentItem.page,
                  ),
                ),
              ),
            ],
          ),
          
          // Mobile bottom navigation
          bottomNavigationBar: isWideScreen ? null : Container(
            decoration: BoxDecoration(
              color: AppTheme.cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingXs),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _navigationItems.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    final isSelected = index == _selectedIndex;
                    
                    return Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => _onItemSelected(index),
                          borderRadius: BorderRadius.circular(AppTheme.radiusM),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppTheme.spacingS,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: const EdgeInsets.all(AppTheme.spacingS),
                                  decoration: BoxDecoration(
                                    color: isSelected 
                                      ? item.colorScheme.primary
                                      : Colors.transparent,
                                    borderRadius: BorderRadius.circular(AppTheme.radiusS),
                                  ),
                                  child: Icon(
                                    item.icon,
                                    size: 20,
                                    color: isSelected 
                                      ? Colors.white
                                      : AppTheme.textSecondary,
                                  ),
                                ),
                                const SizedBox(height: AppTheme.spacingXs),
                                Text(
                                  item.title,
                                  style: AppTheme.bodyMedium.copyWith(
                                    fontSize: 11,
                                    color: isSelected 
                                      ? item.colorScheme.primary
                                      : AppTheme.textSecondary,
                                    fontWeight: isSelected 
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
