import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compileanywhere/ui/models/usermodels.dart';
import 'package:compileanywhere/ui/views/programview.dart';
import 'package:compileanywhere/ui/widgets/circleavatar.dart';
import 'package:compileanywhere/ui/widgets/localwidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListofProg extends StatefulWidget {
  @override
  _ListofProgState createState() => _ListofProgState();
}

class _ListofProgState extends State<ListofProg> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore db = Firestore.instance;
  String profilePicUrl;

  @override
  void initState() {
      // setState(() {
            // Timer(Duration(seconds: 5), checkAuthentication);

      //  profilePicUrl='assets/avatar.png';

      // });
    super.initState();
    checkAuthentication();
  // var future = new Future.delayed(const Duration(milliseconds: 10), checkAuthentication());

    super.initState();
  }

 

  checkAuthentication() {
    _auth.onAuthStateChanged.listen((user) async {
      if (user == null) {
        UserDetails().logout();
        Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, '/intro');
      }
    });
  }

  int _index = 0;
  int i;
  bool fieldTouch = false;

  TextEditingController _searchController = new TextEditingController();
  // Container Pics(String imageVal) {
  //   return Container(
  //     width: 300,
  //     height: 100,
  //     child: Card(
  //       child: Wrap(
  //         children: <Widget>[
  //           Image.network(imageVal),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 360, height: 640, allowFontScaling: true);
// setState(() {
//   profilePicUrl=UserDetails().profilepic;

// });


    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(  
            gradient: LinearGradient(
          colors: [Color(0xFF5254D8), Color(0xFF1DA1F2)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
                  child: Column(children: [
            // FittedBox(
            //   child: Image.asset('assets/background.png'),
            //   fit: BoxFit.fill,
            // ),

            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    right: 90.0, top: 55,
                    // bottom:10
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(36),
                          topRight: Radius.circular(36)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF5254D8),
                        ),
                        hintText: 'Search',
                        suffixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF5254D8),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                          left: 20,
                          top: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 60,
                    left: 360,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child:
                    // CircleAvatarr(),
                     CircleAvatar(
                      foregroundColor: Colors.red,

                       backgroundColor: Colors.blueAccent,
                      // backgroundImage:NetworkImage(UserDetails().profilepic),
                      // backgroundImage: new NetworkImage(UserDetails().profilepic),
                      radius: 22,
                    ),
                  ),
                ),
              ],
            ),
      LimitedBox(
              maxHeight: 300,
              // maxWidth: 300,
                        child: Expanded(
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
              print('clicked');
                        },
                        child: Container(
              child: Image.asset('assets/sem_cards/LabCardSem301.png'),
              width: 50,
              height: 50, 
                        ),
                      ),
                      Container(
                        child: Image.asset('assets/sem_cards/LabCardSem302.png'),
                        width: 0,
                        height: 50,
                      ),
                      Container(
                        child: Image.asset('assets/sem_cards/LabCardSem401.png'),
                        width: 0,
                        height: 50,
                      ),
                      Container(
                        child: Image.asset('assets/sem_cards/LabCardSem402.png'),
                        width: 0,
                        height: 50,
                      ),
                      Container(
                        child: Image.asset('assets/sem_cards/LabCardSem501.png'),
                        width: 0,
                        height: 50,
                      ),
                    ],
                  ),
                ),
            ),

            Padding(
              padding:  EdgeInsets.only(right:218.h),
              child: SizedBox(
                          child: 
                              Container(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                  'Programs',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                               ),
            ),
                            SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.59,
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  child: StreamBuilder(
                                    stream: db
                                        .collection('faculty')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      print(snapshot.data);
                                      print("the data is printed");
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return ListView.builder(
                                        itemCount: snapshot.data.documents.length,
                                        itemBuilder: (context, index) => GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProgramView(
                                    document:
                                        snapshot.data.documents[index],
                                  )));
                                          },
                                          child: CustomCards(
                                            title: snapshot.data.documents[index]['name'],
                                            language: snapshot.data.documents[index]['dept'],
                                            username: snapshot
                              .data.documents[index]['popularity']
                              .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                         
           
          ]),
        ),
      ),
    );
  }
}

void see() {
  Container(
    padding: EdgeInsets.only(left: 25, right: 20, top: 30),
    child: Text('hooo'),
    // Container(
    //      decoration: BoxDecoration(
    //                     color: Colors.white,

    //   borderRadius: BorderRadius.all(Radius.circular(12)),

    // ),
    //   padding: EdgeInsets.only(top:7),
    //   height: 80,
    //  // color: Colors.white,
    //   child: ListTile(
    //     onLongPress: (){
    // Popp();
    //     },
    //     title:  Text('thisssssssssssssssss',
    //       style: GoogleFonts.poppins(
    //         fontWeight:FontWeight.w400,
    //         fontSize: 18,
    //      color:
    //      //Colors.blue,
    //        Colors.red,
    //       ),
    //     ),
    //    trailing:Icon(Icons.chevron_right,
    //    color: Color(0xFF394A33),
    //    ),
    //     subtitle: Padding(
    //       padding:  EdgeInsets.only(left:6.0,top:4),
    //       child: Text('By Sowmya AM, CSE',
    //       style: GoogleFonts.poppins(
    //           fontWeight:FontWeight.w400,
    //           fontSize: 13,
    //        color: Colors.black,
    //         ),

    //       ),
    //     ),
    //   ),
    // ),
  );
}
