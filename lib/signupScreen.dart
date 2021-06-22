import 'package:DogNeedsYou/optionsScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String mail;
  String password;

  Future<void> signUp() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        await Firebase.initializeApp();
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mail, password: password);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => OptionsScreen()));
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Form(
        key: formKey,
        child: new Column(
          children: [
            new TextFormField(
              decoration: new InputDecoration(
                  hintText: "Enter E-Mail",
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
                  child: new Text("Sign-Up",
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                  onPressed: signUp,
                  color: Colors.black,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
