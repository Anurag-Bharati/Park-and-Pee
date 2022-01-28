// ignore_for_file: file_names

class User {
  int? id;
  String name;
  String phone;
  String password;
  String? confirmPass;

  bool isServiceOwner = false;
  String? idPath;
  String? address;
  String? businessPhone;
  String? gender;
  String? legalName;

  User(this.name, this.phone, this.password);
}
