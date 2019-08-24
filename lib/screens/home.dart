import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Expliclt

  // Method
  Widget showAppName() {
    return Text('BEER UBRU');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          showAppName(),
          showAppName(),
        ]));
  }
}
