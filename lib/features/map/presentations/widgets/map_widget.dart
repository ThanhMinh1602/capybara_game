import 'package:capybara_game/common/components/hearder/map_header.dart';
import 'package:capybara_game/common/constants/app_color.dart';
import 'package:capybara_game/common/constants/app_style.dart';
import 'package:capybara_game/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      Assets.images.map.path,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 100.h,
                      left: 0,
                      right: 40.w,
                      child: _buildLevel(
                        level: 1,
                        ratingStar: 3,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const MapHeader(),
        ],
      ),
    );
  }

  Widget _buildLevel({
    void Function()? onTap,
    int? ratingStar,
    required int level,
  }) {
    int stars = (ratingStar != null && ratingStar >= 1 && ratingStar <= 3)
        ? ratingStar
        : 1;

    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  stars,
                  (index) => Image.asset(
                        Assets.icons.png.star.path,
                        width: 70.w,
                      )),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  Assets.icons.png.levelIcon.path,
                  width: 183.w,
                  height: 176.h,
                ),
                Text(
                  '$level',
                  style: AppStyle.kanit_bold_102,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
