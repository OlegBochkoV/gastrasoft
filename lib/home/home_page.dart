import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gastra_soft/home/chat/chat.dart';
import 'package:gastra_soft/home/main_page/main_page.dart';
import 'package:gastra_soft/home/profile/profile.dart';
import 'package:gastra_soft/home/training/training.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {

  late TabController _controller;
  final List<Widget> pages = [
    const MainPage(),
    const TrainingPage(),
    const ChatPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      bottomNavigationBar: bottomPageBar(),
    );
  }

  Widget body() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Positioned(
          top: -5.h,
          child: SvgPicture.asset('assets/icons/background_elipse.svg', height: 55.h, fit: BoxFit.fill)),
        TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          children: pages,
        ),
      ],
    );
  }

  Widget bottomPageBar() {
    double heightIcon = 5.5.w;
    TextStyle style = TextStyle(fontWeight: FontWeight.w400, fontSize: 9.sp);
    double opacitySelect = 1;
    double opacityUnSelect = 0.7;

    return SizedBox(
      height: 9.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Row(
          children: [
            InkWell(
              onTap: () => setState(() {_controller.index = 0;}),
              overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
              child: SizedBox(
                width: 24.w,
                child: Column(
                  children: [
                    SizedBox(height: 1.h),
                    _controller.index == 0
                      ? SvgPicture.asset( 'assets/icons/main_on.svg', height: heightIcon, fit: BoxFit.cover)
                      : SvgPicture.asset( 'assets/icons/main_off.svg', height: heightIcon, fit: BoxFit.cover),
                    SizedBox(height: 0.5.h),
                    Opacity(
                      opacity: _controller.index == 0 ? opacitySelect : opacityUnSelect,
                      child: Text('Главная', style: style))
                  ],),
              ),
            ),
            InkWell(
              onTap: () => setState(() {_controller.index = 1;}),
              overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
              child: SizedBox(
                width: 24.w,
                child: Column(
                  children: [
                    SizedBox(height: 1.h),
                    _controller.index == 1
                      ? SvgPicture.asset('assets/icons/training_on.svg', height: heightIcon, fit: BoxFit.cover)
                      : SvgPicture.asset('assets/icons/training_off.svg', height: heightIcon, fit: BoxFit.cover),
                    SizedBox(height: 0.5.h),
                    Opacity(
                      opacity: _controller.index == 1 ? opacitySelect : opacityUnSelect,
                      child: Text('Тренинг', style: style))
                  ],),
              ),
            ),
            InkWell(
              onTap: () => setState(() {_controller.index = 2;}),
              overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
              child: SizedBox(
                width: 24.w,
                child: Column(
                  children: [
                    SizedBox(height: 1.h),
                    _controller.index == 2
                      ? SvgPicture.asset('assets/icons/chat_on.svg', height: heightIcon, fit: BoxFit.cover)
                      : SvgPicture.asset('assets/icons/chat_off.svg', height: heightIcon, fit: BoxFit.cover),
                    SizedBox(height: 0.5.h),
                    Opacity(
                      opacity: _controller.index == 2 ? opacitySelect : opacityUnSelect,
                      child: Text('Общение', style: style))
                  ],),
              ),
            ),
            InkWell(
              onTap: () => setState(() {_controller.index = 3;}),
              overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
              child: SizedBox(
                width: 24.w,
                child: Column(
                  children: [
                    SizedBox(height: 1.h),
                    _controller.index == 3
                      ? SvgPicture.asset('assets/icons/profile_on.svg', height: heightIcon, fit: BoxFit.cover)
                      : SvgPicture.asset('assets/icons/profile_off.svg', height: heightIcon, fit: BoxFit.cover),
                    SizedBox(height: 0.5.h),
                    Opacity(
                      opacity: _controller.index == 3 ? opacitySelect : opacityUnSelect,
                      child: Text('Профиль', style: style))
                  ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
