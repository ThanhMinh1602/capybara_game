import 'package:capybara_game/common/components/hearder/header_item.dart';
import 'package:capybara_game/common/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapHeader extends StatelessWidget implements PreferredSizeWidget {
  const MapHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 177.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(45.0.r)),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColor.c_F2E39F, AppColor.c_C3E558],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderItem(
            title: 'FULL',
            heartValue: '10',
            onTapPlus: () {},
          ),
          SizedBox(
            width: 30.w,
          ),
          HeaderItem(
            title: '3200',
            onTapPlus: () {},
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 177.h);
}
