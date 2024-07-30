import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:test_code/Features/Test/data/data_sources/products_api_service.dart';
import 'package:test_code/Features/Test/data/repositories/product_repo.dart';
import 'package:test_code/Features/Test/data/repositories/product_repo_impl.dart';
import 'package:test_code/Features/Test/presentation/viewModels/products_cubit.dart';
import 'package:test_code/core/app/apis/dio_factory.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
}

Future<void> _initCore() async {
  final dio = DioFactory.getInstance();
  //? Cubits
  sl.registerFactory<ProductsCubit>(() => ProductsCubit(sl()));

  //! Data source

  sl.registerLazySingleton<ProductsApiService>(() => ProductsApiService(dio));
  //! Repository
  sl.registerLazySingleton<ProductRepo>(() => ProductRepoImpl(sl()));
}
