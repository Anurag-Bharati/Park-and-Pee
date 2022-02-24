// To parse this JSON data, do
//
//     final servicesPage = servicesPageFromJson(jsonString);

import 'dart:convert';

ServicesPage servicesPageFromJson(String str) =>
    ServicesPage.fromJson(json.decode(str));

String servicesPageToJson(ServicesPage data) => json.encode(data.toJson());

class ServicesPage {
  ServicesPage({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });

  final List<Content> content;
  final Pageable pageable;
  final bool last;
  final int totalPages;
  final int totalElements;
  final int size;
  final int number;
  final Sort sort;
  final bool first;
  final int numberOfElements;
  final bool empty;

  factory ServicesPage.fromJson(Map<String, dynamic> json) => ServicesPage(
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        last: json["last"],
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        size: json["size"],
        number: json["number"],
        sort: Sort.fromJson(json["sort"]),
        first: json["first"],
        numberOfElements: json["numberOfElements"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable.toJson(),
        "last": last,
        "totalPages": totalPages,
        "totalElements": totalElements,
        "size": size,
        "number": number,
        "sort": sort.toJson(),
        "first": first,
        "numberOfElements": numberOfElements,
        "empty": empty,
      };
}

class Content {
  Content({
    required this.serviceId,
    required this.serviceOwner,
    required this.name,
    required this.locationType,
    required this.serviceType,
    required this.latitude,
    required this.longitude,
    required this.amenities,
    required this.mainPicPath,
    required this.coverPicPath,
  });

  final int serviceId;
  final int serviceOwner;
  final String name;
  final String locationType;
  final String serviceType;
  final double latitude;
  final double longitude;
  final String amenities;
  final String mainPicPath;
  final String coverPicPath;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        serviceId: json["service_id"],
        serviceOwner: json["service_owner"],
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
        "service_id": serviceId,
        "service_owner": serviceOwner,
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

class Pageable {
  Pageable({
    required this.sort,
    required this.offset,
    required this.pageSize,
    required this.pageNumber,
    required this.paged,
    required this.unpaged,
  });

  final Sort sort;
  final int offset;
  final int pageSize;
  final int pageNumber;
  final bool paged;
  final bool unpaged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        offset: json["offset"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        paged: json["paged"],
        unpaged: json["unpaged"],
      );

  Map<String, dynamic> toJson() => {
        "sort": sort.toJson(),
        "offset": offset,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "paged": paged,
        "unpaged": unpaged,
      };
}

class Sort {
  Sort({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  });

  final bool empty;
  final bool sorted;
  final bool unsorted;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        empty: json["empty"],
        sorted: json["sorted"],
        unsorted: json["unsorted"],
      );

  Map<String, dynamic> toJson() => {
        "empty": empty,
        "sorted": sorted,
        "unsorted": unsorted,
      };
}
