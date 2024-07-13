import 'package:capybara_game/common/components/dialog/app_dialog.dart';
import 'package:capybara_game/common/constants/app_color.dart';
import 'package:capybara_game/common/constants/app_style.dart';
import 'package:capybara_game/features/player/presentations/bloc/player_bloc.dart';
import 'package:capybara_game/gen/assets.gen.dart';
import 'package:capybara_game/model/card_model.dart';
import 'package:capybara_game/model/level_model.dart';
import 'package:capybara_game/services/player_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerWidget extends StatefulWidget {
  final int level;
  const PlayerWidget({super.key, required this.level});

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  void initState() {
    context.read<PlayerBloc>().add(PlayerEvent.init(widget.level));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlayerBloc, PlayerState>(
      listener: (context, state) {
        if (state.isSuccess) {
          AppDialog.successDialog(
            context,
            level: widget.level.toString(),
            oldTries: state.oldTries == 0 || state.oldTries > state.tries
                ? state.tries.toString()
                : state.oldTries.toString(),
            tries: state.tries.toString(),
            ratingStar: state.ratingStar,
            onTapMenu: () {},
            onTapRetry: () {
              context.read<PlayerBloc>().add(PlayerEvent.onTapRetry(
                  LevelModel(level: widget.level, ratingStar: 0, tries: 0)));
            },
            onTapNext: () {
              context.read<PlayerBloc>().add(
                    PlayerEvent.onTapNext(
                      LevelModel(
                        level: widget.level,
                        ratingStar: 3,
                        tries: state.tries,
                      ),
                    ),
                  );
            },
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildPlayerBgr(),
            _buildPlayerBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerBgr() {
    return Image.asset(
      Assets.images.bgrPlayer.path,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _buildPlayerBody() {
    return BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
      final datas = state.dataCard;
      final level = widget.level;
      final config = PlayerService().getGridConfigModel(level);
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 279.h,
            decoration: BoxDecoration(
              boxShadow: [AppColor.boxShadow],
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(45.r)),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.29, 0.71, 1],
                colors: [
                  AppColor.c_ffffff,
                  AppColor.c_70C0D4,
                  AppColor.c_269DB7
                ],
              ),
            ),
            child: Stack(
              children: [
                _buildCloudTop(),
                _buildContainerLevel(),
                _buildBottomHeader(
                    ratingStar: state.ratingStar,
                    tries: state.tries,
                    score: state.oldTries),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: level == 1
                      ? 350.h
                      : level == 2
                          ? 230.h
                          : 120.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: level == 1 ? 2 : config.gridSize,
              ),
              itemCount: datas.length,
              itemBuilder: (context, index) {
                CardModel card = datas[index];
                if (card.isMatched) {
                  return const SizedBox.shrink();
                }
                return GestureDetector(
                  onTap: () {
                    context
                        .read<PlayerBloc>()
                        .add(PlayerEvent.tapCard(card, state.tries, level));
                  },
                  child: Card(
                    color: AppColor.c_70C0D4,
                    child: card.isFlipped
                        ? Image.asset(datas[index].identifier)
                        : Image.asset(
                            Assets.icons.png.questionMark.path,
                            width: 20.w,
                          ),
                  ),
                );
              },
            ),
          )
        ],
      );
    });
  }

  Widget _buildBottomHeader({
    required int ratingStar,
    int? tries,
    int? score,
  }) {
    return Positioned(
      bottom: 20.h,
      left: 28.w,
      right: 28.w,
      child: Row(
        children: [
          _buildPointItem(
            iconPath: Assets.icons.png.helpNumber.path,
            point: tries,
          ),
          const Spacer(),
          for (int i = 0; i < ratingStar; i++)
            Image.asset(
              Assets.icons.png.playerStar.path,
              width: 64.w,
              height: 64.h,
            ),
          const Spacer(),
          _buildPointItem(
            iconPath: Assets.icons.png.crownIcon.path,
            point: score,
          ),
        ],
      ),
    );
  }

  Widget _buildPointItem({int? point, required String iconPath}) {
    return Container(
      width: 192.w,
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [AppColor.boxShadow],
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.19, 0.88],
          colors: [
            AppColor.c_C6F0B7,
            AppColor.c_BBE37B,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(iconPath),
          Text(point.toString(), style: AppStyle.kanit_medium_38),
        ],
      ),
    );
  }

  Widget _buildCloudTop() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Image.asset(Assets.images.cloudHeader.path),
    );
  }

  Widget _buildContainerLevel() {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 28.w,
      right: 28.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Assets.icons.png.helpIcon.path,
            width: 77.w,
            height: 77.w,
          ),
          Container(
            width: 314.w,
            height: 88.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: AppColor.c_F9EBC8,
            ),
            child: Text(
              'LEVEL ${widget.level}',
              style: AppStyle.kanit_bold_61,
            ),
          ),
          Image.asset(
            Assets.icons.png.pauseIcon.path,
            width: 77.w,
            height: 77.w,
          ),
        ],
      ),
    );
  }
}
