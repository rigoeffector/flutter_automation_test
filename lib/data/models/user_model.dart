import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:bloc_login/data/models/company.dart';

User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromJson(jsonData);
}

String userToJson(User data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class User extends Equatable {
  final int id;
  final Company company;
  final String firstName,
      lastName,
      addressline_1,
      gender,
      addressline_2,
      dob,
      memberNumber,
      email,
      msisdn,
      profile,
      country,
      city,
      weight,
      points,
      height,
      bmi;

  const User(
      {this.id,
      this.firstName,
      this.lastName,
      this.gender,
      this.memberNumber,
      this.dob,
      this.email,
      this.msisdn,
      this.profile,
      this.company,
      this.addressline_1,
      this.addressline_2,
      this.country,
      this.city,
      this.bmi,
      this.weight,
      this.height,
      this.points});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      firstName: json["name"],
      lastName: json["surname"],
      memberNumber:
          (json['member_number'] != null) ? json['member_number'] : "",
      email: json['email'],
      msisdn: (json['msisdn'] != null) ? json['msisdn'] : "",
      dob: (json['dob'] != null) ? json['dob'] : "",
      gender: json['gender_id'],
      bmi: (json['bmi'] != null) ? json['bmi'].toString() : "0",
      height: (json['height'] != null) ? json['height'].toString() : "0",
      weight: (json['weight'] != null) ? json['weight'].toString() : "0",
      points: (json['points'] != null) ? json['points'].toString() : "0",
      profile: json['profile'],
      company: Company.fromJson(json['company']),
      addressline_1: json['address_line_1'],
      addressline_2: json['address_line_2'],
      country: json['country'],
      city: json['city']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": firstName,
        "surname": lastName,
        "member_number": memberNumber,
        "email": email,
        "msisdn": msisdn,
        "gender_id": gender,
        "dob": dob,
        "bmi": bmi,
        "height": height,
        "weight": weight,
        "points": points,
        "profile": profile,
        "address_line_1": addressline_1,
        "address_line_2": addressline_2,
        "company": company?.toJson(),
        "country": country,
        "city": city
      };

  @override
  List<Object> get props => [
        id,
        company != null,
        firstName,
        lastName,
        addressline_1,
        gender,
        addressline_2,
        dob,
        memberNumber,
        email,
        msisdn,
        profile,
        country,
        city,
        weight,
        points,
        height,
        bmi
      ];
}
