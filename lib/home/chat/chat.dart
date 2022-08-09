import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gastra_soft/config/app_theme.dart';
import 'package:gastra_soft/domen/chat_item.dart';
import 'package:sizer/sizer.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChatData> chatData = [
      ChatData(title: 'Начальная группа', members: 560),
      ChatData(title: 'Второй поток', members: 32)
    ];

    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          appBar(),
          body(chatData)
        ],
      ),
    );
  }

  Widget appBar() {
    TextStyle style1 = TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp);

    return Column(
      children: [
        SizedBox(height: 7.h),
        SizedBox(
          width: 100.w,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Text('Общение', style: style1),
              Positioned(right: 5.w, child: SvgPicture.asset('assets/icons/menu.svg'))
            ],
          ),
        ),
        SizedBox(height: 3.h),
        Container(height: 0.5.w, color: Colors.grey)
      ],
    );
  }

  Widget body(List<ChatData> chatData) {
    TextStyle style1 = TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp);

    return Column(
      children: [
        SizedBox(height: 3.h),
        Text('Вы состоите в 2ух группах', style: style1),
        Column(children: chatData.map((e) => itemChat(e)).toList())
      ],
    );
  }

  Widget itemChat(ChatData chatData) {
    TextStyle style1 = TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp);
    TextStyle style2 = TextStyle(fontWeight: FontWeight.w700, fontSize: 11.sp, color: AppColors.lighGreen);
    TextStyle style3 = TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp);

    return Padding(
      padding: EdgeInsets.only(top: 3.h),
      child: Container(
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
                  Text(chatData.title, style: style1),
                  SizedBox(width: 4.w),
                  Text('${chatData.members}', style: style2)
                ],
              ),
              SizedBox(height: 2.h),
              Row(children: [SizedBox(width: 5.w), Text('Перейти в чат', style: style3)],)
            ],
          ),
        ),
      ),
    );
  }
}
