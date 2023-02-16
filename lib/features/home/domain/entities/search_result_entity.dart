import 'package:equatable/equatable.dart';
import '../../../../core/domain/entities/guide_entity.dart';

abstract class SearchResultEntity extends Equatable {
  const SearchResultEntity({
    required this.clients
  });

  final List<ClientEntity> clients;

  @override
  List<Object?> get props => [
    clients
  ];
}

abstract class ClientEntity extends Equatable {
  const ClientEntity({
    required this.identification,
    required this.guides
  });

  final String identification;
  final List<GuideEntity> guides;

  @override
  List<Object?> get props => [
    identification,
    guides
  ];
}