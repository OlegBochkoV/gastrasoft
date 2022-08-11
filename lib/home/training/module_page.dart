import 'package:flutter/material.dart';
import 'package:gastra_soft/domen/module_item.dart';
import 'package:gastra_soft/home/training/training_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModulePage extends StatelessWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ModuleData> moduleItem = [
      ModuleData(index: 1, icon: 'assets/images/module1.png'),
      ModuleData(index: 2, icon: 'assets/images/module2.png'),
      ModuleData(index: 3, icon: 'assets/images/module3.png'),
      ModuleData(index: 4, icon: 'assets/images/module4.png'),
      ModuleData(index: 5, icon: 'assets/images/module5.png'),
      ModuleData(index: 6, icon: 'assets/images/module6.png'),
      ModuleData(index: 7, icon: 'assets/images/module7.png'),
      ModuleData(index: 8, icon: 'assets/images/module8.png'),
    ];
    
    return body(moduleItem, context);
  }

  Widget body(List<ModuleData> moduleItem, BuildContext context) {
    return GridView.count(
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      children: moduleItem.map((e) => item(e, context)).toList(),
    );
  }

  Widget item(ModuleData moduleItem, BuildContext context) {
    TextStyle style1 = TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp);
    TextStyle style2 = TextStyle(fontWeight: FontWeight.w300, fontSize: 18.sp);

    return Padding(
      padding: EdgeInsets.only(top: 2.w, left: 2.w, right: 2.w),
      child: InkWell(
        onTap: () => context.read<TrainingBloc>()..setPage(1)..setHeader('Модуль ${moduleItem.index}'),
        child: SizedBox(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(moduleItem.icon),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6.w, left: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('МОДУЛЬ', style: style1),
                    Text('${moduleItem.index}', style: style2)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
