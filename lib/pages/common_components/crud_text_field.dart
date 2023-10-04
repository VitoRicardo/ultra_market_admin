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
    return SizedBox(
      height: 50.h,
      child: TextField(
        onChanged: onChanged,
        keyboardType:
            numberPad ? TextInputType.number : TextInputType.emailAddress,
        inputFormatters:
            numberPad ? [FilteringTextInputFormatter.digitsOnly] : null,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColors.darkGreen,
        decoration: InputDecoration(
            fillColor: AppColors.lightGreen,
            contentPadding: EdgeInsets.only(left: 20.h, bottom: 5.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.h),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.h),
            ),
            hintText: hintText),
      ),
    );
  }
}
