import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:interactive_e_book_system/viewmodels/questioonViewModel2.dart';
import 'package:interactive_e_book_system/views/questionPage2.dart';
import 'package:provider/provider.dart';

class Exercise extends StatefulWidget {
  @override
  State<Exercise> createState() => _ExerciseTabState();
}

class _ExerciseTabState extends State<Exercise> {

  @override
  void initState() {
    super.initState();
    context.read<QuestionViewModel>().loadQuestions();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<QuestionViewModel>(
      builder: (context, vm, child) {

        return ListView.builder(
          itemCount: vm.questions.length,
          itemBuilder: (context, index) {

            final q = vm.questions[index];

            return ListTile(
              title: Text(q.title),
              trailing: Icon(Icons.arrow_forward),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuestionPage(title: q.title,question: q.question,url: q.url,)
                        //QuestionPage(question: q),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}