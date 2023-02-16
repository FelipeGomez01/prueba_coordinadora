part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.homeStatus = Status.loading,
    this.message = '',
    this.guideList = const []
  });

  final Status homeStatus;
  final String message;
  final List<GuideEntity> guideList;

  HomeState copyWith({
    Status? homeStatus,
    String? message,
    List<GuideEntity>? guideList,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      message: message ?? this.message,
      guideList: guideList ?? this.guideList
    );
  }

  @override
  List<Object?> get props => [
    homeStatus,
    message,
    guideList
  ];
}