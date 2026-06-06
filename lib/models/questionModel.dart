class Answer {
  final String text;
  final bool isCorrect;
  final String chosenFeedback;
  final String tip;

  Answer({
    required this.text,
    required this.isCorrect,
    required this.chosenFeedback,
    required this.tip,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      text: json['text'],
      isCorrect: json['isCorrect'],
      chosenFeedback: json['chosenFeedback'] ?? '',
      tip: json['tip'] ?? '',
    );
  }
}

class Question {
  final String question;
  final List<Answer> answers;

  Question({
    required this.question,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      answers: (json['answers'] as List)
          .map((e) => Answer.fromJson(e))
          .toList(),
    );
  }
}