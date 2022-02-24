// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
  User({
    this.userId,
    this.services,
    this.name,
    this.number,
    this.password,
    this.profilePic,
    this.is_so,
    this.legalName,
    this.currentAddress,
    this.businessNumber,
    this.dob,
    this.citizenship,
    this.gender,
  });

  int? userId;
  List<Service>? services;
  String? name;
  String? number;
  String? password;
  String? profilePic;
  bool? is_so;
  String? legalName;
  String? currentAddress;
  String? businessNumber;
  String? dob;
  String? citizenship;
  String? gender;

  factory User.fromMap(Map<String, dynamic> json) => User(
        userId: json["user_id"] == null ? null : json["user_id"],
        services: json["services"] == null
            ? null
            : List<Service>.from(
                json["services"].map((x) => Service.fromMap(x))),
        name: json["name"] == null ? null : json["name"],
        number: json["number"] == null ? null : json["number"],
        password: json["password"] == null ? null : json["password"],
        profilePic: json["profile_pic"],
        is_so: json["is_so"] == null ? null : json["is_so"],
        legalName: json["legal_name"],
        currentAddress: json["current_address"],
        businessNumber: json["business_number"],
        dob: json["dob"],
        citizenship: json["citizenship"],
        gender: json["gender"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId == null ? null : userId,
        "services": services == null
            ? null
            : List<dynamic>.from(services!.map((x) => x.toMap())),
        "name": name == null ? null : name,
        "number": number == null ? null : number,
        "password": password == null ? null : password,
        "profile_pic": profilePic,
        "is_so": is_so == null ? null : is_so,
        "legal_name": legalName,
        "current_address": currentAddress,
        "business_number": businessNumber,
        "dob": dob,
        "citizenship": citizenship,
        "gender": gender,
      };
}

class Service {
  Service({
    this.serviceId,
    this.name,
    this.locationType,
    this.serviceType,
    this.latitude,
    this.longitude,
    this.amenities,
    this.mainPicPath,
    this.coverPicPath,
  });

  int? serviceId;
  String? name;
  String? locationType;
  String? serviceType;
  double? latitude;
  double? longitude;
  String? amenities;
  String? mainPicPath;
  String? coverPicPath;

  factory Service.fromMap(Map<String, dynamic> json) => Service(
        serviceId: json["service_id"] == null ? null : json["service_id"],
        name: json["name"] == null ? null : json["name"],
        locationType:
            json["location_type"] == null ? null : json["location_type"],
        serviceType: json["service_type"] == null ? null : json["service_type"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
        amenities: json["amenities"] == null ? null : json["amenities"],
        mainPicPath:
            json["main_pic_path"] == null ? null : json["main_pic_path"],
        coverPicPath:
            json["cover_pic_path"] == null ? null : json["cover_pic_path"],
      );

  Map<String, dynamic> toMap() => {
        "service_id": serviceId == null ? null : serviceId,
        "name": name == null ? null : name,
        "location_type": locationType == null ? null : locationType,
        "service_type": serviceType == null ? null : serviceType,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "amenities": amenities == null ? null : amenities,
        "main_pic_path": mainPicPath == null ? null : mainPicPath,
        "cover_pic_path": coverPicPath == null ? null : coverPicPath,
      };
}
