import 'package:capybara_game/common/components/button/setting_button.dart';
import 'package:capybara_game/common/components/hearder/map_header.dart';
import 'package:capybara_game/common/constants/app_style.dart';
import 'package:capybara_game/features/map/presentations/bloc/map_bloc.dart';
import 'package:capybara_game/features/map/presentations/widgets/data_map.dart';
import 'package:capybara_game/gen/assets.gen.dart';
import 'package:capybara_game/model/level_model.dart';
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
          PageView(
            scrollDirection: Axis.vertical,
            reverse: true,
            children: maps.map((map) => _buildMapPage(context, map)).toList(),
          ),
          const MapHeader(),
          const SettingButton()
        ],
      ),
    );
  }

  Widget _buildMapPage(BuildContext context, MapData map) {
    return Stack(
      children: [
        Image.asset(
          map.imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        ...map.levels.map((level) => _buildLevel(context, level)).toList(),
      ],
    );
  }

  Widget _buildLevel(BuildContext context, LevelModel level) {
    return Positioned(
      bottom: level.bottom,
      left: level.left,
      child: GestureDetector(
        onTap: () {
          context.read<MapBloc>().add(MapEvent.chooseLevel(level.level));
        },
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  level.ratingStar,
                  (index) => Image.asset(
                    Assets.icons.png.star.path,
                    width: 50.w,
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    Assets.icons.png.levelIcon.path,
                    width: 140.w,
                    height: 140.h,
                  ),
                  Text(
                    '${level.level}',
                    style: AppStyle.kanit_bold_102,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
