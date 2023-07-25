import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    var theme = context.theme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Constants.logo,
                width: 120.w,
                height: 90.h,
              ).animate().fade().slideY(
                duration: const Duration(milliseconds: 500),
                begin: 1,
                curve: Curves.easeInSine
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Online ',
                        style: theme.textTheme.headline4?.copyWith(
                          color: theme.primaryColor),
                        ),
                      TextSpan(
                        text: 'Shopping ',
                        style: theme.textTheme.headline4,
                      ),
                    ]
                  ),
                ).animate().fade().slideY(
                  duration: const Duration(milliseconds: 500),
                  begin: 5,
                  curve: Curves.easeInSine
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}