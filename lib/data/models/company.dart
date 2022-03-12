import 'dart:convert';

List<Company> companyFromJson(String str) =>
    List<Company>.from(json.decode(str).map((x) => Company.fromJson(x)));

String companyToJson(List<Company> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Company {
  int id;
  String name,status,logo;
  Company({
    this.id,
    this.name,
    this.logo,
    this.status,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        status:json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "status": status,
      };
}