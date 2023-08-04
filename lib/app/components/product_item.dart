import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../data/models/product_model.dart';
import '../routes/app_pages.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({
    Key? key,
    required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product),
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 12.w,
              bottom: 12.h,
              child: GestureDetector(
                onTap: () => Get.toNamed(
                  Routes.PRODUCT_DETAILS, arguments: product
                ),
                child: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: theme.primaryColor,
                  child: const Icon(Icons.add_rounded, color: Colors.white),
                ).animate().fade(duration: 200.ms),
              ),
            ),
            Positioned(
              top: 22.h,
              left: 26.w,
              right: 25.w,
              child: Image.asset(product.image).animate().slideX(
                duration: 200.ms,
                begin: 1, curve: Curves.easeInSine,
              ),
            ),
            Positioned(
              left: 16.w,
              bottom: 24.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: theme.textTheme.headline6)
                    .animate().fade().slideY(
                      duration: 200.ms,
                      begin: 1, curve: Curves.easeInSine,
                    ),
                  5.verticalSpace,
                  Text(
                    '1kg, ${product.price}\$',
                    style: theme.textTheme.headline5?.copyWith(
                      color: theme.accentColor,
                    ),
                  ).animate().fade().slideY(
                    duration: 200.ms,
                    begin: 2, curve: Curves.easeInSine,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}