import 'package:capybara_game/common/constants/app_color.dart';
import 'package:capybara_game/features/start/presentations/bloc/start_bloc.dart';
import 'package:capybara_game/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartWidget extends StatefulWidget {
  const StartWidget({super.key});

  @override
  State<StartWidget> createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartBloc, StartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  Assets.images.bgr2.path,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 770.h,
                left: 216.w,
                right: 216.w,
                child: Image.asset(
                  Assets.icons.png.startButton.path,
                  width: 287.76.w,
                ),
              ),
              Positioned(
                bottom: 10.h,
                left: 10.w,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const CustomDialog();
                      },
                    );
                  },
                  child: Image.asset(
                    Assets.icons.png.settingIcon.path,
                    width: 70.w,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
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
                decoration: BoxDecoration(
                    color: AppColor.c_C4D3FF,
                    borderRadius: BorderRadius.circular(59.r),
                    border: Border.all(width: 16.0, color: AppColor.c_04AFD6)),
              ),
            ),
            Positioned(
              top: 0,
              left: 72.w,
              right: 91.w,
              child: Stack(
                children: [
                  Image.asset(Assets.images.cloudSetting.path),
                  Text('data')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
