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
        // group(),
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
        SizedBox(width: 5.w),
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
}
