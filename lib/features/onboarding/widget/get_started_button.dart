import 'package:advanced_project/core/helpers/extensions.dart';
import 'package:advanced_project/core/themeing/colors.dart';
import 'package:advanced_project/core/themeing/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      
      onPressed: (){
        context.pushNamed(Routes.loginScreen);
      },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: MaterialStateProperty.all(const Size(double.infinity, 52)),
      shape: MaterialStateProperty.all( RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
    ),
    
     child: Text("Get Started",style: TextStyles.font16WhiteSemiBold,));
  }
}