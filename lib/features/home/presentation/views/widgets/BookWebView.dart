import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookWebView extends StatefulWidget {
  final String url;
  final String title;

  const BookWebView({super.key, required this.url, required this.title});

  @override
  State<BookWebView> createState() => _BookWebViewState();
}

class _BookWebViewState extends State<BookWebView> {
  late final WebViewController _controller;
  int loadingPercentage = 0; // لمتابعة نسبة التحميل

  @override
  void initState() {
    super.initState();

    // 1. إعداد الكنترولر
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // تفعيل الجافاسكريبت
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress; // تحديث نسبة التحميل
            });
          },
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          onWebResourceError: (error) {
            debugPrint("WebView Error: ${error.description}");
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url)); // تحميل الرابط
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _controller.reload(),
          ),
        ],
      ),
      body: Stack(
        children: [
          // عرض الـ WebView
          WebViewWidget(controller: _controller),

          // عرض شريط التحميل لو الصفحة لسه بتحمل
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
              color: Colors.blue,
              backgroundColor: Colors.grey[200],
            ),
        ],
      ),
    );
  }
}
