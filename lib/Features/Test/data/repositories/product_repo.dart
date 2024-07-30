
import 'package:dartz/dartz.dart';
import 'package:test_code/Features/Test/data/models/product_model.dart';
import 'package:test_code/core/app/apis/errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductModel>>> fetchProducts();


}
