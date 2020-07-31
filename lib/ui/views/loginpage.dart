import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  checkAuthentication() {
    _auth.onAuthStateChanged.listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

  signIn(String email, String password) async {
    try {
      FirebaseUser user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
    } catch (e) {
      showError(e.message);
    }
  }

  showError(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFF5254D8), Color(0xFF1DA1F2)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: ListView(children: [
              Stack(children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  alignment: Alignment(0, 1),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 5, top: 28),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/");
                        })),
              ]),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 60),
                child: TextField(
                  controller: _emailController,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    hintText: 'email',
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(13, 15, 13, 0),
                child: TextField(
                  controller: _passwordController,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15),
                      hintText: 'password',
                      hintStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              Stack(children: [
                Column(children: [
                  Stack(children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 40, 230, 2),
                      child: Text(
                        'NO account? ',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 90, top: 24),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/login");
                            },
                            child: Text(
                              'Create one!',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )))
                  ])
                ]),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 100, 250, 0),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(260, 80, 0, 0),
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(36))),
                        onPressed: () {
                          signIn(
                              _emailController.text, _passwordController.text);
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blue,
                          ),
                        ),
                      )),
                ),
              ]),
              Container(
                  padding: EdgeInsets.fromLTRB(80, 258, 0, 0),
                  child: Text(
                    'SRI SAIRAM COLLEGE OF ENGINEERING',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ])),
      ),
    );
  }
}
