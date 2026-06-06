import 'package:flutter/material.dart';
import 'package:interactive_e_book_system/views/quizPage.dart';

class ExerciseTab extends StatelessWidget {

  final List<Map<String, String>> quizzes = [
    {
      "title": "Chemistry",
      "path": "images/data/QuestionSample.json"
    },
    {
      "title": "Physics",
      "path": "images/data/QuestionSample.json2.json"
    },
    {
      "title": "Chemistry",
      "path": "images/data/QuestionSample.json"
    },
  ];

  @override
  Widget build(BuildContext context) {

    return ListView.builder(

      itemCount: quizzes.length,
      itemBuilder: (context, index) {


        return Card(
          child: ListTile(
            title: Text(quizzes[index]["title"]!),

            trailing: Icon(Icons.arrow_forward),

            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QuizPage(
                    path: quizzes[index]["path"]!,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}