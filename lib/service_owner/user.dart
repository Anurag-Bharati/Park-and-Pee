// ignore_for_file: file_names, non_constant_identifier_names

import '../model/service_main.dart';

class User {
  int? id;
  String name;
  String phone;
  String password;
  String? confirmPass;
  List<ServiceMain> services = [];

  String? legal_name;
  String? current_address;
  String? business_number;
  String? gender;
  String? legalName;

  User(this.name, this.phone, this.password);
}
