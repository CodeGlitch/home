import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:js' as js;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CodeGlitch @ Emanuel Luís',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(height: 5),
              HandCursor(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: 60,
                  width: 180,
                  color: Colors.blue,
                  child: IconButton(
                      icon: Text(
                        "linkedin",
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontFamily: "Arial", fontFamilyFallback: ["helvetica", "courier"]),
                      ),
                      onPressed: () {
                        js.context.callMethod(
                            "open", ["https://linkedin.com/in/CodeGlitch"]);
                      }),
                ),
              ),
              Container(height: 5),
              HandCursor(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: 60,
                  width: 180,
                  color: Colors.blueAccent,
                  child: IconButton(
                      icon: Text(
                        "twitter",
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontFamily: "Arial", fontFamilyFallback: ["helvetica", "courier"]),
                      ),
                      onPressed: () {
                        js.context.callMethod(
                            "open", ["https://twitter.com/CodeGlitch"]);
                      }),
                ),
              ),
              Container(height: 5),
              HandCursor(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: 60,
                  width: 180,
                  color: Colors.blueGrey,
                  child: IconButton(
                      icon: Text(
                        "github",
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontFamily: "Arial", fontFamilyFallback: ["helvetica", "courier"]),
                      ),
                      onPressed: () {
                        js.context.callMethod(
                            "open", ["https://github.com/CodeGlitch"]);
                      }),
                ),
              ),
              Container(height: 5),
              HandCursor(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: 60,
                  width: 180,
                  color: Colors.indigo,
                  child: IconButton(
                      icon: Text(
                        "facebook",
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontFamily: "Arial", fontFamilyFallback: ["helvetica", "courier"]),
                      ),
                      onPressed: () {
                        js.context.callMethod(
                            "open", ["https://www.facebook.com/CodeGlitch"]);
                      }),
                ),
              ),
              Text(
                        "powered by Flutter Web",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: "Arial", fontFamilyFallback: ["helvetica", "courier"]),
                      ),
            ],
          ),
        ],
      ),
    );
  }
}

class HandCursor extends Listener {
  /*class HandCursor extends Listener {
  static final appContainer = html.window.document.getElementById('app-container');
  HandCursor({Widget child}) : super(
  MouseTrackerAnnotation(onHover: onhover, onExit: onexit), child: child);
  static onhover(PointerHoverEvent event){appContainer.style.cursor = 'pointer';}
  static onexit(PointerExitEvent event){ appContainer.style.cursor = 'default'; }
}*/

//https://stackoverflow.com/questions/56211844/flutter-web-mouse-hover-change-cursor-to-pointer
  // get a reference to the body element that we previously altered
  static final appContainer =
      html.window.document.getElementById('app-container');

  HandCursor({Widget child})
      : super(
            onPointerHover: (PointerHoverEvent evt) {
              appContainer.style.cursor = 'pointer';
              // you can use any of these:
              // 'help', 'wait', 'move', 'crosshair', 'text' or 'pointer'
              // more options/details here: http://www.javascripter.net/faq/stylesc.htm
            },
            onPointerExit: (PointerExitEvent evt) {
              // set cursor's style 'default' to return it to the original state
              appContainer.style.cursor = 'default';
            },
            child: child);
}
