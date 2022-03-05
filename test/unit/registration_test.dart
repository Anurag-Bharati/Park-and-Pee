// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:parkandpee/controller/authentication/login.dart'
    as registration;

void main() {
  test(
      'Given a valid user credential  When register resquest is sent Then the output response is 201 Created',
      () async {
    //ARRANGE
    late final http.Response response;
    //ACT
    response = await http
        .post(Uri.parse("http://localhost:8080/api/user"),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'name': "test",
              'number': "1234567890",
              'password': "1234567890"
            }))
        .timeout(
          const Duration(seconds: 5),
        );

    //ASSERT
    expect(response.statusCode, 201);
  });

  test(
      "Given a valid user number When checkNull is called Then the output true ",
      () async {
    //ARRANGE
    String number = "12345";
    //ACT
    bool result = registration.checkNull(number);
    //ASSERT
    expect(result, true);
  });
  test(
      "Given a null user number When checkNull is called Then the output false ",
      () async {
    //ARRANGE
    String? number;
    //ACT
    bool result = registration.checkNull(number);
    //ASSERT
    expect(result, false);
  });
  test(
      "Given a valid user number When checkNumber is called Then the output true ",
      () async {
    //ARRANGE
    String? number = "1234567890";
    //ACT
    bool result = registration.checkNumber(number);
    //ASSERT
    expect(result, true);
  });

  test(
      "Given a  user password When encodePass is called Then the input is encoded ",
      () async {
    //ARRANGE
    String? password = "1234567890";
    //ACT
    String encodedPassword = registration.encode(password);
    //ASSERT
    expect(encodedPassword, 'MTIzNDU2Nzg5MA==');
  });
}
