import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio = Dio();
  String baseUrl = 'http://localhost:8000/api/login';
}
