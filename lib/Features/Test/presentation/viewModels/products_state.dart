part of 'products_cubit.dart';

abstract class ProductsState  {
  const ProductsState();
}

class ProductsInitial extends ProductsState {

}
class ProductsLoading extends ProductsState {}
class ProductsFailure extends ProductsState {
  final String errorMsg;
  const ProductsFailure(this.errorMsg);
}

class ProductsSuccess extends ProductsState {
  List<ProductModel> productModel;

  ProductsSuccess(this.productModel);
}
