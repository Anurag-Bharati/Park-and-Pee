// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<ServiceMain> serviceFromJson(String str) => List<ServiceMain>.from(
    json.decode(str).map((x) => ServiceMain.fromJson(x)));

String serviceToJson(List<ServiceMain> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceMain {
  ServiceMain({
    required this.id,
    required this.name,
    required this.locationType,
    required this.serviceType,
    required this.latitude,
    required this.longitude,
    required this.amenities,
    required this.mainPicPath,
    required this.coverPicPath,
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

  final int? id;
  final String? name;
  final LocationType? locationType;
  final ServiceType? serviceType;
  final double? latitude;
  final double? longitude;
  final String? amenities;
  final String? mainPicPath;
  final String? coverPicPath;

  factory ServiceMain.fromJson(Map<String, dynamic> json) => ServiceMain(
        id: json["service_id"],
        name: json["name"],
        locationType: locationTypeValues.map[json["location_type"]],
        serviceType: serviceTypeValues.map[json["service_type"]],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        amenities: json["amenities"],
        mainPicPath: json["main_pic_path"],
        coverPicPath: json["cover_pic_path"],
      );

  Map<String, dynamic> toJson() => {
        "service_id": id,
        "name": name,
        "location_type": locationTypeValues.reverse![locationType],
        "service_type": serviceTypeValues.reverse![serviceType],
        "latitude": latitude,
        "longitude": longitude,
        "amenities": amenities,
        "main_pic_path": mainPicPath,
        "cover_pic_path": coverPicPath,
      };
}

enum LocationType { RESTAURANT, HOTEL, HOME, OTHER }

final locationTypeValues = EnumValues({
  "Hotel": LocationType.HOTEL,
  "Restaurant": LocationType.RESTAURANT,
  "Home": LocationType.HOME,
  "Other": LocationType.OTHER
});

enum ServiceType { PEE, PARK }

final serviceTypeValues =
    EnumValues({"Parking": ServiceType.PARK, "Toilet": ServiceType.PEE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
