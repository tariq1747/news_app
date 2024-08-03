import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimens {
  const Dimens._();

  static final double zero = 0.sp;
  static final double one = 1.sp;
  static final double two = 2.sp;
  static final double four = 4.sp;
  static final double five = 5.sp;
  static final double six = 6.sp;

  static final double eight = 8.sp;
  static final double nine = 9.sp;
  static final double ten = 10.sp;
  static final double twelve = 12.sp;
  static final double fifteen = 15.sp;
  static final double sixteen = 16.sp;
  static final double twenty = 20.sp;
  static final double twentyFour = 24.sp;
  static final double twentyFive = 25.sp;
  static final double thirtyTwo = 32.sp;
  static final double eighty = 80.sp;
  static final double hundred = 100.sp;
  static final double twoHundredTwenty = 220.sp;

  static final Widget boxHeight8 = SizedBox(height: eight);
  static final Widget boxHeight10 = SizedBox(height: ten);

  static final Widget boxHeight16 = SizedBox(height: sixteen);
  static final Widget boxHeight20 = SizedBox(height: twenty);

  static final Widget boxHeight32 = SizedBox(height: thirtyTwo);

  static final EdgeInsets edgeInsets10 = EdgeInsets.all(ten);

  static final EdgeInsets edgeInsets16 = EdgeInsets.all(sixteen);

  static final EdgeInsets edgeInsetsL2 = EdgeInsets.only(left: two);
  static final EdgeInsets edgeInsetsT10 = EdgeInsets.only(top: ten);

  static final EdgeInsets edgeInsets16_100 =
      EdgeInsets.symmetric(horizontal: sixteen, vertical: hundred);
}
