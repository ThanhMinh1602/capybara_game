// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:capybara_game/common/constants/app_color.dart';
import 'package:capybara_game/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarSlider extends StatelessWidget {
  final double maxScore;
  final double currentScore;
  const StarSlider({
    super.key,
    required this.maxScore,
    required this.currentScore,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        disabledActiveTrackColor: AppColor.c_C3E558,
        trackHeight: 7.0,
        thumbShape: SliderComponentShape.noThumb,
      ),
      child: Stack(
        children: [
          Slider(
            value: currentScore,
            min: 0,
            max: maxScore,
            onChanged: null,
          ),
          Positioned(
            left: 10,
            top: 10,
            bottom: 10,
            child: Image.asset(
              Assets.icons.png.playerStar.path,
              width: 64.w,
              height: 64.h,
            ),
          ),
          Positioned(
            left: 100,
            top: 10,
            bottom: 10,
            child: Image.asset(
              Assets.icons.png.playerStar.path,
              width: 64.w,
              height: 64.h,
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            bottom: 10,
            child: Image.asset(
              Assets.icons.png.playerStar.path,
              width: 64.w,
              height: 64.h,
            ),
          ),
        ],
      ),
    );
  }
}
