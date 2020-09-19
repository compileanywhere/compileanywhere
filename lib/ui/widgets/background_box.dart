import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundBox extends StatelessWidget {
  final Widget child, bottomSheet, bottomNavigatioBar,floatingActionButton;
  final PreferredSizeWidget appBar;
  final bool resizeToAvoidBottomInset;
  final FloatingActionButtonLocation floatingActionButtonLocation;

  const BackgroundBox({Key key, this.bottomSheet, this.bottomNavigatioBar, this.floatingActionButton, this.appBar, this.resizeToAvoidBottomInset, this.floatingActionButtonLocation, this.child}) : super(key: key);
  

  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 640.h,
      width: 360.w,
      color: Color(0xff4740e8),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [
      //       Theme.of(context).colorScheme.primaryVariant,
      //       Theme.of(context).colorScheme.secondaryVariant
      //     ],
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //   ),
      // ),
      child: SafeArea(
          child: Scaffold(
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: child,
        bottomSheet: bottomSheet,
        bottomNavigationBar: bottomNavigatioBar,
      )),
    );
  }
}
