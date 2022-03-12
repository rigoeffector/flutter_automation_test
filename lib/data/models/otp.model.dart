import 'client.model.dart';

class RegOTP {
  int id;
  Client  company;
  final String email, otp, expire, status, created, updated;

  RegOTP({
    this.id,
    this.company,
    this.email,
    this.otp,
    this.expire,
    this.status,
    this.created,
    this.updated,
  });

  factory RegOTP.fromJson(Map<String, dynamic> json) => RegOTP(
      id: json['id'],
      email: json['email'],
      otp: json['otp_code'],
      expire: json['expire'],
      status: json['status'],
      created: json['created'],
      company: Client.fromJson(json['company']),
      updated: json['updated']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "company": company?.toJson(),
        "email": email,
        "otp_code": otp,
        "expire": expire,
        "status": status,
        "created": created,
        "updated": updated,
      };
}
