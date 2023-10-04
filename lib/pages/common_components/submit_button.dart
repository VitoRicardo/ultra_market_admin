import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_market_admin/config/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(25.h),
      ),
      child: TextButton(
        onPressed: () async {
          CollectionReference categories =
              FirebaseFirestore.instance.collection('categories');
          await categories
              .add({'full_name': 'Vitor', 'company': 'company', 'age': 42})
              .then((value) => print("User Added"))
              .catchError((error) => print("Failed to add user: $error"));
        },
        child: const Text('Add Category'),
      ),
    );
  }
}
