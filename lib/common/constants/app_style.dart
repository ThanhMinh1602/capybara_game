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
}
