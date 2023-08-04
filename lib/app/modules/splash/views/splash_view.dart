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
      backgroundColor: theme.primaryColorLight,
      body: Center(
        child: CircleAvatar(
          radius: 55.r,
          backgroundColor: theme.primaryColorDark,
          child: Image.asset(Constants.logo, width: 67.w, height: 55.h),
        ).animate().fade().slideY(
          duration: 500.ms,
          begin: 1, curve: Curves.easeInSine
        ),
      ),
    );
  }
}