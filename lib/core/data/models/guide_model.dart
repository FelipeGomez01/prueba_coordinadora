import 'dart:convert';
import '../../domain/entities/guide_entity.dart';

class GuideModel extends GuideEntity {
  const GuideModel({
    required super.destination,
    required super.guideStatus,
    required super.shippingDate,
    required super.code,
    required super.totalUnits,
    required super.locationGuide,
    required super.units,
    super.noveltyDate,
    super.novelty
  });

  factory GuideModel.fromJson(String str) =>
    GuideModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GuideModel.fromMap(Map<String, dynamic> json) => GuideModel(
    destination: DestinationModel.fromMap(json["destinatario"]),
    guideStatus: json["estado_guia"],
    shippingDate: DateTime.parse(json["fecha_envio"]),
    code: json["guia"],
    totalUnits: json["total_unidades"],
    locationGuide: List<double>.from(json["ubicacion_guia"].map(
      (x) => x?.toDouble())
    ),
    units: List<UnitModel>.from(json["unidades"].map((x) => UnitModel.fromMap(x))),
    noveltyDate: json["fecha_novedad"] == null
      ? null
      : DateTime.parse(json["fecha_novedad"]),
    novelty: json["novedad"]
  );

  Map<String, dynamic> toMap() => {
    "destination": (destination as DestinationModel).toMap(),
    "guideStatus": guideStatus,
    "shippingDate": "${shippingDate.year.toString().padLeft(4, '0')}-${shippingDate.month.toString().padLeft(2, '0')}-${shippingDate.day.toString().padLeft(2, '0')}",
    "code": code,
    "totalUnits": totalUnits,
    "locationGuide": List<dynamic>.from(locationGuide.map((x) => x)),
    "units": List<UnitModel>.from(units.map((x) => (x as UnitModel).toMap())),
    "noveltyDate": "${noveltyDate!.year.toString().padLeft(4, '0')}-${noveltyDate!.month.toString().padLeft(2, '0')}-${noveltyDate!.day.toString().padLeft(2, '0')}",
    "novelty": novelty
  };
}

class DestinationModel extends DestinationEntity{
  const DestinationModel({
    required super.name,
    required super.phone,
    required super.typeDestinationPopulation,
    required super.zoning
  });

  factory DestinationModel.fromJson(String str) =>
    DestinationModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DestinationModel.fromMap(Map<String, dynamic> json) =>
    DestinationModel(
      name: json["nombre"],
      phone: json["telefono"],
      typeDestinationPopulation: json["tipo_poblacion_destino"],
      zoning: ZoningModel.fromMap(json["zonificacion"])
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "phone": phone,
    "typeDestinationPopulation": typeDestinationPopulation,
    "zoning": (zoning as ZoningModel).toMap()
  };
}

class UnitModel extends UnitEntity{
  const UnitModel({
    required super.label1D,
    required super.label2D,
    required super.guideCode,
    required super.unitNumber,
    required super.referenceDetail
  });

  factory UnitModel.fromJson(String str) => UnitModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UnitModel.fromMap(Map<String, dynamic> json) => UnitModel(
    label1D: json["etiqueta1d"],
    label2D: json["etiqueta2d"],
    guideCode: json["guia"],
    unitNumber: json["numero_unidad"],
    referenceDetail: json["referencia_detalle"],
  );

  Map<String, dynamic> toMap() => {
    "label1D": label1D,
    "label2D": label2D,
    "guideCode": guideCode,
    "unitNumber": unitNumber,
    "referenceDetail": referenceDetail
  };
}

class ZoningModel extends ZoningEntity {
  const ZoningModel({
    required super.city,
    required super.terminalCode,
    required super.dane,
    required super.address,
    required super.equipment,
    required super.lat,
    required super.lng,
    required super.zoneHub,
    required super.zonePostal
  });

  factory ZoningModel.fromJson(String str) =>
    ZoningModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ZoningModel.fromMap(Map<String, dynamic> json) => ZoningModel(
    city: json["ciudad"],
    terminalCode: json["codigo_terminal"],
    dane: json["dane"],
    address: json["direccion"],
    equipment: json["equipo"],
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
    zoneHub: json["zona_hub"],
    zonePostal: json["zona_postal"],
  );

  Map<String, dynamic> toMap() => {
    "city": city,
    "terminalCode": terminalCode,
    "dane": dane,
    "address": address,
    "equipment": equipment,
    "lat": lat,
    "lng": lng,
    "zona_hub": zoneHub,
    "zona_postal": zonePostal
  };
}