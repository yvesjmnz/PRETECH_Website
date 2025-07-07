import 'package:flutter/material.dart';
import '../../models/lecture_content.dart';
import '../../theme/app_theme.dart';
import 'title_slide_widget.dart';
import 'content_slide_widget.dart';
import 'multiple_choice_widget.dart';
import 'grid_2x2_widget.dart';
import 'word_cloud_widget.dart';
import 'open_ended_widget.dart';

/// Slide renderer following Single Responsibility Principle
/// Responsibility: Route slides to appropriate widget renderers
class SlideRenderer extends StatelessWidget {
  final LectureSlide slide;
  final VoidCallback? onNext;

  const SlideRenderer({
    super.key,
    required this.slide,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      child: _buildSlideContent(),
    );
  }

  Widget _buildSlideContent() {
    switch (slide.type) {
      case SlideType.title:
        return TitleSlideWidget(
          slide: slide as TitleSlide,
          onNext: onNext,
        );
      case SlideType.content:
        return ContentSlideWidget(
          slide: slide as ContentSlide,
          onNext: onNext,
        );
      case SlideType.multipleChoice:
        return MultipleChoiceWidget(
          slide: slide as MultipleChoiceSlide,
          onNext: onNext,
        );
      case SlideType.grid2x2:
        return Grid2x2Widget(
          slide: slide as Grid2x2Slide,
          onNext: onNext,
        );
      case SlideType.wordCloud:
        return WordCloudWidget(
          slide: slide as WordCloudSlide,
          onNext: onNext,
        );
      case SlideType.openEnded:
        return OpenEndedWidget(
          slide: slide as OpenEndedSlide,
          onNext: onNext,
        );
    }
  }
}