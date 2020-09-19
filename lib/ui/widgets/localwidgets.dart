import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class College extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(80, 658, 0, 10),
      child: Container(
        child: Text(
          'SRI SAI RAM COLLEGE OF ENGINEERING',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            //fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// class Avatar extends StatefulWidget {
//   final double radius;
//   Avatar({@required this.radius});
//   @override
//   _AvatarState createState() => _AvatarState(this.radius);
// }

// class _AvatarState extends State<Avatar> {
//   final double radius;
//   _AvatarState(this.radius);
//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       //  backgroundColor: Colors.blueAccent,
//       backgroundImage: AssetImage('images/avatar.png'),

//       radius: this.radius,
//     );
//   }
// }

class CustomCard extends StatefulWidget {
  final String text;
  CustomCard({@required this.text});
  @override
  _CustomCardState createState() => _CustomCardState(this.text);
}

class _CustomCardState extends State<CustomCard> {
  final String text;
  _CustomCardState(this.text);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Text('hell');
      },
      child: Stack(children: [
        Container(
          padding: EdgeInsets.only(left: 25, right: 20, top: 30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            padding: EdgeInsets.only(top: 7),
            height: 80,
            // color: Colors.white,
            child: ListTile(
              onTap: () {
                Container(
                  color: Colors.amber,
                  child: Text('hello'),
                );
              },
              title: Text(
                this.text,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color:
                      //Colors.blue,
                      Color(0xFF394AA3),
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Color(0xFF394A33),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(left: 6.0, top: 4),
                child: Text(
                  'By Sowmya AM, CSE',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, bottom: 5, top: 18),
          child: Container(
            padding: EdgeInsets.only(left: 9, top: 0),
            height: 20,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xFF394AA3),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            // color: Color(0xFF394AA3),
            child: Text(
              'C++',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class Popp extends StatefulWidget {
  @override
  _PoppState createState() => _PoppState();
}

class _PoppState extends State<Popp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('this is a pop up'),
    );
  }
}




class CustomCards extends StatefulWidget {
  final String title;
  final String language;
  final String username;
  CustomCards({@required this.title, this.language, this.username});
  @override
  _CustomCardsState createState() =>
      _CustomCardsState(this.title, this.language, this.username);
}

class _CustomCardsState extends State<CustomCards> {
  final String title;
  final String language;
  final String username;
  _CustomCardsState(this.title, this.language, this.username);
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.035;
    return Stack(children: [
      Container(
        padding: EdgeInsets.only(left: size, right: size, top: 30),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            padding: EdgeInsets.only(top: 7),
            height: 80,
            // color: Colors.white,
            child: ListTile(
              title: Text(
                this.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color:
                      //Colors.blue,
                      Color(0xFF394AA3),
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Color(0xFF394A33),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(left: 6.0, top: 4),
                child: Text(
                  'by ' + username,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),
            )),
      ),
      Padding(
        padding: EdgeInsets.only(left: 22, bottom: 5, top: 18),
        child: FittedBox(
          fit: BoxFit.none,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 40),
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              height: 20,

              decoration: BoxDecoration(
                color: Color(0xFF394aa3),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              // color: Color(0xFF394AA3),
              child: Text(
                language,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}



class ThemeColor {
  bool isDarkTheme = false;
  List<Color> returnColor() {
    if (isDarkTheme) {
    } else {
      return [Color(0xFF5254D8), Color(0xFF1DA1F2)];
    }
  }
}

class SizedBoxPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 360, height: 640, allowFontScaling: true);
    return SizedBox(
      height: 16.h,
    );
  }
}

  

// class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const TransparentAppBar(
//       {Key key, this.title, this.actionIcon, this.actionOnPressed})
//       : super(key: key);
//   @required
//   final String title;
//   final Function actionOnPressed;
//   final IconData actionIcon;

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context, width: 360, height: 640, allowFontScaling: true);
//     return AppBar(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       centerTitle: true,
//       leading: Padding(
//         padding: EdgeInsets.only(left: 8.w),
//         child: IconButton(
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: Colors.white,
//               size: 24.h,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//       ),
     
//       title: Text(
//         title,
//         overflow: TextOverflow.visible,
//         style: GoogleFonts.poppins(
//           fontSize: ScreenUtil().setSp(24),
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: EdgeInsets.only(right: 16.w),
//           child: IconButton(
//             icon: Icon(
//               actionIcon,
//               color: Colors.white,
//               size: 24.h,
//             ),
//             onPressed: actionOnPressed,
//           ),
//         )
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(56.h);
// }






class OrLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 360, height: 640, allowFontScaling: true);
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            width: 10,
          ),
        ),
        Container(
          width: 56.w,
          height: 1,
          color: Color(0xFFC4C4C4),
        ),
        SizedBox(
          width: 24.w,
        ),
        Text(
          'or',
          style: GoogleFonts.poppins(
            fontSize: ScreenUtil().setSp(12),
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 24.w,
        ),
        Container(
          width: 56.w,
          height: 1,
          color: Color(0xFFC4C4C4),
        ),
        Expanded(
            child: SizedBox(
          width: 10,
        )),
      ],
    );
  }
}
