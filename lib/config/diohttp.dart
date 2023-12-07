import 'package:dio/dio.dart';
import 'package:karyawanapp/config/config.dart';

final BaseOptions options = BaseOptions(baseUrl: baseUrl, headers: {
  'Accept': 'application/json',
  'Access-Control-Allow-Origin': '*'
});

final Dio diohttp = Dio(options);
