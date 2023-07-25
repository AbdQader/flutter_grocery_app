import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../data/models/category_model.dart';
import '../routes/app_pages.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.PRODUCTS),
      child: Column(
        children: [
          CircleAvatar(
            radius: 37.r,
            backgroundColor: theme.cardColor,
            child: Image.asset(category.image),
          ),
          10.verticalSpace,
          Text(category.title, style: theme.textTheme.headline6),
        ],
      ),
    );
  }
}