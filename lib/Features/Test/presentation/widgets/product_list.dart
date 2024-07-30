import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_code/Features/Test/presentation/viewModels/products_cubit.dart';
import 'package:test_code/Features/Test/presentation/widgets/product_item.dart';
import 'package:test_code/core/utils/widgets/error_widget.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  _fetchData() {
    BlocProvider.of<ProductsCubit>(context).fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                //Get ALl Product
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {},
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: SizedBox(height: 20),
                        ),
                        SliverToBoxAdapter(
                          child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.productModel.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, //Number of cloums
                              crossAxisSpacing: 8, // Spacing between colums
                              mainAxisSpacing: 15, //Spacing between rows
                              childAspectRatio: 165 / 250,
                            ),
                            itemBuilder: (context, index) {
                              return ProductItem(
                                item: state.productModel[index],
                              );
                            },
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(height: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is ProductsFailure) {
          return ErrorScreen(
            errorMsg: state.errorMsg,
            onPress: _fetchData,
          );
        }else{
          return CircularProgressIndicator();
        }
      },
    );
  }
}
