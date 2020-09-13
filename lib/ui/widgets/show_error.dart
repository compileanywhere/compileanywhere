import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

showError(String image, String error, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        child: SizedBox(
          width: 296.w,
          height: 162.h,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.h),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: SizedBox(
                      height: 74.h,
                      child: Image.asset(image),
                    ),
                  ),
                  Text(
                    error,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: ScreenUtil().setSp(12),
                      color: Color(0xff7277F1),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 21.h,
                      child: FlatButton(
                        child: Text(
                          'Okay',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil().setSp(14),
                            color: Color(0xff7277F1),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
