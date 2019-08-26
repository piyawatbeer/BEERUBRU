import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  Color mycolor = Colors.green.shade900;

//Method

  Widget showName() {
    return ListTile(
      leading: ImageIcon(
        AssetImage('images/logo.png'),
        size: 36.0,
        color: mycolor,
      ),
      //สามารถนำรูปมาเป็นไอคอนได้โดยไม่มีสี
      title: Text(
        'Beer UBRU',
        style: TextStyle(
          fontSize: 25.0,
          color: mycolor,
          fontFamily: 'Kanit',
        ),
      ),
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: mycolor,
        ),
        labelText: 'Email :',
        labelStyle: TextStyle(color: mycolor),
      ),
    );
  }

  Widget loginButton() {
    return FloatingActionButton(
      backgroundColor: mycolor,
      child: Icon(
        Icons.navigate_next,
        size: 36.0,
      ),
      onPressed: () {
        
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: mycolor,
        ),
        labelText: 'Password :',
        labelStyle: TextStyle(color: mycolor),
      ),
    );
  }

  Widget backButton() {
    return IconButton(
      icon: Icon(
        Icons.navigate_before,
        color: mycolor,
        size: 36.0,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget showAuthen() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg.jpg'), fit: BoxFit.fill),
      ),
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(20.0),
        color: Color.fromRGBO(255, 255, 255, 0.5),
        width: 300.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showName(),
            emailText(),
            passwordText(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            showAuthen(),
            backButton(),
          ],
        ),
      ),
      floatingActionButton: loginButton(),
      // SafeArea อยู่ในzone สีขาว
    );
  }
}
