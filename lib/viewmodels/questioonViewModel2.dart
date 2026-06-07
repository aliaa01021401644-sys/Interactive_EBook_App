import 'package:flutter/material.dart';
import 'package:interactive_e_book_system/data/questionRepository2.dart';
import 'package:interactive_e_book_system/models/questionModel2.dart';


class QuestionViewModel extends ChangeNotifier {

  final QuestionRepository repository;

  QuestionViewModel(this.repository);

  List<QuestionModel> questions = [];
  bool isLoading = false;

  Future<void> loadQuestions() async {

    isLoading = true;
    notifyListeners();

    questions = await repository.getQuestions();

    isLoading = false;
    notifyListeners();
  }
}