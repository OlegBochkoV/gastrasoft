import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gastra_soft/config/app_theme.dart';
import 'package:gastra_soft/home/training/lesson_page.dart';
import 'package:gastra_soft/home/training/module_page.dart';
import 'package:gastra_soft/home/training/training_bloc.dart';
import 'package:sizer/sizer.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({Key? key}) : super(key: key);

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> with TickerProviderStateMixin {
  final TrainingBloc _trainingBloc = TrainingBloc();
  late TabController _controller;
  static const List<Widget> _pages = [
    ModulePage(),
    LessonPage()
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _trainingBloc),
      ],
      child: BlocBuilder<TrainingBloc, TrainingState>(
        builder: (context, state) {
          _controller.index = state.currentPage;
          return Container(
            color: AppColors.white,
            child: Column(
              children: [
                appBar(state),
                body()
              ],
            ),
          );
        }
      ),
    );
  }

  Widget appBar(TrainingState state) {
    TextStyle style1 = TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp);

    return Column(
      children: [
        SizedBox(height: 7.h),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(height: 4.h),
            Text(state.header, style: style1),
            Row(
              children: [
                SizedBox(width: 5.w),
                state.currentPage > 0
                ? InkWell(
                  onTap: () => _trainingBloc..setPage(0)..setHeader('Тренинг'),
                  child: const Icon(Icons.keyboard_backspace, size: 25))
                : const SizedBox()
              ],
            )
          ],
        ),
        SizedBox(height: 1.h),
        Container(height: 0.5.w, color: Colors.grey)
      ],
    );
  }

  Widget body() {
    return Expanded(
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: _pages),
    );
  }
}
