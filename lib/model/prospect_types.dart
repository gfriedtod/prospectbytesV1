import 'dart:convert';

ProspectTypes prospectTypesFromJson(String str) =>
    ProspectTypes.fromJson(json.decode(str));

String prospectTypesToJson(ProspectTypes data) => json.encode(data.toJson());

class ProspectTypes {
  ProspectTypes({
    required this.name,
  });

  String name;

  factory ProspectTypes.fromJson(Map<dynamic, dynamic> json) => ProspectTypes(
        name: json["name"],
      );

  Map<dynamic, dynamic> toJson() => {
        "name": name,
      };
}
