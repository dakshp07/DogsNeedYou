import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homeScreeen.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String mail;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffkey = GlobalKey<ScaffoldState>();
  String password;
  String errorMessage;
  Future<void> signIn() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        await Firebase.initializeApp();
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: mail, password: password);
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      } catch (e) {
        setState(() {
          errorMessage = e.toString();
        });
        final snackb = new SnackBar(
            backgroundColor: Colors.red,
            duration: new Duration(seconds: 6),
            content: new Text(
              errorMessage + " :(",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ));
        scaffkey.currentState.showSnackBar(snackb);
      }
    }
  }

  Future<void> resetPassword() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await Firebase.initializeApp();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: mail);
      final snackb = new SnackBar(
          backgroundColor: Colors.green[600],
          duration: new Duration(seconds: 6),
          content: new Text(
            "Please check your mail to reset the password :)",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ));
      scaffkey.currentState.showSnackBar(snackb);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffkey,
        body: new Form(
            key: formKey,
            child: new Column(children: [
              new TextFormField(
                decoration: new InputDecoration(
                    hintText: "Enter Mail",
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 25,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500)),
                keyboardType: TextInputType.emailAddress,
                validator: (val) =>
                    val.contains("@") ? null : "Enter Valid Mail ID",
                onSaved: (val) => mail = val,
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 5),
              ),
              new TextFormField(
                decoration: new InputDecoration(
                    hintText: "Enter Password",
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 25,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500)),
                keyboardType: TextInputType.name,
                obscureText: true,
                validator: (val) =>
                    val.length < 3 ? "Enter Bigger Password" : null,
                onSaved: (val) => password = val,
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 22),
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  new RaisedButton(
                    padding: const EdgeInsets.all(6),
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: new Text("Sign-In",
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                    onPressed: signIn,
                    color: Colors.black,
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 15)),
                  new Padding(padding: const EdgeInsets.only(top: 15)),
                  new GestureDetector(
                    onTap: resetPassword,
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Text("Forgot Password ?",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  )
                ],
              ),
            ])));
  }
}
