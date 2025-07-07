import 'package:flutter/material.dart';

/// Lecture content model following Single Responsibility Principle
/// Responsibility: Define structure for lecture presentations
class LectureContent {
  final String title;
  final String description;
  final List<LectureSlide> slides;
  
  const LectureContent({
    required this.title,
    required this.description,
    required this.slides,
  });
}

/// Base class for all slide types following Open/Closed Principle
abstract class LectureSlide {
  final String id;
  final SlideType type;
  
  const LectureSlide({
    required this.id,
    required this.type,
  });
}

/// Slide types enumeration
enum SlideType {
  title,
  content,
  multipleChoice,
  grid2x2,
  wordCloud,
  openEnded,
}

/// Title slide
class TitleSlide extends LectureSlide {
  final String title;
  final String? subtitle;
  
  const TitleSlide({
    required super.id,
    required this.title,
    this.subtitle,
  }) : super(type: SlideType.title);
}

/// Content slide with bullet points
class ContentSlide extends LectureSlide {
  final String title;
  final List<String> bulletPoints;
  final String? subtitle;
  
  const ContentSlide({
    required super.id,
    required this.title,
    required this.bulletPoints,
    this.subtitle,
  }) : super(type: SlideType.content);
}

/// Multiple choice question slide
class MultipleChoiceSlide extends LectureSlide {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;
  
  const MultipleChoiceSlide({
    required super.id,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
  }) : super(type: SlideType.multipleChoice);
}

/// 2x2 Grid activity slide
class Grid2x2Slide extends LectureSlide {
  final String title;
  final String instructions;
  final List<GridItem> items;
  final String xAxisLabel;
  final String yAxisLabel;
  final List<String> xAxisLabels; // [Low, High]
  final List<String> yAxisLabels; // [Bottom, Top]
  
  const Grid2x2Slide({
    required super.id,
    required this.title,
    required this.instructions,
    required this.items,
    required this.xAxisLabel,
    required this.yAxisLabel,
    required this.xAxisLabels,
    required this.yAxisLabels,
  }) : super(type: SlideType.grid2x2);
}

/// Grid item for 2x2 activity
class GridItem {
  final String name;
  final int correctQuadrant; // 0-3 (top-left, top-right, bottom-left, bottom-right)
  
  const GridItem({
    required this.name,
    required this.correctQuadrant,
  });
}

/// Word cloud input slide
class WordCloudSlide extends LectureSlide {
  final String question;
  final String placeholder;
  
  const WordCloudSlide({
    required super.id,
    required this.question,
    required this.placeholder,
  }) : super(type: SlideType.wordCloud);
}

/// Open-ended discussion slide
class OpenEndedSlide extends LectureSlide {
  final String question;
  final String? context;
  
  const OpenEndedSlide({
    required super.id,
    required this.question,
    this.context,
  }) : super(type: SlideType.openEnded);
}