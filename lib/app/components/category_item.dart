import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            child: SvgPicture.asset(category.image),
          ).animate().fade(duration: 200.ms),
          10.verticalSpace,
          Text(category.title, style: theme.textTheme.headline6)
            .animate().fade().slideY(
              duration: 200.ms,
              begin: 1,
              curve: Curves.easeInSine,
            ),
        ],
      ),
    );
  }
}