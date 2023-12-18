import 'package:dio/dio.dart';
import 'package:pharmacy_project/main.dart';
import 'package:pharmacy_project/model/user_model.dart';

getData() async {
  Dio dio = Dio();

  Response response = await dio.get(
    'http://localhost:8000/api/login',
    // options: Options(headers: {"authorization": "Bearar " + token})
  );

  if (response.statusCode == 200) {
    return response.data;
  } else {
    return 'Error';
  }
}

late String token;

logIn(String username, int password) async {
  Dio dio = Dio();
  UserModel req = UserModel(username: username, password: password);
  Response response =
      await dio.post('http://localhost:8000/api/login', data: req.toJson());

  if (response.statusCode == 200) {
    token = response.data['token'];
    return response.data;
  } else {
    return 'Error';
  }
}
