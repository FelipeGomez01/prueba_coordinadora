import 'dart:convert';
import '../../../../core/data/models/guide_model.dart';
import '../../domain/entities/search_result_entity.dart';

class SearchResultModel extends SearchResultEntity{
  const SearchResultModel({
    required super.clients
  });

  factory SearchResultModel.fromJson(String str) =>
    SearchResultModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchResultModel.fromMap(Map<String, dynamic> json) {
    final List<ClientModel> clients = [];
    json['clientes'].forEach(
      (key, value){
        final Map<String,dynamic> data = value;
        data.addAll({"identification": key});
        clients.add(ClientModel.fromMap(data));
      }
    );

    return SearchResultModel(clients: clients);
  }

  Map<String, dynamic> toMap() => {
    "clients": List<ClientModel>.from(
      clients.map((x) => (x as ClientModel).toMap())
    )
  };
}

class ClientModel extends ClientEntity{
  const ClientModel({
    required super.identification,
    required super.guides
  });

  factory ClientModel.fromJson(String str) => ClientModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClientModel.fromMap(Map<String, dynamic> json) => ClientModel(
    identification: json["identification"],
    guides: List<GuideModel>.from(json["guias"].map(
      (x)=> GuideModel.fromMap(x)))
  );

  Map<String, dynamic> toMap() => {
    "identification": identification,
    "guides": List<GuideModel>.from(
        guides.map((x) => (x as GuideModel).toMap())
    )
  };
}