import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_coordinadora/features/home/presentation/view_model/report_solution_view_model.dart';
import '../../../../core/domain/entities/guide_entity.dart';
import '../../../../core/utils/enums/status.dart';
import '../../domain/use_cases/home_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
   HomeBloc({
    required this.homeUseCase
  }) : super(const HomeState()) {
    on<SearchingEvent>(_onSearching);
    on<ReportSolutionEvent>(_onReportSolution);
  }

  final HomeUseCase homeUseCase;

  void _onSearching(SearchingEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(homeStatus: Status.loading));

    final result = await homeUseCase.getData(event.identification);

    result.fold(
      (error) => emit(
        state.copyWith(
          homeStatus: Status.error,
          message: error.message
        )
      ),
      (guideList) => emit(
        state.copyWith(
          homeStatus: Status.success,
          guideList: guideList
        )
      )
    );
  }

  void _onReportSolution(ReportSolutionEvent event, Emitter<HomeState> emit) async {
    final reportSolution = ReportSolutionViewModel.fromResult(
      identification: event.identification,
      solution: event.solution,
      guide: state.guideList[event.index]
    );

    final result = await homeUseCase.saveSolution(reportSolution);

    result.fold(
      (error) => emit(
        state.copyWith(
          homeStatus: Status.error,
          message: error.message
        )
      ),
      (isSaved) => emit(
        state.copyWith(
          homeStatus: Status.success
        )
      )
    );
  }
}