import 'package:capybara_game/common/components/button/setting_button.dart';
import 'package:capybara_game/common/components/hearder/map_header.dart';
import 'package:capybara_game/common/constants/app_color.dart';
import 'package:capybara_game/common/constants/app_style.dart';
import 'package:capybara_game/features/map/presentations/bloc/map_bloc.dart';
import 'package:capybara_game/features/map/presentations/widgets/config_map.dart';
import 'package:capybara_game/gen/assets.gen.dart';
import 'package:capybara_game/model/player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  void initState() {
    context.read<MapBloc>().add(const MapEvent.init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              scrollDirection: Axis.vertical,
              reverse: true,
              children: maps
                  .map((mapData) => _buildMapPage(context, mapData))
                  .toList()),
          const MapHeader(),
          const SettingButton(),
        ],
      ),
    );
  }

  Widget _buildMapPage(BuildContext context, MapData mapData) {
    return BlocBuilder<MapBloc, MapState>(builder: (context, state) {
      return Stack(
        children: [
          Image.asset(
            mapData.imagePath,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          for (int i = 0; i < state.dataLevels.length; i++)
            if (mapData.levels.contains(state.dataLevels[i].level))
              _buildLevelItem(context, state.dataLevels[i])
        ],
      );
    });
  }

  Widget _buildLevelItem(BuildContext context, PlayerModel levelModel) {
    final position = levelItemPosition(levelModel.level);
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        final bool isCompleted = levelModel.ratingStar != 0 ||
            (state.dataLevelUnlock.length + 1 == levelModel.level);
        return Positioned(
          bottom: position['bottom'],
          left: position['left'],
          child: GestureDetector(
            onTap: isCompleted
                ? () {
                    context
                        .read<MapBloc>()
                        .add(MapEvent.chooseLevel(levelModel.level));
                  }
                : null,
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 1; i <= levelModel.ratingStar; i++)
                        Container(
                          width: 40.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: levelModel.ratingStar != 0
                                    ? AppColor.c_04AFD6.withOpacity(0.7)
                                    : AppColor.c_000000.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            Assets.icons.png.star.path,
                          ),
                        ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: levelModel.ratingStar != 0
                                  ? AppColor.c_04AFD6.withOpacity(0.7)
                                  : AppColor.c_000000.withOpacity(0.7),
                              spreadRadius: 1,
                              blurRadius: 16.0,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          isCompleted
                              ? Assets.icons.png.levelIcon.path
                              : Assets.icons.png.levelLock.path,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        '${levelModel.level}',
                        style: AppStyle.kanit_bold_70,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
