// ignore_for_file: non_constant_identifier_names

import 'package:capybara_game/common/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  AppStyle._();
  static TextStyle dialogTitle = GoogleFonts.inknutAntiqua(
    color: AppColor.c_003B81,
    fontSize: 43.sp,
    fontWeight: FontWeight.bold,
  );
  //kanit
  static TextStyle settingListTitle = GoogleFonts.kanit(
      color: AppColor.c_234464,
      fontSize: 34.sp,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic);
  static TextStyle kanit_regular_34 = GoogleFonts.kanit(
    color: AppColor.c_234464,
    fontSize: 34.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle kanit_bold_41 = GoogleFonts.kanit(
      color: AppColor.c_C7274B,
      fontSize: 41.sp,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic);

  static TextStyle kanit_bold_102 = GoogleFonts.kanit(
    color: AppColor.c_ffffff,
    fontSize: 102.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle kanit_bold_61 = GoogleFonts.kanit(
    color: AppColor.c_B1194A,
    fontSize: 61.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle kanit_medium_38 = GoogleFonts.kanit(
    color: AppColor.c_909090,
    fontSize: 38.sp,
    fontWeight: FontWeight.w500,
  );
  
}
