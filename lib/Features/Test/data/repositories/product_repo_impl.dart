
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_code/Features/Test/data/data_sources/api_const.dart';
import 'package:test_code/Features/Test/data/data_sources/products_api_service.dart';
import 'package:test_code/Features/Test/data/models/product_model.dart';
import 'package:test_code/Features/Test/data/repositories/product_repo.dart';
import 'package:test_code/core/app/apis/errors/failure.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductsApiService apiService;

  ProductRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> fetchProducts() async {
    try {
      var data = await apiService.get(
          endPoint:ApiConst.products);
      List<ProductModel> products =[];
  for (var item in data) {
products.add(ProductModel.fromJson(item));
  }
      return right(products);
    }  catch (error) {
      if(error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }


}
