import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:interactive_e_book_system/models/lessonModel.dart';

class ContentRepository {

  Future<List<Lesson>> getLessons() async {

    String data = await rootBundle.loadString(
      'images/data/LessonSample.json',
    );

    final jsonResult = json.decode(data);

    return (jsonResult["ontology"][0]["children"] as List)
        .map((e) => Lesson.fromJson(e))
        .toList();
  }
}