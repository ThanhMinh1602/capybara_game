import 'package:capybara_game/common/components/button/setting_button.dart';
import 'package:capybara_game/common/components/dialog/app_dialog.dart';
import 'package:capybara_game/common/constants/app_color.dart';
import 'package:capybara_game/common/constants/app_style.dart';
import 'package:capybara_game/common/extensions/build_context_extension.dart';
import 'package:capybara_game/features/player/presentations/bloc/player_bloc.dart';
import 'package:capybara_game/gen/assets.gen.dart';
import 'package:capybara_game/model/card_model.dart';
import 'package:capybara_game/model/grid_config_model.dart';
import 'package:capybara_game/model/player_model.dart';
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

  void onTapRetry() {
    context.read<PlayerBloc>().add(PlayerEvent.onTapRetry(
        PlayerModel(level: widget.level, ratingStar: 0, tries: 0)));
  }

  void onTapMenu() {
    context.read<PlayerBloc>().add(const PlayerEvent.onTapMenu());
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
            onTapMenu: onTapMenu,
            onTapRetry: onTapRetry,
            onTapNext: () {
              context.read<PlayerBloc>().add(
                    PlayerEvent.onTapNext(
                      PlayerModel(
                        level: widget.level,
                        ratingStar: state.ratingStar,
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
            const SettingButton()
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
          _buildGridCard(level, config, datas, state)
        ],
      );
    });
  }

  Widget _buildGridCard(int level, GridConfigModel config,
      List<CardModel> datas, PlayerState state) {
    return Expanded(
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
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 20.h,
        ),
        itemCount: datas.length,
        itemBuilder: (context, index) {
          CardModel card = datas[index];
          if (card.isMatched) {
            return const SizedBox.shrink();
          }
          return _buildCardItem(context, card, state, level, datas, index);
        },
      ),
    );
  }

  Widget _buildCardItem(BuildContext context, CardModel card, PlayerState state,
      int level, List<CardModel> datas, int index) {
    return GestureDetector(
      onTap: () {
        context
            .read<PlayerBloc>()
            .add(PlayerEvent.tapCard(card, state.tries, level));
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            AppColor.boxShadow,
          ],
          color: AppColor.c_C6E4FE.withOpacity(0.8),
          borderRadius: BorderRadius.circular(35.r),
        ),
        child: Align(
          alignment: Alignment.center,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return card.isFlipped
                  ? Image.asset(
                      card.identifier,
                    )
                  : Image.asset(
                      Assets.icons.png.questionMark.path,
                      width: constraints.maxWidth * 0.3,
                      fit: BoxFit.scaleDown,
                    );
            },
          ),
        ),
      ),
    );
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
          GestureDetector(
            onTap: () {
              AppDialog.pauseDialog(
                context,
                onTapBackHome: onTapMenu,
                onTapContinute: () {
                  context.getNavigator().pop();
                },
                onTapRetry: onTapRetry,
              );
            },
            child: Image.asset(
              Assets.icons.png.pauseIcon.path,
              width: 77.w,
              height: 77.w,
            ),
          ),
        ],
      ),
    );
  }
}
