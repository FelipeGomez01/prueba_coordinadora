import 'package:equatable/equatable.dart';

abstract class GuideEntity extends Equatable {
  const GuideEntity({
    required this.destination,
    required this.guideStatus,
    required this.shippingDate,
    required this.code,
    required this.totalUnits,
    required this.locationGuide,
    required this.units,
    this.noveltyDate,
    this.novelty
  });

  final DestinationEntity destination;
  final String guideStatus;
  final DateTime shippingDate;
  final String code;
  final int totalUnits;
  final List<double> locationGuide;
  final List<UnitEntity> units;
  final DateTime? noveltyDate;
  final String? novelty;

  @override
  List<Object?> get props => [
    destination,
    guideStatus,
    shippingDate,
    code,
    totalUnits,
    locationGuide,
    units,
    noveltyDate,
    novelty
  ];
}

abstract class DestinationEntity  extends Equatable {
  const DestinationEntity({
    required this.name,
    required this.phone,
    required this.typeDestinationPopulation,
    required this.zoning
  });

  final String name;
  final String phone;
  final String typeDestinationPopulation;
  final ZoningEntity zoning;

  @override
  List<Object?> get props => [
    name,
    phone,
    typeDestinationPopulation,
    zoning
  ];
}

abstract class UnitEntity  extends Equatable {
  const UnitEntity({
    required this.label1D,
    required this.label2D,
    required this.guideCode,
    required this.unitNumber,
    required this.referenceDetail
  });

  final String label1D;
  final String label2D;
  final String guideCode;
  final int unitNumber;
  final String referenceDetail;

  @override
  List<Object?> get props => [
    label1D,
    label2D,
    guideCode,
    unitNumber,
    referenceDetail
  ];
}

abstract class ZoningEntity  extends Equatable {
  const ZoningEntity({
    required this.city,
    required this.terminalCode,
    required this.dane,
    required this.address,
    required this.equipment,
    required this.lat,
    required this.lng,
    required this.zoneHub,
    required this.zonePostal
  });

  final String city;
  final String terminalCode;
  final String dane;
  final String address;
  final String equipment;
  final double lat;
  final double lng;
  final String zoneHub;
  final String zonePostal;

  @override
  List<Object?> get props => [
    city,
    terminalCode,
    dane,
    address,
    equipment,
    lat,
    lng,
    zoneHub,
    zonePostal
  ];
}