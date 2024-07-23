import 'package:capybara_game/common/components/hearder/header_item.dart';
import 'package:capybara_game/common/constants/app_color.dart';
import 'package:capybara_game/services/shared_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapHeader extends StatefulWidget {
  const MapHeader({
    super.key,
  });

  @override
  State<MapHeader> createState() => _MapHeaderState();
}

class _MapHeaderState extends State<MapHeader> {
  int totalPoint = 0;
  @override
  void initState() async {
    totalPoint = await getTotalPoint();
    super.initState();
  }

  Future<int> getTotalPoint() async {
    int point = SharedPrefService().getPoint() ?? 0;
    return point;
  }

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
}
