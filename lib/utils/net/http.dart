import 'package:dio/dio.dart';

BaseOptions options = BaseOptions(
  baseUrl: "http://loanapi.wanqiandaikuan.com",
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

var dio = new Dio(options);
