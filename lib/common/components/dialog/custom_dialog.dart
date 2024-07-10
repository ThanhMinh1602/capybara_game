import 'package:capybara_game/common/components/shadow_text.dart';
import 'package:capybara_game/common/constants/app_color.dart';
import 'package:capybara_game/common/constants/app_style.dart';
import 'package:capybara_game/common/extensions/build_context_extension.dart';
import 'package:capybara_game/features/app/presentations/bloc/app_bloc.dart';
import 'package:capybara_game/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SizedBox(
            width: 605.w,
            height: 914.h,
            child: Stack(
              children: [
                Positioned(
                  top: 75.h,
                  bottom: 50.h,
                  left: 14.w,
                  right: 25.w,
                  child: Container(
                    padding: EdgeInsets.only(top: 70.0.h),
                    decoration: BoxDecoration(
                        color: AppColor.c_C4D3FF,
                        borderRadius: BorderRadius.circular(59.r),
                        border:
                            Border.all(width: 16.0, color: AppColor.c_04AFD6)),
                    child: Column(
                      children: [
                        child,
                        const Spacer(),
                        Image.asset(
                          Assets.images.cloudSettingBottom.path,
                          width: double.infinity,
                        )
                      ],
                    ),
                  ),
                ),
                _buildCloudTitle(),
                if (state.option != 0)
                  Positioned(
                    left: 8.w,
                    top: 58.h,
                    child: GestureDetector(
                        onTap: () {
                          context
                              .read<AppBloc>()
                              .add(const AppEvent.chooseOptionSetting(0));
                        },
                        child: Image.asset(Assets.icons.png.backIcon.path,
                            width: 77.0.w)),
                  ),
                Positioned(
                  right: 8.w,
                  top: 58.h,
                  child: GestureDetector(
                      onTap: () {
                        context.getNavigator().pop();
                        context
                            .read<AppBloc>()
                            .add(const AppEvent.chooseOptionSetting(0));
                      },
                      child: Image.asset(Assets.icons.png.closeIcon.path,
                          width: 77.0.w)),
                ),
                Positioned(
                  bottom: 0,
                  left: 5.w,
                  child: Image.asset(
                    Assets.images.capybaraSetting.path,
                    width: 253.w,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildCloudTitle() {
    return Positioned(
      top: 0,
      left: 72.w,
      right: 91.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(Assets.images.cloudSetting.path),
          ShadowText(
            'Cài đặt',
            style: AppStyle.dialogTitle,
          )
        ],
      ),
    );
  }
}
