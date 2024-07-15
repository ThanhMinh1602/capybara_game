import 'package:capybara_game/common/components/button/setting_button.dart';
import 'package:capybara_game/common/components/hearder/map_header.dart';
import 'package:capybara_game/common/constants/app_style.dart';
import 'package:capybara_game/features/map/presentations/bloc/map_bloc.dart';
import 'package:capybara_game/gen/assets.gen.dart';
import 'package:capybara_game/model/player_model.dart';
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
              children: [_buildMapPage(context)]),
          const MapHeader(),
          const SettingButton()
        ],
      ),
    );
  }

  Widget _buildMapPage(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(builder: (context, state) {
      return Stack(
        children: [
          Image.asset(
            Assets.images.map1.path,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          ListView.separated(
              reverse: true,
              itemBuilder: (context, index) {
                return _buildLevel(context, state.dataLevels[index]);
              },
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemCount: 5)
        ],
      );
    });
  }

  Widget _buildLevel(BuildContext context, PlayerModel level) {
    return Positioned(
      // bottom: level.bottom, // Cần cập nhật vị trí cho phù hợp
      // left: level.left,   // Cần cập nhật vị trí cho phù hợp
      child: GestureDetector(
        onTap: () {
          context.read<MapBloc>().add(MapEvent.chooseLevel(level.level));
        },
        child: Center(
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                for (int i = 1; i <= level.ratingStar; i++)
                  Image.asset(
                    Assets.icons.png.star.path,
                    width: 50.w,
                  ),
              ]),
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
