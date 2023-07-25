import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../utils/constants.dart';
import '../../../routes/app_pages.dart';
import '../../calendar/views/calendar_view.dart';
import '../../category/views/category_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/base_controller.dart';
import '../../home/views/home_view.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = context.theme;
    return GetBuilder<BaseController>(
      builder: (_) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          bottom: false,
          child: IndexedStack(
            index: controller.currentIndex,
            children: const [
              HomeView(),
              CategoryView(),
              CalendarView(),
              ProfileView()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          items: [
            _mBottomNavItem(
              label: 'Home',
              icon: Constants.homeIcon,
            ),
            _mBottomNavItem(
              label: 'category',
              icon: Constants.categoryIcon,
            ),
            _mBottomNavItem(
              label: 'Calendar',
              icon: Constants.calendarIcon,
            ),
            _mBottomNavItem(
              label: 'Profile',
              icon: Constants.userIcon,
            ),
          ],
          onTap: controller.changeScreen,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          onPressed:() => Get.toNamed(Routes.CART),
          child: Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.primaryColor,
            ),
            child: Center(child: SvgPicture.asset(Constants.cartIcon)),
          ),
        ),
      ),
    );
  }

  _mBottomNavItem({required String label, required String icon}) {
    return BottomNavigationBarItem(
      label: label,
      icon: SvgPicture.asset(icon, color: Get.theme.iconTheme.color),
      activeIcon: SvgPicture.asset(icon, color: Get.theme.appBarTheme.iconTheme?.color),
    );
  }

  _bageIcon() {
    var basicUse = const badges.Badge(
      badgeContent: Text('7'),
      child: Icon(Icons.settings),
    );
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -10, end: -12),
      showBadge: true,
      ignorePointer: false,
      onTap: () {},
      badgeContent: const Icon(Icons.check, color: Colors.white, size: 10),
      badgeAnimation: const badges.BadgeAnimation.rotation(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.square,
        badgeColor: Colors.blue,
        padding: const EdgeInsets.all(5),
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.white, width: 2),
        borderGradient: const badges.BadgeGradient.linear(
            colors: [Colors.red, Colors.black]),
        badgeGradient: const badges.BadgeGradient.linear(
            colors: [Colors.blue, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
        ),
        elevation: 0,
      ),
      child: const Text('7'),
    );
  }
}
