import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../theme/app_theme.dart';

// Web-specific imports
import 'dart:html' as html show window, IFrameElement;
import 'dart:ui_web' as ui_web;

/// Video lecture page following Single Responsibility Principle
/// Single Responsibility: Display YouTube video content for educational purposes
class VideoPage extends StatefulWidget {
  final String videoId;
  final String title;
  final String description;
  final PageColorScheme colorScheme;

  const VideoPage({
    super.key,
    required this.videoId,
    required this.title,
    required this.description,
    required this.colorScheme,
  });

  /// Factory constructor for creating video page from YouTube URL
  factory VideoPage.fromUrl({
    required String youtubeUrl,
    required String title,
    required String description,
    PageColorScheme? colorScheme,
  }) {
    final videoId = _extractVideoId(youtubeUrl);
    return VideoPage(
      videoId: videoId,
      title: title,
      description: description,
      colorScheme: colorScheme ?? AppTheme.pageColorSchemes[1],
    );
  }

  /// Extract video ID from YouTube URL
  static String _extractVideoId(String url) {
    // Handle various YouTube URL formats
    final regExp = RegExp(
      r'(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})',
      caseSensitive: false,
    );
    
    final match = regExp.firstMatch(url);
    if (match != null && match.groupCount >= 1) {
      return match.group(1) ?? '';
    }
    
    // If no match found, assume the input is already a video ID
    return url.length == 11 ? url : '';
  }

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  bool _isVideoPlaying = false;
  String? _iframeViewType;

  @override
  void initState() {
    super.initState();
    if (widget.videoId.isNotEmpty) {
      _registerIframeView();
    }
  }

  void _registerIframeView() {
    if (!kIsWeb) return; // Only register on web platform
    
    _iframeViewType = 'youtube-player-${widget.videoId}';
    
    // Register the iframe view for web
    ui_web.platformViewRegistry.registerViewFactory(
      _iframeViewType!,
      (int viewId) {
        final iframe = html.IFrameElement()
          ..src = 'https://www.youtube.com/embed/${widget.videoId}?autoplay=0&rel=0&modestbranding=1&fs=1'
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%'
          ..allowFullscreen = true;
        
        return iframe;
      },
    );
  }

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
          
          // Video Content
          _buildVideoContent(context, isMobile, isTablet),
          
          // Video Information
          _buildVideoInformation(isMobile),
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
            widget.colorScheme.primary.withOpacity(0.1),
            widget.colorScheme.secondary.withOpacity(0.1),
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
              Icons.play_circle,
              size: isMobile ? 48 : 64,
              color: widget.colorScheme.primary,
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              widget.title,
              style: isMobile ? AppTheme.headlineMedium : AppTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingM),
            Text(
              widget.description,
              style: AppTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoContent(BuildContext context, bool isMobile, bool isTablet) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? AppTheme.spacingL : AppTheme.spacingXxl),
      child: Card(
        elevation: AppTheme.elevationM,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
            gradient: LinearGradient(
              colors: [
                widget.colorScheme.primary.withOpacity(0.05),
                widget.colorScheme.secondary.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.spacingXl),
            child: Column(
              children: [
                // Video Header
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingL,
                    vertical: AppTheme.spacingM,
                  ),
                  decoration: BoxDecoration(
                    color: widget.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusL),
                    border: Border.all(
                      color: widget.colorScheme.primary.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.video_library,
                        size: isMobile ? 24 : 32,
                        color: widget.colorScheme.primary,
                      ),
                      const SizedBox(width: AppTheme.spacingM),
                      Text(
                        'VIDEO LECTURE',
                        style: AppTheme.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: widget.colorScheme.primary,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: AppTheme.spacingXl),
                
                // Video Player Container
                _buildVideoPlayer(context, isMobile, isTablet),
                
                const SizedBox(height: AppTheme.spacingL),
                
                // Video Controls
                if (!_isVideoPlaying) _buildVideoControls(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(BuildContext context, bool isMobile, bool isTablet) {
    if (widget.videoId.isEmpty) {
      return _buildVideoPlaceholder();
    }

    // Calculate responsive dimensions
    double videoWidth;
    double videoHeight;
    
    if (isMobile) {
      videoWidth = MediaQuery.of(context).size.width - (AppTheme.spacingL * 4);
      videoHeight = videoWidth * 9 / 16; // 16:9 aspect ratio
    } else if (isTablet) {
      videoWidth = 600;
      videoHeight = 338; // 16:9 aspect ratio
    } else {
      videoWidth = 800;
      videoHeight = 450; // 16:9 aspect ratio
    }

    return Container(
      width: videoWidth,
      height: videoHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        child: _isVideoPlaying ? _buildEmbeddedPlayer() : _buildVideoThumbnail(),
      ),
    );
  }

  Widget _buildEmbeddedPlayer() {
    if (!kIsWeb || _iframeViewType == null) {
      // Fallback for non-web platforms or if iframe registration failed
      return _buildVideoFallback();
    }
    
    return HtmlElementView(
      viewType: _iframeViewType!,
    );
  }

  Widget _buildVideoFallback() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.play_circle_outline,
            size: 64,
            color: Colors.white.withOpacity(0.8),
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            'Video Player Loading...',
            style: AppTheme.titleMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            'Click "Open in YouTube" to watch',
            style: AppTheme.bodyMedium.copyWith(
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoThumbnail() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
      ),
      child: Stack(
        children: [
          // YouTube thumbnail
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
              image: DecorationImage(
                image: NetworkImage(
                  'https://img.youtube.com/vi/${widget.videoId}/maxresdefault.jpg',
                ),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {
                  // Handle image load error - try standard quality
                  setState(() {});
                },
              ),
            ),
          ),
          
          // Play button overlay
          Center(
            child: GestureDetector(
              onTap: _playVideo,
              child: Container(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),
          ),
          
          // YouTube logo
          Positioned(
            bottom: AppTheme.spacingM,
            right: AppTheme.spacingM,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingS,
                vertical: AppTheme.spacingXs,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(AppTheme.radiusS),
              ),
              child: const Text(
                'YouTube',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: _playVideo,
          icon: const Icon(Icons.play_arrow),
          label: const Text('Play Video'),
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.colorScheme.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingL,
              vertical: AppTheme.spacingM,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
            ),
          ),
        ),
        const SizedBox(width: AppTheme.spacingM),
        OutlinedButton.icon(
          onPressed: _openInNewTab,
          icon: const Icon(Icons.open_in_new),
          label: const Text('Open in YouTube'),
          style: OutlinedButton.styleFrom(
            foregroundColor: widget.colorScheme.primary,
            side: BorderSide(color: widget.colorScheme.primary),
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingL,
              vertical: AppTheme.spacingM,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVideoPlaceholder() {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: widget.colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        border: Border.all(
          color: widget.colorScheme.primary.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.video_library_outlined,
            size: 64,
            color: widget.colorScheme.primary.withOpacity(0.6),
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            'Video Not Available',
            style: AppTheme.titleMedium.copyWith(
              color: widget.colorScheme.primary.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            'Please check the video URL',
            style: AppTheme.bodyMedium.copyWith(
              color: widget.colorScheme.primary.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoInformation(bool isMobile) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? AppTheme.spacingL : AppTheme.spacingXxl),
      child: Card(
        elevation: AppTheme.elevationS,
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingXl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: isMobile ? 24 : 32,
                    color: widget.colorScheme.primary,
                  ),
                  const SizedBox(width: AppTheme.spacingM),
                  Text(
                    'About This Video',
                    style: isMobile ? AppTheme.titleLarge : AppTheme.headlineSmall,
                  ),
                ],
              ),
              
              const SizedBox(height: AppTheme.spacingL),
              
              Text(
                widget.description,
                style: AppTheme.bodyLarge.copyWith(height: 1.6),
              ),
              
              const SizedBox(height: AppTheme.spacingL),
              
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingM),
                decoration: BoxDecoration(
                  color: widget.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusM),
                  border: Border.all(
                    color: widget.colorScheme.primary.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: widget.colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: AppTheme.spacingS),
                    Expanded(
                      child: Text(
                        'Take notes while watching to enhance your learning experience.',
                        style: AppTheme.bodyMedium.copyWith(
                          color: widget.colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _playVideo() {
    setState(() {
      _isVideoPlaying = true;
    });
  }

  void _openInNewTab() {
    html.window.open(
      'https://www.youtube.com/watch?v=${widget.videoId}',
      '_blank',
    );
  }
}