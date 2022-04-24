// ignore_for_file: file_names

/// MODIFY API URL HERE. SINCE THE SERVER IS CURRENTLY LOCAL THE IP CHANGES
class API {
  static String base = "fcc6-103-163-182-217.ngrok.io/";
  static const String protocol = "http://";
  static const String service = "api/";
  // static const String port = ":8080/";
  static const String port = "";

  static String getUrl(String path) {
    return protocol + base + port + service + path;
  }
}
