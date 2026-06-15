import 'package:flutter/material.dart';
import 'package:interactive_e_book_system/data/ContentRepository.dart';
import 'package:interactive_e_book_system/models/lessonModel.dart';

class ContentViewModel extends ChangeNotifier {

  final ContentRepository repository;

  ContentViewModel(this.repository);

  List<Lesson> lessons = [];

  bool isLoading = false;

  Future<void> loadContent() async {

    isLoading = true;
    notifyListeners();

    lessons = await repository.getLessons();

    isLoading = false;
    notifyListeners();
  }
}