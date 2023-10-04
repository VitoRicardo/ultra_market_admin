import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ultra_market_admin/models/product_model.dart';

import '../../../config/app_colors.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  final bool isExpanded;
  const CardProduct({Key? key, required this.product, required this.isExpanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isExpanded) {
      return const SizedBox();
    }
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
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
              shape: const ContinuousRectangleBorder(),
              padding: EdgeInsets.zero),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
