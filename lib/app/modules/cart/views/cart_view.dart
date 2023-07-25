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
                icon: SvgPicture.asset(
                  Constants.backArrowIcon,
                  fit: BoxFit.none,
                  color: theme.appBarTheme.iconTheme?.color,
                ),
                borderColor: theme.dividerColor,
              ),
              Text(
                'Cart 🛒',
                style: theme.textTheme.headline3,
              ),
              Opacity(
                opacity: 0.0,
                child: CustomIconButton(
                  onPressed: null,
                  icon: SvgPicture.asset(
                    Constants.backArrowIcon,
                    fit: BoxFit.none,
                    color: theme.appBarTheme.iconTheme?.color,
                  ),
                  borderColor: theme.dividerColor,
                ),
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
                    ).animate().fade().slideX(
                      duration: const Duration(milliseconds: 300),
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
                child: Row(
                  children: [
                    Container(
                      width: 65.w,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Constants.busIcon),
                          5.verticalSpace,
                          Text('FREE', style: theme.textTheme.headline6?.copyWith(
                            color: Colors.white,
                          )),
                        ],
                      ),
                    ),
                    20.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total:', style: theme.textTheme.bodyText1?.copyWith(
                          fontSize: 18.sp,
                        )),
                        10.verticalSpace,
                        Text(
                          '\$${controller.total.toStringAsFixed(2)}',
                          style: theme.textTheme.headline3?.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: theme.primaryColor.withOpacity(0.5),
                            decorationThickness: 1,
                            color: Colors.transparent,
                            shadows: [
                              Shadow(
                                color: theme.textTheme.headline3!.color!,
                                offset: const Offset(0, -5)
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ).animate().fade().slideX(
                  duration: const Duration(milliseconds: 300),
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
                  duration: const Duration(milliseconds: 300),
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
