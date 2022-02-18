// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<ServiceMain> serviceFromJson(String str) => List<ServiceMain>.from(
    json.decode(str).map((x) => ServiceMain.fromJson(x)));

String serviceToJson(List<ServiceMain> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceMain {
  ServiceMain({
    this.id,
    this.name,
    this.locationType,
    this.serviceType,
    this.latitude,
    this.longitude,
    this.amenities,
    this.mainPicPath,
    this.coverPicPath,
  });

  /// This function decodes boolean value stored in string to a list of booleans
  static List<bool>? decodeStringToList(String amenity) {
    final List<bool> amenities = [false, false, false, false, false, false];
    for (int i = 0; i < amenity.length; i++) {
      if (amenity[i] == 'T') {
        amenities[i] = true;
      }
    }
    return amenities;
  }

  /// This function encodes boolean value stored in list to a string
  static String? encodeListToString(List<bool> list) {
    String amenities = "";
    for (int i = 0; i < list.length; i++) {
      amenities += list[i] ? 'T' : 'F';
    }
    return amenities;
  }

  int? id;
  String? name;
  String? locationType;
  String? serviceType;
  double? latitude;
  double? longitude;
  String? amenities;
  String? mainPicPath;
  String? coverPicPath;

  factory ServiceMain.fromJson(Map<String, dynamic> json) => ServiceMain(
        id: json["service_id"],
        name: json["name"],
        locationType: json["location_type"],
        serviceType: json["service_type"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        amenities: json["amenities"],
        mainPicPath: json["main_pic_path"],
        coverPicPath: json["cover_pic_path"],
      );

  Map<String, dynamic> toJson() => {
        "service_id": id,
        "name": name,
        "location_type": locationType,
        "service_type": serviceType,
        "latitude": latitude,
        "longitude": longitude,
        "amenities": amenities,
        "main_pic_path": mainPicPath,
        "cover_pic_path": coverPicPath,
      };
}
