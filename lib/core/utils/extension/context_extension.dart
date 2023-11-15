import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:morethantwo/core/const/color_styles.dart';
import 'package:morethantwo/core/const/text_styles.dart';
import 'package:morethantwo/core/routes/route.dart';

extension BuildContextExtension on BuildContext {


  GoRouter get router => goRouter;


  void unFocusKeyboard() => FocusScope.of(this).unfocus();

  dynamic get getArguments => ModalRoute.of(this)?.settings.arguments;

  //size

  bool get isMobile => MediaQuery.of(this).size.width <= 500.0;

  bool get isTablet => MediaQuery.of(this).size.width < 1024.0 && MediaQuery.of(this).size.width >= 650.0;

  bool get isSmallTablet => MediaQuery.of(this).size.width < 650.0 && MediaQuery.of(this).size.width > 500.0;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1024.0;

  bool get isSmall => MediaQuery.of(this).size.width < 850.0 && MediaQuery.of(this).size.width >= 560.0;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  Size get size => MediaQuery.of(this).size;

  bool get isIOS => Platform.isIOS;

  bool get isAndroid => Platform.isAndroid;

  //colors

  Color get accentColor => AppColors.kcAccent;

  Color get blackColor => AppColors.kcBlack;

  Color get whiteColor => AppColors.kcWhite;

  Color get greenColor => AppColors.kcGreen;

  Color get yellowColor => AppColors.kcYellow;

  Color get redColor => AppColors.kcRed;

  Color get white64Color => AppColors.kcWhite64;

  Color get white40Color => AppColors.kcWhite40;

  Color get white16Color => AppColors.kcWhite16;

  Color get white8Color => AppColors.kcWhite8;

  //text styles

  TextStyle get f16w500 => AppTextStyle.f16w500;
  TextStyle get f14w500 => AppTextStyle.f14w500;
  TextStyle get f18w500 => AppTextStyle.f18w500;
  TextStyle get f12w500 => AppTextStyle.f12w500;
  TextStyle get h1 => AppTextStyle.h1;
  TextStyle get h2 => AppTextStyle.h2;
  TextStyle get h3 => AppTextStyle.h3;

}
