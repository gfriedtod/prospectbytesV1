import 'dart:convert';

Prospect prospectFromJson(String str) => Prospect.fromJson(json.decode(str));

String prospectToJson(Prospect data) => json.encode(data.toJson());

class Prospect {
  Prospect({
    required this.image,
    required this.contact,
    required this.name,
    required this.description,
    required this.location,
    required this.email,
    required this.activitySector,
    required this.contactRole,
  });

  String image;
  String contact;
  String name;
  String description;
  String location;
  String email;
  String activitySector;
  String contactRole;

  factory Prospect.fromJson(Map<dynamic, dynamic> json) => Prospect(
        image: json["image"],
        contact: json["contact"],
        name: json["name"],
        description: json["description"],
        location: json["location"],
        email: json["email"],
        activitySector: json["activity_sector"],
        contactRole: json["contact_role"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "contact": contact,
        "name": name,
        "description": description,
        "location": location,
        "email": email,
        "activity_sector": activitySector,
        "contact_role": contactRole,
      };
}
