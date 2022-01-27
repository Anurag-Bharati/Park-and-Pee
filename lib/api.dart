// ignore_for_file: file_names

/// MODIFY API URL HERE. SINCE THE SERVER IS CURRENTLY LOCAL THE IP CHANGES
class API {
  static String ip = "192.168.1.3";
  static const String protocol = "http://";
  static const String path = "api/uploadFile";
  static const String port = ":8080/";

  static String getUrl(String type) {
    return protocol + ip + port + path + type;
  }
}
