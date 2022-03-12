class Client {
  int id;
  String name, logo, email, msisdn, deletedat,status, createdat, updatedat;

  Client({
    this.id,
    this.name,
    this.email,
    this.msisdn,
    this.logo,
    this.status,
    this.deletedat,
    this.createdat,
    this.updatedat,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        msisdn: json["msisdn"],
        logo: json["logo"],
        status:json["status"],
        deletedat:json["deletedat"],
        createdat:json["createdat"],
        updatedat:json["updatedat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "msisdn": msisdn,
        "logo": logo,
        "status": status,
        "created_at": createdat,
        "updated_at": updatedat,
        "deleted_at": deletedat,
      };
}