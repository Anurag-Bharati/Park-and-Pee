class Service {
  Map<String, double?> coordinates = {
    "longitude": null,
    "latitude": null,
  };
  late final String serviceType;
  String? name;
  String? locType;
  List<bool> amenity = [false, false, false, false, false, false];
  String? mainPicPath;
  String? coverPicPath;
  Service(double longitude, double latitude, this.serviceType) {
    coordinates.update("longitude", (value) => longitude);
    coordinates.update("latitude", (value) => latitude);
  }

  setAmenity(List<bool> amenityList) {
    for (int i = 0; i < amenity.length; i++) {
      amenity[i] = amenityList[i];
    }
  }

  List<bool> getAmenity() {
    return amenity;
  }

  setType(String type) {
    locType = type;
  }

  setName(String name) {
    this.name = name;
  }
}
