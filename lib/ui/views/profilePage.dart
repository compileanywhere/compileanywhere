import 'package:compileanywhere/ui/models/usermodels.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:compileanywhere/ui/widgets/localwidgets.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  checkAuthentication() {
    _auth.onAuthStateChanged.listen((user) async {
      if (user == null) {
        UserDetails().logout();
        Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, '/intro');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(UserDetails().email + "email");
    // print(  UserDetails().email+"hell");
    // print(UserDetails().email + 'je;');
    // print(NetworkImage(UserDetails().profilepic));
    ScreenUtil.init(context, width: 360, height: 640, allowFontScaling: true);
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFF5254D8), Color(0xFF1DA1F2)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Column(
              children: <Widget>[
                Stack(children: [
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(top: 40, left: 150),
                    child: Text(
                      'Profile',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 36,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: Positioned(
                      top: 41,
                      right: 355,
                      child: IconButton(
                        color: Colors.white,
                        iconSize: 27,
                        onPressed: () {
                          // Navigator.pushReplacementNamed(context, '/intro');
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                  )
                ]),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: CircleAvatar(
                     backgroundColor: Colors.blueAccent,
                    // backgroundImage: AssetImage('assets/avatar.png'),
                    // backgroundImage: AssetImage('assets/background.png'),


                    backgroundImage: NetworkImage(UserDetails().profilepic),

                    radius: 65,
                  ),
                  // Avatar(
                  //   radius: 65,
                  // ),
                ),
                Stack(children: [
                 
                  Container(
                    padding: EdgeInsets.only(top: 53.h, right: 270.w),
                    child: Text(
                      'General',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 43.h,
                    child: FlatButton(
                      // color: Colors.transparent,
                      //padding: EdgeInsets.fromLTRB(2, 20, 2, 2),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/editprofile');
                      },
                      child: Text(
                        'edit',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ]),
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 22),
                      child: SizedBox(
                        height: 50.h,
                        width: 370,
                        child: Card(
                            child: Container(
                          padding: EdgeInsets.only(top: 18, left: 16),
                          child: Text(
                            // "ass",
                            UserDetails().username,

                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        )),
                      ),
                    ),
                    Positioned(
                      left: 12,
                      top: 14,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 23,
                        width: 93,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF394AA3),
                        ),
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.only(
                              right: 5,
                              top: 3,
                            ),
                            child: Text(
                              'Username',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 36.h),
                      child: SizedBox(
                        height: 65,
                        width: 370,
                        child: Card(
                            child: Container(
                          padding: EdgeInsets.only(top: 18, left: 16),
                          child: Text(
                            UserDetails().email,
                            // "hr",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        )),
                      ),
                    ),
                    Positioned(
                      left: 12,
                      top: 30.h,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 23,
                        width: 93,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF394AA3),
                        ),
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.only(
                              right: 25,
                              top: 1,
                            ),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 230,
                    top: 80.h,
                  ),
                  child: RaisedButton(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(36))),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.red,
                      ),
                    ),
                    onPressed: () {
                      _auth.signOut();
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
