import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  const CustomCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 10.w, 12.h),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Row(
        children: [
          Image.asset(icon),
          16.horizontalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title, style: theme.textTheme.headline5?.copyWith(
                  color: theme.primaryColor,
                ),
              ),
              4.verticalSpace,
              Text(subtitle, style: theme.textTheme.bodyText2),
            ],
          )
        ],
      ),
    );
  }
}