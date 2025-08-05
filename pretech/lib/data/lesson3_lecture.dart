import '../models/lecture_content.dart';

/// Lesson 3 lecture data following Single Responsibility Principle
/// Responsibility: Provide lecture content for physical activities module
class Lesson3Lecture {
  static LectureContent get lectureContent => LectureContent(
    title: 'Physical Activities for Weight Management',
    description: 'Interactive lecture and quiz on physical activities and exercise for effective weight management',
    slides: [
      // Slide 1: Title
      const TitleSlide(
        id: 'title',
        title: 'Physical Activities for Weight Management',
        subtitle: 'Understanding Exercise and Movement for Healthy Living',
      ),
      
      // Slide 2: Introduction
      const ContentSlide(
        id: 'introduction',
        title: 'Introduction',
        bulletPoints: [
          'Physical activity is essential for effective weight management',
          'Regular movement provides profound health benefits',
          'Different types of exercises serve different purposes',
          'Understanding metabolism helps optimize exercise choices',
        ],
      ),
      
      // Slide 3: How the Body Loses Weight
      const ContentSlide(
        id: 'metabolism',
        title: 'How the Body Loses Weight',
        bulletPoints: [
          'Metabolism converts food and beverages into energy',
          'Daily calorie expenditure includes:',
          '• Basal Metabolic Rate (BMR) - varies by body size, muscle, sex, age',
          '• Food digestion (approximately 10%)',
          '• Physical activity and NEAT (Non-Exercise Activity Thermogenesis)',
          'Regular exercise increases resting metabolic rate',
        ],
      ),
      
      // Slide 4: Common Exercise Myths
      const ContentSlide(
        id: 'myths',
        title: 'Common Myths About Exercise',
        bulletPoints: [
          'MYTH: More sweat = more fat burning',
          'FACT: Sweat is thermoregulation, not fat burning indicator',
          'Exercise efficiency depends on intensity, duration, and type',
          'Not volume of sweat produced',
          'Same calories burned in hot vs. cold environments',
        ],
      ),
      
      // Slide 5: Multiple Choice Question 1
      const MultipleChoiceSlide(
        id: 'mc-1',
        question: 'What primarily determines your daily calorie expenditure?',
        options: [
          'Sweating during exercise',
          'Physical Activity',
          'Basal Metabolic Rate (BMR), food digestion, and physical activity',
          'Calorie Intake',
        ],
        correctAnswerIndex: 2,
        explanation: 'Daily calorie expenditure is determined by BMR, calories burned during food digestion (approximately 10%), and physical activity including NEAT.',
      ),
      
      // Slide 6: Multiple Choice Question 2
      const MultipleChoiceSlide(
        id: 'mc-2',
        question: 'Profuse sweating during exercise indicates:',
        options: [
          'Higher fat burning',
          'Effective thermoregulation',
          'Dehydration risk only',
          'Reduced calorie burn',
        ],
        correctAnswerIndex: 1,
        explanation: 'Sweat is a cooling system for thermoregulation, not an indicator of calorie or fat burning (Gonzalez et al., 2012).',
      ),
      
      // Slide 7: Aerobic Activities
      const ContentSlide(
        id: 'aerobic',
        title: 'Aerobic (Cardio) Activities',
        bulletPoints: [
          'Rhythmic, continuous movement of large muscle groups',
          'Examples: walking, cycling, swimming',
          'Elevates heart rate and breathing for sustained periods',
          'Improves cardiovascular and respiratory function',
          'Enhances body\'s oxygen utilization',
        ],
      ),
      
      // Slide 8: HIIT Training
      const ContentSlide(
        id: 'hiit',
        title: 'High-Intensity Interval Training (HIIT)',
        bulletPoints: [
          'Alternates short bursts of near-maximum effort with recovery',
          'Examples: sprinting, cycling intervals',
          'Sessions often 10–30 minutes long',
          'Improves cardiovascular fitness and insulin sensitivity',
          'As effective as longer moderate-intensity workouts',
        ],
      ),
      
      // Slide 9: Strength Training
      const ContentSlide(
        id: 'strength',
        title: 'Strength/Resistance Training',
        bulletPoints: [
          'Exercises muscles against external resistance',
          'Examples: weights, bands, machines, body weight',
          'Focuses on short bursts of effort',
          'Creates microscopic muscle damage for repair and growth',
          'Increases muscle mass to boost resting metabolism',
        ],
      ),
      
      // Slide 10: Multiple Choice Question 3
      const MultipleChoiceSlide(
        id: 'mc-3',
        question: 'Non-Exercise Activity Thermogenesis (NEAT) includes:',
        options: [
          'Marathon running',
          'Taking stairs, standing, or fidgeting',
          'Weightlifting sessions',
          'Scheduled HIIT workouts',
        ],
        correctAnswerIndex: 1,
        explanation: 'NEAT refers to daily activities like taking stairs, standing, or fidgeting - not formal exercise routines.',
      ),
      
      // Slide 11: Multiple Choice Question 4
      const MultipleChoiceSlide(
        id: 'mc-4',
        question: 'A key advantage of aerobic activities (e.g., swimming) is:',
        options: [
          'Spot-reducing belly fat',
          'Eliminating the need for nutrition changes',
          'Building maximal muscle strength',
          'Improving cardiovascular oxygen utilization',
        ],
        correctAnswerIndex: 3,
        explanation: 'Aerobic exercise improves cardiovascular and respiratory function by enhancing the body\'s oxygen utilization.',
      ),
      
      // Slide 12: Multiple Choice Question 5
      const MultipleChoiceSlide(
        id: 'mc-5',
        question: 'HIIT improves health by:',
        options: [
          'Requiring 60+ minute sessions',
          'Matching benefits of longer workouts in shorter time',
          'Exclusively building muscle mass',
          'Prioritizing sweat production',
        ],
        correctAnswerIndex: 1,
        explanation: 'HIIT sessions (often 10–30 minutes) can improve cardiovascular fitness and insulin sensitivity as effectively as longer moderate-intensity workouts.',
      ),
      
      // Slide 13: Multiple Choice Question 6
      const MultipleChoiceSlide(
        id: 'mc-6',
        question: 'Resistance training primarily aids weight management by:',
        options: [
          'Burning most calories during workouts',
          'Reducing BMR over time',
          'Increasing muscle mass to boost resting metabolism',
          'Focusing on sweat-based fat loss',
        ],
        correctAnswerIndex: 2,
        explanation: 'Resistance training builds muscle mass, which increases resting metabolic rate and helps burn more calories even when not exercising.',
      ),
      
      // Slide 14: Multiple Choice Question 7
      const MultipleChoiceSlide(
        id: 'mc-7',
        question: 'The claim "sweat isn\'t a fat-burn indicator" is supported by:',
        options: [
          'Social media influencers',
          'Gonzalez et al. (2012)',
          'Fitness magazine polls',
          'Gym folklore',
        ],
        correctAnswerIndex: 1,
        explanation: 'This scientific claim is supported by research from Gonzalez et al. (2012).',
      ),
      
      // Slide 15: Multiple Choice Question 8
      const MultipleChoiceSlide(
        id: 'mc-8',
        question: 'The CDC emphasizes that physical activity is critical for:',
        options: [
          'Quick weight loss without diet changes',
          'Health/weight control as you age',
          'Replacing medical treatments',
          'Spot-reduction goals',
        ],
        correctAnswerIndex: 1,
        explanation: 'The CDC states that staying physically active is most important for good health and weight control as you get older.',
      ),
      
      // Slide 16: Multiple Choice Question 9
      const MultipleChoiceSlide(
        id: 'mc-9',
        question: 'Optimal weight management combines:',
        options: [
          'HIIT alone',
          'Sweat-centric workouts',
          'Aerobic + strength training + NEAT',
          'Exercise without dietary adjustments',
        ],
        correctAnswerIndex: 2,
        explanation: 'Effective weight management combines aerobic exercise, strength training, and NEAT activities for comprehensive results.',
      ),
      
      // Slide 17: Multiple Choice Question 10
      const MultipleChoiceSlide(
        id: 'mc-10',
        question: 'Believing "sweating more = more fat loss" is inaccurate because:',
        options: [
          'Sweat cools the body, unrelated to calorie burn',
          'Sweat measures workout enjoyment',
          'All exercises produce equal sweat',
          'Fat exits only through breath',
        ],
        correctAnswerIndex: 0,
        explanation: 'Sweat is a cooling mechanism for thermoregulation and is not related to calorie or fat burning.',
      ),
      
      // Slide 18: Word Cloud Activity
      const WordCloudSlide(
        id: 'word-cloud-1',
        question: 'What is your favorite type of physical activity for staying healthy?',
        placeholder: 'Enter your favorite activity...',
      ),
      
      // Slide 19: Open-Ended Discussion
      const OpenEndedSlide(
        id: 'open-1',
        question: 'Describe one way you can incorporate more NEAT (Non-Exercise Activity Thermogenesis) into your daily routine.',
        context: 'Think about simple activities like taking stairs, standing while working, or walking during phone calls.',
      ),
      
      // Slide 20: Summary
      const ContentSlide(
        id: 'summary',
        title: 'Summary & Key Takeaways',
        bulletPoints: [
          'Physical activity is essential for effective weight management',
          'Combine aerobic exercise, strength training, and NEAT activities',
          'Exercise efficiency depends on intensity, duration, and type - not sweat',
          'Regular exercise increases resting metabolic rate',
          'Stay physically active for health and weight control as you age',
        ],
      ),
      
      // Slide 21: Q&A
      const ContentSlide(
        id: 'qa',
        title: 'Questions & Discussion',
        bulletPoints: [
          'Any questions about physical activities for weight management?',
          'Let\'s discuss your experiences with different types of exercise!',
        ],
      ),
    ],
  );
}