import '../models/lecture_content.dart';

/// Lesson 2 Assessment Data - Nutrition and Pinggang Pinoy Quiz
/// Single Responsibility: Provide quiz content for Lesson 2 assessment
class Lesson2AssessmentData {
  static LectureContent get assessmentContent => LectureContent(
    title: 'Lesson 2: Nutrition and Pinggang Pinoy Assessment',
    description: 'Test your knowledge about nutrition and the Pinggang Pinoy food guide',
    slides: [
      // Title slide
      const TitleSlide(
        id: 'title',
        title: 'Lesson 2 Assessment',
        subtitle: 'Nutrition and Pinggang Pinoy Quiz',
      ),
      
      // Question 1
      const MultipleChoiceSlide(
        id: 'q1',
        question: 'What are the purpose of glow foods?',
        options: [
          'Body building',
          'Energy providing',
          'Body regulating',
          'Weight management',
        ],
        correctAnswerIndex: 2, // Body regulating
        explanation: 'Glow foods are rich in vitamins, minerals, and fiber that help regulate body functions and protect against diseases.',
      ),
      
      // Question 2
      const MultipleChoiceSlide(
        id: 'q2',
        question: 'What are the purpose of grow foods?',
        options: [
          'Energy providing',
          'Body building',
          'Weight loss',
          'Body regulating',
        ],
        correctAnswerIndex: 1, // Body building
        explanation: 'Grow foods are rich in protein and are essential for building and repairing body tissues, muscles, and bones.',
      ),
      
      // Question 3
      const MultipleChoiceSlide(
        id: 'q3',
        question: 'What are the purpose of go foods?',
        options: [
          'Energy providing',
          'Weight loss',
          'Body regulating',
          'Body building',
        ],
        correctAnswerIndex: 0, // Energy providing
        explanation: 'Go foods are high in carbohydrates and serve as the primary source of energy for daily activities.',
      ),
      
      // Question 4
      const MultipleChoiceSlide(
        id: 'q4',
        question: 'The process of getting the nutrients and foods your body needs to function',
        options: [
          'Nutrition',
          'Metabolism',
          'Digestion',
          'Catabolism',
        ],
        correctAnswerIndex: 0, // Nutrition
        explanation: 'Nutrition is the process of getting the food and nutrients your body needs to function well.',
      ),
      
      // Question 5
      const MultipleChoiceSlide(
        id: 'q5',
        question: 'What is the recommended daily amount of water intake?',
        options: [
          '10-12 glasses',
          '6-8 glasses',
          '3-5 glasses',
          '9-11 glasses',
        ],
        correctAnswerIndex: 1, // 6-8 glasses
        explanation: 'The Pinggang Pinoy guide recommends drinking 6 to 8 glasses of water daily for proper hydration.',
      ),
      
      // Question 6
      const MultipleChoiceSlide(
        id: 'q6',
        question: 'What is the main component of go foods?',
        options: [
          'Lipids',
          'Fiber',
          'Carbohydrates',
          'Protein',
        ],
        correctAnswerIndex: 2, // Carbohydrates
        explanation: 'Go foods are high in carbohydrates, which are broken down by our bodies to provide energy for our cells.',
      ),
      
      // Question 7
      const MultipleChoiceSlide(
        id: 'q7',
        question: 'What is NOT part of the main components of glow foods?',
        options: [
          'Vitamins',
          'Minerals',
          'Fiber',
          'Lipids',
        ],
        correctAnswerIndex: 3, // Lipids
        explanation: 'Glow foods are rich in vitamins, minerals, fiber, and antioxidants, but not primarily in lipids (fats).',
      ),
      
      // Question 8
      const MultipleChoiceSlide(
        id: 'q8',
        question: 'What is the main component of grow foods?',
        options: [
          'Carbohydrates',
          'Fats',
          'Proteins',
          'Fiber',
        ],
        correctAnswerIndex: 2, // Proteins
        explanation: 'Grow foods are rich in protein, which serves as building blocks for tissues like muscles, bones, skin, and blood.',
      ),
      
      // Summary slide
      const ContentSlide(
        id: 'summary',
        title: 'Assessment Complete!',
        bulletPoints: [
          'Congratulations on completing the Lesson 2 assessment',
          'You have learned about nutrition and the Pinggang Pinoy food guide',
          'Continue practicing healthy eating habits using the Filipino food guide',
          'Remember: Fill half your plate with Glow foods, and divide the other half between Go and Grow foods',
        ],
      ),
    ],
  );
}