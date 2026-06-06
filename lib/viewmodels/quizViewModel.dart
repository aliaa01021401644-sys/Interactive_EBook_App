import 'package:flutter/material.dart';
import 'package:interactive_e_book_system/data/quizRepository.dart';
import 'package:interactive_e_book_system/models/questionModel.dart';

class QuizViewModel extends ChangeNotifier {

  final QuizRepository repository;

  QuizViewModel(this.repository);

  List<Question> questions = [];

  List<int?> selectedAnswers = [];
  List<bool> checked = [];
  List<String> feedbacks = [];
  List<String> tips = [];

  bool isLoading = false;

  Future<void> loadQuiz(String path) async {

    isLoading = true;
    notifyListeners();

    questions = await repository.getQuiz(path);

    selectedAnswers = List.filled(questions.length, null);
    checked = List.filled(questions.length, false);
    feedbacks = List.filled(questions.length, '');
    tips = List.filled(questions.length, '');

    isLoading = false;
    notifyListeners();
  }

  void selectAnswer(int qIndex, int value) {
    selectedAnswers[qIndex] = value;
    notifyListeners();
  }

  void checkAnswer(int qIndex) {

    if (selectedAnswers[qIndex] == null) return;

    final answer =
    questions[qIndex].answers[selectedAnswers[qIndex]!];

    checked[qIndex] = true;
    feedbacks[qIndex] = answer.chosenFeedback;
    tips[qIndex] = answer.tip;

    notifyListeners();
  }
}