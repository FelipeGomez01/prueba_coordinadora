part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class DeployMapEvent extends DetailEvent {
  const DeployMapEvent({
    required this.isCoordinate
  });

  final bool isCoordinate;

  @override
  List<Object> get props => [];
}