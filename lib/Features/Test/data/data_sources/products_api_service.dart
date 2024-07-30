import 'package:dio/dio.dart';
import 'api_const.dart';


class ProductsApiService{
  final  Dio dio;

  ProductsApiService(this.dio);
  Future<List<dynamic>> get({required String endPoint})async {
    var response = await dio.get('${ApiConst.baseUrl}$endPoint');
    return response.data;
  }
}