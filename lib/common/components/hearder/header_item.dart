import 'package:capybara_game/common/constants/app_color.dart';
import 'package:capybara_game/common/constants/app_style.dart';
import 'package:capybara_game/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderItem extends StatelessWidget {
  const HeaderItem(
      {super.key, required this.title, this.heartValue, this.onTapPlus});
  final String title;
  final String? heartValue;
  final void Function()? onTapPlus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325.w,
      height: 118.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 198.w,
                height: 68.h,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 59.w),
                padding: EdgeInsets.only(left: 35.w),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: const Offset(0, 4),
                      color: AppColor.c_000000.withOpacity(0.25),
                    )
                  ],
                  borderRadius: BorderRadius.circular(34.r),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.19, 0.88],
                    colors: [AppColor.c_C3D3FF, AppColor.c_04AFD6],
                  ),
                ),
                child: Text(
                  title,
                  style: AppStyle.kanit_bold_41,
                ),
              ),
              SizedBox(width: 3.w),
              GestureDetector(
                  onTap: onTapPlus,
                  child: Image.asset(Assets.icons.png.circlePlusIcon.path,
                      width: 65.w)),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            child: heartValue != null
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        Assets.icons.png.heart.path,
                        width: 118.w,
                        height: 118.h,
                      ),
                      Text(
                        heartValue ?? '',
                        style: AppStyle.kanit_bold_41
                            .copyWith(color: AppColor.c_ffffff),
                      ),
                    ],
                  )
                : Image.asset(
                    Assets.icons.png.gold.path,
                    width: 118.w,
                    height: 118.h,
                  ),
          ),
        ],
      ),
    );
  }
}
