import '../models/lecture_content.dart';

/// Weight Management lecture data following Single Responsibility Principle
/// Responsibility: Provide lecture content for weight management module
class WeightManagementLecture {
  static LectureContent get lectureContent => LectureContent(
    title: 'Weight Management',
    description: 'Interactive lecture and quiz on healthy weight management principles',
    slides: [
      // Slide 1: Title
      const TitleSlide(
        id: 'title',
        title: 'Weight Management',
        subtitle: 'Understanding Healthy Habits for Life',
      ),
      
      // Slide 2: Word Cloud - Favorite Activity
      const WordCloudSlide(
        id: 'word-cloud-1',
        question: 'What is your favorite physical activity for staying healthy?',
        placeholder: 'Enter your favorite activity...',
      ),
      
      // Slide 3: Why Weight Management Matters
      const ContentSlide(
        id: 'why-matters',
        title: 'Why Weight Management Matters',
        bulletPoints: [
          'Maintaining a healthy weight reduces the risk of chronic diseases (e.g., heart disease, diabetes, hypertension)',
          'Supports physical fitness, energy levels, and mental health',
          'Promotes overall well-being and quality of life',
        ],
      ),
      
      // Slide 4: Recommended Diet Habits
      const ContentSlide(
        id: 'diet-habits',
        title: 'Recommended Diet Habits',
        bulletPoints: [
          'Balanced nutrition is key for weight management',
          'Examples of recommended diets:',
          '• High-protein, low-carbohydrate diets',
          '• Low-fat diets',
          '• Nutritionally balanced hypocaloric diets',
          'Not recommended: Eating only one food group or following fad diets',
        ],
      ),
      
      // Slide 5: Role of Nutrition Education
      const ContentSlide(
        id: 'nutrition-education',
        title: 'The Role of Nutrition Education',
        bulletPoints: [
          'Nutrition education helps people:',
          '• Understand food groups and nutrients',
          '• Make informed food choices',
          '• Develop lifelong healthy eating habits',
          'It does NOT encourage skipping meals or fad diets',
        ],
      ),
      
      // Slide 6: Healthy Nutritional Habits
      const ContentSlide(
        id: 'healthy-habits',
        title: 'Healthy Nutritional Habits',
        bulletPoints: [
          'Examples:',
          '• Nutrition education',
          '• Eating a variety of food groups',
          '• Portion control',
          '• Regular meal times',
        ],
      ),
      
      // Slide 7: Multiple Choice Question 1
      const MultipleChoiceSlide(
        id: 'mc-1',
        question: 'Which of the following is NOT a recommended diet habit for weight management?',
        options: [
          'High-protein, low-carbohydrate diets',
          'Eating only one food group',
          'Low-fat diets',
          'Nutritionally balanced hypocaloric diets',
        ],
        correctAnswerIndex: 1,
        explanation: 'Eating only one food group is not recommended as it lacks nutritional balance and can lead to nutrient deficiencies.',
      ),
      
      // Slide 8: Multiple Choice Question 2
      const MultipleChoiceSlide(
        id: 'mc-2',
        question: 'What is the main purpose of nutrition education in weight management?',
        options: [
          'To encourage skipping meals',
          'To help make informed food choices',
          'To promote fad diets',
          'To eliminate all fats',
        ],
        correctAnswerIndex: 1,
        explanation: 'Nutrition education empowers people to make informed food choices based on understanding of nutrients and food groups.',
      ),
      
      // Slide 9: Multiple Choice Question 3
      const MultipleChoiceSlide(
        id: 'mc-3',
        question: 'What is an example of a nutritional habit that is important for weight management?',
        options: [
          'Nutrition education',
          'Skipping meals',
          'Avoiding all carbohydrates',
          'None of the above',
        ],
        correctAnswerIndex: 0,
        explanation: 'Nutrition education is a fundamental habit that enables all other healthy eating behaviors.',
      ),
      
      // Slide 10: Physical Activity
      const ContentSlide(
        id: 'physical-activity',
        title: 'Physical Activity for Weight Management',
        bulletPoints: [
          'Both cardio and strength training are important',
          'Types of activities:',
          '• Aerobic activities: e.g., jogging, cycling (Cardio)',
          '• HIIT: High-intensity interval training (Cardio/Strength)',
          '• Strength/Resistance training: e.g., weightlifting',
          '• Walking: Low-intensity cardio',
        ],
      ),
      
      // Slide 11: 2x2 Grid Activity
      const Grid2x2Slide(
        id: 'grid-activity',
        title: 'Activity Classification',
        instructions: 'Place each activity in the correct quadrant based on intensity and type:',
        items: [
          GridItem(name: 'Aerobic Activities', correctQuadrant: 1), // High Intensity, Cardio
          GridItem(name: 'HIIT', correctQuadrant: 1), // High Intensity, Cardio/Strength
          GridItem(name: 'Strength/Resistance Training', correctQuadrant: 3), // High Intensity, Strength
          GridItem(name: 'Walking', correctQuadrant: 0), // Low Intensity, Cardio
        ],
        xAxisLabel: 'Intensity',
        yAxisLabel: 'Type',
        xAxisLabels: ['Low Intensity', 'High Intensity'],
        yAxisLabels: ['Cardio', 'Strength'],
      ),
      
      // Slide 12: Importance Summary
      const ContentSlide(
        id: 'importance-summary',
        title: 'Why Is Weight Management Important?',
        bulletPoints: [
          'Prevents disease',
          'Improves self-esteem and mental health',
          'Increases lifespan and quality of life',
        ],
      ),
      
      // Slide 13: Word Cloud - Challenges
      const WordCloudSlide(
        id: 'word-cloud-2',
        question: 'Name a challenge people face when trying to manage their weight.',
        placeholder: 'Enter a challenge...',
      ),
      
      // Slide 14: Open-Ended Discussion 1
      const OpenEndedSlide(
        id: 'open-1',
        question: 'Explain one reason why managing weight is important for overall health.',
        context: 'Think about the physical, mental, and social benefits we\'ve discussed.',
      ),
      
      // Slide 15: Community Support
      const ContentSlide(
        id: 'community-support',
        title: 'Promoting Healthy Weight Management',
        bulletPoints: [
          'Schools and communities can:',
          '• Offer healthy meal options',
          '• Provide nutrition education',
          '• Encourage physical activity through programs and facilities',
        ],
      ),
      
      // Slide 16: Open-Ended Discussion 2
      const OpenEndedSlide(
        id: 'open-2',
        question: 'Suggest one way schools or communities can promote healthy weight management.',
        context: 'Consider practical solutions that could be implemented in your community.',
      ),
      
      // Slide 17: Summary
      const ContentSlide(
        id: 'summary',
        title: 'Summary & Takeaways',
        bulletPoints: [
          'Healthy weight management involves balanced nutrition, regular physical activity, and informed choices',
          'Education and community support play a vital role',
          'Everyone can take small steps toward better health',
        ],
      ),
      
      // Slide 18: Q&A
      const ContentSlide(
        id: 'qa',
        title: 'Q&A',
        bulletPoints: [
          'Any questions? Let\'s discuss!',
        ],
      ),
    ],
  );
}