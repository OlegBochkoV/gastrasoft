import 'package:flutter/material.dart';
import 'package:gastra_soft/domen/lesson_item.dart';
import 'package:sizer/sizer.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<LessonData> lessonItem = [
      LessonData(index: 1, icon: 'assets/images/module1.png', description: 'Описание'),
      LessonData(index: 2, icon: 'assets/images/module2.png', description: 'Описание'),
      LessonData(index: 3, icon: 'assets/images/module3.png', description: 'Описание'),
      LessonData(index: 4, icon: 'assets/images/module4.png', description: 'Описание'),
      LessonData(index: 5, icon: 'assets/images/module5.png', description: 'Описание'),
      LessonData(index: 6, icon: 'assets/images/module6.png', description: 'Описание'),
      LessonData(index: 7, icon: 'assets/images/module7.png', description: 'Описание'),
      LessonData(index: 8, icon: 'assets/images/module8.png', description: 'Описание'),
    ];
    
    return body(lessonItem);
  }

  Widget body(List<LessonData> lessonItem) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: lessonItem.length,
      itemBuilder: ((context, index) {
        return item(lessonItem[index]);
    }));
  }

  Widget item(LessonData lessonItem) {
    TextStyle style1 = TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp);
    TextStyle style2 = TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp);

    return Padding(
      padding: EdgeInsets.only(top: 2.w, left: 2.w, right: 2.w),
      child: SizedBox(
        height: 25.h,
        width: 90.w,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(lessonItem.icon),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6.w, left: 4.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Урок ${lessonItem.index}', style: style1),
                  Text(lessonItem.description, style: style2)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
