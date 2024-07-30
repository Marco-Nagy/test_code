import 'package:bloc/bloc.dart';
import 'package:test_code/Features/Test/data/models/product_model.dart';
import 'package:test_code/Features/Test/data/repositories/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  final ProductRepo productRepo;
  Future<void> fetchProducts()async{
    emit(ProductsLoading());
    var result =await  productRepo.fetchProducts();
    result.fold((failure) {
      emit(ProductsFailure(failure.errorMsg));
    }, (products) {
      emit(ProductsSuccess(products));
    });
  }
}
