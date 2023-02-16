import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:prueba_coordinadora/core/domain/entities/guide_entity.dart';
import 'package:prueba_coordinadora/features/home/domain/entities/report_solution_entity.dart';
import '../../../../core/utils/failure.dart';
import '../repositories/i_home_repository.dart';

class HomeUseCase {
  final IHomeRepository _homeRepository;

  const HomeUseCase(this._homeRepository);

  Future<Either<Failure, List<GuideEntity>>> getData(
      String identification) async {
    try{
      final data = await _homeRepository.getQueryData();

      final int indexFound = data.clients.indexWhere(
        (element) => element.identification == identification
      );

      return indexFound != -1
        ? Right(data.clients[indexFound].guides)
        : const Right([]);
    } catch (e){
      print(e);
      return Left(Failure.fromException(e));
    }
  }

  Future<Either<Failure, bool>> saveSolution(
      ReportSolutionEntity reportSolutionEntity) async {
    try{
      return Right(
          await _homeRepository.setReportSolution(reportSolutionEntity));
    } catch (e){
      print(e);
      return Left(Failure.fromException(e));
    }
  }
}