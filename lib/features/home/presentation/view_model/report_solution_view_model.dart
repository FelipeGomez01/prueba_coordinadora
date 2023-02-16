import 'package:prueba_coordinadora/core/domain/entities/guide_entity.dart';
import '../../domain/entities/report_solution_entity.dart';

class ReportSolutionViewModel extends ReportSolutionEntity {
  const ReportSolutionViewModel({
    required super.novelty,
    required super.reportDate,
    required super.solutionDate,
    required super.solution,
    required super.guideCode,
    required super.clientIdentification
  });

  factory ReportSolutionViewModel.fromResult({
    required final String identification,
    required final String solution,
    required final GuideEntity guide
  }) {
    final String reportDate = '${guide.noveltyDate!.year}-${
      guide.noveltyDate!.month}-${guide.noveltyDate!.day}';
    final DateTime now = DateTime.now();
    final String nowFormatted = '${now.year}-${now.month}-${now.day}';

    return ReportSolutionViewModel(
      novelty: guide.novelty!,
      reportDate: reportDate,
        solutionDate: nowFormatted,
        solution: solution,
        guideCode: guide.code,
        clientIdentification: identification
    );
  }
}