import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_coordinadora/core/domain/entities/guide_entity.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(const DetailState()) {
    on<DeployMapEvent>(_onDeployMap);
  }

  void _onDeployMap(DeployMapEvent event, Emitter<DetailState> emit) async {

  }
}