import 'package:DogNeedsYou/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';

import 'loginScreen.dart';

class OptionsScreen extends StatefulWidget {
  @override
  _OptionsScreenState createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  final GlobalKey<ScaffoldState> scaffKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffKey,
        body: new Container(
          padding: const EdgeInsets.all(40),
          child: new Column(
            children: [
              new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  new RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LogInPage()));
                      },
                      color: Colors.black,
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: new Padding(
                        padding: const EdgeInsets.all(5),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new SvgPicture.asset(
                              "assets/icons/email.svg",
                              width: 50,
                              height: 50,
                            ),
                            new Text("Login with E-Mail",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))
                          ],
                        ),
                      ))
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 40),
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  new RaisedButton(
                      onPressed: () {
                        final snackb = new SnackBar(
                            backgroundColor: Colors.black,
                            duration: new Duration(seconds: 4),
                            content: new Text("Still Under Development :(",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)));
                        scaffKey.currentState.showSnackBar(snackb);
                      },
                      color: Colors.black,
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: new Padding(
                        padding: const EdgeInsets.all(10),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new SvgPicture.asset(
                              "assets/icons/google.svg",
                              width: 50,
                              height: 40,
                            ),
                            new Text("Login with Google",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))
                          ],
                        ),
                      ))
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 40),
              ),
              new GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SignUp()));
                },
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text("Not Registered ?",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                    new Text(
                      " Sign-Up",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
