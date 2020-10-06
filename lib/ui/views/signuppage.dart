import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compileanywhere/ui/models/usermodels.dart';
import 'package:compileanywhere/ui/widgets/background_box.dart';
import 'package:compileanywhere/ui/widgets/customgooglebutton.dart';
import 'package:compileanywhere/ui/widgets/localwidgets.dart';
import 'package:compileanywhere/ui/widgets/transparentappbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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

        Navigator.pushReplacementNamed(context, '/setprofile');
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
          if (user != null) {
                print('its gtntg saveddddddddd');
            UserDetails().updateUser('', '', _email, user.uid, '', user);
            Firestore.instance.collection('users').document(user.uid).setData({
              'email': _email,
            });
          }
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
    return BackgroundBox(
      resizeToAvoidBottomInset: false,
      appBar: TransparentAppBar(
        title: "Sign up",
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 36.h,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Provide an Email';
                      }
                    },
                    onSaved: (input) => _email = input,
                    cursorColor: Colors.white,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(14),
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 16.h),
                      hintText: 'email',
                      hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(12),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.0,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBoxPadding(),
                  TextFormField(
                    validator: (input) {
                      if (input.length < 8) {
                        return 'Password should be atleast 8 characters';
                      }
                    },
                    onSaved: (input) => _password = input,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(14),
                    ),
                    cursorColor: Colors.white,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 16.h),
                      hintText: 'password',
                      hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(12),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.0,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBoxPadding(),
                  TextFormField(
                    validator: (input) {
                      if (input.length < 8) {
                        return 'Password should Be atleast 8 Characters';
                      }
                    },
                    onSaved: (input) => _confirmPassword = input,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(14),
                    ),
                    cursorColor: Colors.white,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 16.h),
                      hintText: 'confirm password',
                      hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(12),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.0,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 117.w,
                height: 32.h,
                child: FlatButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.h)),
                  onPressed: signup,
                  child: Text('Next',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5254d8),
                        fontSize: ScreenUtil().setSp(16),
                      )),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(10.w, 283.h, 0, 0),
                child: College()),
          ],
        ),
      ),
    );
  }
}
