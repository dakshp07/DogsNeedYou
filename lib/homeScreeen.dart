import 'package:DogNeedsYou/optionsScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User user = FirebaseAuth.instance.currentUser;
  Future<void> signOut() async {
    await Firebase.initializeApp();
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => OptionsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new FlatButton(
          child: new Text(
            "Log-Out",
            style: TextStyle(fontSize: 50),
          ),
          color: Colors.red,
          onPressed: signOut,
        ),
      ),
    );
  }
}
