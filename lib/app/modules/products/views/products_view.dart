import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../components/custom_icon_button.dart';
import '../../../components/product_item.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      /* appBar: AppBar(
        title: Text(
          'Vegetables 🌽',
          style: theme.textTheme.headline3,
        ),
        centerTitle: true,
        leading: Align(
          child: CustomIconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              Constants.backArrowIcon,
              fit: BoxFit.none,
              color: theme.appBarTheme.iconTheme?.color,
            ),
          ),
        ),
        actions: [
          CustomIconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Constants.searchIcon,
              fit: BoxFit.none,
              color: theme.appBarTheme.iconTheme?.color,
            ),
          ),
        ],
      ), */
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
                'Vegetables 🌽',
                style: theme.textTheme.headline3,
              ),
              CustomIconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Constants.searchIcon,
                  fit: BoxFit.none,
                  color: theme.appBarTheme.iconTheme?.color,
                ),
                borderColor: theme.dividerColor,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            mainAxisExtent: 214.h,
          ),
          shrinkWrap: true,
          primary: false,
          itemCount: controller.products.length,
          itemBuilder: (context, index) => ProductItem(
            product: controller.products[index],
          ),
        ),
      ),
    );
  }
}
