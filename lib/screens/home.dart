import 'package:beer_ubru/screens/register.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Expliclt

  // Method

  Widget mySizebox() {
    return SizedBox(
      width: 20.0,
      height: 20.0,
    );
  }

  Widget signInButton() {
    return Expanded(
      child: RaisedButton(
        color: Colors.blue.shade700,
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget signUpButton() {
    return Expanded(
      child: OutlineButton(
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.blue.shade700),
        ),
        onPressed: () {
          print('You Click SignUp');

          MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context)=>Register());
          Navigator.of(context).push(materialPageRoute);
        },
      ),
    );
  }

  Widget showButton() {
    return Container(
      margin: EdgeInsets.only(left: 50.0, right: 50.0),
      child: Row(
        children: <Widget>[
          signInButton(),
          mySizebox(),
          signUpButton(),
        ],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 150.0,
        height: 150.0,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  Widget showAppName() {
    return Text(
      'BEER UBRU',
      style: TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.red[200],
        fontFamily: 'Kanit',
      ),
    );
  }

  Widget showAppPhone() {
    return Text(
      'Tel: 0874487882',
      style: TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.red[200],
        fontFamily: 'Kanit',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(
        colors: [Colors.white, Colors.red],
        radius: 1.5,
        center: Alignment.center,
      )),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            mySizebox(),
            showAppName(),
            mySizebox(),
            showAppPhone(),
            mySizebox(),
            showButton(),
          ]),
    ));
  }
}
