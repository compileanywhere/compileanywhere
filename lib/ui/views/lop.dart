import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListofProg extends StatefulWidget {
  @override
  _ListofProgState createState() => _ListofProgState();
}

class _ListofProgState extends State<ListofProg> {
  Container Pics(String imageVal) {
    return Container(
      width: 300,
      height: 100,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.network(imageVal),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xFF5254D8), Color(0xFF1DA1F2)],
          //colors: [Colors.green, Colors.red],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(children: [
          // Image.asset(
          //   'assets/background.png',
          //   width: 300,
          //   height: 683,
          // ),

          Row(children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 60,
                left: 20,
                // right: 240,
              ),
              child: Text(
                'Welcome User',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 60,
                left: 200,
              ),
              child: CircleAvatar(
                foregroundColor: Colors.red,

                //  backgroundColor: Colors.blueAccent,
                backgroundImage: AssetImage('assets/avatar.png'),
                radius: 21,
              ),
            ),
          ]),

          Expanded(
            flex: 3,
            child: ListView(
                // padding: EdgeInsets.only(left:20),

                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  //  Text('this is just for checking'),
                  //   Text('this is just for checking'),
                  //    Text('this is just for checking'),
                  //     Text('this is just for checking'),
                  Pics(
                      "https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/body-image/public/1-corvette-stingray-c8-2019-fd-hr-hero-front_0.jpg?itok=SEYe_vLy"),
//Spacer(flex: 2,),
                  Pics(
                      "https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/body-image/public/1-corvette-stingray-c8-2019-fd-hr-hero-front_0.jpg?itok=SEYe_vLy"),
//Spacer(),
                  Pics(
                      "https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/body-image/public/1-corvette-stingray-c8-2019-fd-hr-hero-front_0.jpg?itok=SEYe_vLy"),
                ]),
          ),
          Expanded(
            flex: 4,
            child: Container(),
          ),

          Container(
            //top: 380,
            child: Text(
              'Programs',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),

          Container(
            //top: 430,
            child: Column(children: [
              SizedBox(
                width: 360,
                height: 70,
                child: Card(
                  child: Text(
                    '1.Matrix Multiplication',
                  ),
                ),
              ),
              SizedBox(
                width: 360,
                height: 70,
                child: Card(
                  child: Text(
                    '1.Matrix Multiplication',
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

Widget _avatarcircle({double radius}) {
  return Container(
    child: Column(
      children: [
        Center(
          child: CircleAvatar(
            //  backgroundColor: Colors.blueAccent,
            backgroundImage: AssetImage('images/avatar.png'),
            radius: (radius),
          ),
        )
      ],
    ),
  );
}
