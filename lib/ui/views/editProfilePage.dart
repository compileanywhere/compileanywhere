import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compileanywhere/ui/models/usermodels.dart';
import 'package:compileanywhere/ui/widgets/avatarwithicon.dart';
import 'package:compileanywhere/ui/widgets/background_box.dart';
import 'package:compileanywhere/ui/widgets/localwidgets.dart';
import 'package:compileanywhere/ui/widgets/transparentappbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';


class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
   File sampleImage;
  String downloadUrl;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password, _confirmPassword, _username;

  _updateProfile() async {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        Firestore.instance
            .collection('users')
            .document(UserDetails().uid)
            .updateData({
          'username': _username,
        });
        UserDetails().username = _username;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        user.updatePassword(_password).then((value) {
          print('password updated');
          UserDetails().user = user;
        }).catchError((error) {
          print(error);
        });
      } catch (e) {}



      print(sampleImage);
      String imageName = UserDetails().uid + '.jpg';
      final StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('Avatar/$imageName');
      StorageUploadTask task = firebaseStorageRef.putFile(sampleImage);
      StorageTaskSnapshot snapshotTask = await task.onComplete;
      downloadUrl = await snapshotTask.ref.getDownloadURL();
    }
    else{
      downloadUrl=UserDetails().profilepic;
    }
     
      UserUpdateInfo updateUser = UserUpdateInfo();
   
    UserDetails().user.updateProfile(updateUser);
    Firestore.instance
        .collection('users')
        .document(UserDetails().uid)
        .updateData(
            {'profilepicurl': downloadUrl});
    UserDetails().profilepic = downloadUrl;
    // Navigator.pushReplacementNamed(context, '/lop');
}

      
  Future getImageCam() async {
    var tempImage = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      sampleImage = File(tempImage.path);
      // imageUrl='uploaded';
    });
  }

  Future getImageGal() async {
    var tempImage = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = File(tempImage.path);
      // imageUrl='uploaded';
    });
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

  // Future getImageCam() async {
  //   var tempImage = await ImagePicker().getImage(source: ImageSource.camera);

  //   setState(() {
  //     sampleImage = File(tempImage.path);
  //     // imageUrl='uploaded';
  //   });
  // }

  // Future getImageGal() async {
  //   var tempImage = await ImagePicker().getImage(source: ImageSource.gallery);

  //   setState(() {
  //     sampleImage = File(tempImage.path);
  //     // imageUrl='uploaded';
  //   });
  // }


  

  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.h),
          child: BackgroundBox(
          appBar: TransparentAppBar(
      title: "Edit Profile",
          ),
          child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox(
              height: 60.h,
            ),
            SizedBox(
              width: 328.w,
              height: 443.h,
              child: Stack(children: [
                SizedBox(
                  width: 328.w,
                  height: 403.h,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 16.w),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 36.h,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Username',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: ScreenUtil().setSp(14),
                                  color: Color(0xFF5254d8),
                                ),
                              ),
                            ),
                            SizedBoxPadding(),
                            TextFormField(
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF5254d8),
                                fontSize: ScreenUtil().setSp(14),
                              ),
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Provide a valid username';
                                }
                              },
                              onSaved: (input) => _username = input,
                              initialValue: UserDetails().username,
                              cursorColor: Color(0xFF5254d8),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff7277F1),
                                    width: 0.0,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff7277F1),
                                    width: 1.0,
                                  ),
                                ),
                                hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w200,
                                  color: Color(0xFF5254d8),
                                  fontSize: ScreenUtil().setSp(12),
                                ),
                                contentPadding: EdgeInsets.only(
                                  top: 13.h,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 36.h,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Password',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: ScreenUtil().setSp(14),
                                  color: Color(0xFF5254d8),
                                ),
                              ),
                            ),
                            TextFormField(
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF5254d8),
                                fontSize: ScreenUtil().setSp(14),
                              ),
                              validator: (input) {
                                if (input.length < 8) {
                                  return 'Provide a valid password';
                                }
                              },
                              onSaved: (input) => _password = input,
                              cursorColor: Color(0xFF5254d8),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF5254d8),
                                      width: 0.0,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF5254d8),
                                      width: 1.0,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    top: 13.h,
                                  ),
                                  hintText: 'new password',
                                  hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w200,
                                    color: Color(0xFF5254d8),
                                    fontSize: ScreenUtil().setSp(12),
                                  )),
                            ),
                            SizedBoxPadding(),
                            TextFormField(
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF5254d8),
                                fontSize: ScreenUtil().setSp(14),
                              ),
                              validator: (input) {
                                if (input.length < 8) {
                                  return 'Provide a valid password';
                                }
                                if (input != _password) {
                                  return 'passwords dont match';
                                }
                              },
                              onSaved: (input) => _confirmPassword = input,
                              cursorColor: Color(0xFF5254d8),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF5254d8),
                                      width: 0.0,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF5254d8),
                                      width: 1.0,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    top: 13.h,
                                  ),
                                  hintText: 'confirm password',
                                  hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w200,
                                    color: Color(0xFF5254d8),
                                    fontSize: ScreenUtil().setSp(12),
                                  )),
                            ),
                            SizedBoxPadding(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: SizedBox(
                                width: 112.w,
                                height: 32.h,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(36.h)),
                                  color: Color(0xFF5254d8),
                                  onPressed: _updateProfile,
                                  child: Text(
                                    'Confirm',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setSp(14),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -1.25),
                  child: AvatarWithIcon(
                    width: 80.w,
                    height: 80.h,
                    avatar: NetworkImage(UserDetails().profilepic),
                    icon: Icons.add,
                    whiteIcon: true,
                    iconHeight: 24.h,
                    iconWidth: 24.w,
                    iconOnPressed: () {
                       _optionsDialogBox();
                    },
                  ),
                ),
              ]),
            )
          ]),
        ),
      ),
          ),
        ),
    );
  }
}
