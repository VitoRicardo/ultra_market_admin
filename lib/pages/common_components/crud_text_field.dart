import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_colors.dart';

class CrudTextField extends StatelessWidget {
  final void Function(String) onChanged;
  final String hintText;
  final bool numberPad;
  const CrudTextField({
    Key? key,
    required this.onChanged,
    required this.hintText,
    this.numberPad = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (numberPad) {
      return SizedBox(
        height: 50.h,
        child: TextField(
          onChanged: onChanged,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlignVertical: TextAlignVertical.center,
          cursorColor: AppColors.darkGreen,
          decoration: InputDecoration(
            fillColor: AppColors.lightGreen,
            contentPadding: EdgeInsets.only(bottom: 5.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.h),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.h),
            ),
          ),
        ),
      );
    }
    return SizedBox(
      height: 50.h,
      child: TextField(
        onChanged: onChanged,
        keyboardType: TextInputType.emailAddress,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColors.darkGreen,
        decoration: InputDecoration(
          fillColor: AppColors.lightGreen,
          contentPadding: EdgeInsets.only(bottom: 5.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
        ),
      ),
    );
  }
}
