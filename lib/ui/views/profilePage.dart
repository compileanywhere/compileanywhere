import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:compileanywhere/ui/widgets/localwidgets.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              width: double.infinity,
              height: 683,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0xFF5254D8), Color(0xFF1DA1F2)],
                //colors: [Colors.green, Colors.red],
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
                            Navigator.pushReplacementNamed(context, '/intro');
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
      //  backgroundColor: Colors.blueAccent,
      backgroundImage: AssetImage('assets/avatar.png'),

      radius: 65,
    ),
                    // Avatar(
                    //   radius: 65,
                    // ),
                  ),
                  Stack(children: [
                    Container(
                      padding: EdgeInsets.only(top: 20, right: 270),
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
                      top: 8,
                      child: FlatButton(
                        // color: Colors.transparent,
                        //padding: EdgeInsets.fromLTRB(2, 20, 2, 2),
                        onPressed: () {
                        Navigator.pushReplacementNamed(context,'/editprofile');
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
                          height: 65,
                          width: 370,
                          child: Card(
                              child: Container(
                            padding: EdgeInsets.only(top: 18, left: 16),
                            child: Text(
                              'ashik',
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
                        padding: EdgeInsets.only(top: 22),
                        child: SizedBox(
                          height: 65,
                          width: 370,
                          child: Card(
                              child: Container(
                            padding: EdgeInsets.only(top: 18, left: 16),
                            child: Text(
                              'ashik@gmail.com',
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
                      top: 120,
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
                        Navigator.of(context).pushNamed("/");
                      },
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
