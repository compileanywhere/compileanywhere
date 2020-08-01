import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SetupProfilePage extends StatefulWidget {
  @override
  _SetupProfilePageState createState() => _SetupProfilePageState();
}

class _SetupProfilePageState extends State<SetupProfilePage> {
  TextEditingController _nameController = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  setupProfile() async {
    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = _nameController.text;
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        user
            .updateProfile(updateInfo)
            .then((value) => {Navigator.pushReplacementNamed(context, '/')});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5254D8), Color(0xFF1DA1F2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
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
                  onPressed: () {},
                ),
                SizedBox(
                  width: 90,
                ),
                Text(
                  'Setup Profile',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Stack(
              children: [
                Container(
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar.png'),
                      radius: 65,
                    ),
                  ),
                ),
                Positioned(
                  left: 240,
                  top: 99,
                  child: ClipOval(
                    child: Container(
                      color: Colors.white,
                      height: 27,
                      width: 27,
                      child: Icon(Icons.add, color: Colors.blue, size: 27),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _nameController,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    hintText: 'username',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                    ),
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
                    borderRadius: BorderRadius.all(Radius.circular(36.0))),
                onPressed: setupProfile,
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(123),
            ),
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
    );
  }
}
