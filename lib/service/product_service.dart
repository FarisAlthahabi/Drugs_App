import 'package:dio/dio.dart';
import 'package:repositry_app/model/product_model.dart';

AddDrug(
  String ScientificName,
  String CommertialName,
  String Classification,
  String Manufacturecompany,
  String AvalableQuantity,
  String Expiration,
  String Price,
) async {
  drugModel request = drugModel(
      ScientificName: ScientificName,
      CommertialName: CommertialName,
      Classification: Classification,
      Manufacturecompany: Manufacturecompany,
      AvalableQuantity: AvalableQuantity,
      Expiration: Expiration,
      Price: Price);

  Dio dio = Dio();
  Response response = await dio.post(
      'http://127.0.0.1:8000/api/drugstore?name=asp&nameTrait=asp&quality=medioum&company=tramidica&quantity=10&dateFinish=2010/10/20&price=2000',
      data: request.toJson());
  if (response.statusCode == 200) {
    print('hello');
    // return response.data;
  } else {
    return 'Error';
  }
}
