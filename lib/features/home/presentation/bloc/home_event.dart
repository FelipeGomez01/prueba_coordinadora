part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SearchingEvent extends HomeEvent {
  const SearchingEvent({
    required this.identification
  });

  final String identification;

  @override
  List<Object> get props => [];
}

class ReportSolutionEvent extends HomeEvent {
  const ReportSolutionEvent({
    required this.index,
    required this.identification,
    required this.solution
  });

  final int index;
  final String identification;
  final String solution;

  @override
  List<Object> get props => [];
}