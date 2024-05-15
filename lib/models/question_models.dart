class QuestionModels {
  final String question;
  final List<String> answer;
  final String correctanswer;

  const QuestionModels({
    required this.question,
    required this.answer,
    required this.correctanswer,
  });
}
  List<QuestionModels> questionWithAnswer =const [
    QuestionModels(
        question: 'What\'s favarite color?',
        answer: ['Yall', 'Blue', 'Green', 'Black'],
        correctanswer: 'Red'),
    QuestionModels(
        question: 'What\'s favarite food?',
        answer: ['Pizza', 'Pasta', 'Burger', 'Sandwich'],
        correctanswer: 'Pizza'),
    QuestionModels(
        question: 'What\'s favarite animals?',
        answer: ['Cat', 'Dog', 'Elephent', 'lion'],
        correctanswer: 'Cat'),
    QuestionModels(
        question: 'What\'s favarite movie?',
        answer: ['Taitanic', 'Avatar', 'Eternals', 'Inception'],
        correctanswer: 'Avatar'),
  ];

