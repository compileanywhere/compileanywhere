import 'package:compileanywhere/ui/splashscreen/splashscreen.dart';
import 'package:compileanywhere/ui/views/commentsPage.dart';
import 'package:compileanywhere/ui/views/editProfilePage.dart';
import 'package:compileanywhere/ui/views/playground.dart';
import 'package:compileanywhere/ui/views/homepage.dart';
import 'package:compileanywhere/ui/views/intropage.dart';
import 'package:compileanywhere/ui/views/loginpage.dart';
import 'package:compileanywhere/ui/views/lop.dart';
import 'package:compileanywhere/ui/views/playground_senthiil.dart';
import 'package:compileanywhere/ui/views/profilePage.dart';
import 'package:compileanywhere/ui/views/setProfilePage.dart';
import 'package:compileanywhere/ui/views/settings.dart';
import 'package:compileanywhere/ui/views/setupprofilepage.dart';
import 'package:compileanywhere/ui/views/signuppage.dart';
import 'package:compileanywhere/ui/widgets/imagepicker.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/intro':
        return MaterialPageRoute(builder: (context) => IntroPage());
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case '/signup':
        return MaterialPageRoute(builder: (context) => SignupPage());
        case '/setprofile':
        return MaterialPageRoute(builder: (context) => SetupProfilePages());
      case '/profile':
        return MaterialPageRoute(builder: (context) => Profile());
      case '/editprofile':
        return MaterialPageRoute(builder: (context) => EditProfile());
      case '/lop':
        return MaterialPageRoute(builder: (context) => ListofProg());
      case '/splashscreen':
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case '/playground':
        return MaterialPageRoute(builder: (context) => PlayGround());
      case '/comments':
        return MaterialPageRoute(builder: (context) => Comments());
         case '/picker':
        return MaterialPageRoute(builder: (context) => ImagePickerr());
         case '/settings':
        return MaterialPageRoute(builder: (context) => Settings());



        break;
    }
  }
}
