// ignore_for_file: file_names

/// MODIFY API URL HERE. SINCE THE SERVER IS CURRENTLY LOCAL THE IP CHANGES
class API {
  static String ip = "192.168.1.86";
  static const String protocol = "http://";
  static const String path = "api/user/";
  static const String port = ":8080/";

  static String getUrl(String type) {
    return protocol + ip + port + path + type;
  }
}