import 'package:prueba_coordinadora/features/home/domain/entities/report_solution_entity.dart';
import '../entities/search_result_entity.dart';

abstract class IHomeRepository {
  Future<SearchResultEntity> getQueryData();

  Future<bool> setReportSolution(ReportSolutionEntity reportSolutionEntity);
}