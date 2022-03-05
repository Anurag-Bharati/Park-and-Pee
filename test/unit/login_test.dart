// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:parkandpee/controller/authentication/login.dart' as login;

void main() {
  test(
      'Given a valid user credential  When login resquest is sent Then the output response is 202 Accepted',
      () async {
    //ARRANGE
    late final http.Response response;
    //ACT
    response = await http
        .post(Uri.parse("http://localhost:8080/api/user/auth"),
            headers: {'Content-Type': 'application/json'},
            body:
                json.encode({'number': "1234567890", 'password': "1234567890"}))
        .timeout(
          const Duration(seconds: 5),
        );

    //ASSERT
    expect(response.statusCode, 202);
  });
  test(
      'Given a invalid user credential  When login resquest is sent Then the output response is 404 NotFound',
      () async {
    //ARRANGE
    late final http.Response response;
    //ACT
    response = await http
        .post(Uri.parse("http://localhost:8080/api/user/auth"),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({'number': "12", 'password': "12"}))
        .timeout(
          const Duration(seconds: 5),
        );

    //ASSERT
    expect(response.statusCode, 404);
  });

  test(
      "Given a valid user number When checkNull is called Then the output true ",
      () async {
    //ARRANGE
    String number = "12345";
    //ACT
    bool result = login.checkNull(number);
    //ASSERT
    expect(result, true);
  });
  test(
      "Given a null user number When checkNull is called Then the output false ",
      () async {
    //ARRANGE
    String? number;
    //ACT
    bool result = login.checkNull(number);
    //ASSERT
    expect(result, false);
  });
  test(
      "Given a valid user number When checkNumber is called Then the output true ",
      () async {
    //ARRANGE
    String? number = "1234567890";
    //ACT
    bool result = login.checkNumber(number);
    //ASSERT
    expect(result, true);
  });
}
