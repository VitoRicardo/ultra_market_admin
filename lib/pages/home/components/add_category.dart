import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ultra_market_admin/config/app_colors.dart';
import 'package:ultra_market_admin/config/routers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ultra_market_admin/config/hard_parameters.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: HardParameters.verticalPadding),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(2, 2),
            )
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(HardParameters.radiusCard),
        ),
        child: SizedBox(
          height: 54.h,
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(HardParameters.radiusCard),
              ),
            ),
            onPressed: () => context.pushNamed(NamedRoutes.category),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
