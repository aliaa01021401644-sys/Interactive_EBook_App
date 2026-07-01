import 'package:flutter/material.dart';
import 'package:glossary_packagee/glossary_packagee.dart';
import 'package:interactive_e_book_system/views/Contentpage.dart';
import 'package:interactive_e_book_system/views/ExerciseTab2.dart';
import 'package:interactive_e_book_system/views/Exercisetab.dart';
import 'package:interactive_e_book_system/views/TermsPage.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
backgroundColor: Colors.amber,
          title: Text("Interactive E_Book"),

          bottom: TabBar(
            tabs: [
              Tab(text: "Content"),
             // Tab(text: "Exercises"),
              Tab(text: "Glossary"),
              Tab(text: "Exercises"),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            ContentPage(),
           // ExerciseTab(),
            GlossaryPage(),
            //TermsPage(),
            //Center(child: Text("Profile")),
            Exercise(),
          ],
        ),
      ),
    );
  }
}