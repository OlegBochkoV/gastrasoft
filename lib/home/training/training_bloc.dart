import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gastra_soft/domen/module_item.dart';

class TrainingState {
  ModuleData? moduleItem;
  String header;
  int currentPage;

  TrainingState({required this.moduleItem, required this.header, required this.currentPage});

  TrainingState copyWith(
    {ModuleData? moduleItem, 
    String? header, 
    int? currentPage}) {
      return TrainingState(
        moduleItem: moduleItem ?? this.moduleItem,
        header: header ?? this.header,
        currentPage: currentPage ?? this.currentPage);
      }
}

class TrainingBloc extends Cubit<TrainingState> {
  TrainingBloc() : super(TrainingState(moduleItem: null, header: 'Тренинг', currentPage: 0));

  void setPage(int value) => emit(state.copyWith(currentPage: value));

  void setHeader(String value) => emit(state.copyWith(header: value));
}
