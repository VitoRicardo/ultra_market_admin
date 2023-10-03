import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_market_admin/config/app_colors.dart';
import 'package:ultra_market_admin/models/category_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ultra_market_admin/models/product_model.dart';
import 'package:ultra_market_admin/pages/home/components/card_product.dart';
import 'add_product.dart';

class CardCategory extends StatefulWidget {
  final Category category;
  final List<Product> productList;

  const CardCategory(
      {super.key, required this.category, required this.productList});

  @override
  State<CardCategory> createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(2, 2),
                )
              ],
              color: widget.category.isActive
                  ? Colors.greenAccent
                  : AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Slidable(
              key: const ValueKey(0),
              startActionPane: ActionPane(
                extentRatio: 1,
                motion: const ScrollMotion(),
                children: [
                  CustomSlidableAction(
                    backgroundColor: AppColors.red,
                    foregroundColor: Colors.white,
                    onPressed: (BuildContext context) {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete),
                        Text('Delete'),
                      ],
                    ),
                  ),
                  CustomSlidableAction(
                    backgroundColor: AppColors.midGreen,
                    foregroundColor: Colors.white,
                    onPressed: (BuildContext context) {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit),
                        Text('Edit'),
                      ],
                    ),
                  ),
                ],
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.category.totalProducts} Products',
                        style: const TextStyle(
                            color: AppColors.grey, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: Text(
                          widget.category.category,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                            height: 30.h,
                            child: const Icon(Icons.arrow_drop_down)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          AddProduct(isExpanded: isExpanded),
          for (Product product in widget.productList)
            CardProduct(
              product: product,
              isExpanded: isExpanded,
            )
        ],
      ),
    );
  }
}
