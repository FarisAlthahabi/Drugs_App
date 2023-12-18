import 'package:dio/dio.dart';
import 'package:pharmacy_project/model/register_model.dart';

late String token;

Register(String name, String email, String password, String c_password) async {
  Dio dio = Dio();
  RegisterModel req = RegisterModel(
      name: name, email: email, password: password, c_password: c_password);
  Response response = await dio.post(
      'http://localhost:8000/api/register?name=naa&email=defrs@dsd&password=12345&c_password=12345',
      data: req.toJson());

  if (response.statusCode == 200) {
    print('hello');
    // token = response.data['token'];
    // return response.data;
  } else {
    print('error');
    return 'Error';
  }
}
