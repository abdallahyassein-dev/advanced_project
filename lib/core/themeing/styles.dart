import 'package:advanced_project/core/themeing/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles{
  static  TextStyle font24Black700Weight = TextStyle(
    fontSize: 24.sp,
    color: Colors.black,
    fontWeight: FontWeight.w700
  );

  static  TextStyle font32BlueBold= TextStyle(
      fontSize: 32.sp,
      color: ColorsManager.mainBlue,
      fontWeight: FontWeight.bold
  );

  static TextStyle font13GreyRegular= TextStyle(
      fontSize: 13.sp,
      color: ColorsManager.grey,
      fontWeight: FontWeight.normal
  );

    static TextStyle font16WhiteSemiBold= TextStyle(
      fontSize: 16.sp,
      color: Colors.white,
      fontWeight: FontWeight.w500
  );
}