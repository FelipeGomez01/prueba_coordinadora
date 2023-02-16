import 'dart:async';
import '../../../../config/constants.dart';
import '../../../../core/utils/petition.dart';

class HomeDataSource {
  Future<Map<String,dynamic>> getData() async {
    try{
      final response = await petition.get('${Constants.apiUrl}/api');

      return response.data;
    }
    catch(e){
      rethrow;
    }
  }

  Future<bool> setReportSolution(Map<String,dynamic> data) async {
    try{
      final response = await petition.post('${Constants.apiUrl}/nys',
        data: data
      );

      return !response['error'];
    }
    catch(e){
      rethrow;
    }
  }
}