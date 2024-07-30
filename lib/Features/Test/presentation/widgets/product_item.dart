import 'package:flutter/material.dart';
import 'package:test_code/Features/Test/data/models/product_model.dart';
import 'package:test_code/core/styles/my_fonts.dart';
import 'package:test_code/core/utils/widgets/custom_image.dart';
import 'package:test_code/core/utils/widgets/custom_linear_container_admin.dart';
import 'package:test_code/core/utils/widgets/text_app.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.item});
final ProductModel item;
  @override
  Widget build(BuildContext context) {
    return CustomLinearContainer(
      height: 250,
      width: 165,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Buttons

          // Show Image
          Flexible(
            child: Container(
              height: 160,
              width: 160,
              padding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 10,
                  child: CustomImage(
                    imageUrl: item.image,
                  )),
            ),
          ),
          const SizedBox(height: 10),
          // title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextApp(
              text: item.title,
              style: MyFonts.styleBold700_14
                  .copyWith(color: Colors.white),
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 5),
          // Category Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextApp(
              text: item.category,
              style: MyFonts.styleRegular400_12
                  .copyWith(color: Colors.white),
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 5),
          // Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextApp(
              text: '\$ ${item.price}',
              style: MyFonts.styleRegular400_12
                  .copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
