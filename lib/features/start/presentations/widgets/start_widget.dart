import 'package:capybara_game/common/components/button/setting_button.dart';
import 'package:capybara_game/common/extensions/build_context_extension.dart';
import 'package:capybara_game/common/navigator/navigator.dart';
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
                child: GestureDetector(
                  onTap: () {
                    context.getNavigator().push(screen: const ScreenType.map());
                  },
                  child: Image.asset(
                    Assets.icons.png.startButton.path,
                    width: 287.76.w,
                  ),
                ),
              ),
              Positioned(
                bottom: 10.h,
                left: 10.w,
                child: const SettingButton(),
              ),
            ],
          ),
        );
      },
    );
  }
}
