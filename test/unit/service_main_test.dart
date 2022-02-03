// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:parkandpee/Model/service_main.dart';
import 'package:http/http.dart' as http;

void main() {
  Future<ServiceMain?> getServiceObject() async {
    late final List<ServiceMain> listOfServices;
    dynamic response = await http.get(
      Uri.parse("http://192.168.1.3:8080/api/service"),
    );
    if (response.body.isNotEmpty) {
      listOfServices = (json.decode(response.body) as List)
          .map((data) => ServiceMain.fromJson(data))
          .toList();
      return listOfServices[0];
    }
  }

  test(
      'Given a list of boolean When encodeListToString is called Then the output is a valid string',
      () async {
    //ARRANGE
    const List<bool> listOfBoolean = [true, true, true, false, false, false];
    late final String result;
    //ACT
    result = ServiceMain.encodeListToString(listOfBoolean)!;
    //ASSERT
    expect(result, "TTTFFF");
  });

  test(
      "Given a encoded string When decodeStringToList is called Then the output is a valid list ",
      () async {
    //ARRANGE
    const stringOfBoolean = "TFTFTF";
    late final List<bool> result;
    //ACT
    result = ServiceMain.decodeStringToList(stringOfBoolean)!;
    //ASSERT
    expect(result, [true, false, true, false, true, false]);
  });

  test(
      "Given a json response When fromJsonToServiceMain is called Then the outpt is a valid ServiceMain object",
      () async {
    //ARRANGE
    late final dynamic result;

    //ACT
    result = await getServiceObject();
    //ASSERT
    assert(result != null);
    print("-----OBJECT-----");
    print("Id: " + result!.id.toString());
    print(result.name);
    print("Service: " + result.serviceType.toString());
    print(
      "Coordinate: " + result.latitude.toString() + result.longitude.toString(),
    );
    print("------TEST------");
    expect(result.runtimeType, ServiceMain);
  });

  test(
      "Given a ServiceMain object When toJson is called Then the outpt is a valid Map<String,dynamic> object",
      () async {
    //ARRANGE
    late final ServiceMain? service;
    //ACT
    service = await getServiceObject();
    //ASSERT
    assert(service != null);
    var a = service!.toJson();
    expect(a.runtimeType.toString(), "_InternalLinkedHashMap<String, dynamic>");
  });
}
