import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Expliclt

  // Method
  Widget showLogo() {
    return Container(alignment: Alignment.center, child: Container(
      width: 200.0,
      height: 550.0,
      child: Image.asset('images/logo.png'),
    ),);
  }

  Widget showAppName() {
    return Text('BEER UBRU');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          showLogo(),
          showAppName(),
        ]));
  }
}
