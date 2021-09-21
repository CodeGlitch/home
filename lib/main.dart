import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emanuel Luís @ CodeGlitch - Full stack developer @ Azores',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  getBodyItem(String name, String url, Color backgroundColor) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 60,
      width: 180,
      color: backgroundColor,
      child: IconButton(
          icon: Text(
            name,
            style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontFamily: "Arial",
                fontFamilyFallback: ["helvetica", "courier"]),
          ),
          onPressed: () {
            _launchURL(url);
          }).showCursorOnHover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        color: Colors.black,
        child: //Center(
            //child:
            ListView(
          shrinkWrap: false,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(height: 5),
                Text(
                  "Emanuel Luís 💙",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: "Arial",
                      fontFamilyFallback: ["helvetica", "courier"]),
                ),
                Container(height: 5),
                Text(
                  "Flutter Portugal, Full stack .NET Web Developer, Student @ Azores",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontFamily: "Arial",
                      fontFamilyFallback: ["helvetica", "courier"]),
                ),
                Container(height: 5),
                getBodyItem("Twitter", "https://twitter.com/CodeGlitch",
                    Colors.blueAccent),
                Container(height: 5),
                getBodyItem(
                    "Medium", "https://medium.com/@codeglitch", Colors.grey),
                Container(height: 5),
                getBodyItem("LinkedIn", "https://linkedin.com/in/CodeGlitch",
                    Colors.blue),
                Container(height: 5),
                getBodyItem(
                    "GitHub", "https://github.com/CodeGlitch", Colors.blueGrey),
                Container(height: 5),
                getBodyItem("Facebook", "https://www.facebook.com/CodeGlitch",
                    Colors.indigo),
                Container(height: 5),
                Text(
                  "powered by Flutter Web",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: "Arial",
                      fontFamilyFallback: ["helvetica", "courier"]),
                ),
                Container(height: 15),
              ],
            ),
          ],
        ),
      ),
      //),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

extension HoverExtensions on Widget {
  //from https://www.filledstacks.com/post/flutter-web-hover-and-mouse-cursor/
  static final appContainer =
      html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this,
      onHover: (event) => appContainer!.style.cursor = 'pointer',
      onExit: (event) => appContainer!.style.cursor = 'default',
    );
  }
}
