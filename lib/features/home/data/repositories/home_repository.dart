import 'package:prueba_coordinadora/features/home/data/models/report_solution_model.dart';
import 'package:prueba_coordinadora/features/home/domain/entities/report_solution_entity.dart';

import '../models/search_result_model.dart';
import '../../domain/repositories/i_home_repository.dart';
import '../data_sources/home_data_source.dart';

class HomeRepository implements IHomeRepository {
  final _homeDataSource = HomeDataSource();

  @override
  Future<SearchResultModel> getQueryData() async {
    try{
      return SearchResultModel.fromMap(await _homeDataSource.getData());
    }catch(e){
      print(e);
      rethrow;
    }
  }

  @override
  Future<bool> setReportSolution(ReportSolutionEntity reportSolutionEntity) async {
    try{
      final data = ReportSolutionModel.entityToModel(reportSolutionEntity);

      return await _homeDataSource.setReportSolution({"data": data.toMap()});
    }catch(e){
      print(e);
      rethrow;
    }
  }
}