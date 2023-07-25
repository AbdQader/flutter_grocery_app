import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/dummy_helper.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_card.dart';
import '../../../components/custom_icon_button.dart';
import '../../../components/product_count_item.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 376.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(
                      Constants.container,
                      fit: BoxFit.fill,
                      color: theme.cardColor,
                    ),
                  ),
                  Positioned(
                    top: 24.h,
                    left: 24.w,
                    right: 24.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          onPressed: () => Get.back(),
                          icon: SvgPicture.asset(
                            Constants.backArrowIcon,
                            fit: BoxFit.none,
                            color: theme.appBarTheme.iconTheme?.color,
                          ),
                        ),
                        CustomIconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            Constants.searchIcon,
                            fit: BoxFit.none,
                            color: theme.appBarTheme.iconTheme?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 100.h,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      controller.product.image,
                      width: 250.w, height: 225.h,
                    ),
                  ),
                ],
              ),
            ),
            30.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  Text(
                    controller.product.name,
                    style: theme.textTheme.headline2,
                  ),
                  const Spacer(),
                  ProductCountItem(
                    quantity: controller.product.quantity,
                    onIncreasePressed: () {},
                    onDecreasePressed: () {},
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                '1kg, ${controller.product.price}\$',
                style: theme.textTheme.headline3?.copyWith(
                  color: theme.accentColor,
                ),
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                controller.product.description,
                style: theme.textTheme.bodyText1,
              ),
            ),
            24.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: GridView(
                shrinkWrap: true,
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  mainAxisExtent: 80.h,
                ),
                children: DummyHelper.cards.map((card) => CustomCard(
                  title: card['title']!,
                  subtitle: card['subtitle']!,
                  icon: card['icon']!,
                )).toList(),
              ),
            ),
            30.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomButton(
                text: 'Add to cart',
                onPressed: () => controller.onAddToCartPressed(),
                fontSize: 16.sp,
                radius: 50.r,
                verticalPadding: 16.h,
                hasShadow: false,
              ).animate().fade().slideY(
                duration: const Duration(milliseconds: 300),
                begin: 1,
                curve: Curves.easeInSine,
              ),
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}
