import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:webview_flutter/webview_flutter.dart';

final theme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.latoTextTheme(),
);

final controller = WebViewController()
  ..loadRequest(Uri.parse('https://github.com/gsmart2k'));
void main() {
  runApp(MaterialApp(theme: theme, home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HNG Assignment',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 300,
                    child: Image.asset(
                      'res/images/gbolahan.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                          alignment: Alignment.centerLeft,
                          width: 300,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(SimpleIcons.slack),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Ogunrinade Gbolahan',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 4,
                                      backgroundColor: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('Mobile Dev Intern, HNG'),
                                  ],
                                ),
                              ],
                            ),
                          )))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WebView()));
                    },
                    icon: const Icon(SimpleIcons.github),
                    label: const Text('Open Github')),
              )
            ]),
      ),
    );
  }
}

class WebView extends StatefulWidget {
  const WebView({super.key});
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
