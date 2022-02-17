// ignore_for_file: file_names

/// MODIFY API URL HERE. SINCE THE SERVER IS CURRENTLY LOCAL THE IP CHANGES
class API {
  static String base = "192.168.1.5";
  static const String protocol = "http://";
  static const String service = "api/";
  static const String port = ":8080/";

  static String getUrl(String path) {
    return protocol + base + port + service + path;
  }
}
