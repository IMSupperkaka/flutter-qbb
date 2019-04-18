import 'Http.dart';

class ApiInterface {
  // 获取配置接口
  static Future getConfig() async {
    return dio.post("/interface/v1.0.0/base/config").then((r) {
      print(r);
    }).catchError(print);
  }
  // 首页顶部接口
  static Future getHomeTop() async {
    return dio.post("/interface/dcbookkeep/v1.0.0/index/top").then((r) {
      print(r);
    }).catchError(print);
  }
}