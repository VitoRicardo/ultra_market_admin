import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ultra_market_admin/config/routers.dart';
import 'package:ultra_market_admin/dummy_data.dart';
import 'package:ultra_market_admin/pages/home/components/add_category.dart';
import 'package:ultra_market_admin/pages/home/components/card_category.dart';
import 'package:ultra_market_admin/models/category_model.dart';
import 'package:ultra_market_admin/models/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          TextButton(
              onPressed: () => context.pushNamed(NamedRoutes.category),
              child: const Icon(Icons.forward))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          const AddCategory(),
          for (String category in dummy.keys)
            CardCategory(
              category: Category(category: category, listProducts: [
                for (String product in dummy[category]!) Product(name: product),
              ]),
            ),
        ],
      ),
    );
  }
}
