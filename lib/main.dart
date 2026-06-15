import 'package:flutter/material.dart';
import 'package:interactive_e_book_system/data/ContentRepository.dart';
import 'package:interactive_e_book_system/data/TermsRepository.dart';
import 'package:interactive_e_book_system/data/questionRepository2.dart';
import 'package:interactive_e_book_system/data/quizRepository.dart';
import 'package:interactive_e_book_system/viewmodels/ContentViewModel.dart';
import 'package:interactive_e_book_system/viewmodels/TermsViewModel.dart';
import 'package:interactive_e_book_system/viewmodels/questioonViewModel2.dart';
import 'package:interactive_e_book_system/viewmodels/quizViewModel.dart';
import 'package:interactive_e_book_system/views/mainPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        // Inject Repository into ViewModel
        ChangeNotifierProvider(
        create: (_) =>
              QuizViewModel(QuizRepository()),
        ),

        ChangeNotifierProvider(
          create: (_) =>
              TermsViewModel(TermsRepository()),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              QuestionViewModel(QuestionRepository()),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              ContentViewModel(ContentRepository ()),
        ),

      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomePage()
      ),
    );
  }
}


