import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:interactive_e_book_system/models/termsModel.dart';

class TermsRepository {

  Future<List<Term>> getTerms() async {

    String data =
    await rootBundle.loadString(
      'images/data/Terms.json',
    );

    final jsonResult =
    json.decode(data);

    return (jsonResult['terms'] as List)
        .map((e) => Term.fromJson(e))
        .toList();
  }
}