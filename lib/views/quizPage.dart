
import 'package:flutter/material.dart';
import 'package:interactive_e_book_system/viewmodels/quizViewModel.dart';
import 'package:provider/provider.dart';



class QuizPage extends StatefulWidget {

final String path;

QuizPage({required this.path});

@override
State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

@override
void initState() {
super.initState();

Future.microtask(() {

Provider.of<QuizViewModel>(
context,
listen: false,
).loadQuiz(widget.path);
});
}

@override
Widget build(BuildContext context) {

return Scaffold(
// backgroundColor: Colors.brown,
appBar: AppBar(title: Text("Exercise"),
    backgroundColor: Colors.amber,
),


body: Consumer<QuizViewModel>(
builder: (context, vm, child) {

if (vm.isLoading) {
return Center(child: CircularProgressIndicator());
}

return ListView.builder(
itemCount: vm.questions.length,
itemBuilder: (context, qIndex) {

final q = vm.questions[qIndex];

return Card(
margin: EdgeInsets.all(10),
child: Padding(
padding: EdgeInsets.all(10),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

Text(
q.question,
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),

...List.generate(q.answers.length, (aIndex) {

return RadioListTile(
value: aIndex,
groupValue: vm.selectedAnswers[qIndex],
title: Text(q.answers[aIndex].text),

onChanged: (val) {
vm.selectAnswer(qIndex, val as int);
},
);
}),

ElevatedButton(
onPressed: () {
vm.checkAnswer(qIndex);
},
child: Text("Check"),
),
 if (vm.checked[qIndex])
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

Text(
vm.feedbacks[qIndex],
style: TextStyle(
fontWeight: FontWeight.bold,
),
),

if (vm.tips[qIndex].isNotEmpty)
Text(
"Tip: ${vm.tips[qIndex]}",
style: TextStyle(color: Colors.blue),
),
],
),
],
),
),
);
},
);
},
),
);
}
}