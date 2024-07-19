import 'package:famlaika1/constants/colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
extension IconButtonStyleHelper on CustomIconButton{
  static BoxDecoration get outlineGray=>BoxDecoration(
      color: appTheme.gray90003,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(34.h,),
        bottomLeft: Radius.circular(34.h,),
        bottomRight: Radius.circular(34.h,),
      ),
      border: Border.all(
        color: appTheme.gray80001,
        width: 1.h,
      )
  );
}
class CustomIconButton extends StatelessWidget {
  CustomIconButton({Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap}):
        super(key:key,);
  final Alignment? alignment;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;
  final Widget? child;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return alignment !=null? Align(
        alignment: alignment ?? Alignment.center,
        child: iconButtonWidget) :iconButtonWidget;

  }
  Widget get iconButtonWidget => SizedBox(
    height: (height ?? 0).h,
    width:  (width ?? 0).w,
    child: IconButton(
      padding: EdgeInsets.zero,
      onPressed: onTap, icon: Container(
      height: (height ?? 0).h,
      width: (width ?? 0).w,
      padding: padding != null
          ? EdgeInsets.symmetric(
        horizontal: padding!.horizontal.w,
        vertical: padding!.vertical.h,
      )
          : EdgeInsets.zero,
      decoration: decoration ??
          BoxDecoration(
              color: Color(0xFF383838),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34.h),
                  bottomLeft: Radius.circular(34.h),
                  bottomRight: Radius.circular(34.h)
              ),
              border: Border.all(
                  color: Colors.white24,
                  width: 1.h
              )
          ),
      child: child,

    ),

    ),
  );
}