import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_icon_button.dart';
import '../../../components/no_data.dart';
import '../controllers/cart_controller.dart';
import 'widgets/cart_item.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                onPressed: () => Get.back(),
                backgroundColor: theme.scaffoldBackgroundColor,
                borderColor: theme.dividerColor,
                icon: SvgPicture.asset(
                  Constants.backArrowIcon,
                  fit: BoxFit.none,
                  color: theme.appBarTheme.iconTheme?.color,
                ),
              ),
              Text('Cart 🛒', style: theme.textTheme.headline3),
              const Opacity(
                opacity: 0.0,
                child: CustomIconButton(onPressed: null, icon: Center()),
              ),
            ],
          ),
        ),
      ),
      body: GetBuilder<CartController>(
        builder: (_) => Column(
          children: [
            24.verticalSpace,
            Expanded(
              child: controller.products.isEmpty
                ? const NoData(text: 'No Products in Your Cart Yet!')
                : ListView.separated(
                    separatorBuilder: (_, index) => Padding(
                      padding: EdgeInsets.only(top: 12.h, bottom: 24.h),
                      child: const Divider(thickness: 1),
                    ),
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) => CartItem(
                      product: controller.products[index],
                    ).animate(delay: (100 * index).ms).fade().slideX(
                      duration: 300.ms,
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
                  ),
            ),
            30.verticalSpace,
            Visibility(
              visible: controller.products.isNotEmpty,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomButton(
                  text: 'Purchase Now',
                  onPressed: () => controller.onPurchaseNowPressed(),
                  fontSize: 16.sp,
                  radius: 50.r,
                  verticalPadding: 16.h,
                  hasShadow: false,
                ).animate().fade().slideY(
                  duration: 300.ms,
                  begin: 1,
                  curve: Curves.easeInSine,
                ),
              ),
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}
