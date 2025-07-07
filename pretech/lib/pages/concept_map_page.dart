import 'package:flutter/material.dart';

class ConceptMapPage extends StatefulWidget {
  const ConceptMapPage({Key? key}) : super(key: key);

  @override
  State<ConceptMapPage> createState() => _ConceptMapPageState();
}

class _ConceptMapPageState extends State<ConceptMapPage> with TickerProviderStateMixin {
  final TransformationController _transformationController = TransformationController();
  bool _showControls = false;
  late AnimationController _controlsAnimationController;
  late Animation<double> _controlsAnimation;

  @override
  void initState() {
    super.initState();
    _controlsAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _controlsAnimation = CurvedAnimation(
      parent: _controlsAnimationController,
      curve: Curves.easeInOut,
    );
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
      if (_showControls) {
        _controlsAnimationController.forward();
      } else {
        _controlsAnimationController.reverse();
      }
    });
  }

  void _zoomIn() {
    final Matrix4 matrix = _transformationController.value.clone();
    matrix.scale(1.3);
    _transformationController.value = matrix;
  }

  void _zoomOut() {
    final Matrix4 matrix = _transformationController.value.clone();
    matrix.scale(0.8);
    _transformationController.value = matrix;
  }

  void _resetView() {
    _transformationController.value = Matrix4.identity();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    _controlsAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        
        return Scaffold(
          backgroundColor: const Color(0xFFF8FFFE),
          body: Stack(
            children: [
              // Main Content
              Column(
                children: [
                  // Clean Header
                  _buildHeader(isMobile),
                  
                  // Image Container - Takes most of the space
                  Expanded(
                    child: _buildImageContainer(constraints),
                  ),
                  
                  // Simple Bottom Info
                  _buildBottomInfo(isMobile),
                ],
              ),
              
              // Floating Controls (Hidden by default)
              _buildFloatingControls(constraints),
              
              // Control Toggle Button
              _buildControlToggle(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF00BFAE).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.hub,
              color: const Color(0xFF00BFAE),
              size: isMobile ? 20 : 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Interactive Concept Map',
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF00BFAE),
                  ),
                ),
                Text(
                  'Explore weight management concepts',
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            InteractiveViewer(
              transformationController: _transformationController,
              panEnabled: true,
              scaleEnabled: true,
              minScale: 0.5,
              maxScale: 4.0,
              child: Image.asset(
                "assets/images/CONCEPTMAP.png",
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return _buildErrorPlaceholder(constraints);
                },
              ),
            ),
            
            // Subtle hint overlay
            Positioned(
              bottom: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.touch_app,
                      size: 16,
                      color: Colors.white,
                    ),
                    Icon(Icons.mouse,
                    size: 16,
                    color: Colors.white,),
                    const SizedBox(width: 6),
                    Text(
                      'Pinch & Drag OR Use your mouse',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorPlaceholder(BoxConstraints constraints) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.hub,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Interactive Concept Map',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Image not found',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomInfo(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: const Color(0xFF00BFAE),
            size: isMobile ? 18 : 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Explore the connections between nutrition, exercise, and health',
              style: TextStyle(
                fontSize: isMobile ? 13 : 14,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingControls(BoxConstraints constraints) {
    return Positioned(
      top: 100,
      right: 16,
      child: AnimatedBuilder(
        animation: _controlsAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _controlsAnimation.value,
            child: Opacity(
              opacity: _controlsAnimation.value,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildControlButton(
                      icon: Icons.zoom_in,
                      onPressed: _zoomIn,
                      tooltip: 'Zoom In',
                    ),
                    const Divider(height: 1),
                    _buildControlButton(
                      icon: Icons.zoom_out,
                      onPressed: _zoomOut,
                      tooltip: 'Zoom Out',
                    ),
                    const Divider(height: 1),
                    _buildControlButton(
                      icon: Icons.center_focus_strong,
                      onPressed: _resetView,
                      tooltip: 'Reset View',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildControlToggle() {
    return Positioned(
      top: 100,
      right: 16,
      child: FloatingActionButton.small(
        onPressed: _toggleControls,
        backgroundColor: const Color(0xFF00BFAE),
        foregroundColor: Colors.white,
        elevation: 4,
        child: AnimatedRotation(
          turns: _showControls ? 0.125 : 0,
          duration: const Duration(milliseconds: 300),
          child: const Icon(Icons.tune),
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onPressed,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Icon(
              icon,
              color: const Color(0xFF00BFAE),
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}