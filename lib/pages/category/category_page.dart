import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_market_admin/cubit/image_cubit.dart';
import 'package:ultra_market_admin/repository/image_repository.dart';
import 'package:ultra_market_admin/pages/common_components/common_components.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CategoryPage'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            SizedBox(
              height: 20.h,
            ),
            BlocProvider<ImageCubit>(
              create: (_) =>
                  ImageCubit(imageRepository: context.read<ImageRepository>()),
              child: const AddImagePanel(),
            ),
            SizedBox(height: 20.h),
            CrudTextField(
              onChanged: (value) {},
              hintText: 'Name',
            ),
            SizedBox(height: 20.h),
            CrudTextField(
              onChanged: (value) {},
              hintText: 'Description',
            ),
            SizedBox(height: 20.h),
            CrudTextField(
                onChanged: (value) {},
                hintText: 'Promotion [%]',
                numberPad: true),
            SizedBox(height: 20.h),
            const SubmitButton(),
            SizedBox(height: 20.h),
          ],
        ));
  }
}
