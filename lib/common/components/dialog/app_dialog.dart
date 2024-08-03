import 'package:capybara_game/common/components/dialog/custom_dialog.dart';
import 'package:capybara_game/common/constants/app_color.dart';
import 'package:capybara_game/common/constants/app_style.dart';
import 'package:capybara_game/features/app/presentations/bloc/app_bloc.dart';
import 'package:capybara_game/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDialog {
  static Future<void> settingDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return CustomDialog(
              title: 'Cài đặt',
              child: IndexedStack(
                index: state.option,
                children: [
                  _MainSettingContent(context),
                  _InstructContent(),
                  _VolumeContent(),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static Future<void> successDialog(
    BuildContext context, {
    required String level,
    required String tries,
    required String oldTries,
    required int ratingStar,
    void Function()? onTapMenu,
    void Function()? onTapRetry,
    void Function()? onTapNext,
  }) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return CustomDialog(
                title: 'Level $level',
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < ratingStar; i++)
                          Image.asset(
                            Assets.icons.png.playerStar.path,
                            width: 91.w,
                            height: 91.h,
                          ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'ĐÃ MỞ',
                      style: AppStyle.kanit_regular_34.copyWith(
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic),
                    ),
                    Container(
                      width: 267.w,
                      height: 60.h,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
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
                      child: Text(tries,
                          style: AppStyle.kanit_medium_38.copyWith(
                              fontSize: 40.sp, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 30.h),
                    Image.asset(Assets.icons.png.crownIconYl.path, width: 77.w),
                    SizedBox(height: 5.h),
                    Container(
                      width: 192.w,
                      height: 60.h,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
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
                      child: Text(oldTries,
                          style: AppStyle.kanit_medium_38.copyWith(
                              fontSize: 40.sp, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 90.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildButtonSuccess(
                            icon: Icons.menu, title: 'MENU', onTap: onTapMenu),
                        _buildButtonSuccess(
                            icon: Icons.restart_alt_outlined,
                            title: 'RETRY',
                            onTap: onTapRetry),
                        _buildButtonSuccess(
                            icon: Icons.arrow_circle_right_outlined,
                            title: 'NEXT',
                            onTap: onTapNext),
                      ],
                    )
                  ],
                ));
          },
        );
      },
    );
  }

  static Future<void> pauseDialog(
    BuildContext context, {
    void Function()? onTapBackHome,
    void Function()? onTapRetry,
    void Function()? onTapContinute,
  }) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return CustomDialog(
                title: 'PAUSE',
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildButtonSuccess(
                            icon: Icons.play_arrow,
                            title: 'CONTINUTE',
                            onTap: onTapContinute),
                        _buildButtonSuccess(
                            icon: Icons.home,
                            title: 'HOME',
                            onTap: onTapBackHome),
                        _buildButtonSuccess(
                            icon: Icons.restart_alt_outlined,
                            title: 'RETRY',
                            onTap: onTapRetry),
                      ],
                    ),
                  ],
                ));
          },
        );
      },
    );
  }

  static Widget _buildButtonSuccess(
      {required IconData icon, required String title, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 84.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0.r),
          border: Border.all(
            color: AppColor.c_003B81,
            width: 2,
          ),
          gradient: const RadialGradient(
            stops: [58 / 100, 1],
            colors: [AppColor.c_EFF2F6, AppColor.c_C3D3FF],
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 45.w,
              color: AppColor.c_003B81,
            ),
            Text(
              title,
              style: AppStyle.kanit_semibold_19,
            )
          ],
        ),
      ),
    );
  }
}

class _VolumeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          return _SliderVolume(
            title: 'Music',
            value: state.bgmVolume,
            onChanged: (value) {
              context.read<AppBloc>().add(AppEvent.changeBgmVolume(value));
            },
          );
        }),
        BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          return _SliderVolume(
            title: 'Sound',
            value: state.effectsVolume,
            onChanged: (value) {
              context.read<AppBloc>().add(AppEvent.changeEffectsVolume(value));
            },
          );
        })
      ],
    );
  }
}

// ignore: unused_element
class _SliderVolume extends StatelessWidget {
  final String title;
  final double value;

  final void Function(double)? onChanged;
  const _SliderVolume(
      {required this.title, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w),
      child: Column(
        children: [
          Divider(color: AppColor.c_003B81, endIndent: 60.w, indent: 60.w),
          SizedBox(height: 15.0.h),
          Text(title, style: AppStyle.settingListTitle),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text('${(value * 100).toInt()}%',
                  style: AppStyle.kanit_regular_34),
            ),
          ),
          Slider(
            value: value,
            min: 0.1,
            max: 1.0,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class _InstructContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hướng dẫn', style: AppStyle.settingListTitle),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 47.0.w).copyWith(top: 26.0.h),
          child: Text(
            textAlign: TextAlign.center,
            'Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text',
            style: AppStyle.kanit_regular_34,
          ),
        ),
      ],
    );
  }
}

class _MainSettingContent extends StatelessWidget {
  final BuildContext context;

  const _MainSettingContent(this.context);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return GestureDetector(
                    onTap: () {
                      context
                          .read<AppBloc>()
                          .add(AppEvent.stateMusic(state.isPlayMusic));
                    },
                    child: Image.asset(
                        state.isPlayMusic
                            ? Assets.icons.png.musicIcon.path
                            : Assets.icons.png.musicOffIcon.path,
                        width: 77.w));
              },
            ),
            SizedBox(width: 35.0.w),
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return GestureDetector(
                    onTap: () {
                      context
                          .read<AppBloc>()
                          .add(AppEvent.stateSound(state.isPlaySound));
                    },
                    child: Image.asset(
                        state.isPlaySound
                            ? Assets.icons.png.speakerIcon.path
                            : Assets.icons.png.speakerOffIcon.path,
                        width: 77.w));
              },
            ),
          ],
        ),
        SizedBox(height: 16.0.h),
        Image.asset(Assets.images.functionAccount.path, width: 371.w),
        SizedBox(height: 38.0.h),
        _ItemSetting(
          icon: Assets.icons.png.instructIcon.path,
          title: 'Hướng dẫn',
          onTap: () {
            context.read<AppBloc>().add(const AppEvent.chooseOptionSetting(1));
          },
        ),
        SizedBox(height: 26.0.h),
        _ItemSetting(
          icon: Assets.icons.png.volumeIcon.path,
          title: 'Âm lượng',
          onTap: () {
            context.read<AppBloc>().add(const AppEvent.chooseOptionSetting(2));
          },
        ),
      ],
    );
  }
}

class _ItemSetting extends StatelessWidget {
  final String icon;
  final String title;
  final void Function()? onTap;

  const _ItemSetting({required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(icon, width: 55.w),
            SizedBox(width: 18.0.w),
            Text(title, style: AppStyle.settingListTitle),
            const Spacer(),
            Image.asset(Assets.icons.png.nextIcon.path, height: 22.0.h),
          ],
        ),
      ),
    );
  }
}
