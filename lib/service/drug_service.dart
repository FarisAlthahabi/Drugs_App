import 'package:dio/dio.dart';
import 'package:pharmacy_project/model/drug_model.dart';

import 'base_service.dart';

abstract class QuestionService extends BaseService {
  Future<List<drugModel>> getDrugs();
}

class drugServiceImp extends QuestionService {
  @override
  Future<List<drugModel>> getDrugs() async {
    Response response = await dio.get(baseUrl);
    print(response.data);
    if (response.statusCode == 200) {
      dynamic temp = response.data;
      List<drugModel> questions =
          List.generate(temp.length, (index) => drugModel.fromMap(temp[index]));
      return questions;
    } else {
      return [];
    }
  }
}
