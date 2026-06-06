import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:interactive_e_book_system/models/questionModel.dart';

class QuizRepository {

  Future<List<Question>> getQuiz(String path) async {

    final data = await rootBundle.loadString(path);

    final jsonData = json.decode(data);

    return (jsonData["questions"] as List)
        .map((e) => Question.fromJson(e))
        .toList();
  }
}
