import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gastra_soft/config/app_theme.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(),
        group(),
        myProgress(),
        bottomInfo()
      ],
    );
  }

  Widget header() {
    TextStyle style1 = TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp);
    TextStyle style2 = TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp);
    TextStyle style3 = TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp);

    return Column(
      children: [
        SizedBox(height: 7.h),
        Text('Профиль', style: style1),
        SizedBox(height: 3.h),
        photo(),
        SizedBox(height: 1.h),
        Text('Юлия Бойкова', style: style3),
        SizedBox(height: 1.h),
        Row(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Text('mail@siignores.com', style: style2),
            SizedBox(width: 2.w),
            SvgPicture.asset('assets/icons/pencil.svg', height: 4.w)
          ],
        )
      ],
    );
  }

  Widget photo() {
    return SizedBox(
      height: 25.w,
      width: 35.w,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 25.w,
            width: 25.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100.w),
            )
          ),
          SvgPicture.asset('assets/icons/photo_preview.svg', height: 23.w, width: 23.w),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset('assets/icons/verified.svg', height: 6.w, width: 6.w),
          ),
          Positioned(
            top: 15.w,
            right: 2.w,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 9.w,
                  width: 9.w,
                  decoration: BoxDecoration(
                    color: AppColors.lighBrown,
                    borderRadius: BorderRadius.circular(100.w),
                  ),
                ),
                Container(
                  height: 7.w,
                  width: 7.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(100.w),
                  ),
                ),
                SvgPicture.asset('assets/icons/camera.svg', height: 3.5.w, width: 3.5.w)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget group() {
    TextStyle style1 = TextStyle(fontWeight: FontWeight.w700, fontSize: 21.sp);
    TextStyle style2 = TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp);
    TextStyle style3 = TextStyle(fontWeight: FontWeight.w700, fontSize: 11.sp, color: AppColors.lighGreen);
    TextStyle style4 = TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 2.h),
        Text('Группа', style: style1),
        SizedBox(height: 2.h),
        Container(
          height: 13.h,
          width: 85.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5.w),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/group.svg', height: 4.w, width: 4.w),
                    SizedBox(width: 2.w),
                    Text('Начальная группа', style: style2),
                    SizedBox(width: 4.w),
                    Text('560', style: style3)
                  ],
                ),
                SizedBox(height: 2.h),
                Text('Перейти в чат', style: style4)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget myProgress() {
    TextStyle style1 = TextStyle(fontWeight: FontWeight.w700, fontSize: 21.sp);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4.h),
        Text('Мой прогресс', style: style1),
        SizedBox(height: 2.h),
        Container(
          height: 13.h,
          width: 85.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
            color: AppColors.white
          ),
        ),
      ],
    );
  }

  Widget bottomInfo() {
    TextStyle style1 = TextStyle(decoration: TextDecoration.underline, fontSize: 10.sp);

    return Column(
      children: [
        SizedBox(height: 2.h),
        Text('Политика конфиденциальности', style: style1),
        SizedBox(height: 2.h),
        SvgPicture.asset('assets/icons/logo.svg', width: 30.w)
      ],
    );
  }
}
