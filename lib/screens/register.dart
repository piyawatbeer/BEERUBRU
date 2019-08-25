import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  Color nameColor = Colors.green.shade400;
  Color emailColor = Colors.blue.shade400;
  Color passwordColor = Colors.pink.shade400;
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;

  //method

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.face,
          size: 36.0,
          color: nameColor,
        ),
        labelText: 'ชื่อ-สกุล:',
        labelStyle: TextStyle(color: nameColor),
        helperText: 'กรุณาใส่ชื่อ-นามสกุล',
        helperStyle: TextStyle(color: nameColor),
        hintText: 'กรอกภาษาอังกฤษเท่านั้น',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณากรอกชื่อ-นามสกุล';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: passwordColor,
        ),
        labelText: 'รหัสผ่าน:',
        labelStyle: TextStyle(color: passwordColor),
        helperText: 'กรุณาใส่รหัสผ่าน',
        helperStyle: TextStyle(color: passwordColor),
        hintText: 'ใส่มากกว่า 6 ตัวอักษร',
      ),
      validator: (value) {
        if (value.length < 6) {
          return 'กรุณากรอกมากกว่า 6 ตัวอักษร';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: emailColor,
        ),
        labelText: 'อีเมล:',
        labelStyle: TextStyle(color: emailColor),
        helperText: 'กรุณาใส่อีเมล',
        helperStyle: TextStyle(color: emailColor),
        hintText: 'abc@asd.com',
      ),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'กรุณากรอกอีเมลให้ถูกต้อง';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('name = $nameString, email = $emailString, password = $passwordString ');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0xFF, 0xFF, 0xB3, 0x00),
        title: Text('Register'),
        actions: <Widget>[
          registerButton(),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          children: <Widget>[
            nameText(),
            passwordText(),
            emailText(),
          ],
        ),
      ),
    );
  }
}
