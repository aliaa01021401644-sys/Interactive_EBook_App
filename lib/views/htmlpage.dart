// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class HtmlPage extends StatefulWidget {
//   final String url;
//   final String title;
//
//   const HtmlPage({
//     super.key,
//     required this.url,
//     required this.title,
//   });
//
//   @override
//   State<HtmlPage> createState() => _HtmlPageState();
// }
//
// class _HtmlPageState extends State<HtmlPage> {
//   late final WebViewController controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadRequest(Uri.parse(widget.url));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: WebViewWidget(controller: controller),
//     );
//   }
// }





















import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class HtmlPage extends StatelessWidget {
  final String url;
  final String title;

  const HtmlPage({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(url),
        ),
      ),
    );
  }
}