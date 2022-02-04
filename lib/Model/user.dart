// ignore_for_file: file_names

import 'service_main.dart';

class User {
  int? id;
  String name;
  String phone;
  String password;
  String? confirmPass;
  List<ServiceMain> services = [];

  String? idPath;
  String? address;
  String? businessPhone;
  String? gender;
  String? legalName;

  User(this.name, this.phone, this.password);
}
