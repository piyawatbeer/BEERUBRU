import 'package:beer_ubru/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  String loginString = '';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Method

  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Widget signOutMenu() {
    return ListTile(
      leading: Icon(Icons.android,color: Colors.red,),
      title: Text(
        'Signout',
        style: TextStyle(color: Colors.red),
      ),
      onTap: () {
        processSignOut();
      },

    );
  }

Future<void> processSignOut() async {
    await firebaseAuth.signOut().then((response) {
      MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext) => Home());
        Navigator.of(context).pushAndRemoveUntil(materialPageRoute, (Route<dynamic>route)=>false);
    });
  }

  Future<void> findDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      loginString = firebaseUser.displayName;
      print('login = $loginString');
    });
  }

  Widget showLogin() {
    return Text(
      'Login by ... $loginString',
      style: TextStyle(fontSize: 16.0),
    );
  }

  Widget showAppName() {
    return Text(
      'Beer UBRU',
      style: TextStyle(
        fontSize: 24.0,
        color: Colors.blue,
        fontFamily: 'Kanit',
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget myHeadDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/logo2.png'), fit: BoxFit.fill),
      ),
      child: Column(
        children: <Widget>[
          showLogo(),
          showAppName(),
          showLogin(),
        ],
      ),
    );
  }

  Widget myDrewerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          myHeadDrawer(),
          signOutMenu(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      body: Text('body'),
      drawer: myDrewerMenu(),
    );
  }
}
