import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../components/custom_button.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLightTheme = MySharedPref.getThemeIsLight();
    final theme = context.theme;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              isLightTheme ? Constants.background : Constants.backgroundDark,
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
                  backgroundColor: theme.primaryColorDark,
                  child: Image.asset(
                    Constants.logo,
                    width: 40.33.w, height: 33.40.h,
                  ),
                ).animate().fade().slideY(
                  duration: 300.ms,
                  begin: -1,
                  curve: Curves.easeInSine,
                ),
                30.verticalSpace,
                Text(
                  'Get your groceries delivered to your home',
                  style: theme.textTheme.headline1,
                  textAlign: TextAlign.center,
                ).animate().fade().slideY(
                  duration: 300.ms,
                  begin: -1,
                  curve: Curves.easeInSine,
                ),
                24.verticalSpace,
                Text(
                  'The best delivery app in town for delivering your daily fresh groceries',
                  style: theme.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ).animate().fade().slideY(
                  duration: 300.ms,
                  begin: 1,
                  curve: Curves.easeInSine,
                ),
                40.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: CustomButton(
                    text: 'Shop now',
                    onPressed: () => Get.offNamed(Routes.BASE),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
