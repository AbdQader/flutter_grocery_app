import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/translations/strings_enum.dart';

showLoadingOverLay({
  required Future<dynamic> Function() asyncFunction,
  String? msg,
}) async {
  await Get.showOverlay(asyncFunction: () async {
    try{
      await asyncFunction();
    } catch(error) {
      rethrow;
    }
  }, loadingWidget: Center(
    child: _getLoadingIndicator(msg: msg),
  ), opacity: 0.7,
    opacityColor: Colors.black,
  );
}

Widget _getLoadingIndicator({String? msg}){
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 20.w,
      vertical: 10.h,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      color: Colors.white,
    ),
    child: Column(mainAxisSize: MainAxisSize.min,children: [
      Image.asset('assets/images/app_icon.png',height: 45.h,),
      SizedBox(width: 8.h,),
      Text(msg ?? Strings.loading.tr,style: Get.theme.textTheme.bodyText1),
    ],),
  );
}