import 'package:flutter/material.dart';

import 'package:compileanywhere/ui/views/homepage.dart';
import 'package:compileanywhere/ui/views/intropage.dart';
import 'package:compileanywhere/ui/views/loginpage.dart';
import 'package:compileanywhere/ui/views/signuppage.dart';
import 'package:compileanywhere/ui/views/setupprofilepage.dart';

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
      case '/setupprofile':
        return MaterialPageRoute(builder: (context) => SetupProfilePage());
        break;
    }
  }
}
