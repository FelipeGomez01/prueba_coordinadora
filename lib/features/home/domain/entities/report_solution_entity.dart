import 'package:equatable/equatable.dart';

abstract class ReportSolutionEntity extends Equatable {
  const ReportSolutionEntity({
    required this.novelty,
    required this.reportDate,
    required this.solutionDate,
    required this.solution,
    required this.guideCode,
    required this.clientIdentification
  });

  final String novelty;
  final String reportDate;
  final String solutionDate;
  final String solution;
  final String guideCode;
  final String clientIdentification;

  @override
  List<Object?> get props => [
    novelty,
    reportDate,
    solutionDate,
    solution,
    guideCode,
    clientIdentification
  ];
}