import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gastra_soft/config/app_theme.dart';
import 'package:gastra_soft/domen/news_item.dart';
import 'package:sizer/sizer.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<NewsData> newsItem = [
      NewsData(title: 'Лекция 1', description: 'Описание главы 1'),
      NewsData(title: 'Лекция 2', description: 'Описание главы 2'),
      NewsData(title: 'Лекция 3', description: 'Описание главы 3')
    ];

    return Column(
      children: [
        header(),
        news(newsItem),
        group(),
        // calendar()
      ],
    );
  }

  Widget header() {
    TextStyle style1 = TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp);
    TextStyle style2 = TextStyle(fontWeight: FontWeight.w900, fontSize: 9.sp, color: AppColors.white);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 12.w,
                width: 42.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.w),
                  color: AppColors.white
                ),
              ),
              Container(
                height: 10.5.w,
                width: 40.5.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.w),
                  color: AppColors.lighBrown
                ),
              ),
              SizedBox(
                width: 40.w, 
                child: Row(
                  children: [
                    SizedBox(width: 1.w),
                    SvgPicture.asset('assets/icons/photo_preview.svg', height: 8.w),
                    SizedBox(width: 1.w),
                    Text('Юлия Бойкова', style: style1)
                  ],
                )
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 10.w,
            width: 10.w,
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                SvgPicture.asset('assets/icons/notification.svg', height: 5.w),
                Positioned(
                  top: 0,
                  right: 1.w,
                  child: Container(
                    height: 4.w,
                    width: 4.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.w),
                      color: AppColors.lighGreen
                    ),
                    child: Center(child: Text('3', style: style2)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget news(List<NewsData> newsItem) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(children: newsItem.map((e) => itemNews(e)).toList())
    );
  }

  Widget itemNews(NewsData newsItem) {
    return Row(
      children: [
        SizedBox(width: 7.5.w),
        Container(
          width: 70.w,
          height: 18.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
            color: AppColors.white
          ),
          child: Column(
            children: [
              SizedBox(height: 4.h),
              Text(newsItem.title),
              SizedBox(height: 2.h),
              Text(newsItem.description)
            ],
          ),
        )
      ],
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
}
