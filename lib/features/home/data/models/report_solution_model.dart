import 'package:prueba_coordinadora/features/home/domain/entities/report_solution_entity.dart';

class ReportSolutionModel extends ReportSolutionEntity {
  const ReportSolutionModel({
    required super.novelty,
    required super.reportDate,
    required super.solutionDate,
    required super.solution,
    required super.guideCode,
    required super.clientIdentification
  });

  factory ReportSolutionModel.entityToModel(
      ReportSolutionEntity entity) => ReportSolutionModel(
    novelty: entity.novelty,
    reportDate: entity.reportDate,
    solutionDate: entity.solutionDate,
    solution: entity.solution,
    guideCode: entity.guideCode,
    clientIdentification: entity.clientIdentification
  );

  Map<String, dynamic> toMap() => {
    "novedad": novelty,
    "fecha_reporte": reportDate,
    "fecha_solucion": solutionDate,
    "solucion": solution,
    "guia": guideCode,
    "cliente": clientIdentification
  };
}