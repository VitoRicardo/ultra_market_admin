import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_market_admin/config/app_colors.dart';
import 'package:ultra_market_admin/cubit/image_cubit.dart';
import 'package:ultra_market_admin/cubit/image_state.dart';
import 'package:ultra_market_admin/repository/image_repository.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AddImagePanel extends StatelessWidget {
  const AddImagePanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (state.status == ImageStatus.error) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('You didn\'t select a image '),
                ),
              );
          }
        });

        if (state.status == ImageStatus.loading) {
          return DottedBorder(
            dashPattern: const [5, 5],
            padding: EdgeInsets.zero,
            child: Container(
              height: 300.h,
              width: double.infinity,
              color: AppColors.grey.withOpacity(0.2),
              child: const CircularProgressIndicator(),
            ),
          );
        }
        if (state.status == ImageStatus.success) {
          return DottedBorder(
            dashPattern: const [5, 5],
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: AppColors.grey.withOpacity(0.2)),
              height: 300.h,
              width: double.infinity,
              child: Slidable(
                key: const ValueKey(0),
                startActionPane: ActionPane(
                  extentRatio: 1,
                  motion: const ScrollMotion(),
                  children: [
                    CustomSlidableAction(
                      padding: EdgeInsets.zero,
                      backgroundColor: AppColors.red,
                      foregroundColor: Colors.white,
                      onPressed: (BuildContext context) {
                        context.read<ImageCubit>().deleteImage();
                      },
                      child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete),
                            Text('Delete'),
                          ],
                        ),
                      ),
                    ),
                    CustomSlidableAction(
                      padding: EdgeInsets.zero,
                      backgroundColor: AppColors.midGreen,
                      foregroundColor: Colors.white,
                      onPressed: (BuildContext context) {
                        context.read<ImageCubit>().pickImage();
                      },
                      child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.photo_camera),
                            Text('Modify'),
                          ],
                        ),
                      ),
                    ),
                    CustomSlidableAction(
                      padding: EdgeInsets.zero,
                      backgroundColor: AppColors.darkGreen,
                      foregroundColor: Colors.white,
                      onPressed: (BuildContext context) {
                        context.read<ImageCubit>().cropImage();
                      },
                      child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.crop),
                            Text('Crop'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.file(
                    File(
                      context.read<ImageRepository>().imagePath!,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return DottedBorder(
          dashPattern: const [5, 5],
          child: Container(
            height: 300.h,
            width: double.infinity,
            color: AppColors.grey.withOpacity(0.2),
            child: TextButton(
                style: TextButton.styleFrom(
                    shape: const ContinuousRectangleBorder(),
                    padding: EdgeInsets.zero),
                onPressed: () {
                  context.read<ImageCubit>().pickImage();
                },
                child: const Icon(Icons.photo_camera)),
          ),
        );
      },
    );
  }
}
