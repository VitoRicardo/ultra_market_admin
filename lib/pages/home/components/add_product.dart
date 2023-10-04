import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProduct extends StatelessWidget {
  final bool isExpanded;
  const AddProduct({super.key, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    if (!isExpanded) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
    return DottedBorder(
      dashPattern: const [3, 3],
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
        child: TextButton(
          style: TextButton.styleFrom(
              shape: const ContinuousRectangleBorder(),
              padding: EdgeInsets.zero),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.add, size: 20.h)],
          ),
        ),
      ),
    );
  }
}
