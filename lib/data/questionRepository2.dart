import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:interactive_e_book_system/models/questionModel2.dart';


class QuestionRepository {

  Future<List<QuestionModel>> getQuestions() async {

    final data = await rootBundle.loadString(
      'images/data/question.json',
    );

    final jsonResult = json.decode(data);

    return (jsonResult['questions'] as List)
        .map((e) => QuestionModel.fromJson(e))
        .toList();
  }
}