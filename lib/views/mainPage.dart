import 'package:flutter/material.dart';
import 'package:interactive_e_book_system/views/Exercisetab.dart';
import 'package:interactive_e_book_system/views/TermsPage.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
backgroundColor: Colors.amber,
          title: Text("Interactive E_Book"),

          bottom: TabBar(
            tabs: [
              Tab(text: "Content"),
              Tab(text: "Exercises"),
              Tab(text: "Glossary"),
              Tab(text: "Exer"),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            Center(child: Text("Home")),
            ExerciseTab(),
            TermsPage(),
            //Center(child: Text("Profile")),
            Center(child: Text("Settings")),
          ],
        ),
      ),
    );
  }
}