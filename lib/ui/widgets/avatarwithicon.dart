import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarWithIcon extends StatelessWidget {
  final double width, height, iconWidth, iconHeight;
  final NetworkImage avatar;
  final IconData icon;
  final Function iconOnPressed;
  final bool whiteIcon;

  const AvatarWithIcon(
      {Key key,
      this.width,
      this.height,
      this.iconWidth,
      this.iconHeight,
      this.avatar,
      this.icon,
      this.iconOnPressed,
      this.whiteIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FittedBox(
            child: CircularProfileAvatar(
              null,
              child: CircleAvatar(
                backgroundImage: avatar,
              ),
              borderColor: whiteIcon ? Color(0xFF7277F1) : Colors.white,
              borderWidth: ScreenUtil().setSp(1),
              radius: ScreenUtil().setSp(60),
            ),
          ),
          Positioned(
            bottom: 3.h,
            right: 8.w,
            child: SizedBox(
              width: iconWidth,
              height: iconHeight,
              child: FittedBox(
                child: FloatingActionButton(
                    backgroundColor:
                        whiteIcon ? Color(0xFF7277F1) : Colors.white,
                    elevation: 0,
                    child: FittedBox(
                      child: Icon(
                        icon,
                        color: whiteIcon ? Colors.white : Color(0xff7277f1),
                        size: ScreenUtil().setSp(24),
                      ),
                    ),
                    onPressed: iconOnPressed),
              ),
            ),
          )
        ],
      ),
    );
  }
}
