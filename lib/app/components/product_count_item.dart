import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import 'custom_icon_button.dart';

class ProductCountItem extends StatelessWidget {
  final int quantity;
  final Function() onIncreasePressed;
  final Function() onDecreasePressed;
  const ProductCountItem({
    Key? key,
    required this.quantity,
    required this.onIncreasePressed,
    required this.onDecreasePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      children: [
        CustomIconButton(
          width: 36.w,
          height: 36.h,
          onPressed: onDecreasePressed,
          icon: SvgPicture.asset(
            Constants.removeIcon,
            fit: BoxFit.none
          ),
          backgroundColor: theme.cardColor,
        ),
        16.horizontalSpace,
        Text(
          quantity.toString(),
          style: theme.textTheme.headline4
        ),
        16.horizontalSpace,
        CustomIconButton(
          width: 36.w,
          height: 36.h,
          onPressed: onIncreasePressed,
          icon: SvgPicture.asset(
            Constants.addIcon,
            fit: BoxFit.none
          ),
          backgroundColor: theme.primaryColor,
        ),
      ],
    );
  }
}