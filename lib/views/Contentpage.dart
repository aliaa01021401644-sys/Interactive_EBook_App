

import 'package:flutter/material.dart';
// import 'package:interactive_e_book_system/core/Widget/pdfListScreen.dart';
// import 'package:interactive_e_book_system/core/Widget/videosurvices/videoviewmodel.dart';
import 'package:interactive_e_book_system/modules/pdf/pdf_list_screen.dart';
import 'package:interactive_e_book_system/viewmodels/ContentViewModel.dart';
import 'package:interactive_e_book_system/views/Exercisetab.dart';
import 'package:interactive_e_book_system/views/VedioPage.dart';
import 'package:interactive_e_book_system/views/htmlpage.dart';
import 'package:provider/provider.dart';

class ContentPage extends StatefulWidget {
const ContentPage({super.key});

@override
State<ContentPage> createState() =>
_ContentPageState();
}

class _ContentPageState
extends State<ContentPage> {

@override
void initState() {
super.initState();

Future.microtask(() {
Provider.of<ContentViewModel>(
context,
listen: false,
).loadContent();
});
}

@override
Widget build(BuildContext context) {

return Consumer<ContentViewModel>(
builder: (context, vm, child) {

if (vm.isLoading) {
return const Center(
child:
CircularProgressIndicator(),
);
}

return ListView.builder(

itemCount: vm.lessons.length,

itemBuilder: (context, index) {

final lesson = vm.lessons[index];
final objects = lesson.objects;

return Card(
margin: const EdgeInsets.all(10),

child: ExpansionTile(
title: Text(
lesson.name,
style: const TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),

children: List.generate(
objects.length,
(i) {

final obj = objects[i];

return ListTile(
leading: Icon(
obj["type"] == "pdf"
? Icons.picture_as_pdf
    : Icons.play_circle,
color: Colors.blue,
),

title: Text(obj["title"]),

onTap: () {

if (obj["type"] == "pdf") {
 Navigator.push(
  context,
  MaterialPageRoute(
   builder: (_) =>

       PdfListScreen(),
//ExerciseTab(),
  ),
 );
}else if (obj["type"] == "html") {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) =>

       HtmlPage(
       url: obj["url"],
       title: obj["title"],
      ),
     ),
    );


} else {

Navigator.push(
context,
MaterialPageRoute(
builder: (_) =>
    //ExerciseTab()
VideoPage(
url: obj["url"],
title: obj["title"],
),
),
);
}
},
);
},
),
),
);
},
);
},
);
}
}