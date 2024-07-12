import 'package:capybara_game/common/components/button/setting_button.dart';
import 'package:capybara_game/common/components/hearder/map_header.dart';
import 'package:capybara_game/common/constants/app_style.dart';
import 'package:capybara_game/features/map/presentations/bloc/map_bloc.dart';
import 'package:capybara_game/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                        context,
                        level: 3,
                        ratingStar: 3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const MapHeader(),
          const SettingButton()
        ],
      ),
    );
  }

  Widget _buildLevel(
    BuildContext context, {
    int? ratingStar,
    required int level,
  }) {
    int stars = (ratingStar != null && ratingStar >= 1 && ratingStar <= 3)
        ? ratingStar
        : 1;
    return GestureDetector(
      onTap: () {
        context.read<MapBloc>().add(MapEvent.chooseLevel(level));
      },
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
