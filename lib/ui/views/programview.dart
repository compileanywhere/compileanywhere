import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compileanywhere/ui/views/commentsPage.dart';
import 'package:compileanywhere/ui/widgets/localwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgramView extends StatefulWidget {
  final DocumentSnapshot document;
  ProgramView({Key key, @required this.document}) : super(key: key);
  @override
  _ProgramViewState createState() => _ProgramViewState(this.document);
}

class _ProgramViewState extends State<ProgramView> {
  final DocumentSnapshot document;
  _ProgramViewState(this.document);

  _increment() {
    print('i got clicked');
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await transaction.get(document.reference);
      await transaction.update(freshSnap.reference, {
        'likes': freshSnap['likes'] + 1,
      });
    });
  }

  bool icons = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 360, height: 640, allowFontScaling: true);
    return Scaffold(
      body: Container(
        height: 640.h,
        width: 360.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ThemeColor().returnColor(),
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8.h, 0, 16.h),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: ScreenUtil().setSp(18),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  title: Text(
                    "Program",
                    style: GoogleFonts.poppins(
                      fontSize: ScreenUtil().setSp(24),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 328.w,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 56.h,
                        child: Align(
                          alignment: Alignment.center,
                          child: ListTile(
                            // leading: FittedBox(
                            //   child: CircularProfileAvatar(
                            //     null,
                            //     child: Image(
                            //       image: NetworkImage(document['avatar_link']),
                            //     ),
                            //     borderColor: Color(0xFF7277F1),
                            //     borderWidth: ScreenUtil().setSp(1),
                            //     radius: ScreenUtil().setSp(36),
                            //   ),
                            // ),
                            title: RichText(
                              text: TextSpan(
                                text: document['name'],
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF333333),
                                  fontSize: ScreenUtil().setSp(10),
                                ),
                                children: [
                                  TextSpan(
                                    text: '  last updated on',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF828282),
                                      fontSize: ScreenUtil().setSp(8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Text(
                              // document['creation_date'].toDate().toString(),
                              "here the time vll come",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF828282),
                                fontSize: ScreenUtil().setSp(8),
                              ),
                            ),
                            // trailing: Stack(
                            //   children: <Widget>[
                            //     IconButton(
                            //       onPressed: () {
                            //         print('i got clicked');
                            //         Firestore.instance.runTransaction(
                            //           (transaction) async {
                            //             DocumentSnapshot freshSnap =
                            //                 await transaction
                            //                     .get(document.reference);
                            //             await transaction
                            //                 .update(freshSnap.reference, {
                            //               'likes': freshSnap['likes'] + 1,
                            //             },
                            //             );
                            //           },
                            //         );
                            //         icons
                            //             ? setState(() {
                            //                 icons = false;

                            //               })
                            //             : setState(() {
                            //                 icons = true;

                            //               });
                            //       },
                            //       icon: Icon(
                            //         icons
                            //             ? MaterialCommunityIcons.star
                            //             : MaterialCommunityIcons.star_outline,
                            //         color: icons ? Colors.red : Colors.blue,
                            //       ),
                            //     ),
                            //     Padding(
                            //       padding: const EdgeInsets.only(
                            //           top: 38.0, left: 20),
                            //       child: Text(document['likes'].toString()),
                            //     )
                            //   ],
                            // ),
//////////old comment
                            // FittedLikeButton(
                            //   // Color(0xffffa800),
                            //   // MaterialCommunityIcons.star,
                            //   // MaterialCommunityIcons.star_outline,
                            //   // // 153,
                            //   // document['likes'],
                            //   // // document['likes'].toString(),
                            //   // "star",
                            // ),

                            //its working=>
                            //     Text(document['likes'].toString()),
                            // onTap: _increment,
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xFF7277f1),
                        thickness: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setSp(16)),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Title',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF828282),
                                  fontSize: ScreenUtil().setSp(8),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 4.h, 0, 16.h),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  // document['title'],
                                  document['dept'],

                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF333333),
                                    fontSize: ScreenUtil().setSp(12),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Description',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF828282),
                                  fontSize: ScreenUtil().setSp(8),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4.h),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  // document['description'],
                                  document['name'],
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF333333),
                                    fontSize: ScreenUtil().setSp(12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Color(0xff7277f1),
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 48.h,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 16.w,
                              ),
                              ButtonTheme(
                                minWidth: 112.w,
                                child: OutlineButton(
                                  onPressed: () {
                                    final data = ClipboardData(
                                      text: document['code'],
                                    );
                                    Clipboard.setData(data);
                                    Navigator.pushNamed(context, '/playground');
                                  },
                                  child: Text(
                                    'Run',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff7277f1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: ScreenUtil().setSp(12),
                                    ),
                                  ),
                                  shape: StadiumBorder(),
                                  borderSide: BorderSide(
                                    color: Color(0xff7277f1),
                                    width: 1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              ButtonTheme(
                                minWidth: 112.w,
                                child: OutlineButton(
                                  onPressed: () {},
                                  child: Text(
                                    'YouTube',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff7277f1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: ScreenUtil().setSp(12),
                                    ),
                                  ),
                                  shape: StadiumBorder(),
                                  borderSide: BorderSide(
                                    color: Color(0xff7277f1),
                                    width: 1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              ButtonTheme(
                                minWidth: 112.w,
                                child: OutlineButton(
                                  onPressed: () {
                                    // Navigator.pushNamed(context, '/comments');
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Comments(
                                                programId: this.document.documentID)));
                                  },
                                  child: Text(
                                    'Comments',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff7277f1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: ScreenUtil().setSp(12),
                                    ),
                                  ),
                                  shape: StadiumBorder(),
                                  borderSide: BorderSide(
                                    color: Color(0xff7277f1),
                                    width: 1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 64.h,
                  maxHeight: 484.h,
                ),
                child: SizedBox(
                  width: 328.w,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(ScreenUtil().setSp(16)),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Code',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF828282),
                                  fontSize: ScreenUtil().setSp(8),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: ScreenUtil().setSp(4.h)),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  document['code'],

                                  // 'program vll come here',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF333333),
                                      fontSize: ScreenUtil().setSp(12)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 64.h,
                  maxHeight: 215.h,
                ),
                child: SizedBox(
                  width: 328.w,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(ScreenUtil().setSp(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Output',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF828282),
                                  fontSize: ScreenUtil().setSp(8),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4.h),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  // document['output'],
                                  'output vll come here',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF333333),
                                    fontSize: ScreenUtil().setSp(12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 64.h,
                  maxHeight: 215.h,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.91111,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(ScreenUtil().setSp(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Input',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF828282),
                                  fontSize: ScreenUtil().setSp(8),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4.h),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  // document['input'],
                                  'imput vll come here',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF333333),
                                    fontSize: ScreenUtil().setSp(12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
