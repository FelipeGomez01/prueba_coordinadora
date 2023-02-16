part of 'detail_bloc.dart';

class DetailState extends Equatable {
  const DetailState({
    this.guideEntity
  });

  final GuideEntity? guideEntity;

  DetailState copyWith({
    GuideEntity? guideEntity
  }) {
    return DetailState(guideEntity: guideEntity ?? this.guideEntity);
  }

  @override
  List<Object?> get props => [
    guideEntity
  ];
}