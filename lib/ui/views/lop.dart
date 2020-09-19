import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compileanywhere/ui/models/usermodels.dart';
import 'package:compileanywhere/ui/views/programview.dart';
import 'package:compileanywhere/ui/widgets/background_box.dart';
import 'package:compileanywhere/ui/widgets/circleavatar.dart';
import 'package:compileanywhere/ui/widgets/localwidgets.dart';
import 'package:compileanywhere/ui/widgets/searchbar_and_profileIcon.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListofProg extends StatefulWidget {
  final ScrollController controller;

  const ListofProg({Key key, this.controller}) : super(key: key);

  @override
  _ListofProgState createState() => _ListofProgState(this.controller);
}

class _ListofProgState extends State<ListofProg> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore db = Firestore.instance;
  String profilePicUrl;

  _ListofProgState(this.controller);
  final ScrollController controller;

  @override
  void initState() {
    // setState(() {
    // Timer(Duration(seconds: 5), checkAuthentication);

    //  profilePicUrl='assets/avatar.png';

    // });
    // super.initState();
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
  // String location =await UserDetails().profilepic;

  TextEditingController _searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 360, height: 640, allowFontScaling: true);
    setState(()  {
      Timer(Duration(seconds: 5), () => profilePicUrl = UserDetails().profilepic());
    });

    return BackgroundBox(
      appBar: SearchBarAndNotification(controller: _searchController,),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xff4740e8),
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //   colors: [Color(0xFF5254D8), Color(0xFF1DA1F2)],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),

        // ),
        child: SingleChildScrollView(
          child: Column(children: [
            // FittedBox(
            //   child: Image.asset('assets/background.png'),
            //   fit: BoxFit.fill,
            // ),

            // Stack(
            //   children: <Widget>[
            //     Padding(
            //       padding: EdgeInsets.only(
            //         right: 90.0, top: 55,
            //         // bottom:10
            //       ),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.only(
            //               bottomRight: Radius.circular(36),
            //               topRight: Radius.circular(36)),
            //         ),
            //         child: TextField(
            //           decoration: InputDecoration(
            //             hintStyle: GoogleFonts.poppins(
            //               fontWeight: FontWeight.w400,
            //               color: Color(0xFF5254D8),
            //             ),
            //             hintText: 'Search',
            //             suffixIcon: Icon(
            //               Icons.search,
            //               color: Color(0xFF5254D8),
            //             ),
            //             border: InputBorder.none,
            //             contentPadding: EdgeInsets.only(
            //               left: 20,
            //               top: 14,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       padding: EdgeInsets.only(
            //         top: 60,
            //         left: 360,
            //       ),
            //       child: GestureDetector(
            //         onTap: () {
            //           Navigator.pushNamed(context, '/profile');
            //         },
            //         child:
            //             // CircleAvatarr(),
            //             //     CircleAvatar(
            //             //   foregroundColor: Colors.red,

            //             //   // backgroundColor: Colors.blueAccent,
            //             //   // backgroundImage: NetworkImage(profilePicUrl),
            //             //   backgroundImage: new NetworkImage(UserDetails().profilepic),
            //             //   radius: 22,
            //             // ),
            //             profilee(),
            //       ),
            //     ),
            //   ],
            // ),

            SizedBox(
              height: 200.h,
              width: 360.w,
              child: CarouselSlider(
                height: 170.h,
                enlargeCenterPage: true,
                // autoPlay: true,
                aspectRatio: 16 / 9,
                // autoPlayCurve: Curves.fastOutSlowIn,
                // enableInfiniteScroll: true,
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                // viewportFraction: 0.8,
                items: [
                  Container(
                
                    margin: EdgeInsets.only(top:20.0.h,left:5.w),
                    decoration: BoxDecoration(
                      // color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/sem_cards/LabCardSem301.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    // color: Colors.amber,
  margin: EdgeInsets.only(top:20.0.h,left:5.w),                  decoration: BoxDecoration(
                      // color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/sem_cards/LabCardSem302.png'),
                        fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                     margin: EdgeInsets.only(top:20.0.h,left:5.w),
                    decoration: BoxDecoration(
                      // color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/sem_cards/LabCardSem401.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:20.0.h,left:5.w),
                    decoration: BoxDecoration(
                      // color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/sem_cards/LabCardSem402.png'),
                          fit: BoxFit.fill),
                    ),
                  ),Container(
                    margin: EdgeInsets.only(top:20.0.h,left:5.w),
                    decoration: BoxDecoration(
                      // color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/sem_cards/LabCardSem501.png'),
                          fit: BoxFit.fill),
                    ),
                  ),Container(
                      margin: EdgeInsets.only(top:20.0.h,left:5.w),
                    decoration: BoxDecoration(
                      // color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/sem_cards/LabCardSem502.png'),
                          fit: BoxFit.fill),
                    ),
                  ),Container(
                      margin: EdgeInsets.only(top:20.0.h,left:5.w),
                    decoration: BoxDecoration(
                      // color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/sem_cards/LabCardSem601.png'),
                          fit: BoxFit.fill),
                    ),
                  ),Container(
  margin: EdgeInsets.only(top:20.0.h,left:5.w),                    decoration: BoxDecoration(
                      // color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/sem_cards/LabCardSem602.png'),
                          fit: BoxFit.fill),
                    ),
                  ),Container(
  margin: EdgeInsets.only(top:20.0.h,left:5.w),                    decoration: BoxDecoration(
                      // color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/sem_cards/LabCardSem701.png'),
                          fit: BoxFit.fill),
                    ),
                  ),Container(
  margin: EdgeInsets.only(top:20.0.h,left:5.w),                    decoration: BoxDecoration(
                      // color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/sem_cards/LabCardSem702.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
            ),

            // LimitedBox(
            //   maxHeight: 300,
            //   // maxWidth: 300,
            //   child: Expanded(
            //     child: PageView(
            //       scrollDirection: Axis.horizontal,
            //       children: <Widget>[
            //         GestureDetector(
            //           onTap: () {
            //            Navigator.pushNamed(context,'/picker');
            //           },
            //           child: Container(
            //             child:
            //                 Image.asset('assets/sem_cards/LabCardSem301.png'),
            //             width: 50,
            //             height: 50,
            //           ),
            //         ),
            //         Container(
            //           child: Image.asset('assets/sem_cards/LabCardSem302.png'),
            //           width: 0,
            //           height: 50,
            //         ),
            //         Container(
            //           child: Image.asset('assets/sem_cards/LabCardSem401.png'),
            //           width: 0,
            //           height: 50,
            //         ),
            //         Container(
            //           child: Image.asset('assets/sem_cards/LabCardSem402.png'),
            //           width: 0,
            //           height: 50,
            //         ),
            //         Container(
            //           child: Image.asset('assets/sem_cards/LabCardSem501.png'),
            //           width: 0,
            //           height: 50,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBoxPadding(),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 20.h),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Programs',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.59,
              width: MediaQuery.of(context).size.width * 0.9,
              child: StreamBuilder(
                stream: db.collection('faculty').snapshots(),
                builder: (context, snapshot) {
                  // print(snapshot.data['name']);

                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Scrollbar(
                    // isAlwaysShown: true,
                    // controller: controller,
                    // labelTextBuilder: (offset)=>Text('${offset.floor()}'),
                    // backgroundColor:Colors.white,
                    // controller: controller,
                    // isAlwaysShown: false,

                    //  alwaysVisibleScrollThumb: true,

                    child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProgramView(
                                    document: snapshot.data.documents[index],
                                  )));
                        },
                        child: CustomCards(
                          title: snapshot.data.documents[index]['name'],
                          language: snapshot.data.documents[index]['dept'],
                          username: snapshot.data.documents[index]['popularity']
                              .toString(),
                        ),
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

Widget profilee() {
  return CircleAvatar(
    foregroundColor: Colors.red,
    backgroundImage: AssetImage('assets/avatar.png'),
    // backgroundColor: Colors.blueAccent,
    // backgroundImage: NetworkImage(profilePicUrl),
    // backgroundImage: new NetworkImage(UserDetails().profilepic),
    radius: 22,
  );
}



// Widget profilee() {
//   return  FadeInImage.assetNetwork( 
//     image:UserDetails().profilepic,
//     placeholder:'assets/sem_cards/LabCardSem301.png',// your assets image path
//     fit: BoxFit.cover,
//   );
// }


// Widget profilee(){
//   // print(UserDetails().profilepic + 'ashi:::::::::::::::::::::::::::::::::::::::::::');
// return Image.network(
//      'https://firebasestorage.googleapis.com/v0/b/compile-anywhere.appspot.com/o/Avatar%2F4ryMIkoCnMPTuJ9Oks8auWZVhV92.jpg?alt=media&token=e4e1b1ea-4286-482b-a6e8-0d4121129c55',
//       fit: BoxFit.cover,
      
//   );
// }