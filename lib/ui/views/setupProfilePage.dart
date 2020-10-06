import 'package:compileanywhere/ui/widgets/background_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SetupProfilePage extends StatefulWidget {
  @override
  _SetupProfilePageState createState() => _SetupProfilePageState();
}

class _SetupProfilePageState extends State<SetupProfilePage> {
  TextEditingController _nameController = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  setupProfile() async {
    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = _nameController.text;
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        user
            .updateProfile(updateInfo)
            .then((value) => {Navigator.pushReplacementNamed(context, '/lop')});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundBox(
      child: Form(
        key: _formKey,
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top:48,
                // left: 12,
                // right: 12
                // ,bottom: 12
                ),
              ),
              Row(
                
                children: [
                  IconButton(
                    padding: EdgeInsets.only(bottom:5,),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 90,
                    
                  ),
                  
                  //Padding(padding: EdgeInsets.only(right:80),),
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
                padding: EdgeInsets.only(top:57),
              ),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left:10),
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/avatar.png'),
                        radius: 73,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 240,
                    top: 109,
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
                child: TextFormField(
                  controller: _nameController,
                  cursorColor: Colors.white,
                  style: GoogleFonts.poppins(color:Colors.white,
                  fontWeight:FontWeight.w200,),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15),
                      hintText: 'username',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                          validator: (input) {
                      if (input.isEmpty) {
                        return 'Provide a username';
                      }
                    },
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 250,
                ),
                child: RaisedButton(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(45, 3, 45, 3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(36.0))),
                  onPressed: 
                  // (){
                    // Navigator.pushReplacementNamed(context, '/intro');
                                    setupProfile,

                  // },
                  child: Text(
                    'Signup',
                 style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                                color: Color(0xFF1DA3F2),
                            
                              ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:123,right: 123,top: 172),
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
