// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<Service> serviceFromJson(String str) =>
    List<Service>.from(json.decode(str).map((x) => Service.fromJson(x)));

String serviceToJson(List<Service> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Service {
  Service({
    required this.id,
    required this.name,
    required this.locationType,
    required this.serviceType,
    required this.coordinates,
    required this.amenities,
    required this.mainPicPath,
    required this.coverPicPath,
  });

  /// This function decodes boolean value stored in string to a list of booleans
  List<bool>? decodeStringToList(String amenity) {
    final List<bool> amenities = [false, false, false, false, false, false];
    for (int i = 0; i < amenity.length; i++) {
      if (amenity[i] == 'T') {
        amenities[i] = true;
      }
    }
    return amenities;
  }

  /// This function encodes boolean value stored in list to a string
  String? encodeListToString(List<bool> list) {
    String amenities = "";
    for (int i = 0; i < list.length; i++) {
      amenities += list[i] ? 'T' : 'F';
    }
    return amenities;
  }

  final int id;
  final String name;
  final LocationType? locationType;
  final ServiceType? serviceType;
  final String coordinates;
  final String amenities;
  final String? mainPicPath;
  final String? coverPicPath;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        locationType: locationTypeValues.map[json["location_type"]],
        serviceType: serviceTypeValues.map[json["service_type"]],
        coordinates: json["coordinates"],
        amenities: json["amenities"],
        mainPicPath: json["mainPicPath"],
        coverPicPath: json["coverPicPath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location_type": locationTypeValues.reverse![locationType],
        "service_type": serviceTypeValues.reverse![serviceType],
        "coordinates": coordinates,
        "amenities": amenities,
        "mainPicPath": mainPicPath,
        "coverPicPath": coverPicPath,
      };
}

enum LocationType { RESTURANT, HOTEL, HOME, OTHER }

final locationTypeValues = EnumValues({
  "Hotel": LocationType.HOTEL,
  "Resturant": LocationType.RESTURANT,
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
