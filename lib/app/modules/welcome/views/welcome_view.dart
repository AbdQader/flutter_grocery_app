import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../components/custom_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Constants.background,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                95.verticalSpace,
                CircleAvatar(
                  radius: 33.r,
                  backgroundColor: theme.backgroundColor,
                  child: Image.asset(
                    Constants.logo,
                    width: 40.33.w,
                    height: 33.40.h,
                  ),
                ),
                30.verticalSpace,
                Text(
                  'Get your groceries delivered to your home',
                  style: theme.textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                24.verticalSpace,
                Text(
                  'The best delivery app in town for delivering your daily fresh groceries',
                  style: theme.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                40.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: CustomButton(
                    //width: 190.w,
                    text: 'Shop now',
                    onPressed: () => Get.offNamed(Routes.BASE),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
