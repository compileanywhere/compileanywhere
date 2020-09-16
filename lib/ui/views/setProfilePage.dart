import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compileanywhere/ui/models/usermodels.dart';
import 'package:compileanywhere/ui/widgets/localwidgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class SetupProfilePages extends StatefulWidget {
  @override
  _SetupProfilePagesState createState() => _SetupProfilePagesState();
}

class _SetupProfilePagesState extends State<SetupProfilePages> {
  File sampleImage;
  String downloadUrl;

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();

  setUpProfile(String name, String username) async {
    if (sampleImage != null) {
      print('i was called here');
      print(sampleImage);
      String imageName = UserDetails().uid + '.jpg';
      final StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('Avatar/$imageName');
      StorageUploadTask task = firebaseStorageRef.putFile(sampleImage);
      StorageTaskSnapshot snapshotTask = await task.onComplete;
      downloadUrl = await snapshotTask.ref.getDownloadURL();
    } else {
      downloadUrl =
          "https://firebasestorage.googleapis.com/v0/b/compile-anywhere.appspot.com/o/Avatar%2FZO5ZhoKdByNDD8Te1ronRZODFrD2.jpg?alt=media&token=ff8745de-81cd-4d75-9fc1-c107ba064086";
    }

    UserUpdateInfo updateUser = UserUpdateInfo();
    updateUser.displayName = name;
    UserDetails().user.updateProfile(updateUser);
    Firestore.instance
        .collection('users')
        .document(UserDetails().uid)
        .updateData(
            {'name': name, 'username': username, 'profilepicurl': downloadUrl});
            
    UserDetails().name = name;
    UserDetails().username = username;
    UserDetails().profilepic = downloadUrl;
    Navigator.pushReplacementNamed(context, '/lop');
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'Take a Picture',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: getImageCam,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  GestureDetector(
                    child: Text(
                      'Choose from Gallery',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: getImageGal,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future getImageCam() async {
    var tempImage = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      sampleImage = File(tempImage.path);
      Navigator.pop(context);
      // imageUrl='uploaded';
    });
  }

  Future getImageGal() async {
    var tempImage = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = File(tempImage.path);
      Navigator.pop(context);
      // imageUrl='uploaded';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: ThemeColor().returnColor())),
            ),
            SizedBox(
              height: 75,
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: Align(
                  alignment: Alignment(-0.4, 0),
                  child: Text(
                    'Setup profile',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 140,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: sampleImage == null  
                                 ? AssetImage('assets/avatar.png')
                                    : FileImage(sampleImage),
                                radius:
                                    MediaQuery.of(context).size.width * 0.20,
                              ),
                              Positioned(
                                left: 127,
                                top: 127,
                                child: ClipOval(
                                  child: Container(
                                    color: Colors.white,
                                    height: 27,
                                    width: 27,
                                    child: IconButton(
                                        onPressed: () {
                                          _optionsDialogBox();
                                        },
                                        icon: Icon(Icons.add)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //  _optionsDialogBox();

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      controller: _nameController,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 15),
                        hintText: 'name',
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
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      controller: _usernameController,
                      cursorColor: Colors.white,
                    
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 15),
                        hintText: 'username',
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
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.only(left: 30, right: 15),
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(40, 7, 40, 7),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(36))),
                        onPressed: () {
                          setUpProfile(
                              _nameController.text, _usernameController.text);
                        },
                        child: Text('Sign up',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7277F1),
                              fontSize: 19,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
