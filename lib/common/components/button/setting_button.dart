import 'package:capybara_game/common/components/dialog/setting_dialog.dart';
import 'package:capybara_game/gen/assets.gen.dart';
import 'package:capybara_game/services/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppSettingDialog.settingDialog(context);
        // AudioManager().soundTap();
      },
      child: Image.asset(
        Assets.icons.png.settingIcon.path,
        width: 70.w,
      ),
    );
  }
}
