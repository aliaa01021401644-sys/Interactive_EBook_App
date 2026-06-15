import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestionPage extends StatelessWidget {

  final String title;
  final String question;
  final String url;

  const QuestionPage({
    super.key,
    required this.title,
    required this.question,
    required this.url,
  });

  Future<void> openUrl() async {

    final uri = Uri.parse(url);

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // يفتح Chrome مباشرة
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(title)),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              icon: const Icon(Icons.twenty_mp),
              label: const Text("Open Question ",style: TextStyle(color: Colors.amber),),

              onPressed: () {
                openUrl();
              },
            ),

          ],
        ),
      ),
    );
  }
}