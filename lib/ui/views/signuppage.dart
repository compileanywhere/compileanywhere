import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _confirmPassword;

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.of(context).pop();

        Navigator.pushReplacementNamed(context, '/setupprofile');
      }
    });
  }

  signup() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_password == _confirmPassword) {
        try {
          FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
                  email: _email, password: _password))
              .user;
        } catch (e) {
          showError(e.message);
        }
      } else {
        showError("passwords do not match");
      }
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF5254D8), Color(0xFF1DA1F2)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(12),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Text(
                    'Sign up',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Provide an Email';
                          }
                        },
                        onSaved: (input) => _email = input,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15),
                            hintText: 'email',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        validator: (input) {
                          if (input.length < 6) {
                            return 'Password should Be atleast 6 Characters';
                          }
                        },
                        onSaved: (input) => _password = input,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15),
                            hintText: 'password',
                            hintStyle: TextStyle(color: Colors.white70),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        validator: (input) {
                          if (input.length < 6) {
                            return 'Password should Be atleast 6 Characters';
                          }
                        },
                        onSaved: (input) => _confirmPassword = input,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15),
                            hintText: 'confirm password',
                            hintStyle: TextStyle(color: Colors.white70),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 220,
                      ),
                      child: RaisedButton(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(45, 0, 45, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(36.0))),
                        onPressed: signup,
                        child: Text(
                          'Signup',
                          style: TextStyle(color: Colors.blue, fontSize: 17),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(112)),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'SRI SAIRAM COLLEGE OF ENGINEERING',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
