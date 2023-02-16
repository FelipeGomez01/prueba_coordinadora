import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_coordinadora/features/detail/presentation/bloc/detail_bloc.dart';
import '../../features/home/di/home_di.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';

class BlocsDI {
  static get instance => [
    BlocProvider(
      create: (_) => HomeBloc(homeUseCase: homeDI.homeUseCase)
    ),
    BlocProvider(
      create: (_) => DetailBloc()
    )
  ];
}