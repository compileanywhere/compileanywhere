import 'package:flutter/material.dart';
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




class Avatar extends StatefulWidget {
  final double radius;
  Avatar({@required this.radius});
  @override
  _AvatarState createState() => _AvatarState(this.radius);
}

class _AvatarState extends State<Avatar> {
  final double radius;
  _AvatarState(this.radius);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      //  backgroundColor: Colors.blueAccent,
      backgroundImage: AssetImage('images/avatar.png'),

      radius: this.radius,
    );
  }
}



