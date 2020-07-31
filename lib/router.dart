import 'package:flutter/material.dart';

import 'package:compileanywhere/ui/views/homepage.dart';
import 'package:compileanywhere/ui/views/intropage.dart';
import 'package:compileanywhere/ui/views/loginpage.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/intro':
        return MaterialPageRoute(builder: (context) => IntroPage());
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginPage());
        break;
    }
  }
}
