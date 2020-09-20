import 'package:compileanywhere/ui/models/usermodels.dart';
import 'package:compileanywhere/ui/widgets/localwidgets.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarAndNotification extends StatefulWidget
    implements PreferredSizeWidget {
  final TextEditingController controller;

  const SearchBarAndNotification({Key key, this.controller}) : super(key: key);
  @override
  _SearchBarAndNotificationState createState() =>
      _SearchBarAndNotificationState(this.controller);
  Size get preferredSize => Size.fromHeight(56.h);
}

class _SearchBarAndNotificationState extends State<SearchBarAndNotification> {
  final TextEditingController controller;

  _SearchBarAndNotificationState(this.controller);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBoxPadding(),
        Row(
          children: [
            SizedBox(
              height: 36.h,
              width: 276.w,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(36.h),
                        bottomRight: Radius.circular(36.h)),
                    // color: Theme.of(context).colorScheme.primary,
                    color: Colors.white),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: GoogleFonts.poppins(
                          fontSize: ScreenUtil().setSp(16),
                        ),
                        autofocus: false,
                        controller: controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: GoogleFonts.poppins(
                              fontSize: ScreenUtil().setSp(16),
                              color: Color(0xff5254d8)),
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 2.h),
                          suffixIcon: Icon(EvaIcons.search,
                              // color: Theme.of(context).iconTheme.color,
                              // size: Theme.of(context).iconTheme.size,
                              color: Color(0xff5254d8)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 32.w,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context,'/profile');
              },
                          child: SizedBox(
                width: 36.w,
                height: 36.h,
                child: CircleAvatar(
                  foregroundColor: Colors.red,
                  backgroundImage: AssetImage('assets/avatar.png'),
                  // backgroundColor: Colors.blueAccent,
                  // backgroundImage: NetworkImage(profilePicUrl),
                  // backgroundImage: new NetworkImage(UserDetails().profilepic),
                  radius: 22,
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            )
          ],
        ),
      ],
    );
  }
}
